ESX = nil

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

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)





Citizen.CreateThread(function()

    while true do

        Citizen.Wait(10)

        if IsControlJustPressed(1,167) and ESX.PlayerData.job and ESX.PlayerData.job.name == 'avocat' then
            SocietyMenu()
        end

    end

end)

function SocietyMenu()

    local evMenu = RageUI.CreateMenu("Avocat","Made by ~y~evann™")

    RageUI.Visible(evMenu, not RageUI.Visible(evMenu))

    while evMenu do
        
        Citizen.Wait(0)

        RageUI.IsVisible(evMenu,true,true,true,function()

            
        
            RageUI.ButtonWithStyle("Faire une Facture", nil, {RightLabel = "💰"}, true, function(Hovered, Active, Selected)
                if Selected then
                    local player, distance = ESX.Game.GetClosestPlayer()    
                    local raison = ""
                    local montant = 0
                    AddTextEntry("FMMC_MPM_NA", "Objet de la facture")
                    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Donnez le motif de la facture :", "", "", "", "", 30)
                    while (UpdateOnscreenKeyboard() == 0) do
                        DisableAllControlActions(0)
                        Wait(0)
                    end
                    if (GetOnscreenKeyboardResult()) then
                        local result = GetOnscreenKeyboardResult()
                        if result then
                            raison = result
                            result = nil
                            AddTextEntry("FMMC_MPM_NA", "Montant de la facture")
                            DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Indiquez le montant de la facture :", "", "", "", "", 30)
                            while (UpdateOnscreenKeyboard() == 0) do
                                DisableAllControlActions(0)
                                Wait(0)
                            end
                            if (GetOnscreenKeyboardResult()) then
                                result = GetOnscreenKeyboardResult()
                                if result then
                                    montant = result
                                    result = nil
                                    if player ~= -1 and distance <= 3.0 then
                                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_fbi', ("fbi"), montant)
                                        TriggerEvent('esx:showAdvancedNotification', 'Fl~g~ee~s~ca ~g~Bank', 'Facture envoyée : ', 'Vous avez envoyé une facture d\'un montant de : ~g~'..montant.. '$ ~s~pour cette raison : ~b~' ..raison.. '', 'CHAR_BANK_FLEECA', 9)
                                    else
                                        RageUI.Popup({message = "~r~Probleme~s~: Aucuns joueurs proche"})
                                    end
                                end
                            end
                        end
                    end
                    cooldown = true
                    Citizen.SetTimeout(5000,function()
                    cooldown = false
                    end)
                end
            end)
            
            
            ---RageUI.ButtonWithStyle("Recruter", nil, {RightLabel = "📁"}, true, function(Hovered, Active, Selected)
                ---if Selected then
                    ---TriggerServerEvent('recruter')
                ---end
            ---end)

            RageUI.ButtonWithStyle("Disponible", nil, {RightLabel = "📢"}, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent('Annonce:ev', true, false, false, false, false)
                end
            end)

            RageUI.ButtonWithStyle("Indisponible", nil, {RightLabel = "📢"}, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent('Annonce:ev', false, true, false, false, false)
                end
            end)


        
        end, function()
        end)

        if not RageUI.Visible(evMenu) then
            evMenu=RMenu:DeleteType("Delete", true)
        end

    end

end