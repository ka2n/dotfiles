#!/bin/env ruby

NAME = { LVDS: 'eDP-1', DP1: 'DP-1', DP2: 'DP-2', DP: 'DP-1', HDMI: 'HDMI-1' }
ON = { LVDS: false, DP1: false, DP2: false, HDMI: false }
CONN = { LVDS: false, DP: false, HDMI: false }

# Getting state

def updateState
	xo = `xrandr`
	CONN[:LVDS] = xo.match? /^#{NAME[:LVDS]} connected/
	CONN[:HDMI] = xo.match? /^#{NAME[:HDMI]} connected/

	dp1 = xo.match? /^#{NAME[:DP1]} connected/
	dp2 = xo.match? /^#{NAME[:DP2]} connected/
    CONN[:DP] = dp1 || dp2
    if dp1
        NAME[:DP] = NAME[:DP1]
    elsif dp2
        NAME[:DP] = NAME[:DP2]
    end

	xo = `xrandr --listmonitors`
	ON[:LVDS] = xo.match? /\s#{NAME[:LVDS]}/
	ON[:DP] = xo.match? /\s#{NAME[:DP]}/
	ON[:HDMI] = xo.match? /\s#{NAME[:HDMI]}/
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
			`xrandr --output #{NAME[:HDMI]} --auto --right-of #{NAME[:DP]}`
			`xrandr --output #{NAME[:LVDS]} --auto --below #{NAME[:HDMI]}`
		else
			if CONN[:HDMI]
				notify 'Use HDMI + Main'
				`xrandr --output #{NAME[:HDMI]} --auto --above #{NAME[:LVDS]}`
			elsif CONN[:DP]
				notify 'Use DP + Main'
				`xrandr --output #{NAME[:DP]} --auto --above #{NAME[:LVDS]}`
			end
		end
	when ON[:LVDS] && (ON[:HDMI] || ON[:DP])
		# サブのみにする
		`xrandr --output #{NAME[:LVDS]} --off`

		if CONN[:HDMI] && CONN[:DP]
			notify 'Use only Sub display(HDMI + DP)'
			`xrandr --output #{NAME[:HDMI]} --auto --right-of #{NAME[:DP]}`
		else
			notify 'Use only Sub display(HDMI or DP)'
			`xrandr --output #{NAME[:HDMI]} --auto` if CONN[:HDMI]
			`xrandr --output #{NAME[:DP]} --auto` if CONN[:DP]
		end
	else
		# メインのみにする
		notify 'Use only main display'
		`xrandr --output #{NAME[:LVDS]} --auto`
		`xrandr --output #{NAME[:HDMI]} --off`
		`xrandr --output #{NAME[:DP]} --off`
	end
end

updateState
switchByState
