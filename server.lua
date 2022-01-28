ESX = nil
TriggerEvent('esx:getSharedObject' , function(obj)  ESX = obj  end)

ESX.RegisterServerCallback('getCurrentJob', function(surce, cb)
    local xPlayer = ESX.GetPlayerFromID(source)
    print(xPlayer.identifier)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier' , {
        ['@identifier'] = xPlayer.identifier,
    }, function(result)
        cb(result[1].job)
    end)
end)