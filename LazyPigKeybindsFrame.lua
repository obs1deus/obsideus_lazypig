local FontstringTables = {
	["Non Configurable Enhancements"] = {
		[0] = "LazyPigNCE",
		[1] = { "LazyPig_kbfs000", "Sell Grey Items/Repairs:", "Hold Alt while the merchant window is open" },
		[2] = { "LazyPig_kbfs001", "Repeatable Quest Auto-Complete:", "Hold Shift through the first turn-in and talk to the NPC again." },
		[3] = { "LazyPig_kbfs002", "Quest Acceptance:", "Hold Shift or Alt on the quest detail screen." },
	},

	["Special Key-Combination Bindings"] = {
		[0] = "LazyPigSKCB",
		[1] = { "LazyPig_kbfs010", "Follow:", "CTRL-SHIFT" },
		[2] = { "LazyPig_kbfs011", "Inspect Player/Bid Auction:", "ALT-SHIFT" },
		[3] = { "LazyPig_kbfs012", "Send Mail/Create Auction:", "CTRL-ALT" },
		[4] = { "LazyPig_kbfs013", "Confirm Popup/Buy Auction:", "CTRL-ALT" },
		[5] = { "LazyPig_kbfs014", "Initiate-Accept Trade:", "CTRL-ALT" },
	},

	["Configurable Key Bindings"] = {
		[0] = "LazyPigCKB",
		[1] = { "LazyPig_kbfs020", "Logout:", "" },
		[2] = { "LazyPig_kbfs021", "Unstuck", "" },
		[3] = { "LazyPig_kbfs022", "Reload UI:", "" },
		[4] = { "LazyPig_kbfs023", "Target WSG EFC/Duel Request-Cancel", "" },
		[5] = { "LazyPig_kbfs024", "Drop WSG Flag/Remove Slow Fall Buff", "" },
	},
}


local function FontstringGroup(hParent, offsetX, offsetY, sTitle, tCheck, tCol1, tCol2, bKB)
	local frame = CreateFrame("Frame", tCheck[0], hParent)
	frame:SetPoint("TOPLEFT", hParent, "TOPLEFT", offsetX, offsetY)
	frame:SetWidth(11)
	frame:SetHeight(11)

	local fs_title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	fs_title:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
	fs_title:SetTextColor(1, 1, 1, 1)
	fs_title:SetText(sTitle)

	frame.fs_title = fs_title

	frame.fst = {}
	frame.fsc = {}
	
	local max_width = { 0, nil }

	for k,v in ipairs(tCheck) do
		local fst = frame:CreateFontString(v[1], "ARTWORK", "GameFontNormalSmall")
		fst:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 8, -(4+(k-1)*10))
		fst:SetText(v[2])
		fst:SetTextColor(tCol1[1], tCol1[2], tCol1[3], tCol1[4])
		local temp = fst:GetStringWidth()
		if temp > max_width[1] then 
			max_width[1] = temp
			max_width[2] = fst
		end

		frame.fst[k] = fst
	end
	for k,v in ipairs(tCheck) do
		local fsname
		if not bKB then
			fsname = v[1].."Content"
		else
			fsname = "LP_KB" .. tostring(k)
		end
		local fsc = frame:CreateFontString(fsname, "ARTWORK", "GameFontNormalSmall")
		fsc:SetPoint("LEFT", getglobal(v[1]), "LEFT", 10+max_width[1], 0)
		fsc:SetText(v[3])
		fsc:SetTextColor(tCol2[1], tCol2[2], tCol2[3], tCol2[4])

		frame.fsc[k] = fsc
	end
end

function LazyPig_CreateKeybindsFrame()
	local options = LazyPigOptionsFrame
	local frame = CreateFrame("Frame", "LazyPigKeybindsFrame", options)
	tinsert(UISpecialFrames, "LazyPigKeybindsFrame")
	frame:SetFrameStrata("DIALOG")
	frame:SetFrameLevel(options:GetFrameLevel() + 5)
	frame:SetWidth(570)
	frame:SetHeight(175)
	frame.docked = true

	function frame:UpdateDockPosition()
		if not self.docked then return end

		local scale = options:GetEffectiveScale() / UIParent:GetEffectiveScale()
		local width = self:GetWidth() * scale
		local height = self:GetHeight() * scale
		local gap = 6
		self:ClearAllPoints()
		if (options:GetBottom() or 0) * scale >= height + gap then
			self:SetPoint("TOP", options, "BOTTOM", 0, -gap)
		elseif UIParent:GetWidth() - (options:GetRight() or 0) * scale >= width + gap then
			self:SetPoint("TOPLEFT", options, "TOPRIGHT", gap, 0)
		elseif (options:GetLeft() or 0) * scale >= width + gap then
			self:SetPoint("TOPRIGHT", options, "TOPLEFT", -gap, 0)
		else
			self:SetPoint("BOTTOM", options, "BOTTOM", 0, 10)
		end
	end

	frame:SetPoint("BOTTOM", options, "BOTTOM", 0, 10)
	frame:SetBackdrop( {
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
			edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", 
			tile = true, 
			tileSize = 32, 
			edgeSize = 32, 
			insets = { left = 11, right = 12, top = 12, bottom = 11 }
		} );
	frame:SetBackdropColor(.01, .01, .01, .91)

	frame:SetMovable(false)
	frame:EnableMouse(true)
	frame:SetClampedToScreen(false)
	frame:RegisterForDrag("LeftButton")

	frame:Hide()
	frame:SetScript("OnShow", function()
		frame:UpdateDockPosition()
		LazyPig_ShowBindings("LOGOUT", "LP_KB1", "CTRL+ALT+SHIFT");
		LazyPig_ShowBindings("UNSTUCK", "LP_KB2");
		LazyPig_ShowBindings("RELOAD", "LP_KB3");
		LazyPig_ShowBindings("DUEL", "LP_KB4");
		LazyPig_ShowBindings("WSGDROP", "LP_KB5");	
	end)
	frame:SetScript("OnMouseDown", function()
		if not this.docked and arg1 == "LeftButton" and not this.isMoving then
			this:StartMoving();
			this.isMoving = true;
		end
	end)
	frame:SetScript("OnMouseUp", function()
		if arg1 == "LeftButton" and this.isMoving then
			this:StopMovingOrSizing();
			this.isMoving = false;
		end
	end)
	frame:SetScript("OnHide", function()
		if this.isMoving then
			this:StopMovingOrSizing();
			this.isMoving = false;
		end
	end)

	-- MenuTitle Frame
	local texture_title = frame:CreateTexture("LazyPigKeybindsFrameTitle")
	texture_title:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header", true);
	texture_title:SetWidth(266)
	texture_title:SetHeight(58)
	texture_title:SetPoint("CENTER", LazyPigKeybindsFrame, "TOP", 0, -20)

	frame.texture_title = texture_title

	-- MenuTitle FontString
	local fs_title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	fs_title:SetPoint("CENTER", frame.texture_title, "CENTER", 0, 12)
	fs_title:SetText("Keybinds")

	frame.fs_title = fs_title

	local dockButton = CreateFrame("Button", "LazyPigKeybindsDockButton", frame, "GameMenuButtonTemplate")
	dockButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -16, -12)
	dockButton:SetWidth(72)
	dockButton:SetHeight(20)
	dockButton:SetText("Undock")
	dockButton:SetScript("OnClick", function()
		frame.docked = not frame.docked
		if frame.docked then
			frame:SetParent(options)
			frame:SetScale(1)
			frame:SetFrameLevel(options:GetFrameLevel() + 5)
			frame:SetMovable(false)
			frame:SetClampedToScreen(false)
			frame:UpdateDockPosition()
			dockButton:SetText("Undock")
		else
			frame:SetParent(UIParent)
			frame:SetScale(options:GetEffectiveScale() / UIParent:GetEffectiveScale())
			frame:ClearAllPoints()
			frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
			frame:SetMovable(true)
			frame:SetClampedToScreen(true)
			dockButton:SetText("Dock")
		end
	end)


	local st = "Non Configurable Enhancements"
	frame.fsgroup_NCE = FontstringGroup(frame, 20, -25, st, FontstringTables[st], {1, .81, 0}, {1, 1, 1})

	local st = "Special Key-Combination Bindings"
	frame.fsgroup_SKCB = FontstringGroup(frame, 20, -85, st, FontstringTables[st], {1, .81, 0}, {.8, .1, .1})

	local st = "Configurable Key Bindings"
	frame.fsgroup_CKB = FontstringGroup(frame, 255, -85, st, FontstringTables[st], {1, .81, 0}, {.8, .1, .1}, true)

	return frame
end