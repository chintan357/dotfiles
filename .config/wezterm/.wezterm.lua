local wezterm = require 'wezterm'

-- local config = wezterm.config_builder()

local config = {
    audible_bell = "Disabled",
    check_for_updates = false,
    color_scheme = 'GruvboxDark',
    window_decorations = "NONE",
    inactive_pane_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.0,
    },
    font_size = 10.0,
    font = wezterm.font 'FiraCode Nerd Font',
    launch_menu = {},

    leader = { key="0", mods="CTRL", timeout_milliseconds = 1 },
    disable_default_key_bindings = true,
    window_background_opacity = 0.95,
    window_padding = {
        left = 3,
        right = 0,
        top = 3,
        bottom = 0,
    },
    use_fancy_tab_bar = false,
    -- hide_tab_bar_if_only_one_tab = true,
    enable_tab_bar = false,

    keys = {

        { key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        { key = "\\",mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },

        { key = "h", mods = "CTRL|SHIFT",       action=wezterm.action{ActivatePaneDirection="Left"}},
        { key = "j", mods = "CTRL|SHIFT",       action=wezterm.action{ActivatePaneDirection="Down"}},
        { key = "k", mods = "CTRL|SHIFT",       action=wezterm.action{ActivatePaneDirection="Up"}},
        { key = "l", mods = "CTRL|SHIFT",       action=wezterm.action{ActivatePaneDirection="Right"}},

        { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        { key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
        { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
        { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
        { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},

        { key = "X", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
        { key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},

        { key = "n", mods="SHIFT|CTRL",     action="ToggleFullScreen" },

        { key ="v",  mods="SHIFT|CTRL",    action=wezterm.action.PasteFrom 'Clipboard'},
        { key ="c",  mods="SHIFT|CTRL",    action=wezterm.action.CopyTo 'Clipboard'},

        { key = "+", mods="CTRL|SHIFT",     action="IncreaseFontSize" },
        { key = "-", mods="CTRL",     action="DecreaseFontSize" },
        { key = "0", mods="CTRL",     action="ResetFontSize" },
    },
}


return config


-- config.keys = {
--     {
--         key = 'w',
--         mods = 'CTRL|ALT',
--         action = wezterm.action.CloseCurrentPane { confirm = true },
--     },
-- }

