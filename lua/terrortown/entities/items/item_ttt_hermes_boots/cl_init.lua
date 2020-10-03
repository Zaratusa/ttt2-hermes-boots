-- author "Zaratusa"
-- contact "http://steamcommunity.com/profiles/76561198032479768"

LANG.AddToLanguage("english", "hermes_boots_name", "Hermes Boots")
LANG.AddToLanguage("english", "hermes_boots_desc", "Increases your movement speed.")

LANG.AddToLanguage("Русский", "hermes_boots_name", "Сапоги Гермеса")
LANG.AddToLanguage("Русский", "hermes_boots_desc", "Увеличивает вашу скорость передвижения.")

hook.Add("TTT2ScoreboardAddPlayerRow", "ZaratusasTTTMod", function(ply)
	local ID64 = ply:SteamID64()

	if (ID64 == "76561198032479768") then
		AddTTT2AddonDev(ID64)
	end
end)
