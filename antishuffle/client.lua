--SCRIPT BY EARTH_IS_COOL


local allowshuffle = false 
local playerped = nil 
local currentvehicle = nil


Citizen.CreateThread(function()
        while true do
            Citizen.Wait(100) --Run Every 100ms
            playerped = PlayerPedId() --Set "playerped" variable to the current PlayerPedID
            currentvehicle = GetVehiclePedIsIn(playerped, false) --Get the current vehicle
        end
end)


Citizen.CreateThread(function ()
        while true do
            Citizen.Wait(100)
            if IsPedInAnyVehicle(playerped, false) and allowshuffle == false then
                SetPedConfigFlag(playerped, 184, true)
                if GetIsTaskActive(playerped, 165) then
                    seat=0
                    if GetPedInVehicleSeat(currentvehicle, -1) == playerped then
                        seat=-1

                    end


                    SetPedIntoVehicle(playerped, currentvehicle, seat)
                end
                elseif IsPedInAnyVehicle(playerped, false) and allowshuffle == true  then
                    SetPedConfigFlag(playerped, 184, false)
            end
        end    
end)

--SCRIPT BY EARTH_IS_COOL