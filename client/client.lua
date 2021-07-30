RegisterCommand('help', function()
    TriggerEvent('chat:addMessage', {
        color = {255,0,0},
        multiline = true,
        args = {'[SERVER]', 'Join the discord for help, discord.gg/'}
    })
end)

RegisterCommand('car',function(source,args) 
    local vehicleName = args[1] or 'adder'
    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = {'Vehicle is not recognised: ' .. vehicleName}
        })
        return
    end
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do 
        wait(500)
    end
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityCoords(playerped), true, false)
    SetPedIntoVehicle(playerPed, vehicle, -1)
    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)
    TriggerEvent('chat:addMessage', {
        args = {'You have spawned a ' .. vehicleName .. '.'}
    })
end, false)

RegisterCommand('dv', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    DeleteEntity(vehicle)
end,false)