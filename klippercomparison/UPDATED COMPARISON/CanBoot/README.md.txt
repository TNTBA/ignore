Differences in README.md:

- Lines with differences: 8 lines in 2 blocks

Detailed Differences:

--- /media/mks/5dcae443-0796-4029-ae6c-bf5bd2a37067/home/mks/CanBoot/README.md	2023-08-12 06:18:50.848709110 -0400
+++ /home/mks/firmware_comparison/downloads/CanBoot/README.md	2024-10-08 17:45:28.434223129 -0400
@@ -99,6 +99,11 @@
    flashtool.py -i can0 -q
    ```
 
+   **NOTE: A query should only be performed when a single can node is on
+   the network.  Attempting to query multiple nodes may result in transmission
+   errors that can force a node into a "bus off" state.  When a node enters
+   "bus off" it becomes unresponsive.  The node must be reset to recover.**
+
    For USB/UART devices:
    Before flashing, make sure pyserial is installed.  This step only needs to
    be performed once:
@@ -165,6 +170,11 @@
 
 ## Katapult Deployer
 
+**WARNING**: Make absolutely sure your Katapult build configuration is
+correct before uploading the deployer.  Overwriting your existing
+bootloader with an incorrectly configured build will brick your device
+and require a programmer to recover.
+
 The Katapult deployer allows a user to overwrite their existing bootloader
 with Katapult, allowing modification and updates without a programmer.  It
 is *strongly* recommended that an alternate recovery (programmer, DFU, etc)
