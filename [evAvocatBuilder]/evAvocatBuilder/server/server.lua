ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_phone:registerNumber', 'avocat', ('avocat'), true, true)
TriggerEvent('esx_society:registerSociety', 'avocat', 'avocat', 'society_avocat', 'society_avocat', 'society_avocat', {type = 'private'})

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)



----------------------------

function ShowCoordinates()
    local player = source
    local ped = GetPlayerPed(player)
    playerCoords = GetEntityCoords(ped, false)
    testcoords = playerCoords

    print(playerCoords)
end

RegisterNetEvent("myCoordinates")
AddEventHandler("myCoordinates", ShowCoordinates)



---------------- Coffre 


RegisterServerEvent('evJob:prendreitems')
AddEventHandler('evJob:prendreitems', function(itemName, count)
	local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if count > 0 and inventoryItem.count >= count then

			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _src, "quantité invalide")
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _src, 'Objet retiré', count, inventoryItem.label)
			end
		else
			TriggerClientEvent('esx:showNotification', _src, "quantité invalide")
		end
	end)
end)


RegisterNetEvent('evJob:stockitem')
AddEventHandler('evJob:stockitem', function(itemName, count)
	local _src = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', _src, "Objet déposé "..count..""..inventoryItem.label.."")
		else
			TriggerClientEvent('esx:showNotification', _src, "quantité invalide")
		end
	end)
end)


ESX.RegisterServerCallback('evJob:inventairejoueur', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

ESX.RegisterServerCallback('evJob:prendreitem', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		cb(inventory.items)
	end)
end)




--------STOCK items



RegisterNetEvent('evJob:GiveItem')
AddEventHandler('evJob:GiveItem', function(Nom, Item)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    xPlayer.addInventoryItem(Item, 1)
end)


-----------Recrutement 



---RegisterServerEvent('recruter')
---AddEventHandler('recruter', function(target)


  ---local source = source
  ---local PlayerE = ESX.GetPlayerFromId(source)
  ---local TargetE = ESX.GetPlayerFromId(target)

  
  	---if PlayerE.job.grade_name == 'boss' then
  		---TargetE.setJob("avocat", 0)
  		---TriggerClientEvent('esx:showNotification', xPlayer.source, "Le joueur a été recruté")
  		---TriggerClientEvent('esx:showNotification', target, "Vous venez d'être recruté")
  	---else
		---TriggerClientEvent('esx:showNotification', xPlayer.source, "Tu n'est pas patron")
	---end
---end)





----------------Annonces


RegisterServerEvent('Annonce:ev')
AddEventHandler('Annonce:ev', function(open, close, pause, dispolivre, nodispolivre)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if open then
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Avocat', '~g~Disponible', 'Passer nous voir !', 'CHAR_ESTATE_AGENT', 8)
		elseif close then
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Avocat', '~r~Indisponible', 'Repasser plus tard', 'CHAR_ESTATE_AGENT', 8)
		elseif pause then
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Avocat', '~y~Annonce', 'tt', 'CHAR_ESTATE_AGENT', 8)
		elseif dispolivre then
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Avocat', '~y~Annonce', 'tt', 'CHAR_ESTATE_AGENT', 8)
		elseif nodispolivre then
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Avocat', '~y~Annonce', 'tt', 'CHAR_ESTATE_AGENT', 8)
		end
	end
end)
