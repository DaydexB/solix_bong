

RegisterNetEvent('solix_bong:esxMoneyRemove', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local Cost = Config.PriceToSmoke 
    local PlayerMoney = xPlayer.getMoney()
    local account = Config.AccountToRemoveFrom

    if PlayerMoney >= Cost then 
        xPlayer.removeAccountMoney(account, Cost)
        TriggerClientEvent('solix_bong:MoneyRemoveResult', _src, true)
    else
        TriggerClientEvent('solix_bong:MoneyRemoveResult', _src, false)
    end
end)

RegisterNetEvent('solix_bong:noMoneyRemove', function()
    local _src = source
    TriggerClientEvent('solix_bong:MoneyRemoveResult', _src, true)
end)