local function keyCode(key, modifiers)
   modifiers = modifiers or {}
   return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()      
   end
end

local function remapKey(modifiers, key, keyCode)
   hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end



-- Jetbrainsの時だけ
  -- 日本語入力中
    -- lでASCIIにする
    -- qでカタカナにする
local function nonLatin(sourceID)
  return sourceID == "jp.sourceforge.inputmethod.aquaskk.Hiragana" or sourceID == "jp.sourceforge.inputmethod.aquaskk.Katakana" or sourceID == "jp.sourceforge.inputmethod.aquaskk.HalfWidthKana"
end

local function katakana(sourceID)
  return sourceID == "jp.sourceforge.inputmethod.aquaskk.Katakana" or sourceID == "jp.sourceforge.inputmethod.aquaskk.HalfWidthKana"
end

rml = hs.hotkey.new(nil, "l", function()
  sid = hs.keycodes.currentSourceID()
  if nonLatin(sid) then
      hs.keycodes.currentSourceID("jp.sourceforge.inputmethod.aquaskk.Ascii")
    else
      rml:disable()
      hs.eventtap.keyStroke(nil, "l")
      rml:enable()
  end
end)
rmq = hs.hotkey.new(nil, "q", function()
  sid = hs.keycodes.currentSourceID()  
  if nonLatin(sid) then
      if katakana(sid) then
          hs.keycodes.currentSourceID("jp.sourceforge.inputmethod.aquaskk.Hiragana")
      else
          hs.keycodes.currentSourceID("jp.sourceforge.inputmethod.aquaskk.Katakana")
      end
    else
      rmq:disable()
      hs.eventtap.keyStroke(nil, "q")
      rmq:enable()
  end
end)

local function handleJetbrainsAppEvent(name, event, app)
  if event == hs.application.watcher.activated then
    if name == "RubyMine" then
      rml:enable()
      rmq:enable()
    else
      rml:disable()
      rmq:disable()
    end
  end
end
appsWatcher = hs.application.watcher.new(handleJetbrainsAppEvent)
appsWatcher:start()
  
--local function showKeyPress(tapEvent)
    --local charactor = hs.keycodes.map[tapEvent:getKeyCode()]
    --hs.alert.show(charactor, 1.5)
--end

--local keyTap = hs.eventtap.new(
  --{hs.eventtap.event.types.keyDown},
  --showKeyPress
--)

--k = hs.hotkey.modal.new({"cmd", "shift", "ctrl"}, 'P')
--function k:entered()
  --hs.alert.show("Enabling Keypress Show Mode", 1.5)
  --keyTap:start()
--end
--function k:exited()
  --hs.alert.show("Disabling Keypress Show Mode", 1.5)
--end
--k:bind({"cmd", "shift", "ctrl"}, 'P', function()
    --keyTap:stop()
    --k:exit()
--end)

--appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
--appsWatcher:start()

-- カーソル移動
remapKey({'ctrl'}, 'f', keyCode('right'))
remapKey({'ctrl'}, 'b', keyCode('left'))
remapKey({'ctrl'}, 'n', keyCode('down'))
remapKey({'ctrl'}, 'p', keyCode('up'))

---- テキスト編集
--remapKey({'ctrl'}, 'w', keyCode('x', {'cmd'}))
--remapKey({'ctrl'}, 'y', keyCode('v', {'cmd'}))

---- コマンド
--remapKey({'ctrl'}, 's', keyCode('f', {'cmd'}))
--remapKey({'ctrl'}, '/', keyCode('z', {'cmd'}))
--remapKey({'ctrl'}, 'g', keyCode('escape'))

---- ページスクロール
--remapKey({'ctrl'}, 'v', keyCode('pagedown'))
--remapKey({'alt'}, 'v', keyCode('pageup'))
--remapKey({'cmd', 'shift'}, ',', keyCode('home'))
--remapKey({'cmd', 'shift'}, '.', keyCode('end'))
