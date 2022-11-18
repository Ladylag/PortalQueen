--initialization values
addonName, portalQueen = ...
local HBD = LibStub('HereBeDragons-2.0')
local HBDP = LibStub('HereBeDragons-Pins-2.0')

local pinParent = {} -- HBDP needs some ref for the pins

function PortalQueen() 
    -- DebugDemoOfMapPin()

   
    -- local pin = CreateFrame('Button', nil, UIParent, "SecureActionButtonTemplate")
    -- pin:SetPoint("CENTER")
    -- pin:SetWidth(64)
    -- pin:SetHeight(64)
    -- pin:SetAttribute("type", "macrotext")
    -- pin:SetAttribute("macrotext", "/say testing")
    -- pin:RegisterForClicks()

   

    CreateMapPins()
end

function PortalQueenOnFrame()
    
end

function PQTest()
    local macroBtn = CreateFrame("Button", "myMacroButton", UIParent, "SecureActionButtonTemplate, ActionBarButtonTemplate")
    macroBtn:SetPoint("CENTER")
    macroBtn:SetPoint("TOP")
    macroBtn:SetSize(50, 50)
    macroBtn:SetAttribute("type", "spell") -- left click causes macro
    macroBtn:SetAttribute("spell", "Frost Nova") -- text for macro on left click
    macroBtn:RegisterForClicks("AnyUp")
    macroBtn.texture = macroBtn:CreateTexture()
    macroBtn.texture:SetAllPoints(macroBtn)
    macroBtn.texture:SetColorTexture(1,0.1,0.1,0.75)    
end

function ActivatePortal(portalItemId)
    if PlayerHasToy(portalItemId) then 
        UseToy(portalItemId) 
    end
end

-- Commented out code is how you create a pin and place it on the map
-- the real trick is getting the mapID, x, and y, values.
function DebugDemoOfMapPin()
    local pinFrame = CreateFrame('Button', nil, UIParent)
    pinFrame.texture = pinFrame:CreateTexture()
	pinFrame.texture:SetAllPoints(pinFrame)
	pinFrame.texture:SetColorTexture(0.1,1,0.1,0.75)
    pinFrame:SetWidth(16)
    pinFrame:SetHeight(16)

    -- Get here be dragons to work
    HBD:UpdateCurrentPosition(true)
    local x, y, mapID = HBD:GetPlayerZonePosition()
    print("x: " .. tostring(x) .. ", y: " .. tostring(y) .. ", mapID: " .. tostring(mapID))
    HBDP:AddWorldMapIconMap(pinParent, pinFrame, mapID, x, y, HBD_PINS_WORLDMAP_SHOW_WORLD, 'PIN_FRAME_LEVEL_TOPMOST')
end

function CreateMapPins()
    -- Seems that this function must be called before pins can be placed
    HBD:UpdateCurrentPosition(true)

    -- Currently using data provided from InteractiveWormholes
    for i, p in pairs(portalQueen.data) do
        if p.x ~= nil and p.y ~= nil and p.mapID ~= nil then
            print("pin for: " .. tostring(i) .. ": " .. tostring(p.x) .. ", " .. tostring(p.y) .. ", " .. tostring(p.mapID))
            local pin = CreateFrame('Button', nil, UIParent)
            pin.texture = pin:CreateTexture()
            pin.texture:SetAllPoints(pin)
            pin.texture:SetColorTexture(1,0.1,0.1,0.75)
            pin:SetWidth(16)
            pin:SetHeight(16)

            HBDP:AddWorldMapIconMap(pinParent, pin, p.mapID, p.x, p.y, HBD_PINS_WORLDMAP_SHOW_WORLD, 'PIN_FRAME_LEVEL_TOPMOST')
        else
            print("No pin will be created for this data: " .. tostring(i) .. ": " .. tostring(p.x) .. ", " .. tostring(p.y) .. ", " .. tostring(p.mapID))
        end
    end
end