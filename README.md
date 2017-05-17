# Welcome to Project Durendal

## Project Purpose:
### The Slime Method -
The initial project goal is to learn and explore the Haxe game engine's support for video game development. I'm modifying an existing HaxeFlixel demo ([FlxFSM](http://haxeflixel.com/demos/FlxFSM/)) from the HaxeFlixel website in order to learn HaxeFlixel's API by adding platformer features incrementally. 

![reSlime](/docs/slimeAlpha01.png?raw=true)

### Live Demo
[Try the Demo](https://mgodsy.github.io/Durendal/index.html)

### The Long Run -
The overarching goal is to build my own code base into something more than a slime in the sewers. I'm looking into creating a Side Scrolling Platform|Shooter (Super Metroid, Contra, and conceptually closest to, Metal Slug)

## Getting started with Haxe

To build and run Durendal on Windows, follow the steps below:

1. Download [Haxe](http://haxe.org/download/), [OpenFL](http://www.openfl.org/learn/docs/getting-started/), and [HaxeFlixel](http://haxeflixel.com/download/) from their respective links.
    * After HaxeFlixel's installation has finished, open a new command prompt and install the `lime` command by running `haxelib run lime setup`.
    * Install the `flixel` command by running `haxelib install flixel-tools` followed by running `haxelib run flixel-tools setup`.
    * By running the `haxelib install flixel-addons` command, you can install an additional library of extra HaxeFlixel features.
3. Clone or download this repository to your computer.	
4. Open a command prompt in the newly created `\Durendal` folder.
5. Run the command `haxelib run lime test neko` to build and run the executable.
    * The executable is located in `\Durendal\platformer\export\windows\neko\bin`.
    * To run in debug mode, run the command `haxlib run lime test -debug neko`. The debug console can be accessed with the backquote key.

## Far Future Project Goals
If HaxeFlixel doesn't work to my preference, I may decide to port to [Unity](https://store.unity.com/download/thank-you?thank-you=personal&os=win&nid=237), which has a larger feature set, and is a toolset I have prior experience with.

### 
