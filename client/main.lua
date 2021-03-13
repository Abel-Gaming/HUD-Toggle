ESX              = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(250)
	end
end)

RegisterCommand("hidehud", function(source, args, rawCommand)
	ESX.UI.HUD.SetDisplay(0)
	ESX.ShowNotification("~r~HUD Hidden", false, true, 130)
end, false)

RegisterCommand("showhud", function(source, args, rawCommand)
	ESX.UI.HUD.SetDisplay(100)
	ESX.ShowNotification("~g~HUD Shown", false, true, 210)
end, false)
