-- author "Zaratusa"
-- contact "http://steamcommunity.com/profiles/76561198032479768"

CreateConVar("ttt_hermesboots_detective", 1, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Should Detectives be able to buy the Hermes Boots?", 0, 1)
CreateConVar("ttt_hermesboots_traitor", 1, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Should Traitors be able to buy the Hermes Boots?", 0, 1)
local speed = CreateConVar("ttt_hermesboots_speed", 1.3, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "The speed multiplier for the Hermes Boots.")

ITEM.EquipMenuData = {
	type = "item_passive",
	name = "hermes_boots_name",
	desc = "hermes_boots_desc",
}
ITEM.hud = Material("vgui/ttt/perks/item_hermes_boots_hud.png")
ITEM.material = "vgui/ttt/icon_hermes_boots"
ITEM.CanBuy = {}
ITEM.credits = 1

if (GetConVar("ttt_hermesboots_detective"):GetBool()) then
	table.insert(ITEM.CanBuy, ROLE_DETECTIVE)
end
if (GetConVar("ttt_hermesboots_traitor"):GetBool()) then
	table.insert(ITEM.CanBuy, ROLE_TRAITOR)
end

--[[Perk logic]]--
hook.Add("TTTPlayerSpeedModifier", "TTTHermesBoots", function(ply, _, _, speedMultiplierModifier)
	if (IsValid(ply) and ply:Alive() and ply:IsTerror() and ply:HasEquipmentItem("item_ttt_hermes_boots")) then
		speedMultiplierModifier[1] = speedMultiplierModifier[1] * speed:GetFloat()
	end
end)
