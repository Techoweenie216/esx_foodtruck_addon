ESX = nil
-- location is by the main airport on New Empire Way,
-- behind the building in dock 1
-- You have to be in the taco truck or you will not get any inventory
-- You have to have $250 on your player or you will not get any inventory
local MarkerLocation = vector3(-768.0791, -2607.758, 13.81177)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
   
   while true do
	Citizen.Wait(1)
	local ped = GetPlayerPed(-1)
	local playerCoords = GetEntityCoords(ped)
	local distance = #(playerCoords - MarkerLocation)
	local isInMarker = false	

	if distance < 28.0 then
		
		DrawMarker(3, MarkerLocation.x, MarkerLocation.y, MarkerLocation.z , 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, .5, .5, .5, 255, 255, 255, 100, false, false, 2, true, nil, false)
	  		if distance < 2.0 then
				isInMarker = true
				else
				HasAlreadyGotMessage = false
				end
		else
			Citizen.Wait(500)
		end
		
	if isInMarker and not HasAlreadyGotMessage then

	
	ESX.ShowHelpNotification('Hit ~INPUT_INTERACTION_MENU~ to buy inventory')
		if IsControlJustReleased(0,244) then	
			CurrentVehicle = GetVehiclePedIsUsing(ped )
			if CurrentVehicle ~= 8428802 then
				ESX.ShowNotification('You must be in a Food Service Truck to get inventory')
			else
				TriggerServerEvent('esx_foodtruck_addon:LoadUp', 'inventory', 1)
			end
		end
	
	
	end
   end
end)   