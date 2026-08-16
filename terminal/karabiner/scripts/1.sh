#!/bin/zsh

frontmost_bundle_id=$(
  /usr/bin/osascript -e 'tell application "System Events" to get bundle identifier of first application process whose frontmost is true'
)

if [[ "$frontmost_bundle_id" == "com.apple.mail" ]]; then
  /usr/bin/open -b com.apple.iCal
else
  /usr/bin/open -b com.apple.mail
fi
