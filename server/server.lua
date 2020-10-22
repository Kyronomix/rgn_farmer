VORP = exports.vorp_core:vorpAPI()
VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local itemcount = math.random(Config.itemcount['min'], Config.itemcount['max'])

RegisterServerEvent('rgn_farmer:startjob')
AddEventHandler('rgn_farmer:startjob', function()
    --TriggerEvent('redemrp:getPlayerFromId', source, function(user)
    TriggerEvent("vorp:getCharacter",source,function(user)
        TriggerClientEvent('rgn_farmer:start', source)
        TriggerClientEvent("vorp:TipRight", source, Language.translate[Config.lang]['gopos'], 5000)
    end)
end)

RegisterServerEvent('rgn_farmer:pay')
AddEventHandler('rgn_farmer:pay', function(money, xp)
    --TriggerEvent('redemrp:getPlayerFromId', source, function(user)
    TriggerEvent("vorp:getCharacter",source,function(user)
        local _source = source
		local count = VorpInv.getItemCount(source, "wheat")
        VORP.addMoney(_source, 0, (money * count))
        VORP.addXp(_source, xp)
	end)
end)

RegisterServerEvent('rgn_farmer:additem')
AddEventHandler('rgn_farmer:additem', function(item)
	local _source = source
	VorpInv.addItem(_source, Config.item, itemcount)
end)

RegisterServerEvent('rgn_farmer:removeitem')
AddEventHandler('rgn_farmer:removeitem', function(item)
	local _source = source
	local count = VorpInv.getItemCount(source, "wheat")
	VorpInv.subItem(_source, Config.item, count)
end)
	
