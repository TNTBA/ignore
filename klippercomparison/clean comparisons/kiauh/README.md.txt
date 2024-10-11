Differences in README.md:

- Lines with differences: 19 lines in 5 blocks

Detailed Differences:

--- /media/mks/5dcae443-0796-4029-ae6c-bf5bd2a37067/home/mks/kiauh/README.md	2023-12-15 01:08:34.837257048 -0500
+++ /home/mks/firmware_comparison/downloads/kiauh/README.md	2024-10-08 17:45:33.575241837 -0400
@@ -29,7 +29,7 @@
 ### 📋 Prerequisites
 KIAUH is a script that assists you in installing Klipper on a Linux operating system that has
 already been flashed to your Raspberry Pi's (or other SBC's) SD card. As a result, you must ensure 
-that you have a functional Linux system on hand. `Raspberry Pi OS Lite (32bit)` is a recommended Linux image 
+that you have a functional Linux system on hand. `Raspberry Pi OS Lite (either 32bit or 64bit)` is a recommended Linux image 
 if you are using a Raspberry Pi. The [official Raspberry Pi Imager](https://www.raspberrypi.com/software/) 
 is the simplest way to flash an image like this to an SD card.
 
@@ -39,7 +39,7 @@
   <img src="https://raw.githubusercontent.com/dw-0/kiauh/master/resources/screenshots/rpi_imager1.png" alt="KIAUH logo" height="350">
 </p>
 
-* Then select `Raspberry Pi OS Lite (32bit)`:
+* Then select `Raspberry Pi OS Lite (32bit)` (or 64bit if you want to use that instead):
 <p align="center">
   <img src="https://raw.githubusercontent.com/dw-0/kiauh/master/resources/screenshots/rpi_imager2.png" alt="KIAUH logo" height="350">
 </p>
@@ -125,7 +125,7 @@
 <tr>
 <th><img src="https://raw.githubusercontent.com/fluidd-core/fluidd/master/docs/assets/images/logo.svg" alt="Fluidd Logo" height="64"></th>
 <th><img src="https://avatars.githubusercontent.com/u/31575189?v=4" alt="jordanruthe avatar" height="64"></th>
-<th><img src="https://camo.githubusercontent.com/627be7fc67195b626b298af9b9677d7c58e698c67305e54324cffbe06130d4a4/68747470733a2f2f6f63746f7072696e742e6f72672f6173736574732f696d672f6c6f676f2e706e67" alt="OctoPrint Logo" height="64"></th>
+<th><img src="https://raw.githubusercontent.com/OctoPrint/OctoPrint/master/docs/images/octoprint-logo.png" alt="OctoPrint Logo" height="64"></th>
 </tr>
 <tr>
 <th>by <a href="https://github.com/fluidd-core">fluidd-core</a></th>
@@ -154,18 +154,20 @@
 <tr>
 <th><h3><a href="https://github.com/Clon1998/mobileraker_companion">Mobileraker's Companion</a></h3></th>
 <th><h3><a href="https://octoeverywhere.com/?source=kiauh_readme">OctoEverywhere For Klipper</a></h3></th>
+<th><h3><a href="https://github.com/crysxd/OctoApp-Plugin">OctoApp For Klipper</a></h3></th>
 <th><h3></h3></th>
 </tr>
 
 <tr>
-<th><a href="https://github.com/Clon1998/mobileraker_companion"><img src="https://raw.githubusercontent.com/Clon1998/mobileraker/master/assets/icon/mr_appicon.png" alt="OctoEverywhere Logo" height="64"></th>
+<th><a href="https://github.com/Clon1998/mobileraker_companion"><img src="https://raw.githubusercontent.com/Clon1998/mobileraker/master/assets/icon/mr_appicon.png" alt="OctoEverywhere Logo" height="64"></a></th>
 <th><a href="https://octoeverywhere.com/?source=kiauh_readme"><img src="https://octoeverywhere.com/img/logo.svg" alt="OctoEverywhere Logo" height="64"></a></th>
-<th></th>
+<th><a href="https://octoapp.eu/?source=kiauh_readme"><img src="https://octoapp.eu/octoapp.webp" alt="OctoApp Logo" height="64"></a></th>
 </tr>
 
 <tr>
 <th>by <a href="https://github.com/Clon1998">Patrick Schmidt</a></th>
 <th>by <a href="https://github.com/QuinnDamerell">Quinn Damerell</a></th>
+<th>by <a href="https://github.com/crysxd">Christian Würthner</a></th>
 <th></th>
 </tr>
 
@@ -174,6 +176,16 @@
 
 <hr>
 
+<h2 align="center">🎖️ Contributors 🎖️</h2>
+
+<div align="center">
+  <a href="https://github.com/dw-0/kiauh/graphs/contributors">
+    <img src="https://contrib.rocks/image?repo=dw-0/kiauh" alt=""/>
+  </a>
+</div>
+
+<hr>
+
 <h2 align="center">✨ Credits ✨</h2>
 
 * A big thank you to [lixxbox](https://github.com/lixxbox) for that awesome KIAUH-Logo!
