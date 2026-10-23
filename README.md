# Dotfiles
My configuration files for utilities which I'm using everyday.

![Screenshot](https://user-images.githubusercontent.com/2149612/221192964-61983fc7-2bc4-4ac8-badf-4b2d48d1c901.png)

## Features
* No dependencies
* Zsh
 * prompt
 * la is for better ls - with color output and numberized chmod
 * manp - like man but in Text.app
 * ru - removes unnecessary ._* media files & DS_Store
 * extract - unzip any archive
* Homebrew
 * Packages, applications, taps, and App Store apps are managed in the [Brewfile](Brewfile)
* Git config and global ignore
* Nano syntax highlighter
* Xcode theme

## Installation
```sh
cd ~ && git clone --recursive https://github.com/vitaliyr/dotfiles.git ~/.dotfiles && ~/.dotfiles/install.sh
```

## App settings

Use `scripts/preferences.sh` to save a macOS preferences domain as XML or restore it. For Mos,
run these commands from the repository root:

```sh
./scripts/preferences.sh save com.caldis.Mos settings/mos.plist
./scripts/preferences.sh restore com.caldis.Mos settings/mos.plist
```

Quit Mos before restoring, then reopen it. `install.sh` restores the saved Mos
preferences during macOS client installation.

## Thanks
* [Paul Miller](https://github.com/paulmillr) for bootstrap and ideas

## License
The MIT License (MIT)

Copyright (c) 2024 Vitalii Rybachenko ([http://ribachenko.com](http://ribachenko.com))

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
