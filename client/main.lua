ESX              = nil
local hudHidden = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(250)
	end
end)

RegisterCommand("hidehud", function(source, args, rawCommand)
	hudHidden = true
	TriggerEvent("swt_notifications:Icon","HUD Hidden","top-right",2500,"red-10","white",true,"mdi-earth-off")
end, false)

RegisterCommand("showhud", function(source, args, rawCommand)
	hudHidden = false
	TriggerEvent("swt_notifications:Icon","HUD Shown","top-right",2500,"green-10","white",true,"mdi-earth")
end, false)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if hudHidden then
			ESX.UI.HUD.SetDisplay(0.0)
		else
			ESX.UI.HUD.SetDisplay(1.0)
		end
	end
end)
