local money = math.random(Config.money['min'], Config.money['max'])
local xp = math.random(Config.xp['min'], Config.xp['max'])
local item = Config.item
local FirstField = false
local Field1 = false
local Field2 = false
local Field3 = false
local Field4 = false
local LastField = false
local Delivery = false
local FinalDelivery = false
local prop = {}

RegisterCommand("ir", function(args)
    local args = target
    TeleportToPlayer(target)
end)

function TeleportToPlayer(target)  -- WORK
    local ped = GetPlayerPed(target)
    local pos = GetEntityCoords(ped)
    SetEntityCoords(PlayerPedId(), pos)
end

Citizen.CreateThread(function()
    local blip = N_0x554d9d53f696d002(1664425300, Config.Zones['init'].x, Config.Zones['init'].y, Config.Zones['init'].z)
    SetBlipSprite(blip, 1664261990, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Farming Job") 
end)

--Citizen.CreateThread(function () 
--    local book = GetHashKey("mp001_s_mp_catalogue01x")
--    local pcoords = GetEntityCoords(PlayerPedId())
--    RequestModel(book)
--    while not HasModelLoaded(book) do
--        Citizen.Wait(0)
--    end
--    
--    for i=1,#Config.Zones['init'] do
--        local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Zones['init'].x, Config.Zones['init'].y, Config.Zones['init'].z)
--        SetBlipSprite(blip, 1109348405, 1)
--        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Trabajo Farming Job")
--    end
--
--    for i=1,#Config.Zones['init'] do
--        prop[i] = CreateObjectNoOffset(book, Config.Zones['init'].x, Config.Zones['init'].y, Config.Zones['init'].z, false, false, false, false)
--        SetEntityHeading(prop[i], Config.Zones['init'].h)
--        FreezeEntityPosition(prop[i], true)
--    end
--end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zones['init'].x, Config.Zones['init'].y, Config.Zones['init'].z - 1.0, 0, 0, 0, 0, 0, 0, 3.5, 3.5, 0.9, 18, 255, 1, 155, 0, 0, 2, 0, 0, 0, 0)
        if (Vdist(pos.x, pos.y, pos.z, Config.Zones['init'].x, Config.Zones['init'].y, Config.Zones['init'].z) < 3.0) then
            if Field1 == false then
                DrawTxt(Language.translate[Config.lang]['press'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    TriggerServerEvent('rgn_farmer:startjob')
                end
            end
        end
        if FirstField == true then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zones['Field1'].x, Config.Zones['Field1'].y, Config.Zones['Field1'].z - 1.0, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zones['Field1'].x, Config.Zones['Field1'].y, Config.Zones['Field1'].z) < 3.0) then
                DrawTxt(Language.translate[Config.lang]['press'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    TriggerEvent("vorp:TipRight", Language.translate[Config.lang]['goto'], 5000)
					RemoveBlip(blip)
					blip2 = N_0x554d9d53f696d002(203020899, Config.Zones['Field2'].x, Config.Zones['Field2'].y, Config.Zones['Field2'].z)
                    SetBlipSprite(blip2, -570710357, 1)
					FirstField = false
                    Field2 = true
					TriggerServerEvent('rgn_farmer:additem')
                end
            end
        elseif Field2 == true then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zones['Field2'].x, Config.Zones['Field2'].y, Config.Zones['Field2'].z - 1.0, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zones['Field2'].x, Config.Zones['Field2'].y, Config.Zones['Field2'].z) < 3.0) then
                DrawTxt(Language.translate[Config.lang]['press'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    TriggerEvent("vorp:TipRight", Language.translate[Config.lang]['goto'], 5000)
                    RemoveBlip(blip2)
                    blip3 = N_0x554d9d53f696d002(203020899, Config.Zones['Field3'].x, Config.Zones['Field3'].y, Config.Zones['Field3'].z)
                    SetBlipSprite(blip3, -570710357, 1)
                    Field2 = false
                    Field3 = true
					TriggerServerEvent('rgn_farmer:additem')
                end
            end
        elseif Field3 == true then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zones['Field3'].x, Config.Zones['Field3'].y, Config.Zones['Field3'].z - 1.0, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zones['Field3'].x, Config.Zones['Field3'].y, Config.Zones['Field3'].z) < 3.0) then
                DrawTxt(Language.translate[Config.lang]['press'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    TriggerEvent("vorp:TipRight", Language.translate[Config.lang]['goto'], 5000)
                    RemoveBlip(blip3)
                    blip4 = N_0x554d9d53f696d002(203020899, Config.Zones['Field4'].x, Config.Zones['Field4'].y, Config.Zones['Field4'].z)
                    SetBlipSprite(blip4, -570710357, 1)
                    Field3 = false
                    Field4 = true
					TriggerServerEvent('rgn_farmer:additem')
                end
            end
        elseif Field4 == true then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zones['Field4'].x, Config.Zones['Field4'].y, Config.Zones['Field4'].z - 1.0, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zones['Field4'].x, Config.Zones['Field4'].y, Config.Zones['Field4'].z) < 3.0) then
                DrawTxt(Language.translate[Config.lang]['press'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    TriggerEvent("vorp:TipRight", Language.translate[Config.lang]['load'], 5000)
                    RemoveBlip(blip4)
                    blip5 = N_0x554d9d53f696d002(203020899, Config.Zones['Vehicle'].x, Config.Zones['Vehicle'].y, Config.Zones['Vehicle'].z)
                    SetBlipSprite(blip5, -570710357, 1)
                    Field4 = false
                    LastField = true
					TriggerServerEvent('rgn_farmer:additem')
                end
            end
        elseif LastField == true then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zones['Vehicle'].x, Config.Zones['Vehicle'].y, Config.Zones['Vehicle'].z - 1.0, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 1.5, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zones['Vehicle'].x, Config.Zones['Vehicle'].y, Config.Zones['Vehicle'].z) < 3.0) then
                DrawTxt(Language.translate[Config.lang]['pressc'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion2()
                    TriggerEvent("vorp:TipRight", Language.translate[Config.lang]['carry'], 5000)
                    TriggerEvent('rgn_farmer:lastroute')
                    RemoveBlip(blip5)
                    blip6 = N_0x554d9d53f696d002(203020899, Config.Zones['Delivery'].x, Config.Zones['Delivery'].y, Config.Zones['Delivery'].z)
                    SetBlipSprite(blip6, -570710357, 1)
                    LastField = false
                    Delivery = true
                    TriggerEvent('rgn_farmer:timer')
                end
            end
        elseif Delivery == true then
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zones['Delivery'].x, Config.Zones['Delivery'].y, Config.Zones['Delivery'].z - 1.0, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 1.5, 255, 23, 23, 155, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(pos.x, pos.y, pos.z, Config.Zones['Delivery'].x, Config.Zones['Delivery'].y, Config.Zones['Delivery'].z) < 3.0) then
                DrawTxt(Language.translate[Config.lang]['pressf'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    if IsPedInAnyVehicle(PlayerPedId(), true) then
                        DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                        TriggerEvent("vorp:TipRight", Language.translate[Config.lang]['completejob'] ..money.."$ | "..xp.."XP", 5000)
						RemoveBlip(blip6)
						TriggerServerEvent('rgn_farmer:pay', money, xp)
						TriggerServerEvent('rgn_farmer:removeitem')
                        Delivery = false
                        Field1 = false
                    else
                        TriggerEvent("vorp:TipRight", Language.translate[Config.lang]['noveh'], 5000)
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('rgn_farmer:lastroute')
AddEventHandler('rgn_farmer:lastroute', function()
	Citizen.Wait(0)

	local jugador = PlayerPedId()
	local Vehicle = GetHashKey(Config.Vehicle)
	RequestModel(Vehicle)

	while not HasModelLoaded(Vehicle) do
		Citizen.Wait(0)
	end

	spawncar = CreateVehicle(Vehicle, Config.Zones['Vehicle'].x, Config.Zones['Vehicle'].y, Config.Zones['Vehicle'].z, Config.Zones['Vehicle'].heading, true, false)
	SetVehicleOnGroundProperly(spawncar)
	SetModelAsNoLongerNeeded(Vehicle)
end)

RegisterNetEvent('rgn_farmer:start')
AddEventHandler('rgn_farmer:start', function(source)
    blip = N_0x554d9d53f696d002(203020899, Config.Zones['Field1'].x, Config.Zones['Field1'].y, Config.Zones['Field1'].z)
    SetBlipSprite(blip, -570710357, 1)
    FirstField = true
    Field1 = true
end)

RegisterNetEvent('rgn_farmer:timer')
AddEventHandler('rgn_farmer:timer', function()
	local timer = 220

	Citizen.CreateThread(function()
		while timer > 0 and Delivery do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		while Delivery do
			Citizen.Wait(0)
			DrawTxt(Language.translate[Config.lang]['temp']..timer..Language.translate[Config.lang]['seconds'], 0.4, 0.92, 0.4, 0.4, true, 255, 255, 255, 150, false)
            if timer < 1 then
                TriggerEvent("vorp:TipRight", Language.translate[Config.lang]['lose'], 5000)
				Field1, Field2, Field3, Field4, LastField, Delivery, FirstField = false, false, false, false, false, false, false
				DeleteVehicle(spawncar)
				RemoveBlip(blip6)
                SetEntityCoords(PlayerPedId(), Config.Zones['Vehicle'].x, Config.Zones['Vehicle'].y, Config.Zones['Vehicle'].z)
			end
		end
	end)
end)

function animacion()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('working_loop_hoe'), 20000, true, false, false, false)
    exports['progressBars']:startUI(20000, Language.translate[Config.lang]['Farming'])
    Wait(20000)
    ClearPedTasksImmediately(PlayerPedId())
end

function animacion2()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('PROP_HUMAN_SACK_STORAGE_IN'), 7000, true, false, false, false)
    exports['progressBars']:startUI(7000, Language.translate[Config.lang]['placing'])
    Wait(7000)
    ClearPedTasksImmediately(PlayerPedId())
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)


    --Citizen.InvokeNative(0x66E0276CC5F6B9DA, 2)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

function CreateVarString(p0, p1, variadic)
    return Citizen.InvokeNative(0xFA925AC00EB830B9, p0, p1, variadic, Citizen.ResultAsLong())
end
