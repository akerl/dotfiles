function reloadConfig(files)
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            hs.reload()
            hs.alert.show("Config reloaded")
            return
        end
    end
end

local confDir = os.getenv("HOME") .. "/.hammerspoon/"
local confWatcher = hs.pathwatcher.new(confDir, reloadConfig):start()

for module in hs.fs.dir(confDir) do
    if module:sub(-4) == ".lua" then
        local moduleName = module:sub(0, -5)
        if moduleName ~= "init" then
            require(module:sub(0, -5))
        end
    end
end

hs.alert.show("Config loaded")

