local wezterm = require 'wezterm'

function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'tokyonight_night'
  else
    return '3024 Day'
  end
end

function return_bg_image(appearance)
  if appearance:find 'Dark' then
    return '/Users/inust/Downloads/cyberpunk.jpeg'
  else
    return '/Users/inust/Downloads/snowtown.jpeg'
  end
end

if wezterm.config_builder then
  config = wezterm.config_builder()
end
return {
color_scheme = scheme_for_appearance(get_appearance()),
  background = {
    {
      source = {
      File = '/Users/inust/Downloads/snowtown.jpeg'
      },
      repeat_x = "Mirror",
      height = "100%",
      width = 1000,
      hsb = {
        brightness=1.0,
       hue = 1.0, 
        saturation = 0.4,
      },
    }
  },
  window_background_opacity = 0.05,
  text_background_opacity = 0.4,
  hide_tab_bar_if_only_one_tab = true,
	adjust_window_size_when_changing_font_size = false,
	selection_word_boundary = " \t\n{}[]()\"'`,;:│=&!%",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
  font = wezterm.font_with_fallback({"D2Coding", {family = "Symbols Nerd Font", scale = 0.75}}),
  window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 12.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
},

colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}
}
