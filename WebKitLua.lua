local file = io.open("WebKitLua", "w")

if file then
    file:write("This file was created by Lua 5.4.6, compiled from source, on an A2 Core!\n")
    file:write("Call Lua on WebKit. Status: Prototype, developed by Shadowdev-Vita.")
    file:close()
    print("File 'WebKitLua' created successfully.")
else
    print("Error: Could not create file.")
end
