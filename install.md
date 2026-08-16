# System Installation from Scratch

## Installation

* Username `salen`
* Workstation name `Macbook-Pro-Vitaliy`
* Log in into iCloud

## Preparation

* Install dotfiles

## Configuration

* Link Alfred settings to `~/iCloud/Alfred`
* Log in 1Password

### Karabiner-Elements

```sh
mkdir -p "$HOME/.config"
ln -s "$HOME/.dotfiles/terminal/karabiner" "$HOME/.config/karabiner"
launchctl kickstart -k "gui/$(id -u)/org.pqrs.service.agent.karabiner_console_user_server"
```
