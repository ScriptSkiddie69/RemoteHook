## RemoteHook documentation
RemoteHook is a tool that helps you intercept remote events in roblox.
## Installing the tool
Simply run:
```lua
loadstring(game:HttpGet('https://raw.githubusercontent.com/ScriptSkiddie69/RemoteHook/refs/heads/main/Installation.lua'))()
```

## Using the tool
Now that you have installed RemoteHook
We need to define the file simply run
```lua
local code = loadstring(readfile('RemoteHook//main.lua'))()
```

## RemoteHook keywords list
Now that you have define the tool
We need to know the keywords obviously
```lua
local code = loadstring(readfile('RemoteHook//main.lua'))()
--// traceline
code.traceline(<string>, <string>) -- this is only used for tracer at hookevent
--// trace arguments
code.trace_arguments(<string>) -- this is only used for tracer at hookevent
--// hookevent
code.hookevent(parameters)

code.hookevent({
    path = <instance>
    type = <string>,
    arguments = <string>,
    callback = function(value) <callback (value)>
    print(value)
    end

})
--// hookvalue
code.hookvalue(<string>) 
```

## RemoteHook functions documentation
Now that we know the keywords lets move onto coding
Lets use hookevent and type = "spy"
```lua
local code = loadstring(readfile('RemoteHook//main.lua'))()
code.hookevent({
    path = game.Workspace.RemoteEvent,
    type = "spy",
    arguments = "",
    callback = function(value)
    print(value) 
    end

})
```
Output example:
```lua
table 0xa52900111
```
Summary:
- Basically the hook type <spy> logs the remote event arguments that is sending to the server
- the callback(value) returns the remote event arguments which is a table {}
- path is the path of the remotevent you wanna spy
- arguments is only used for callback and trace hook type

Block hook type example:
```lua
local code = loadstring(readfile('RemoteHook//main.lua'))()
code.hookevent({
    path = game.Workspace.RemoteEvent,
    type = "block",
    arguments = "",
    callback = function(value)
    print(value) 
    end

})
```
Summary:
- Basically the hook type <block> blocks the remote event arguments that is sending to the server
- the callback(value) returns the remote event name
- path is the path of the remotevent you wanna block
- arguments is only used for callback and trace hook type

Callback hook type example:
```lua
local code = loadstring(readfile('RemoteHook//main.lua'))()
code.hookevent({
    path = game.Workspace.RemoteEvent,
    type = "block",
    arguments = {"Argument1 test", "Argument2 test"},
    callback = function(value)
    print(value) 
    end

})
```
Output:
```
print(arguments) <table> or {"Argument1 test", "Argument2 test"}
```
Summary:
- Basically the hook type <Callback> runs the remoteevent when it detects it that it ran and callsback (arguments)
- the callback(value) returns the remote event arguments
- path is the path of the remotevent you wanna callback
- arguments is the args the hook will run when the remoteevent is ran (OnClientEvent)

Trace hook type example:
```lua
local code = loadstring(readfile('RemoteHook//main.lua'))()
code.hookevent({
    path = game.Workspace.RemoteEvent,
    type = "trace",
    arguments = "local",
    callback = function(value)
    print(value) 
    end

})
```
Output:
```
local args_traced = _function.trace_arguments(_function.traceline(script, remote.Name))
callback("-- TRACED AND SCRIPT DUMP SUCCESSFUL LOGS: --")
callback("- Remote path: game." .. remote:GetFullName())
callback("- Script path: game." .. v:GetFullName())
callback("- Arguments amount (OnClientEvent hook): " .. args_traced)
callback("- Script line: " .. _function.traceline(script, remote.Name))
```

Summary:
- Basically the hook type <trace> intercepts the remoteevent and dumps all localscript that is running the remotevent and output it
- the callback(value) returns the trace logs
- path is the path of the remotevent you wanna trace
- arguments is basically a dropdown for trace (hook type)
