#!/bin/bash

# Define paths
OLD_FIRMWARE_ROOT="/media/mks/5dcae443-0796-4029-ae6c-bf5bd2a37067"
DOWNLOAD_DIR="$HOME/firmware_comparison/downloads"
COMPARISON_DIR="$HOME/firmware_comparison/comparisons"
LOG_FILE="$HOME/firmware_comparison/comparison_log.txt"

# Create necessary directories
mkdir -p "$DOWNLOAD_DIR"
mkdir -p "$COMPARISON_DIR"

# Components to check
components=(
  "klipper"
  "canboot"
  "crowsnest"
  "fluidd"
  "kiauh"
  "klippy-env"
  "moonraker"
  "moonraker-env"
)

# Repositories URLs
declare -A repos=(
  ["klipper"]="https://github.com/Klipper3d/klipper.git"
  ["canboot"]="https://github.com/Arksine/CanBoot.git"
  ["crowsnest"]="https://github.com/mainsail-crew/crowsnest.git"
  ["fluidd"]="https://github.com/fluidd-core/fluidd.git"
  ["kiauh"]="https://github.com/th33xitus/kiauh.git"
  ["moonraker"]="https://github.com/Arksine/moonraker.git"
)

# Clear the log file
> "$LOG_FILE"

echo "Starting component comparison..." | tee -a "$LOG_FILE"

for component in "${components[@]}"; do
  echo "Processing $component..." | tee -a "$LOG_FILE"

  # Check if the component is included in the old firmware
  if [ -d "$OLD_FIRMWARE_ROOT/$component" ] || [ -d "$OLD_FIRMWARE_ROOT/home/$component" ] || [ -d "$OLD_FIRMWARE_ROOT/opt/$component" ]; then
    echo "$component is included in the old firmware." | tee -a "$LOG_FILE"
    included="yes"
    # Set the path to the old component
    if [ -d "$OLD_FIRMWARE_ROOT/$component" ]; then
      OLD_COMPONENT_PATH="$OLD_FIRMWARE_ROOT/$component"
    elif [ -d "$OLD_FIRMWARE_ROOT/home/$component" ]; then
      OLD_COMPONENT_PATH="$OLD_FIRMWARE_ROOT/home/$component"
    elif [ -d "$OLD_FIRMWARE_ROOT/opt/$component" ]; then
      OLD_COMPONENT_PATH="$OLD_FIRMWARE_ROOT/opt/$component"
    else
      OLD_COMPONENT_PATH=""
    fi
  else
    echo "$component is not included in the old firmware." | tee -a "$LOG_FILE"
    included="no"
    OLD_COMPONENT_PATH=""
  fi

  # Only proceed if the component is included or explicitly requested
  if [ "$included" == "yes" ] || [[ "$component" == "canboot" || "$component" == "crowsnest" || "$component" == "fluidd" || "$component" == "kiauh" || "$component" == "klippy-env" || "$component" == "moonraker-env" ]]; then
    # Download the current version
    if [[ "$component" == "klippy-env" || "$component" == "moonraker-env" ]]; then
      # For virtual environments, we need to create them
      echo "Setting up virtual environment for $component..." | tee -a "$LOG_FILE"
      # Ensure python3-venv is installed
      sudo apt-get install -y python3-venv
      # Create virtual environment
      ENV_DIR="$DOWNLOAD_DIR/$component"
      python3 -m venv "$ENV_DIR"
      # Activate and install requirements if available
      source "$ENV_DIR/bin/activate"
      if [ "$component" == "klippy-env" ]; then
        if [ -d "$DOWNLOAD_DIR/klipper" ]; then
          pip install -r "$DOWNLOAD_DIR/klipper/scripts/klippy-requirements.txt"
        else
          echo "Klipper source not found for $component requirements." | tee -a "$LOG_FILE"
        fi
      elif [ "$component" == "moonraker-env" ]; then
        if [ -d "$DOWNLOAD_DIR/moonraker" ]; then
          pip install -r "$DOWNLOAD_DIR/moonraker/scripts/moonraker-requirements.txt"
        else
          echo "Moonraker source not found for $component requirements." | tee -a "$LOG_FILE"
        fi
      fi
      deactivate
    else
      # Clone the repository
      REPO_URL="${repos[$component]}"
      if [ -z "$REPO_URL" ]; then
        echo "No repository URL found for $component. Skipping download." | tee -a "$LOG_FILE"
        continue
      fi
      git clone "$REPO_URL" "$DOWNLOAD_DIR/$component"
    fi

    # Compare with old firmware if included
    if [ "$included" == "yes" ] && [ -n "$OLD_COMPONENT_PATH" ]; then
      echo "Comparing $component..." | tee -a "$LOG_FILE"
      diff -urN "$OLD_COMPONENT_PATH" "$DOWNLOAD_DIR/$component" > "$COMPARISON_DIR/${component}_diff.txt"
      if [ -s "$COMPARISON_DIR/${component}_diff.txt" ]; then
        echo "Differences found for $component. See ${component}_diff.txt." | tee -a "$LOG_FILE"
      else
        echo "No differences found for $component." | tee -a "$LOG_FILE"
        rm "$COMPARISON_DIR/${component}_diff.txt"
      fi
    else
      echo "Skipping comparison for $component as it is not included in the old firmware." | tee -a "$LOG_FILE"
    fi
  else
    echo "Skipping $component as it is neither included in the old firmware nor specified for download." | tee -a "$LOG_FILE"
  fi

  echo "----------------------------------------" | tee -a "$LOG_FILE"
done

echo "Component comparison completed." | tee -a "$LOG_FILE"
echo "Check the '$COMPARISON_DIR' directory for differences and '$LOG_FILE' for the log."

