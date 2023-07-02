# Boing for Agon Light

![Boing Screenshot](https://github.com/leighbb/agon-boing/blob/main/screenshots/boing.jpg?raw=true)

## Introduction

This is a port of the famous Amiga Boing bouncing ball demo to the Agon
Light, using BBC BASIC.

At the moment this requires some patches to the VDP (see my agon-vdp
repository), to work. So, running this on a stock VDP will not work.

## How to run

Assuming you have the right VDP, then copy all the files into a folder
and then just load and run loader.bas. It will automatically CHAIN
boing.bas when it is done. Once the bitmaps are loaded you can re-run
the boing.bas. I did it like this to make debugging easier.

**NOTE** If you Escape out the program, the screen will not refresh as
it will be in double-buffer mode.  Type "MODE 3" (or whatever) to
switch back to a non-double-buffered mode.

## Bitmaps

I pre-created the bitmaps of the ball (18 frames) and shadow on Linux,
then converted them into BBC BASIC compatible data files. They are
basically two integers for width and height and then width * height
integers with the RGBA2222 values.

