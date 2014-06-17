local wm = GetWindowManager() -- we want to use whatever window manager the game is

local maci = {}

-- Status
maci.isActive = false
maci.isAvAOnly = false
maci.isLogDebug = false -- Set at 'true' to show debug informations


-- Params
maci.paramOn = "on"
maci.paramOff = "off"
maci.paramAvA = "ava"
maci.paramDebug = "debug"

-- Constants
maci.slashCommand = "maci"
maci.uniqueId = "maci_for_the_win"
maci.deltaTime = 5

maci.slots = {
	3 = ActionButton3,
	4 = ActionButton4,
	5 = ActionButton5,
	6 = ActionButton6,
	7 = ActionButton7
}


maci.getStamina = function ()
	local current, max, effect = GetUnitPower("player", POWERTYPE_STAMINA)
	
	return current, max, effect
end

maci.getMagicka = function ()
	local current, max, effect = GetUnitPower("player", POWERTYPE_MAGICKA)
	
	return current, max, effect
end

-- GetSlotAbilityCost(index) ->      Returns: integer abilityCost, integer mechanicType 



maci.createControle = function (index)

  -- now a label, so we can display the information
  -- not local, because it is declared above, so we can modify it later
  lblCounter = wm:CreateControl("lblCounter", maci.slots[index], CT_LABEL)
  lblCounter:SetColor(0.8, 0.8, 0.8, 1)
  lblCounter:SetFont("ZoFontAlert")
  lblCounter:SetScale(1)
  lblCounter:SetWrapMode(TEX_MODE_CLAMP)
  lblCounter:SetDrawLayer(1)
  lblCounter:SetText("Click Counts: 0")
  lblCounter:SetAnchor(CENTER, GuiRoot, CENTER, 0,0)

  return lblCounter
end