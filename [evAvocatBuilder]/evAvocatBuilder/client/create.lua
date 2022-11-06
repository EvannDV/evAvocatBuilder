ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)









RegisterCommand("evAvocat", function(source, args, rawcommand)
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'avocat' and ESX.PlayerData.job.grade_name == 'boss' then
        CreationMenu()
    end
end, false)


function CreationMenu()

    local evMenu = RageUI.CreateMenu("Création","Made by ~y~evann™")

    RageUI.Visible(evMenu, not RageUI.Visible(evMenu))

    while evMenu do
        
        Citizen.Wait(0)

        RageUI.IsVisible(evMenu,true,true,true,function()

            
        
            

            RageUI.Separator("📍     Garage    📍")

            

            


            RageUI.ButtonWithStyle("Voiture 1", nil, {RightLabel = "🔍"}, true, function(Hovered, Active, Selected)
                if Selected then
                    msg = KeyboardInput("Rentrer le nom du véhicule", "", 20)
                end
            end)

            RageUI.ButtonWithStyle("Voiture 2", nil, {RightLabel = "🔍"}, true, function(Hovered, Active, Selected)
                if Selected then
                    msgg = KeyboardInput("Rentrer le nom du véhicule", "", 20)
                end
            end)


            RageUI.ButtonWithStyle("Créer le Garage", nil, {RightBadge=RageUI.BadgeStyle.Car}, true, function(Hovered, Active, Selected)
                if Selected then
                    local ped = PlayerPedId()
                    posss = GetEntityCoords(PlayerPedId())
                    TriggerServerEvent('myCoordinates')
                    Citizen.CreateThread(function()
                        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'avocat' then
                            while true do
                                local interval = 1
                                local pos = GetEntityCoords(PlayerPedId())
                                local dest = vector3(posss.x, posss.y, posss.z)
                                local distance = GetDistanceBetweenCoords(pos, dest, true)
                    
                                if distance > 30 then
                                    interval = 200
                                else
                                    interval = 1
                                    DrawMarker(36, posss.x, posss.y, posss.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, Config.CouleurR1, Config.CouleurG1, Config.CouleurB1, 170, 0, 0, 0, 0, nil, nil, 0)
                                    if distance < 1 then  
                                        AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour ouvrir le menu")
                                        DisplayHelpTextThisFrame("HELP", false)
                                        if IsControlJustPressed(1, 51) then
                                            RageUI.Visible(RMenu:Get("GarageJob","GarageJob_main"), true)
                                        end
                                    end
                                end
                    
                                Citizen.Wait(interval)
                            end
                            return
                        end
                    end)
  
                end
            end)

            RageUI.Separator("📍     Stock Item   📍")
            
            

            RageUI.ButtonWithStyle("Nom Item", nil, {RightLabel = "🔍"}, true, function(Hovered, Active, Selected)
                if Selected then
                    nitem = KeyboardInput("Rentrer le nom de l'item", "", 20)
                end
            end)


            RageUI.ButtonWithStyle("Label Item", nil, {RightLabel = "🔍"}, true, function(Hovered, Active, Selected)
                if Selected then
                    litem = KeyboardInput("Rentrer le label de l'item", "", 20)
                end
            end)


            RageUI.ButtonWithStyle("Créer le Stock Item", nil, {RightLabel = "🔐"}, true, function(Hovered, Active, Selected)
                if Selected then
                    local ped = PlayerPedId()
                    sept = GetEntityCoords(PlayerPedId())
                    TriggerServerEvent('myCoordinates')
                    Citizen.CreateThread(function()
                        while true do 
                            local wait = 750
                                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'avocat' then
                                    for k in pairs {vector3(sept.x, sept.y, sept.z)} do 
                                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                    local pos = {vector3(sept.x, sept.y, sept.z)}
                                    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
                    
                                    if dist <= 6 then 
                                        wait = 0
                                        DrawMarker(21, sept.x, sept.y, sept.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, Config.CouleurR1, Config.CouleurG1, Config.CouleurB1, 180, true, true, p19, true)
                                    end
                                    if dist <= 1.0 then 
                                        wait = 0
                    
                                        AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour ouvrir le menu")
                                        DisplayHelpTextThisFrame("HELP", false)
                                        if IsControlJustPressed(1, 51) then 
                                            OpenStockMenu()
                                        end
                                    end
                                    
                                end
                            end
                        Citizen.Wait(wait)
                        end
                    end)
    
                end
            end)



            RageUI.Separator("📍     Création     📍")

            
            RageUI.ButtonWithStyle("Créer la Gestion Patron", nil, {RightLabel = "👑"}, true, function(Hovered, Active, Selected)
                if Selected then
                    local ped = PlayerPedId()
                    endd = GetEntityCoords(PlayerPedId())
                    TriggerServerEvent('myCoordinates')
                    Citizen.CreateThread(function()
                        while true do
                            local wait = 750
                            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'avocat' and ESX.PlayerData.job.grade_name == 'boss' then
                                for k in pairs {vector3(endd.x, endd.y, endd.z)} do
                                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                    local pos = {vector3(endd.x, endd.y, endd.z)}
                                    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
                    
                                    if dist <= 6 then
                                        wait = 0
                                        DrawMarker(29, endd.x, endd.y, endd.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.7, 0.7, 0.7, Config.CouleurR1, Config.CouleurG1, Config.CouleurB1, 180, true, true, p19, true)  
                                        if dist <= 1.0 then
                                            wait = 0
                    
                    
                                            AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour ouvrir le menu")
                                            DisplayHelpTextThisFrame("HELP", false)
                                            if IsControlJustPressed(1,51) then
                                                OpenMenuBossEvJob()
                                            end
                                        end
                                    end
                                end
                            end
                        Wait(wait)
                        end
                    end)
   
                end
            end)

            RageUI.ButtonWithStyle("Créer le Coffre", nil, {RightLabel = "🧰"}, true, function(Hovered, Active, Selected)
                if Selected then
                    local ped = PlayerPedId()
                    ag = GetEntityCoords(PlayerPedId())
                    TriggerServerEvent('myCoordinates')
                    Citizen.CreateThread(function()
                        while true do
                            local wait = 750
                                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'avocat' then
                                    for k in pairs {vector3(ag.x, ag.y, ag.z)} do
                                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                    local pos = {vector3(ag.x, ag.y, ag.z)}
                                    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
                    
                                    if dist <= 6 then
                                        wait = 0
                                        DrawMarker(21, ag.x, ag.y, ag.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.7, 0.7, 0.7, Config.CouleurR1, Config.CouleurG1, Config.CouleurB1, 180, true, true, p19, true)  
                                    end
                    
                                    if dist <= 1.0 then
                                        wait = 0
                                        
                                        AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour ouvrir le menu")
                                        DisplayHelpTextThisFrame("HELP", false)
                                        if IsControlJustPressed(1,51) then
                                            OpenMenuCoffreEv()
                                        end
                                    end
                                end
                            end
                        Citizen.Wait(wait)
                        end
                    end)
    
                end
            end)



            

        
        end, function()
        end)

        if not RageUI.Visible(evMenu) then
            evMenu=RMenu:DeleteType("Delete", true)
        end

    end

end



------------------Keyboard INPUT


KeyboardInput = function(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end






function aboss()
    TriggerEvent('esx_society:openBossMenu', 'avocat', function(data, menu)
        menu.close()
    end, {wash = false})
end



---------Emplacement + createmenu 



RMenu.Add("GarageJob", "GarageJob_main", RageUI.CreateMenu("Garage", "Made by ~y~evann™"))
RMenu:Get("GarageJob", "GarageJob_main").Closed = function()
    print("vous avez fermé le menu")

end





-------------Menu Vehicules


Citizen.CreateThread(function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'avocat' then
        while true do
            RageUI.IsVisible(RMenu:Get("GarageJob","GarageJob_main"),true,true,true,function()
           
                RageUI.ButtonWithStyle("Voiture de Fonction 1", nil, {RightBadge = RageUI.BadgeStyle.Car}, true,function(h,a,s)
                    if s then
                        RageUI.CloseAll()
                        local ped = PlayerPedId()
                        local model = GetHashKey(msg)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                        local pos = GetEntityCoords(PlayerPedId())
                        local vehicle = CreateVehicle(model, pos.x, pos.y, pos.z, 90.0, true, false)
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)

                    end
            
                end)


                RageUI.ButtonWithStyle("Voiture de Fonction 2", nil, {RightBadge = RageUI.BadgeStyle.Car}, true,function(h,a,s)
                    if s then
                        RageUI.CloseAll()
                        local ped = PlayerPedId()
                        local model = GetHashKey(msgg)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                        local pos = GetEntityCoords(PlayerPedId())
                        local vehicle = CreateVehicle(model, pos.x, pos.y, pos.z, 90.0, true, false)
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)

                    end
            
                end)



                RageUI.ButtonWithStyle("~r~Ranger le Véhicule", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true,function(h,a,s)
                    if s then
                        local Vehicle = GetVehiclePedIsUsing(PlayerPedId())
                        local playerPed = PlayerPedId()
                        if GetPedInVehicleSeat(Vehicle, -1) == playerPed then     
                            ESX.Game.DeleteVehicle(Vehicle)
                            ESX.ShowNotification('~g~Vehicule rangé')
                            RageUI.CloseAll()
                        end

                    end
            
                end)




            end, function()end, 1)
            Citizen.Wait(0)
        end
    end

end)




---------------------- Boss Menu


function OpenMenuBossEvJob()

    local menuTest = RageUI.CreateMenu("Boss Actions","Interactions")

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()

            RageUI.Separator("↓     ~y~Gestion de l'entreprise     ~s~↓")
        
            
            RageUI.ButtonWithStyle("Actions Patron", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    aboss()
                    RageUI.CloseAll()    
                end
            end)

        
        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("Delete", true)
        end

    end

end

-- fonction Coffre 

function OpenPrendreEvJob()
	ESX.TriggerServerCallback('evJob:prendreitem', function(items)
		local elements = {}

		for i=1, #items, 1 do
            table.insert(elements, {
                label = 'x' .. items[i].count .. ' ' .. items[i].label,
                value = items[i].name
            })
        end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
            css      = 'LTD',
			title    = 'stockage',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
                css      = 'LTD',
				title = 'quantité'
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification('quantité invalide')
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('evJob:prendreitems', itemName, count)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenDeposerEvJob()
	ESX.TriggerServerCallback('evJob:inventairejoueur', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
            css      = 'police',
			title    = 'inventaire',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
                css      = 'police',
				title = 'quantité'
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification('quantité invalide')
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('evJob:stockitem', itemName, count)

					Citizen.Wait(300)
					OpenDeposerEvJob()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

--------------Menu evCoffre


local open = false
local MenuCoffreEv = RageUI.CreateMenu("Coffre", "Coffre")

MenuCoffreEv.Closed = function()
    open = false
end

function OpenMenuCoffreEv()
    local menuTest = RageUI.CreateMenu("Coffre", "Made by ~y~evann™")

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()

            RageUI.Separator("↓     Stockage     ↓")
        
            RageUI.ButtonWithStyle("~g~Deposer",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then    
                    OpenDeposerEvJob()
                    RageUI.CloseAll()
                end
            end)  

            

            RageUI.ButtonWithStyle("~r~Prendre",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    OpenPrendreEvJob()
                    RageUI.CloseAll()   
                end
            end)  

        
        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("Delete", true)
        end

    end

end






------------Stock Item



local open = false
local MenuStockMenu = RageUI.CreateMenu("↓↓↓↓↓↓", nil)

MenuStockMenu.Closed = function() 
    open = false
end




function OpenStockMenu()

    local menuTest = RageUI.CreateMenu("Stock", nil)

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()

            RageUI.Separator("↓                      ~s~↓")
        
            RageUI.ButtonWithStyle(nitem, nil, {RightLabel = "~g~→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    
                    TriggerServerEvent('evJob:GiveItem', nitem, litem)
                       
                    
                end
            end) 
            

            RageUI.Separator("↓    ~r~Fermer le menu     ~s~↓")

            RageUI.ButtonWithStyle("~r~Fermer",nil, {RightLabel = "~y~→→→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    RageUI.CloseAll()    
                end
            end)  

        
        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("StockItem", true)
        end

    end

end