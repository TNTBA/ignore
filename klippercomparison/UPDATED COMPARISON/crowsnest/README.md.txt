Differences in README.md:

- Lines with differences: 327 lines in 5 blocks

Detailed Differences:

--- /media/mks/5dcae443-0796-4029-ae6c-bf5bd2a37067/home/mks/crowsnest/README.md	2023-12-15 01:50:44.402398135 -0500
+++ /home/mks/firmware_comparison/downloads/crowsnest/README.md	2024-10-08 17:45:29.818228183 -0400
@@ -10,11 +10,23 @@
 
 # crowsnest
 
-A webcam daemon for Raspberry Pi OS Lite images like [MainsailOS](https://github.com/mainsail-crew/MainsailOS)
+A wrapper script for webcam streaming on Raspberry Pi OS Lite images like [MainsailOS](https://github.com/mainsail-crew/MainsailOS). Mainly written in bash.
+
+-   [Why is it called crowsnest?](#why-is-it-called-crowsnest)
+-   [Support](#support)
+-   [Documentation](#documentation)
+-   [Compatibility](#compatibility)
+-   [Contribute](#contribute)
+-   [How to support us?](#how-to-support-us)
+-   [CustomPiOS-module](#custompios-module)
+-   [What 'Backends' does crowsnest use](#what-backends-does-crowsnest-use)
+-   [Credits](#credits)
 
 ---
 
-## It inherited his name from sailing ships crow's nest.
+## Why is it called crowsnest?
+
+**It inherited his name from sailing ships crow's nest.**
 
 > A crow's nest is a structure in the upper part of the main mast of a ship or a structure that is used as a lookout point. \
 > See https://en.wikipedia.org/wiki/Crow's_nest
@@ -23,90 +35,24 @@
 
 ---
 
-<br>
-
-# :rotating_light: Attention :rotating_light:
-
-_**This branch is intended to be used if you need to use Debian 10 (codename "buster") based OS images.**_
-
-This branch is more or less unmaintained.
-In my opinion, it worked very well and had no real problems until I released version 4.
-
-I will make some fixes if there is a need, but my main focus is on the current version (`master`branch)
-
-**Please note that the only documentation for this branch is in this document**
-
-<br>
-<br>
-
-## Index:
+## Support
 
--   [Foreword](#foreword)
--   [Installation](#installation)
-
-<br>
-
--   [Configuration :exclamation: **READ THIS** :exclamation:](#simple-configuration)
-
-<br>
-
--   [FAQ :exclamation: **READ THIS** :exclamation:](#faq)
-    -   [I get / keep getting Error 127 in line 31](#question-i-get--keep-getting-error-127-in-line-31-what-can-i-do)
-    -   [I set `mode` to `rtsp`, but I get no stream in VLC](#question-i-set-mode-to-rtsp-but-i-get-no-stream-in-vlc-what-should-i-do)
-    -   [I have twice the same model of a USB Cam, cant get both to show up](#question-i-have-twice-the-same-model-of-a-usb-cam-cant-get-both-to-show-up-what-can-i-do)
-    -   [How to install/use a Raspicam (V1/V2 are tested, HQ Variant untested)](#question-how-to-installuse-a-raspicam-v1v2-are-tested-hq-variant-untested)
-    -   [I use a Raspicam and a USB one but I cant get them both for unknown reason](#question-i-use-a-raspicam-and-a-usb-one-but-i-cant-get-them-both-for-unknown-reason-how-do-i-fix-that)
-
-<br>
-
--   [How do I contribute the best way](#question-how-do-i-contribute-the-best-way)
--   [I want to support you in person, because \<fillinyourreason>! - How? ](#question-but-kwad-i-want-to-support-you-in-person-because-fillinyourreason-how)
-
-<br>
-
--   [CustomPiOS-module](#custompios-module)
--   [What 'Backends' uses crowsnest?](#what-backends-uses-crowsnest)
--   [Credits](#credits)
+Please read carefully on [how to configure](https://crowsnest.mainsail.xyz/) crowsnest to your needs! Check out the [FAQ](https://crowsnest.mainsail.xyz/) section for first aid or join our [Discord](https://discord.gg/mainsail) server if you need further help. For some topics that are not covered in the documentation, just read below.
 
-<br>
-<br>
-<br>
+_**PS: Do not open issues that are based on misconfiguration! This makes it harder for me to keep track of problems in my code.**_
 
 ---
 
-<br>
+## Documentation
 
-## Foreword
+We have decided to move crowsnest's documentation to a new location.\
+Please go to [https://crowsnest.mainsail.xyz/](https://crowsnest.mainsail.xyz/)
 
-Thank you for choosing crowsnest as your stream service.
-
-**Please read carefully on [how to configre](#simple-configuration) crowsnest to your needs!**
-
-If you have any trouble that isn't corelated to my bad code :wink:
-
-see [FAQ](#faq) section for first aid. :rotating_light:
-
-Please join our [Discord](https://discord.gg/mainsail) server if you need further help.
-
-Do not open issues that are based on misconfiguration!
-
-This makes it harder for me to keep track of issues in my code.
-
-Thanks in advance \
-Regards KwadFan
-
-<br>
+If there is something in our documentation that is not covered, is described in a way that is misunderstood, or simply is missing, please let us know!
 
 ---
 
-<br>
-
-## Installation
-
-    cd ~
-    git clone -b legacy/v3 https://github.com/mainsail-crew/crowsnest.git
-    cd ~/crowsnest
-    sudo make install
+## Compatibility
 
 Tested on the following distributions:
 
@@ -116,411 +62,66 @@
 Should work but not tested: :question: \
 Not available: :heavy_minus_sign:
 
-|         Operating System          |  X86 Architecture  |     ARM Architecture     |
-| :-------------------------------: | :----------------: | :----------------------: |
-|        MainsailOS (<0.7.1)        | :heavy_minus_sign: | :heavy_check_mark: (rpi) |
-|        MainsailOS (>1.0.0)        | :heavy_minus_sign: | :heavy_check_mark: (rpi) |
-|              Armbian              |     :question:     |    :heavy_check_mark:    |
-|        Ubuntu Server 20.04        | :heavy_check_mark: |        :question:        |
-|      Ubuntu Server 22.04 LTS      | :heavy_check_mark: | :heavy_check_mark: (rpi) |
-| Linux Mint 21 (codename: vanessa) | :heavy_check_mark: |        :question:        |
-|    Archlinux (and derivatives)    |        :x:         |           :x:            |
-|           Alpine Linux            |        :x:         |           :x:            |
+|         Operating System          |  X86 Architecture  |     ARM Architecture                        |
+| :-------------------------------: | :----------------: | :-----------------------------------------: |
+|     Raspberry Pi OS (buster)      | :heavy_minus_sign: |   :x: ([Hint](#hint-buster))                       |
+|    Raspberry Pi OS (bullseye)     | :heavy_minus_sign: |    :heavy_check_mark:                       |
+|    Raspberry Pi OS (bookworm)     | :heavy_minus_sign: | :heavy_check_mark: ([Hint](#hint-bookworm)) |
+|        MainsailOS (<0.7.1)        | :heavy_minus_sign: |   :x: ([Hint](#hint-buster))                       |
+|        MainsailOS (>1.0.0)        | :heavy_minus_sign: | :heavy_check_mark: (rpi)                    |
+|              Armbian              |     :question:     |    :heavy_check_mark:                       |
+|              DietPi               |     :question:     |    :heavy_check_mark: (rpi)                 |
+|        Ubuntu Server 20.04        | :heavy_check_mark: |        :question:                           |
+|      Ubuntu Server 22.04 LTS      | :heavy_check_mark: | :heavy_check_mark: (rpi)                    |
+|      Ubuntu Server 23.10          |     :question:     | :heavy_check_mark: (rpi)                    |
+| Linux Mint 21 (codename: vanessa) | :heavy_check_mark: |        :question:                           |
+|    Archlinux (and derivatives)    |        :x:         |           :x:                               |
+|           Alpine Linux            |        :x:         |           :x:                               |
 
 _If you test that on other distributions, feel free to open a Pull Request to enhance documentation._
 
-After successful installation you should consider to add
-
-    [update_manager crowsnest]
-    type: git_repo
-    path: ~/crowsnest
-    origin: https://github.com/mainsail-crew/crowsnest.git
-    primary_branch: legacy/v3
-    install_script: tools/install.sh
-
-to your _moonraker.conf_, to get latest and possibly greatest features.
-
-### To uninstall 'crowsnest'
-
-    cd ~/crowsnest
-    make uninstall
-
-### Are there more options?
-
-Yes.
-
-    cd ~/crowsnest
-    make
-
-or
-
-    make help
-
-For advanced users it is possible to configure the installer.
-
-Simply run:
-
-    make config
-
----
-
-<br>
-
-## Simple Configuration
-
-All you need to get your camera up and running is a small block of code in your _crowsnest.conf_ \
-In MainsailOS you can do that in mainsail web interface. \
-Open the 'config' section, there should be the mentioned file.
-
-By default it look like this:
-
-    [crowsnest]
-    log_path: ~/printer_data/logs/crowsnest.log
-    log_level: quiet
-
-    [cam 1]
-    mode: mjpg
-    port: 8080
-    device: /dev/video0
-    resolution: 640x480
-    max_fps: 15
-
-What that basicly means is:
-
-    log_path: ~/printer_data/logs/crowsnest.log
-
-**:warning: _Do not change after installation! This will prevent logrotate properly handling the log file rotation!_ :warning:**
-
-You can choose:
-
-    log_level: quiet
-
-This option shows a bare minimum logfile. \
-For example:
-
-    [06/16/22 09:57:01] crowsnest: crowsnest - A webcam Service for multiple Cams and Stream Services.
-    [06/16/22 09:57:01] crowsnest: Version: v2.4.0-15-ge42799b
-    [06/16/22 09:57:01] crowsnest: Prepare Startup ...
-    [06/16/22 09:57:01] crowsnest: INFO: Checking Dependencys
-    [06/16/22 09:57:01] crowsnest: Dependency: 'crudini' found in /usr/bin/crudini.
-    [06/16/22 09:57:02] crowsnest: Dependency: 'find' found in /usr/bin/find.
-    [06/16/22 09:57:02] crowsnest: Dependency: 'logger' found in /usr/bin/logger.
-    [06/16/22 09:57:02] crowsnest: Dependency: 'xargs' found in /usr/bin/xargs.
-    [06/16/22 09:57:02] crowsnest: Dependency: 'ffmpeg' found in /usr/bin/ffmpeg.
-    [06/16/22 09:57:02] crowsnest: Dependency: 'ustreamer' found in bin/ustreamer/ustreamer.
-    [06/16/22 09:57:02] crowsnest: Dependency: 'rtsp-simple-server' found in bin/rtsp-simple-server/rtsp-simple-server.
-    [06/16/22 09:57:02] crowsnest: INFO: Detect available Devices
-    [06/16/22 09:57:02] crowsnest: INFO: Found 1 total available Device(s)
-    [06/16/22 09:57:02] crowsnest: Detected 'Raspicam' Device -> /dev/video0
-    [06/16/22 09:57:02] crowsnest: INFO: No usable CSI Devices found.
-    [06/16/22 09:57:02] crowsnest: V4L2 Control:
-    [06/16/22 09:57:02] crowsnest: No parameters set for [cam 1]. Skipped.
-    [06/16/22 09:57:02] crowsnest: Try to start configured Cams / Services...
-    [06/16/22 09:57:03] crowsnest: INFO: Configuration of Section [cam 1] looks good. Continue...
-    [06/16/22 09:57:03] crowsnest: Starting ustreamer with Device /dev/video0 ...
-    [06/16/22 09:57:05] crowsnest: ... Done!
-
-The next option is
-
-    log_level: verbose
-
-This gives you a little more informations. \
-It prints out you existing _webcam.conf_ and shows a detailed info about your configured ( and connected ) cams.
-
-You will find an example log [here](log-example.md).
-
-This is useful to determine what the hardware encoder of your camera is capable of. \
-In this case a "cheap" raspicam for about 7€ was used. \
-So, truly made for 'Helper for Setup' purposes.
-
-If you want to get the full details, please use
-
-    log_level: debug
-
-This will show you barely the same as 'verbose' but it prints also your configured start parameters ( and the defaults ), \
-also it shows the output of your choosen streamer. \
-This option ist more for debugging purposes and has a tendency to overwhelm you if you are not familiar with that.
-
----
-
-Another option that affects the 'logging' behavior is
-
-    delete_log: true
-
-If you enable that option, everytime you restart, your existing log file will be deleted.
-
-If you want to run crowsnest without any proxy set up, \
-you can use
-
-    no_proxy: true
-
-This forces ustreamer to listen on all available network interfaces.
-
----
-
-Now the more interessting part.
-
-    [cam 1]
-    mode: mjpg
-    port: 8080
-    device: /dev/video0
-    resolution: 640x480
-    max_fps: 15
-
-_**Note:** You can name the cam, how you want! ex.: [cam raspicam]_
-**Attention: Do not skip the keyword 'cam'**
-
----
-
-This section should be pretty much self explantory.
-
-    mode: mjpg
-
-means your choosen streamservice will be ustreamer with the well known mjpg-protocol. \
-You can choose:
+#### Hint Buster
 
-    mode: rtsp
+OS images that are based on Debian 10 (codename 'buster') are no longer supported with Crowsnest version 4 (current `master` branch)!
 
-This let you use external viewer like vlc for example. \
-To view the stream use a proper player like [VLC](https://www.videolan.org/).
+Please use the `legacy/v3` branch for these OS types.\
+See the [README.md](https://github.com/mainsail-crew/crowsnest/tree/legacy/v3) of this branch for usage instructions.
 
-**The stream url will be _rtsp://\<printeriporname\>:8554/\<yourcamerasectionname\>_** \
-As an example: _rtsp://mainsail.local:8554/1_ \
+#### Hint Bookworm
 
-> _There will be no preview in your Browser!_
+Raspberry Pi OS images that are based on Debian 12 (codename 'bookworm') currently use a different branch of [camera-streamer](https://github.com/ayufan/camera-streamer)!
+The Raspberry Pi 5 has only [ustreamer](https://github.com/pikvm/ustreamer) support! This is due to the missing JPEG and H264 Hardware encoders.
 
 ---
 
-    port: 8080
-
-This will only affect the used port of ustreamer.
-
-> **_Ports 8080 - 8084 are covered by nginx reverse proxy in MainsailOS_** \
-> **_According to that 8080 will be /webcam, port 8081 will be /webcam2 and so on._**
-
----
-
-    device: /dev/video0
-
-This setting defines what video device will be used by the selected service.
-
-If you are not using a Raspberry Pi then `/dev/video0` might not work and you might encounter an "`Video capture not supported by the device`" error in the `crowsnest.log` log file.
-
-In this case you should use the direct device ID for the USB camera found in the `/dev/v4l/by-id` directory, like in the following example:
-
-    device: /dev/v4l/by-id/usb-PixArt_Imaging_Inc._USB2.0_Camera-video-index0
-
-Please be aware that all available devices are always listed in the `crowsnest.log` log file, so you can always copy the appropriate device ID from there.
-
----
-
-    resolution: 640x480
-
-Your desired FPS settings has to match what your camera able to deliver! \
-
-> _For the most part ignored in rtsp mode!_
-
-    max_fps: 15
-
-This last option only affects ustreamer: \
-This needs some to read further information.
-
-    custom_flags:
-
-If you enable this in your `[cam whatevernameyouset]`, \
-you can add parameters according to your needs. \
-Those will be appended to the default/preconfigured parameters.
-
-> **_These are seperated by a single space not comma seperated!_**
-
-To setup services to your need you have to take a closer look to the documentation of the project. \
-As a pointer in the right direction:
-
--   ustreamer
-    -   For sake of simplicity I converted ustreamers manpage to [ustreamer's manpage](./ustreamer_manpage.md)
-
----
-
-### Feature V4L2 Control:
-
-    v4l2ctl:
-
-This optional parameter allows you to setup your Cam due v4l2-ctl options. \
-Unfortunatly this is a complex topic. \
-But I try to explain it, as good I can.
-
-### As an Example
-
-You own a Logitech C920 Camera, these camera needs some tweaks to get a sharp picture. \
-A solution was to use a cronjob (timed actions due scripts) that runs a script with some v4l2-ctl commands.
-
-    v4l2-ctl -d /dev/video0 -c focus_auto=0
-    v4l2-ctl -d /dev/video0 -c focus_absolute=30
-
-That script gets executed when th Pi boots up. \
-Not a comfortable solution.
-
-[_alexz_](https://github.com/zellneralex) from the [mainsail-crew](https://github.com/orgs/mainsail-crew/people) mentioned it would be a good move when this could happen by crowsnest, hassle free for the user.
-
-Take a look at [alexz webcam.conf](https://github.com/zellneralex/klipper_config/blob/11f4f8db8ac0e273e25134b571d0a93291f3511e/webcam.conf)
-
-So, here we go.
-Simply add
-
-    v4l2ctl: focus_auto=0,focus_absolute=30
-
-to your camera setup section. \
-Restart webcamd via mainsail (or your used UI) and you're good to go.
-
-To determine which options or better said parameters your webcam provides, set at least
-
-    log_level: verbose
-
-This will show you a list with available options. Like this:
-
-    [04/02/22 15:07:44] webcamd: Supported Controls:
-    [04/02/22 15:07:44] webcamd: 		brightness 0x00980900 (int) : min=1 max=255 step=1 default=128 value=128
-    [04/02/22 15:07:44] webcamd: 		contrast 0x00980901 (int) : min=1 max=255 step=1 default=128 value=128
-    [04/02/22 15:07:44] webcamd: 		saturation 0x00980902 (int) : min=1 max=255 step=1 default=128 value=128
-    [04/02/22 15:07:44] webcamd: 		white_balance_temperature_auto 0x0098090c (bool) : default=1 value=1
-    [04/02/22 15:07:44] webcamd: 		gain 0x00980913 (int) : min=1 max=100 step=1 default=50 value=50
-    [04/02/22 15:07:45] webcamd: 		power_line_frequency 0x00980918 (menu) : min=0 max=2 default=1 value=1
-    [04/02/22 15:07:45] webcamd: 		0: Disabled
-    [04/02/22 15:07:45] webcamd: 		1: 50 Hz
-    [04/02/22 15:07:45] webcamd: 		2: 60 Hz
-    [04/02/22 15:07:45] webcamd: 		white_balance_temperature 0x0098091a (int) : min=2800 max=6500 step=1 default=4650 value=4650 flags=inactive
-    [04/02/22 15:07:45] webcamd: 		sharpness 0x0098091b (int) : min=1 max=255 step=1 default=128 value=128
-    [04/02/22 15:07:45] webcamd: 		exposure_auto 0x009a0901 (menu) : min=0 max=3 default=0 value=0
-    [04/02/22 15:07:45] webcamd: 		0: Auto Mode
-    [04/02/22 15:07:45] webcamd: 		2: Shutter Priority Mode
-    [04/02/22 15:07:46] webcamd: 		exposure_absolute 0x009a0902 (int) : min=5 max=2500 step=1 default=5 value=5 flags=inactive
-    [04/02/22 15:07:46] webcamd: 		exposure_auto_priority 0x009a0903 (bool) : default=0 value=0
-
-You have to "play around" with those settings if it matches your needs. \
-simply repeat the commands as mentioned earlier in your ssh connection. \
-If you have discoverd your setup write that to your _webcam.conf_ as described.
-
----
-
-<br>
-
-## FAQ
-
----
-
-#### :question: I get / keep getting Error 127 in line 31. What can I do?
-
-**Solution:**
-
-Simple fix. For what ever reason ustreamer wont start. Run the following commands please.
-
-    sudo systemctl stop crowsnest.service
-    cd ~/crowsnest
-    make buildclean
-    make build
-    sudo systemctl start crowsnest.service
-
-Did it work? If your answer is yes... Was easy right? :wink: \
-If it doesn't work for you, you probably updated a Debian "Buster" to latest "Bullseye" right? \
-Here is the catch, Buster uses a proprietary Firmware for the GPU called OpenMaxIL. \
-This isn't included any more in "Bullseye". \
-These files are located in `/opt/vc`. \
-Please backup these files and delete this folder by
-
-    sudo rm -rf /opt/vc
-
-Now run the commands mentioned in the beginning.
-
----
-
-#### :question: I set `mode` to `rtsp`, but I get no stream in VLC. What should I do?
-
-**Solution:**
-
-Read your log. \
-If you are not using a raspicam or a camera with an inbuilt "H264" encoder, chances are equal to zero, to get a rtsp stream. \
-Sorry :man_shrugging:
-
----
-
-#### :question: I have twice the same model of a USB Cam, cant get both to show up. What can I do?
-
-**Solution:**
-
-Easy fix: Run
-
-    ls -l /dev/v4l/by-path
-
-Grab the two equal named devices, ending with `index0` \
-Use that paths as device path in your _crowsnest.conf_!
-
----
-
-#### :question: How to install/use a Raspicam (V1/V2 are tested, HQ Variant untested)?
-
-**Solution:**
-
-Well...
-
-If your device is a Raspberry Pi, one of the mentioned cameras **and** your OS is a Raspberry Pi OS based one, simply do nothing! \
-I tried as much as I can to reduce the steps to get that done. \
-Use `/dev/video0` as device in your _crowsnest.conf_ \
-That is the device path I try to force for Raspicams.
-
----
-
-#### :question: I use a Raspicam and a USB one but I cant get them both for unknown reason. How do I fix that?
-
-**Solution:**
-
-My "force action" for Raspicams has a downside. If your USB Cam was attached before you extended a raspicam, the path `/dev/video0` is blocked by that USB Cam.
-
-To fix that please unplug the USB one and reboot. \
-Plug the USB Cam in, after the stream of the raspicam is shown. \
-After that use the `/dev/v4l/by-id/<whateveryourdeviceidis>-index0` for the USB one and restart crowsnest. \
-
----
-
-#### :question: How do I contribute the best way?
-
-**Solution:**
-
-Well...
+## Contribute
 
 1. Create an Issue related to your topic.
-2. Prepare an _tested_ Pull Request against the develop branch
+2. Prepare an _tested_ Pull Request against the `develop` branch
     - Please use commits formatted according to [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
-    - Make sure not to ignore code formating as provided via [_.editorconfig_](.editorconfig) of this repo
-3. Be patient. Every PR has to pass some sort of "internal gates" before it will hit the master branch, unless an immediate reaction is crutial.
+    - Make sure you do not ignore the code formatting as provided by the [_.editorconfig_](.editorconfig) of this repo
+3. Be patient. Every PR has to go through some sort of "internal gates" before it reaches the master branch, unless an immediate response is crucial.
 
 ---
 
-#### :question: But Kwad I want to support you in person, because \<fillinyourreason>! How?
+## How to support us
 
-**Solution:**
+Buy [KwadFan](https://github.com/KwadFan) a coffee at [ko-fi.com](https://ko-fi.com/KwadFan) or [support the mainsail project](https://docs.mainsail.xyz/about/sponsors#support-mainsail)
 
-Buy me a coffee at [ko-fi.com](https://ko-fi.com/U7U2GK66P)
+Please consider hitting the :star: button in the upper right hand corner to show some love for this project.
 
 ---
 
 ## CustomPIOS Module
 
-I have decided to provide an [CustomPiOS Module](https://github.com/guysoft/CustomPiOS) to make it easier to integrate to other distributions like MainsailOS or similar. \
-Please see [README.md](./custompios/README.md) in the module folder for further informations.
+I have decided to provide a [CustomPiOS Module](https://github.com/guysoft/CustomPiOS) to make it easier to integrate with other distributions like MainsailOS or similar. \
+Please see [README.md](./custompios/README.md) in the module folder for more information.
 
 ---
 
-## What 'Backends' uses crowsnest?
+## What 'Backends' does crowsnest use?
 
--   ustreamer - A streamserver from Pi-KVM project \
-    active maintained by [Maxim Devaev](https://github.com/mdevaev) \
-    [ustreamer on github](https://github.com/pikvm/ustreamer)
-
--   rtsp-simple-server
-    -   This server provides rtsp streams and more \
-        at this point of development are only 'rtsp' features enabled \
-        More features are planned. \
-        [rtsp-simple-server](https://github.com/aler9/rtsp-simple-server) is written in Go by [aler9](https://github.com/aler9)
+Please see the according [FAQ](https://crowsnest.mainsail.xyz/faq/backends-from-crowsnest) section in our documentation.
 
 ---
 
@@ -534,6 +135,8 @@
 
 Thanks to [Pedro Lamas](https://github.com/pedrolamas), for the ISSUE_TEMPLATES.
 
+Thanks to [ayufan](https://github.com/ayufan) for keep going on camera-streamer, even I stressed him to get rid of some bugs ;)
+
 ---
 
 <p align="center">
@@ -542,4 +145,4 @@
 
 **So, with all that said, get your position seaman! Prepare to get wet feets on your journey.**
 
-## ARRRR yooo rrready to sail?
+## Are you ready to sail?
