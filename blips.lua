-- Explicação do código: https://youtu.be/xrEXO6j1w88

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
PdeF = Tunnel.getInterface("aula_1")

function MyDraw3DText(x, y, z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
	if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextDropShadow(0, 0, 0, 55)
		SetTextEdge(0, 0, 0, 150)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
	end
end
local blips = {
    [1] = {['x'] = 657.68, ['y'] = 200.62, ['z'] = 95.3},
    [2] = {['x'] = 655.17, ['y'] = 195.22, ['z'] = 95.41},
    [3] = {['x'] = 652.82, ['y'] = 189.19, ['z'] = 95.42},
    [4] = {['x'] = 651.2, ['y'] = 183.61, ['z'] = 95.3},
    [5] = {['x'] = 648.95, ['y'] = 177.81, ['z'] = 95.44},
    [6] = {['x'] = 646.95, ['y'] = 172.01, ['z'] = 95.45},
    [7] = {['x'] = 644.8, ['y'] = 166.3, ['z'] = 95.46},
    [8] = {['x'] = 638.63, ['y'] = 149.69, ['z'] = 95.32},
    [9] = {['x'] = 637.11, ['y'] = 145.18, ['z'] = 95.3},
    [10] = {['x'] = 634.61, ['y'] = 137.9, ['z'] = 95.11},
    [11] = {['x'] = 615.79, ['y'] = 145.1, ['z'] = 97.11},
    [12] = {['x'] = 614.21, ['y'] = 156.8, ['z'] = 97.32},
    [13] = {['x'] = 616.63, ['y'] = 162.75, ['z'] = 97.28},
    [14] = {['x'] = 618.62, ['y'] = 168.77, ['z'] = 97.32},
    [15] = {['x'] = 621.28, ['y'] = 174.97, ['z'] = 97.28},
    [16] = {['x'] = 623.53, ['y'] = 181.07, ['z'] = 97.28},
    [17] = {['x'] = 626.1, ['y'] = 186.94, ['z'] = 97.2},
    [18] = {['x'] = 628.09, ['y'] = 193.1, ['z'] = 97.12},
    [19] = {['x'] = 630.12, ['y'] = 198.38, ['z'] = 97.15},
    [20] = {['x'] = 631.57, ['y'] = 204.32, ['z'] = 97.37},
    -- ['x'] = 645.53, ['y'] = 184.35, ['z'] = 95.69
}
CreateThread(function()
    local contagem = 0
    while true do
        Wait(5)
        local  ped = PlayerPedId()
        local player = GetEntityCoords(ped)
        for v in pairs(blips) do
            local blip = vector3(blips[v].x, blips[v].y, blips[v].z)
            local distancia = #(player - blip)
            if distancia < 8 then
                DrawMarker(
                    0, -- type --[[ integer ]], 
                    blip.x, -- posX --[[ number ]], 
                    blip.y, -- posY --[[ number ]], 
                    blip.z-1, -- posZ --[[ number ]], 
                    0, -- dirX --[[ number ]], 
                    0, -- dirY --[[ number ]], 
                    0, -- dirZ --[[ number ]], 
                    0, -- rotX --[[ number ]], 
                    0, -- rotY --[[ number ]], 
                    0, -- rotZ --[[ number ]], 
                    0.8, -- scaleX --[[ number ]], 
                    0.8, -- scaleY --[[ number ]], 
                    0.8, -- scaleZ --[[ number ]], 
                    255, -- red --[[ integer ]], 
                    0, -- green --[[ integer ]], 
                    0, -- blue --[[ integer ]], 
                    255, -- alpha --[[ integer ]], 
                    0, -- bobUpAndDown --[[ boolean ]], 
                    1, -- faceCamera --[[ boolean ]], 
                    2, -- p19 --[[ integer ]], 
                    0 -- rotate --[[ boolean ]], 
                    -- textureDict --[[ string ]], 
                    -- textureName --[[ string ]], 
                    -- drawOnEnts --[[ boolean ]]
                )
                if distancia < 1.5 then -- (apertar, 'E')
                    MyDraw3DText(blip.x, blip.y, blip.z, "Use o comando [~p~/entrar~w~] para acessar o ~p~TRAILER~w~.")
                end
            end
        end
    end
end
)
