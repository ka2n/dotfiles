#!/bin/env ruby

LVDS = 'eDP1'
DP = 'DP1'
HDMI = 'HDMI1'

ON = { LVDS: false, DP: false, HDMI: false }
CONN = { LVDS: false, DP: false, HDMI: false }

# Getting state

def updateState
	xo = `xrandr`
	CONN[:LVDS] = xo.match? /^#{LVDS} connected/
	CONN[:DP] = xo.match? /^#{DP} connected/
	CONN[:HDMI] = xo.match? /^#{HDMI} connected/
	xo = `xrandr --listmonitors`
	ON[:LVDS] = xo.match? /\s#{LVDS}/
	ON[:DP] = xo.match? /\s#{DP}/
	ON[:HDMI] = xo.match? /\s#{HDMI}/
end

def notify(msg = '')
	`notify-send 'Display' '#{msg}'`
end

def switchByState
	# 以下をイテレーション
	# 1. メインのみ
	# 2. メインとサブ
	# 3. サブのみ
	
	# サブが未接続ならメインのみに変更
	case 
	when (CONN[:HDMI] || CONN[:DP]) && ON[:LVDS] && !ON[:HDMI] && !ON[:DP]
		# メインとサブにする
		if CONN[:HDMI] && CONN[:DP]
			notify 'Use All(Main + HDMI + DP)'
			`xrandr --output #{HDMI} --auto --right-of #{DP}`
			`xrandr --output #{LVDS} --auto --below #{HDMI}`
		else
			if CONN[:HDMI]
				notify 'Use HDMI + Main'
				`xrandr --output #{HDMI} --auto --above #{LVDS}`
			elsif CONN[:DP]
				notify 'Use DP + Main'
				`xrandr --output #{DP} --auto --above #{LVDS}`
			end
		end
	when ON[:LVDS] && (ON[:HDMI] || ON[:DP])
		# サブのみにする
		`xrandr --output #{LVDS} --off`

		if CONN[:HDMI] && CONN[:DP]
			notify 'Use only Sub display(HDMI + DP)'
			`xrandr --output #{HDMI} --auto --right-of #{DP}`
		else
			notify 'Use only Sub display(HDMI or DP)'
			`xrandr --output #{HDMI} --auto` if CONN[:HDMI]
			`xrandr --output #{DP} --auto` if CONN[:DP]
		end
	else
		# メインのみにする
		notify 'Use only main display'
		`xrandr --output #{LVDS} --auto`
		`xrandr --output #{HDMI} --off`
		`xrandr --output #{DP} --off`
	end
end

updateState
switchByState
