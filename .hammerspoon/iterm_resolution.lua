function itermResolutionCallback()
    local profileDir = os.getenv("HOME") .. "/.iterm_profiles/"
    local availDir = profileDir .. "available/"
    local currentFile = profileDir .. "current"

    local screen = hs.screen.mainScreen()
    local mode = screen:currentMode()
    local desc = mode["desc"]
    local profileFile = availDir .. desc
    print(profileFile)

    local profileName = hs.fs.displayName(profileFile)
    if profileName ~= nil then
        hs.execute("ln -sf " .. profileFile .. " " .. currentFile)
    end
end

local itermResolutionWatcher = hs.screen.watcher.new(itermResolutionCallback)
itermResolutionWatcher:start()
