--initialization values
addonName, portalQueen = ...
local HBD = LibStub('HereBeDragons-2.0')
local HBDP = LibStub('HereBeDragons-Pins-2.0')

local pinParent = {} -- HBDP needs some ref for the pins

function PortalQueen() 
    -- DebugDemoOfMapPin()

    CreateMapPins()
end

function PortalQueenOnFrame()
    
end

function PQTest()
    local macroBtn = CreateFrame("CheckButton", "myMacroButton", UIParent, "ActionBarButtonTemplate")
    macroBtn:SetPoint("CENTER")
    macroBtn:SetPoint("TOP")
    macroBtn:SetAttribute("type", "macro") -- left click causes macro
    macroBtn:SetAttribute("macrotext", "/cast Frost Nova") -- text for macro on left click
    macroBtn:SetScale(0.5, 0.5)
end

function CreateMapPins()
    -- Seems that this function must be called before pins can be placed
    HBD:UpdateCurrentPosition(true)

    for i, p in pairs(portalQueen.data) do
        if p.x ~= nil and p.y ~= nil and p.mapID ~= nil then
            print("pin for: " .. tostring(i) .. ": " .. tostring(p.x) .. ", " .. tostring(p.y) .. ", " .. tostring(p.mapID))

            local pin = CreateFrame("CheckButton", "myMacroButton", UIParent, "ActionBarButtonTemplate")
            pin:SetPoint("CENTER")
            pin:SetPoint("TOP")
            pin:SetAttribute("type", "macro") 
            pin:SetAttribute("macrotext", p.macro) 
            pin:SetScale(0.3, 0.3)

            HBDP:AddWorldMapIconMap(pinParent, pin, p.mapID, p.x, p.y, HBD_PINS_WORLDMAP_SHOW_WORLD, 'PIN_FRAME_LEVEL_TOPMOST')
        else
            print("No pin will be created for this data: " .. tostring(i) .. ": " .. tostring(p.x) .. ", " .. tostring(p.y) .. ", " .. tostring(p.mapID))
        end
    end
end