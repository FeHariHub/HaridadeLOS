  -- Executar
local GameID = game.PlaceId

-- Jogos
local Supported_Games = {
    LegendsOfSpeed_City = 3101667897,
    LegendsOfSpeed_Space = 3232996272,
    LegendsOfSpeed_Desert = 3276265788,
}

-- Script
if GameID == Supported_Games.LegendsOfSpeed_City
or GameID == Supported_Games.LegendsOfSpeed_Space 
or GameID == Supported_Games.LegendsOfSpeed_Desert then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FeHariHub/HaridadeLOS/main/LendasDaVelocidade2.lua"))()
elseif GameID == Supported_Games.MuscleLegends then
else
    warn("Oops! Este jogo ainda não é suportado. Estamos trabalhando para adicionar mais!")
end
