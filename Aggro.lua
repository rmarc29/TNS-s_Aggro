local frame = CreateFrame("Frame")
frame:RegisterEvent("UNIT_TARGET")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")

-- Warning text
local warningText = frame:CreateFontString(nil, "OVERLAY")
warningText:SetFont("Fonts/FRIZQT__.TTF", 32, "OUTLINE")
warningText:SetPoint("CENTER", UIParent, "CENTER", 0, 100)
warningText:SetTextColor(1, 0, 0)
warningText:Hide()

-- Warning icon
local warningIcon = frame:CreateTexture(nil, "OVERLAY")
warningIcon:SetSize(64, 64)
warningIcon:SetPoint("CENTER", UIParent, "CENTER", 0, 200)
warningIcon:SetTexture("Interface\\Icons\\Ability_DualWield")
warningIcon:Hide()

-- Show warning (text + icon + sound)
local function ShowWarning(unit)
    local name = UnitName(unit) or "an enemy"
    warningText:SetText("You're being targeted by " .. name)
    warningText:Show()
    warningIcon:Show()
    PlaySoundFile("Sound\\Item\\Weapons\\Gun\\GunFire01.wav")

    C_Timer.After(2, function()
        warningText:Hide()
        warningIcon:Hide()
    end)
end

-- Event handler
frame:SetScript("OnEvent", function(self, event, unit)
    if UnitCanAttack("player", "target") and UnitIsUnit("targettarget", "player") then
        ShowWarning("target")
    end
end)
