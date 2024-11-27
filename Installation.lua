local makefolder = makefolder or warn('YOUR EXECUTOR DOES NOT SUPPORT MAKEFOLDER! ')
local readfile = readfile or warn('YOUR EXECUTOR DOES NOT SUPPORT READFILE! ')
local writefile = writefile or warn('YOUR EXECUTOR DOES NOT SUPPORT WRITEFILE! ')
local install
if isfolder('RemoteHook') then
    warn('3/3 - RemoteHook installed')
    else
    warn('RemoteHook is not installed! Installing...')
    makefolder('RemoteHook')
    warn('1/3 - Writing files into /RemoteHook')
    wait(1)
    writefile('RemoteHook//main.lua', '')
    warn('2/3 - Setting up install link..')
    install = "https://pastebin.com/raw/DKX7Aa9n"
    wait(1)
    warn('3/3 - Installing utilities into /RemoteHook')
    wait(1)
    appendfile('RemoteHook//main.lua', loadstring(game:HttpGet(install))())
    warn('RemoteHook intiated to use it go to documentation at: https://github.com/ScriptSkiddie69/RemoteHook')
    warn('Or simply by defining local hook = loadstring(readfile('RemoteHook//main.lua'))() and you learn the rest')
end
