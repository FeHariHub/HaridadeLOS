--> Jogos
local games = {
  [3101667897] = "https://raw.githubusercontent.com/FeHari/HaridadeLOS/main/HaridadeTrial.lua"
}

local gameUrl = games[game.PlaceId]

--> Jogo Não Suportado
if (not gameUrl) then
  return game:GetService("Players").LocalPlayer:Kick("Oops! Este jogo ainda não é suportado. Estamos trabalhando para adicionar mais!)
end

--> Carregar Script!
loadstring(game:HttpGet("https://raw.githubusercontent.com/FeHari/HaridadeLOS/main/HaridadeTrial.lua"))()
