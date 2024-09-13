
-- Import libraries
local GUI = require("GUI")
local system = require("System")
local internet = require("internet")

---------------------------------------------------------------------------------

query = "Hello world!"
temp = query:gsub("%s", "&")
local lang = "rus"

local workspace, window, menu = system.addWindow(GUI.filledWindow(1, 1, 65, 20, 0xE1E1E1))

local localization = system.getCurrentScriptLocalization()

local layout = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 1))

local amogus = window:addChild(GUI.input(2, 4, 30, 3, 0xEEEEEE, 0x555555, 0x999999, 0xFFFFFF, 0x2D2D2D, localization.textToTranslate, localization.textToTranslate))
local sugoma = window:addChild(GUI.input(35, 4, 30, 3, 0xEEEEEE, 0x555555, 0x999999, 0xFFFFFF, 0x2D2D2D, localization.translatedText, localization.translatedText))
local comboBox = window:addChild(GUI.comboBox(2, 12, 30, 3, 0xEEEEEE, 0x2D2D2D, 0xCCCCCC, 0x888888))
comboBox:addItem(localization.toRus).onTouch = function()
  lang = "rus"
end
comboBox:addItem(localization.toEng).onTouch = function()
  lang = "eng"
end
comboBox:addItem(localization.toGer).onTouch = function()
  lang = "ger"
end
comboBox:addItem(localization.toFre).onTouch = function()
  lang = "fre"
end
comboBox:addItem(localization.toIta).onTouch = function()
  lang = "ita"
end
comboBox:addItem(localization.toPol).onTouch = function()
  lang = "pol"
end

local translateButton = window:addChild(GUI.button(2, 8, 30, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, localization.translate))
translateButton.onTouch = function()
  query = amogus.text
  temp = query:gsub("%s", "&")
  sigma, reason = internet.request("http://213.171.30.54:8080/api/translate/" .. lang .. "/" .. temp)
  sugoma.text = sigma
end

window.onResize = function(newWidth, newHeight)
  window.backgroundPanel.width, window.backgroundPanel.height = newWidth, newHeight
  layout.width, layout.height = newWidth, newHeight
end

---------------------------------------------------------------------------------

workspace:draw()

