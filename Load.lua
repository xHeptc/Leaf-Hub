local MarketplaceService = game:GetService("MarketplaceService")

local games = {
    [402122991] = {src="https://pastebin.com/raw/ZS8Cp2FA"}, -- RedWood Prison
} -- game list

local check = games[game.PlaceId] -- checks for the game in the list

if check then
    loadstring(game:HttpGet(check.src, true))()
else
    local Players = game:GetService("Players")
    Players.LocalPlayer:Kick(string.format("%s is unsupported. Please DM xHeptc#5183 if you think this was a mistake.", MarketplaceService:GetProductInfo(game.PlaceId).Name))
end
