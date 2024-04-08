
function bongInfo()
    local model = Config.BongProps
    exports.ox_target:addModel(model, options)
end


AddEventHandler('solix_bong:smokeBong', function()
    ExecuteCommand('e bong')
end)

RegisterNetEvent('solix_bong:MoneyRemoveResult')
AddEventHandler('solix_bong:MoneyRemoveResult', function(success)
    if success then
        TriggerEvent('solix_bong:smokeBong')
        Wait(11000)
        ExecuteCommand('emotecancel')
        Wait(10000)
        TriggerEvent('solix_bong:setPlayerHigh')
    else
        ESX.ShowNotification('uh oh! You dont have enough money')
    end
end)



RegisterNetEvent('solix_bong:setPlayerHigh')
AddEventHandler('solix_bong:setPlayerHigh', function()
    SetTimecycleModifier("spectator5")
    SetTimecycleModifierStrength(1.0)
    Wait(Config.HowLongToBeHighFor)
    ClearTimecycleModifier()
end)



local price = Config.PriceToSmoke
     options = {
        label = 'Smoke Bong for $'.. price,
        icon = 'fa-solid fa-bong',
        onSelect = function()
            if Config.PayToSmoke == true then 
                TriggerServerEvent('solix_bong:esxMoneyRemove')
            else
                TriggerServerEvent('solix_bong:noMoneyRemove')
            end
        end,
    }
bongInfo(model, options)