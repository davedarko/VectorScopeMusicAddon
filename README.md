# VectorScopeMusicAddon
A small add-on for the Hackaday Supercon 2023 / Europe 2024 event badge that allows displaying oscilloscope music

## Design Notes
There's a switch to flip the x and y-axis. Due to the displays coordinate system being 0,0 top-left it means that the y-axis is mirrored or upside-down. To negate this in some way and not fiddle around with inverting signals, the switch rotates the image by 90 degrees. It might just be that one of my macbooks channels is inverted, I have to investigate.

There's a branch where I had fixed the inverted y-channel by creating a differential amp with new values. There's an easier fix for the display being upside down now though. I've created a software PR that rotates and mirrors the display so it's looking correct on its own - see request here https://github.com/Hack-a-Day/Vectorscope/pull/15

mainly copied schematics from here:
https://electronics.stackexchange.com/questions/37095/level-shifting-a-2-5v-signal-to-0-5v

![Screenshot of KiCad render](https://github.com/davedarko/VectorScopeMusicAddon/blob/main/src/render.png?raw=true)
