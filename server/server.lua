ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_foodtruck_addon:LoadUp')
AddEventHandler('esx_foodtruck_addon:LoadUp', function(itemName, qty)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local cost = 250 
	CashonHand = xPlayer.getMoney()
		
	if cost <= CashonHand then	
		CurrentBread = xPlayer.getInventoryItem('bread').count
		CurrentWater = xPlayer.getInventoryItem('water').count
		CurrentCoffee = xPlayer.getInventoryItem('coffee').count
		CurrentDonut = xPlayer.getInventoryItem('donut').count
		CurrentCocaCola = xPlayer.getInventoryItem('cocacola').count
		
		
		if CurrentBread >= 28 then
			xPlayer.showNotification('~y~You cannot load anymore Bread', false, yes, 140)
			cost = cost - 100
		else			
			xPlayer.addInventoryItem('bread', 25) -- Basic Script
		end
		if CurrentWater >= 28 then
			xPlayer.showNotification('~y~You cannot load anymore Water', false, yes, 140)
			cost = cost - 50	
		else		
		xPlayer.addInventoryItem('water', 25) -- Basic Script
		end
		if CurrentCoffee >= 28 then
			xPlayer.showNotification('~y~You cannot load anymore Coffee', false, yes, 140)
			cost = cost - 25
		else
		xPlayer.addInventoryItem('coffee', 25) --added item
		end
		if CurrentDonut >= 28 then
			xPlayer.showNotification('~y~You cannot load anymore Donuts', false, yes, 140)
			cost = cost - 50
		else		
		xPlayer.addInventoryItem('donut', 25) --added item
		end
		if CurrentCocaCola >= 28 then
			xPlayer.showNotification('~y~You cannot load anymore Cola', false, yes, 140)
			cost = cost - 25
		else		
		xPlayer.addInventoryItem('cocacola', 25) -- added item
		end		
		
		xPlayer.removeMoney(cost)
		xPlayer.showNotification('~y~It cost you $' .. cost .. ' for your inventory', false, yes, 140)
	else
		xPlayer.showNotification('~y~You do not have enough money', false, yes, 140)
	end
	
end)		