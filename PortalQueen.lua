--initialization values
addonName, portalQueen = ...

function PortalQueen() 

end

function PortalQueenOnFrame()

end

function ActivatePortal(portalItemId)
    if PlayerHasToy(portalItemId) then 
        UseToy(portalItemId) 
    end
end