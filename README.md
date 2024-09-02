# VectorScopeMusicAddon
A small add-on for the Hackaday Supercon 2023 / Europe 2024 event badge that allows displaying oscilloscope music

## Design Notes
There's a switch to flip the x and y-axis. Due to the displays coordinate system being 0,0 top-left it means that the y-axis is mirrored or upside-down. To negate this in some way and not fiddle around with inverting signals, the switch rotates the image by 90 degrees. It might just be that one of my macbooks channels is inverted, I have to investigate.

## Errata
There's an easy fix for the vectorscope having an inverted y-axis, making the oscilloscope music show upside down. I've created a software PR that rotates and mirrors the display so it's looking correct on its own. Luckily the oscilloscope mode has running its own display instance, so it is one line of code to change.
See request here https://github.com/Hack-a-Day/Vectorscope/pull/15

## BASIC-2
There's a wonderful case design for the badge done by @softegg. To fit into the badge better, I have designed another version with no parts on the left side of the pin header and mounting holes to create a small 3D printed cover to fit the theme better.
https://github.com/softegg/supercon-2023-badge-enclosure/


## credits
- Hackaday's badge repo https://github.com/Hack-a-Day/Vectorscope
- schematics are heavily inspired by this post https://electronics.stackexchange.com/questions/37095/level-shifting-a-2-5v-signal-to-0-5v

![Screenshot of KiCad render](https://github.com/davedarko/VectorScopeMusicAddon/blob/main/src/render.png?raw=true)
