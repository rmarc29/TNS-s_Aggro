local frame = CreateFrame("Frame")
frame:RegisterEvent("UNIT_TARGET")

-- Warning text

local warningText = frame:CreateFontString(nil, "OVERLAY")
warningText:SetFont("Fonts/FRIZQT__.TTF", 32, "OUTLINE")
warningText:SetPoint("CENTER", UIParent, "CENTER", 0, 100)
warningText:SetTextColor(1, 0, 0)
warningText:SetText("You're being targeted by " .. unit)
warningText:Hide()

-- Time text

local function ShowWarning()
    warningText:Show()
    PlaySoundFile("Sound//Item//Weapons//Gun//GunFire01.wav")
    C_Timer.After(2, function()
        warningText:Hide()
    end)
end

-- Unit target check

frame:SetScript("OnEvent", 
    function(self, event, unit)
        if UnitCanAttack("player", unit) and UnitIsUnit(unit.."target", "player")
    then
        ShowWarning()
    end
end)
