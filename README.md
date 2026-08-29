That wasn't that useful, just basic, and I don't have another thing.

Hey, guys. I'm back, with a new tinkering device! (Samsung Galaxy A2 Core, Dark Grey, 8GB storage, expandable by SD card, 1GB RAM, running on a reflashed INS firmware, of Android 8.1.0 - Oreo Go Edition.)

And by the way, I had to reflash, because the phone was from Thailand, and would default back to Thai on reset, and also, the THL firmware it originally had, was region-locked, and had way more bloat than the INS version.

Anyway, enough background. Let's get tinkering with an Android device!

So, yeah, here's the stuff I managed to play with off-scene:

Unlocked the bootloader, after flashing the INS firmware.

Installed Termux.

Compiled Lua 5.4.6 from source, after installing normally failed, like, 5 times.

Currently prototyping a "Call Lua from WebKit" thing, haven't tested.

Sorry I haven't updated this, lol. 'Member how I was talking about hacking a M8 Game Stick? Nope. Even though it runs U-Boot and a stripped down Linux 3.x/4.x kernel, there's no way to get a shell, so nah. So, final plan: Buy a remote for that Fire Stick, get ADB running, and do my research. You will see scripts published here soon, lol, so check that out.

(Kamikiri failed, fought with FireISO and installing Kamikiri for 2 and a half hours, it failed, lol.)

So, gonna work with primarily older Android devices (KitKat to Pie), and see how that goes. Maybe work with Red Velvet Cake in the future, lol, when I get a Pixel XL (when I get a stable job and cash.)

Bye for now, FreeBSDKernel9-0.

Oh, hey. So, update, getting a Fire Stick remote tomorrow, so I don't have to buy one. But, anyway, I'm working on ideas, but I don't have any yet, since I don't have file paths and shit, but when I get into the file paths, and other stuff, like API's (for custom pop-up's, notifications, yada, yada, yada), I will FINALLY start making scripts. Also, I said this in my old repo, but I need to add a thing.

I will have seperate folders, with guides for where to go and stuff, so that's cool. But yeah, folders, with my scripts. They will be MKSH, though (sorry, Linux bros!), because I only know Debian Bash, and plus, I primarily tinker with Android stuff, so yeah, cool.

Anyway, see ya, FreeBSDKernel9-0.

So that last C thing was too basic, so I'm not even gonna bother writing C. I'd rather read and explain C, like what Low Level does, since I can read most languages, including C, just not write them. But yeah, got a remote, which paired first try, but no WiFi on it (entirely my fault).

But yeah, the person that gave me the remote said they'll give me a new Fire Stick if mine doesn't work, so my thing (I didn't announce the name previously) Operation: Dumb ADB Tomfoolery isn't dead. But anyway, lemme explain what happened:

I cracked the WiFi/Bluetooth chip (MediaTek 67739 BSN) when pulling the shield off without heat, in the top-left corner, so yeah, amazing. That's why the remote paired first try, but the WiFi kept dropping. So, that's fun, I guess.

Anyway, I'm out, FreeBSDKernel9-0.

So yeah, update, that stick died. I was messing around and found a set of pins about a millimeter apart from the CPU (I've no clue, MediaTek ARM something something?) arranged in a colon pattern, and they were CLK and DAT. So I then found out by shorting DAT with the end of a paperclip, the whole stick reboots. Thought that was cool, and kept doing it, then realized I scraped the pin off the board, and when I tried to turn it on again, it wouldn't boot.

But yeah, cracked WiFi chip anyway, so it was a brick, anyway. That's kinda annoying, since it might've been hackable with Kamikiri, considering how long it wasn't updated for. Welp, never mind. Anyway, posted my first release, ro-debuggable.sh . And you'll see this repo get wayyy more releases than some of my others, since MKSH is a language I reliably know (still learnng, but it's pretty simple) so I don't need to wait for devs, I can just do it myself.

Anyway, bye, FreeBSDKernel9-0.

So, hey guys. Got that Fire Stick.

Here's the specs:

Fire TV Stick 2nd Gen (internally code named 'tank')

Firmare version: Fire OS 5.2.9.5

Build ID: LVY48F

What it's based on: Android Lollipop (5.1.1)

Made in: Luxembourg

Assembled in: China

Model No: LY73PR

And spoilers, I already found a wide-open Privilege Leak.

Later, FreeBSDKernel9-0.

Oh, hey. So, I'm back from doing a release real quick. So anyway, lemme explain this Privilege Leak I found. It's a classic Privilege Leak on the flag for core_dump_debug_enable (which was set to [n], before I exploited this Leak), that allows you to just... kinda enable that debug flag. When testing, I used it to get a bugreport.txt fle from when I crashed Amazon's custom boot init, neo-init. For context, before that flag was enabled, I couldn't get one, because the data/tombstones directory required (root) access, and trying to get a Bug Report from the shell would just throw an error.

Oh, also got Silk's version string: Chromium Blink 108.0.5359.220. This probably has some vulnerabilities, but:

(1) Not a web developer. (2) I have literally zero experience in exploiting V8 CVE's, I'd shout out @nt-fargo for that, lol. (The 'CSSFontFace Use-After-Free in WebKit' guy.)

Anyway, later, FreeBSDKernel9-0.

Holy mother of- Yo, it's literally been a few hours since I discovered the core_dump_debug_enable vulnerability, and I just got, like, WAAY more.

Improper Access Control (CWE 284) In The SQLite3 Tables, Allowing For Full SQLite3 Read/Write Access Information Disclosure (CWE 200) And Incorrect Permission Assignment (CWE 276) Aiding In Gaining Full SQLite3 Read/Write Access Missing Authorization (CWE 862) And Improper Handling Of System Disruptions (CWE 755) Aiding To DoS The DREAMING_STATE Screensaver

So, as you can tell, I've been pretty busy today, huh?

Oh, hello again. Posted my core_dump_debug_enable Privilege Leak script, and just from that, I got a few extra:

External Control Of System Configuration Setting (CWE 15) In The Property Flags, To Aid In A Privilege Leak Chain Improper Privilege Management (CWE 269) To Gain Unauthorized Access To (root) Property Flags Externally Controlled Reference To A Resource In Another Sphere (CWE 610) To Trigger A (root) Property Flag While In UID 2000 (shell).

Bye for now, FreeBSDKernel9-0.

Well, turns out DoS'ing the screensaver once worked, but it now doesn't, so here's two new apps (Netflix/YouTube) that use these same vulnerabilities to crash:

Using CWE 755 (Improper Handling Of System Disruptions), and CWE 862 (Missing Authorization) to panick the Android System Server, and throw a NULL Focused App dump. (Updated BrokenAccessControlChain.sh to accomodate.)

Anyway, bye, FreeBSDKernel9-0.

So, update, found yet another vulnerability. Jeez, it's been, like, 3 days! Now, the script I released to trigger it is compltely broken, but it's just supposed to show how it works, anyway.

Now, the vulnerability. It's a vulnerability in the 'WiFi Password' field in the Settings app, where, by inserting special characters after you've reached the character limit, you can cause an App Crash.

At it's core, it's an Input Sanitization Flaw, Leading To a Buffer Overflow, and App Crash.

What it leverages:

CWE 20 (Improper Input Validation) CWE 1284 (Improer Validation Of Specifed Quality In Input) CWE 120 (Buffer Copy Without Checking The Size Of Input) CWE 787 (Out Of Bounds Write)

How to trigger it (manually):

Launch Settings (either with shell commands, or by just going to the Settings icon, and hitting Network)

Go to a WiFi network that isn't connected (or just disconnect yours)

Click it

When it asks for a Password, type 'A' a bunch, until you can't type any more characters.

Then immediately start spamming the $ sign (It's a special character, which triggers the Buffer Overflow)

Instead of stripping them out lie a secure app, it will keep letting you type them

When you feel like it, immediately start spamming the " symbol

Same as earlier, but spam the & symbol

Then spam more $ symbols (This triggers the crash)

Hit 'Submit' like normal

If lucky: It will freeze for a few seconds, then kick you to the Home Screen (or sometimes yank you back into your last app) If not: Instead of displaying 'Invalid Password', it will freeze, then show a message saying 'An unexpected error has occurred.'

Later, FreeBSDKernel9-0.

Cool, cool, cool. Found a permanent bypass for the BIND_DREAMING_STATE signature on the screensaver, using the exact same vulnerabilities as before, but this time, it's not a fluke, I tested many times. So, anyway, using the same vulnerabiliies as last time I tried to call, and then subsequently DoS, the screensaver, I have now found a permant bypass for the BIND_DREAMING_STATE signature, using a basic AOSP flag, all because Amazon forgot to check if the caller of a system signed app, mind you, is signed by [system].

So obviously, the vulnerability stems from more than one CWE, like last time.

CWE 862: Missing Authorization To Call An App Signed By [system] CWE 755: Improper Handling Of System Disruptions Leading To App/Service Crash (DoS) CWE 926: Improper Export Of Android Component, Leading To Restriction Bypass

Anyway, the 'basic AOSP flag' I was talking about. It's literally am start -p. When using -p, there is no check in place to make sure you are [system] or (root) before the command executes, like -n, -a, etc, meaning you can literally just run this, and it will happily let you launch a system signed app, and, in my case, DoS it. So that means, if someone found an RCE bug that allowed access to a 'tank', they could run this on any system signed app, which led me to the next piece I found. Using CWE 862, you can also list/launch apps in the /system/priv-app folder, that you're literally not supposed to get access to, without being [system] or (root). That's the whole point of LPE's, to do dumb shit you're not usually allowed to do.

Anyway, my goal here was to get an RCE, still haven't found one, but I'm sure I will.

Later, FreeBSDKernel9-0.

So, been messing around over a few days, and found a case of CWE 755 (Improper Handling Of System Disruptions), and a new one: CWE 400 (Uncontrolled Resource Consumption), which, of course, I weaponized.

Basically, I found 3 ways to crash the Kernel (Kernel Panic, Leading To A System-Wide LDoS), using dd commands to flood the eMMC.

Spawning a ton of Internal Jobs and PID's, until the system can't keep up, and KP's, crashing your shell, so you can't even $(reboot) your way out, and have to unplug it for a solid minute.

Nuking the LMK, using dd, which did cause a crash leading to a reboot, but not always.

Overwhelming the LMK, using dd, which triggers the watchdog to reset, and the system to crash (this will sometimes freeze your terminal, LOL.)

Also, I found a way to get temp [system] privileges, too.

Anyway, bye for now, FreeBSDKernel9-0.

(LMAO, Dumb Ways To Die just started playing.) Anyway, temp [system] privileges. Using CWE 78 (OS Command Injection), CWE 610 (Externally Controlled Reference To A Resource In Another Sphere), and CWE 755 (Improper Handling Of System Disruptions), and CWE 862 (Missing Authorization), you can gain access to a 'core' subpackage behind the Settings app (that you're normally not even supposed to see, hence CWE 862) and execute commands, to gain temp [system] privileges.

The package is: com.amazon.settings.core, and nomally, you're not even supposed to see this, but this is the same software version that Amazon left development gear in (Devo), but I wasn't able to get access.

Anyway, on track. You can gain [system] privileges, but since you're in an app, controlling from a shell, you have both Java App Sandboxing and SELinux breathing down your neck, meaning, it really is temporary. So temporary, that SELinux sees you're in shell immediately when you execute a thing, and lowers your privileges back down, exactly like how FreeRTOS' xPortRaisePrivilege() function is supposed to work, except this isn't FreeRTOS, it's just SELinux set to Enforcing.

(LMAO, FreeRTOS' xPortRaisePrivilege() was exploited, in CVE-2021-43997.)

So unless I find a way to hold privileges, this exploit won't be that useful.

Anyway, bye, FreeBSDKernel9-0.

Oh, hey. So I'm getting a new thing when I go home, and it's Linux based. It's a 4G modem USB dongle thing, by ciciglow (never heard of it, LOL.)

So yeah, apparently it runs Busybox ash, as it's shell, and the SoC is Qualcomm based. I'll drop the specs when I go home, so see you then.

Short 'n' sweet, FreeBSDKernel9-0.

So, update. It's been 5 days, it still hasn't arrived. I'm gonna giv up on it after 7, which sucks, because my Nana spent the cash I gave her to order it. I'm kinda pissed, LOL. But for now, might try to hack a Yoto Gen 3 (ESP32-S3, embedded Linux). I'll try that in, like, an hour, and update you.

FreeBSDKernel9-0.

So it's Day 7, I've given up on the package, if it comes, cool, but I don't care rn. Also, hacking that over WiFi was a dead end - Windows tools really suck, and BLE on light Linux is just junk. I will try, but probably won't get it. But, like, yeah, no cash. and no ciciglow. Thanks, Amazon and Elprico. You're crap.

FreeBSDKernel9-0.

'Kay, new idea. It's like 2AM rn, and I just got an admin password backdoor into my router, and am gonna try Telnet into my router, LOL. It's, like, some Sky Hub thing, one of those flat ones, with the small green LEDs, and I'll drop the specs, since I'm auth as admin now.

Broadcom BCM63168 SoC Backdoor: admin / sky Model: Upgraded ER115, crammed into a flatpack Linux Kernel: 3.4.11-rt19

So yeah, since it's officially Day 8 of the ciciglow drama, I'm gonna see if they left Telnet on Port 23, and come back.

FreeBSDKernel9-0.

Sorry I haven't updated in a bit. Here's my current info:

Nana messaged Amazon and Elprico, hasn't heard back, probs'll just get a refund.

MacOS got hacked. (screensharingd RCE/Auth Bypass - CVE-2026-65400)

I'm getting an older Kindle on Monday, to hack. (since, under the hood, Kindles are just a stripped Linux Kernel with Busybox)

Found two new bugs. But one I forgot how to replicate, so I won't document it.

FreeBSDKernel9-0.

So, I gave up on the router, LOL, so that rules out those bugs.

The bug is:

BriefBoot (Affected Device: Imaginear MP Touch) Will try test more on the bug, and hopefully get a CVE off MITRE.

CWE's:

CWE 400 (Active Debug Code) CWE 798 (Use Of Default/Hardcoded Credentials) CWE 16 (Security Misconfiguration)

Causes:

DPC isn't set up properly, allowing access to the Reboot/Power menu, and the APK used isn't set as Device Owner, allowing a boot time race condition.

The bug itself:

In the APK (tourBuilder), it's intended use at the Peterhead Prison Museum, is you go around, and type the codes on the different exhibits, to listen to info about them, in a provided set o headphones. So I quickly tried to exploit the approach, by typing random codes (I assumed there would be a backdoor code, and I was soon proven right), and I got one.

This is where CWE 798 and 400 come in. The code was 9999, and it led to a test menu. After playing around for a bit, I found my exploit, BriefBoot, which is a Kiosk Escape/Boot-time Race Condition vulnerability.

Exploit steps:

Type 9999 > Sync > Download Latest Version > tourBuilder has stopped > Reboot > immediately spam the app drawer > with a fast hand, you can get into Settings, enable Developer Options, etc. The 'wake lock' script is active (kicking you back into the APK), hence the 'fast hand' thing.

I haven't tried that yet, but I'll ask for a retired device when I go back, and test more.

Also, I will track this bug as 56737 (LOSER in single digit T9), due to the Loser, Baby TADC Remix, LMAO.

FreeBSDKernel9-0.

New bug. Not a software thing, rather a human being weird with config files. It's one of those bugs you look at, and wonder why it even exists.

Name: Awk2Shell

Affected devices: Any Linux based device with bad/rushed settings in /etc/sudoers.

CWE's:

CWE 269 (Improper Privilege Management)

CWE 78 (OS Command Injection - 'CMi')

CWE 732 (Incorrect Permission Assignment for Critical Resource)

Root cause:

This single line, that allows uid=33 (www-data) to access all data, and having /usr/bin/awk, which can run as sudo, and has system() access,as that's it's entire point: www-data ALL=(ALL) NOPASSWD: /usr/bin/awk

Impact: Using awk's system() function, you can spawn /bin/ash as (root), meaning, yep, full (root) shell.

I used Docker for my example, but any regular web server with www-data ALL=(ALL) NOPASSWD: /usr/bin/awk can have this bug.

Later, FreeBSDKernel9-0.

Another day, another LPE. This one is so dumb...

Gentle Paws

Gentle Paws is a bug that stems from a crappy startup script written in 2015, for Google Cloud Shell.

Where do I start...? Oh, um, I got one.

Using USER to see if the script is running as (root)? Check. Using direct calls to /bin/bash -c, which is exactly what system() does? Check. Using a wildcard (*) to pass whatever the first line you run to /bin/bash? Mmmhmm. Check.

Look, I'm not dunking on Google, I'm just saying it's a chain of weird decisions, that led to idiots like me getting an LPE, before the terminal even fully loads.

Also, letting UID 1000 symlink rsyslogd and other important services to /bin/true is a bad idea, considering... zero restrictions are in place to even stop that.

Also, $USER is literally spoofable, and is exactly how CVE-2026-24061 works. I'm kinda tired of big corp rushing code, because it leads to me scoring two different LPE's in a day. But hey, free career, and a fun experience, so I'm not complining. (I'm just sayin'...)                                       

Later, FreeBSDKernel9-0.
