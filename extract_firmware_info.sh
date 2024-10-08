#!/bin/bash

# Define the mount point
MOUNT_POINT="/mnt/old_firmware"

# Ensure dtc is installed
if ! command -v dtc &> /dev/null; then
    echo "Installing device-tree-compiler..."
    sudo apt-get install -y device-tree-compiler
fi

# Create output directory
OUTPUT_DIR="firmware_info"
mkdir -p "$OUTPUT_DIR"

# 1. Extract Kernel Version
echo "Extracting kernel version..."
ls "$MOUNT_POINT/lib/modules/" > "$OUTPUT_DIR/old_kernel_version.txt"
OLD_KERNEL_VERSION=$(cat "$OUTPUT_DIR/old_kernel_version.txt")

# 2. List Kernel Modules
echo "Listing kernel modules..."
find "$MOUNT_POINT/lib/modules/$OLD_KERNEL_VERSION/" -type f -name '*.ko' > "$OUTPUT_DIR/old_kernel_modules.txt"
awk -F'/' '{print $NF}' "$OUTPUT_DIR/old_kernel_modules.txt" | sed 's/\.ko$//' | sort > "$OUTPUT_DIR/old_module_names.txt"

# 3. Extract Device Tree Blobs
echo "Extracting device tree blobs..."
find "$MOUNT_POINT" -name '*.dtb' > "$OUTPUT_DIR/dtb_files_list.txt"
# Decompile each DTB found
while read -r dtb_file; do
    dtc -I dtb -O dts -o "$OUTPUT_DIR/$(basename $dtb_file .dtb).dts" "$dtb_file"
done < "$OUTPUT_DIR/dtb_files_list.txt"

# 4. List All Installed Packages (if applicable)
if [ -d "$MOUNT_POINT/var/lib/dpkg" ]; then
    echo "Extracting installed packages..."
    grep -E 'Package:|Version:' "$MOUNT_POINT/var/lib/dpkg/status" > "$OUTPUT_DIR/old_packages_raw.txt"
    awk '/Package:/ {pkg=$2} /Version:/ {print pkg, $2}' "$OUTPUT_DIR/old_packages_raw.txt" > "$OUTPUT_DIR/old_installed_packages.txt"
else
    echo "No package manager found. Listing all files..."
    find "$MOUNT_POINT/" -type f > "$OUTPUT_DIR/old_all_files.txt"
fi

# 5. Extract Firmware Files
echo "Listing firmware files..."
find "$MOUNT_POINT/lib/firmware/" -type f > "$OUTPUT_DIR/old_firmware_files.txt"

# 6. Extract Module Dependencies
echo "Extracting module dependencies..."
cp "$MOUNT_POINT/lib/modules/$OLD_KERNEL_VERSION/modules.dep" "$OUTPUT_DIR/old_modules.dep"

echo "Extraction complete. Check the '$OUTPUT_DIR' directory for details."
