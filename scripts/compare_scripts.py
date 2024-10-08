#!/usr/bin/env python3

import os
import subprocess
import hashlib
import filecmp
import argparse

def find_scripts(root_dir):
    script_paths = []
    for dirpath, dirnames, filenames in os.walk(root_dir, followlinks=False):
        for filename in filenames:
            filepath = os.path.join(dirpath, filename)
            try:
                # Check if the file is a regular file and executable
                if os.path.isfile(filepath) and os.access(filepath, os.X_OK):
                    # Use 'file' command to determine if it's a script
                    result = subprocess.run(['file', '-b', filepath], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True)
                    if 'script' in result.stdout.lower():
                        script_paths.append(os.path.relpath(filepath, root_dir))
            except Exception as e:
                print(f"Error processing file {filepath}: {e}")
    return script_paths

def write_list_to_file(file_list, output_file):
    with open(output_file, 'w') as f:
        for filepath in sorted(file_list):
            f.write(filepath + '\n')

def compare_script_lists(list1, list2):
    set1 = set(list1)
    set2 = set(list2)
    missing_in_list2 = sorted(set1 - set2)
    added_in_list2 = sorted(set2 - set1)
    common_scripts = sorted(set1 & set2)
    return missing_in_list2, added_in_list2, common_scripts

def compare_common_scripts(common_scripts, root1, root2, output_dir):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    for relative_path in common_scripts:
        script1 = os.path.join(root1, relative_path)
        script2 = os.path.join(root2, relative_path)
        # Compare files
        if not filecmp.cmp(script1, script2, shallow=False):
            # Files are different
            diff_output_file = os.path.join(output_dir, relative_path.replace('/', '_') + '.diff')
            os.makedirs(os.path.dirname(diff_output_file), exist_ok=True)
            # Run diff command and save output
            try:
                with open(diff_output_file, 'w') as diff_file:
                    subprocess.run(['diff', '-u', script1, script2], stdout=diff_file, stderr=subprocess.DEVNULL)
            except Exception as e:
                print(f"Error comparing scripts {script1} and {script2}: {e}")

def main():
    parser = argparse.ArgumentParser(description='Compare scripts in two root directories.')
    parser.add_argument('original_root', help='Path to the original root directory')
    parser.add_argument('new_root', help='Path to the new root directory')
    args = parser.parse_args()

    original_root = os.path.abspath(args.original_root)
    new_root = os.path.abspath(args.new_root)

    print('Finding scripts in the original root directory...')
    original_scripts = find_scripts(original_root)
    write_list_to_file(original_scripts, 'original_scripts.txt')

    print('Finding scripts in the new root directory...')
    new_scripts = find_scripts(new_root)
    write_list_to_file(new_scripts, 'new_scripts.txt')

    print('Comparing script lists...')
    missing_in_new, added_in_new, common_scripts = compare_script_lists(original_scripts, new_scripts)

    # Write differences to file
    with open('scripts_diff.txt', 'w') as diff_file:
        if missing_in_new:
            diff_file.write('Scripts missing in the new root directory:\n')
            for path in missing_in_new:
                diff_file.write(f'- {path}\n')
            diff_file.write('\n')
        if added_in_new:
            diff_file.write('Scripts added in the new root directory:\n')
            for path in added_in_new:
                diff_file.write(f'+ {path}\n')
            diff_file.write('\n')
        if not missing_in_new and not added_in_new:
            diff_file.write('No scripts are missing or added between the two root directories.\n')

    print('Comparing common scripts for modifications...')
    compare_common_scripts(common_scripts, original_root, new_root, 'script_differences')

    print('Comparison complete.')
    print('Check the following files and directories for results:')
    print('- original_scripts.txt')
    print('- new_scripts.txt')
    print('- scripts_diff.txt')
    print('- script_differences/')

if __name__ == '__main__':
    main()
