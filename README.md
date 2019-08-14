# Self PAC
Small Automator app that runs an echo PAC configuration server that returns its own hostname.

## Core files
* [run_server.rb](Self%20PAC.app/Contents/Scripts/run_server.rb) - the actual WEBrick server
* [document.wflow](Self%20PAC.app/Contents/document.wflow) - the automator workflow

## Caveats
The automator workflow doesn't work when run within the Automator.app - this is because the `path to me` AppleScript returns the path to Automator.app and not to our app.