local M = {}
local task

-- Controleer eventueel met: command -v aerospace
local aerospace = "/opt/homebrew/bin/aerospace"

local presets = { 1 / 3, 1 / 2, 2 / 3 }

local function cycle(direction)
	if task then
		return
	end

	local win = hs.window.focusedWindow()
	if not win or not win:isStandard() or win:isFullScreen() then
		return
	end

	local availableWidth = win:screen():frame().w
	local currentWidth = win:frame().w
	local tolerance = 20 -- voorkomt vastlopen door afronding en gaps

	local target

	if direction > 0 then
		for _, fraction in ipairs(presets) do
			local width = availableWidth * fraction
			if width > currentWidth + tolerance then
				target = width
				break
			end
		end
		target = target or availableWidth * presets[1]
	else
		for i = #presets, 1, -1 do
			local width = availableWidth * presets[i]
			if width < currentWidth - tolerance then
				target = width
				break
			end
		end
		target = target or availableWidth * presets[#presets]
	end

	task = hs.task.new(aerospace, function(code, _, stderr)
		task = nil
		if code ~= 0 then
			hs.alert.show("AeroSpace resize mislukt; zie Console")
			print(stderr)
		end
	end, {
		"resize",
		"--window-id",
		tostring(win:id()),
		"width",
		tostring(math.floor(target + 0.5)),
	})

	if not task or not task:start() then
		task = nil
		hs.alert.show("Kan AeroSpace niet starten; controleer het pad")
	end
end

M.grow = hs.hotkey.bind({ "alt" }, ",", function()
	cycle(1)
end)

M.shrink = hs.hotkey.bind({ "alt" }, ".", function()
	cycle(-1)
end)

return M
