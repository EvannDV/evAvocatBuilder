ESX = nil



TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



ESX.RegisterUsableItem('tenueavocat', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('evtenuebasique', source) 

end)



















