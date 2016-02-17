# Help for commands
function hh {
    echo
    echo -e "$COLOR_LIGHT_CYAN""FS and utils"
    echo
    echo -e "$COLOR_BOLD""cdh""$COLOR_NC"" - cd to home directory"
    echo -e "$COLOR_BOLD""cl""$COLOR_NC"" - clears the output"
    echo -e "$COLOR_BOLD""lock""$COLOR_NC"" - locks computer"
    echo -e "$COLOR_BOLD""ru""$COLOR_NC"" - removes unnecessary files such as DS_Store and dot slash files"
    echo -e "$COLOR_BOLD""la""$COLOR_NC"" - ls with color and numeric chmod"
    echo -e "$COLOR_BOLD""fcount""$COLOR_NC"" - count of files in directory recursive"
    echo -e "$COLOR_BOLD""findword""$COLOR_NC"" - finds USD1 in directory recursive"
    echo -e "$COLOR_BOLD""rmfiles""$COLOR_NC"" - removes files by provided USD1 glob"
    echo -e "$COLOR_BOLD""extract""$COLOR_NC"" - unarchive any archive. TODO: Still not working properly    "
    echo -e "$COLOR_BOLD""manp""$COLOR_NC"" - man in Preview.app"
    echo
    echo
    echo -e "$COLOR_LIGHT_GREEN""Apps"
    echo
    echo -e "$COLOR_BOLD""phpstorm""$COLOR_NC"" - opens phpstorm with USD1 file/project"
    echo -e "$COLOR_BOLD""sublime""$COLOR_NC"" - opens sublime text with USD1 file/project"
    echo -e "$COLOR_BOLD""atom""$COLOR_NC"" - opens atom with USD1 file/project"
    echo -e "$COLOR_BOLD""opera""$COLOR_NC"" - opens Opera with disabled web security"
    echo -e "$COLOR_BOLD""ggc""$COLOR_NC"" - opens Chrome with disabled web security"
    echo
    echo
    echo -e "$COLOR_LIGHT_BLUE""Git"
    echo
    echo -e "$COLOR_BOLD""rmB""$COLOR_NC"" - removes all branches except USD1"
    echo -e "$COLOR_BOLD""gu""$COLOR_NC"" - git reset soft"
    echo -e "$COLOR_BOLD""gr""$COLOR_NC"" - git reset hard"
    echo -e "$COLOR_BOLD""gc""$COLOR_NC"" - git checkout"
    echo -e "$COLOR_BOLD""ga""$COLOR_NC"" - git add ."
    echo -e "$COLOR_BOLD""gs""$COLOR_NC"" - git status"
    echo -e "$COLOR_BOLD""gd""$COLOR_NC"" - git diff"
    echo -e "$COLOR_BOLD""gl""$COLOR_NC"" - git log"
    echo -e "$COLOR_BOLD""gitcheckout""$COLOR_NC"" - checkout git repositories recursive. See -h"
    echo -e "$COLOR_BOLD""parse_git_dirty""$COLOR_NC"" - returns a star if repository contains modified files"
    echo -e "$COLOR_BOLD""parse_git_branch""$COLOR_NC"" - returns current git branch with star (or not) from parse_git_dirty"
    echo
    echo
    echo -e "$COLOR_YELLOW""NPM"
    echo
    echo -e "$COLOR_BOLD""nii""$COLOR_NC"" - npm install"
    echo -e "$COLOR_BOLD""niis""$COLOR_NC"" - npm install --save"
    echo -e "$COLOR_BOLD""niisd""$COLOR_NC"" - npm install --save-dev"
    echo -e "$COLOR_BOLD""ns""$COLOR_NC"" - npm search"
    echo -e "$COLOR_BOLD""nbc""$COLOR_NC"" - reinstall npm & bower dependencies"
    echo
    echo
    echo -e "$COLOR_YELLOW""Homebrew"
    echo
    echo -e "$COLOR_BOLD""brup""$COLOR_NC"" - brew upgrade and brew update installed"
    echo -e "$COLOR_BOLD""brout""$COLOR_NC"" - brew list outdated packages"
    echo -e "$COLOR_BOLD""bri""$COLOR_NC"" - brew install"
    echo -e "$COLOR_BOLD""brs""$COLOR_NC"" - brew search"
    echo -e "$COLOR_BOLD""brl""$COLOR_NC"" - brew list"
    echo -e "$COLOR_BOLD""brci""$COLOR_NC"" - brew cask install"
    echo -e "$COLOR_BOLD""brcs""$COLOR_NC"" - brew cask search"
    echo -e "$COLOR_BOLD""brcl""$COLOR_NC"" - brew cask list"
    echo
    echo
    echo -e "$COLOR_BROWN""Code Highlight from/to clipboard buffer"
    echo
    echo -e "$COLOR_BOLD""hjs""$COLOR_NC"" - JS"
    echo -e "$COLOR_BOLD""hhtml""$COLOR_NC"" - HTML"
    echo -e "$COLOR_BOLD""hcss""$COLOR_NC"" - CSS"
    echo -e "$COLOR_BOLD""hswift""$COLOR_NC"" - Swift"
    echo -e "$COLOR_BOLD""hobjc""$COLOR_NC"" - ObjC"
    echo
    echo
    echo -e "$COLOR_LIGHT_GREEN"Colors"$COLOR_NC"
    echo
    echo "Use variable COLOR_@COLOR_NAME. Also available bold, dim, underline, blink. Use COLOR_NC for clearing styles."
    echo
}
