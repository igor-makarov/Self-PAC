# Self PAC
Small Automator app that runs an echo PAC configuration server that returns its own hostname.

## Installation
The app is unsigned, which will cause Gatekeeper to reject it. Before first run, you must open the app with Automator.app and save it.
Script:

```
curl -O -L https://github.com/igor-makarov/self-pac/archive/master.zip
unzip master.zip
open -a Automator.app "self-pac-master/Self PAC.app"
```

Launch the app and test it's working by:
```
curl http://localhost:8000/
# should print:
# function FindProxyForURL(url, host) { return 'PROXY localhost:8888; DIRECT'; }
```

## Core files
* [run_server.rb](Self%20PAC.app/Contents/Scripts/run_server.rb) - the actual WEBrick server
* [document.wflow](Self%20PAC.app/Contents/document.wflow) - the automator workflow

## Caveats
The automator workflow doesn't work when run within the Automator.app - this is because the `path to me` AppleScript returns the path to Automator.app and not to our app.