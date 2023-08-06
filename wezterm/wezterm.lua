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
    return '~/Downloads/cyberpunk.jpeg'
  else
    return '~/Downloads/snowy.jpeg'
  end
end

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end
config.color_scheme = scheme_for_appearance(get_appearance())
config.window_background_image = return_bg_image(get_appearance())
if get_appearance():find 'Dark' then
  config.window_background_image_hsb = {brightness=0.3}
end
return config
