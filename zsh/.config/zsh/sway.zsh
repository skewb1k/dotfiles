# export WLR_RENDERER=vulkan 
# export GTK_THEME=Adwaita-dark
# export WLR_NO_HARDWARE_CURSORS=1 
# export XWAYLAND_NO_GLAMOR=1
# export SDL_VIDEODRIVER=wayland
export XDG_SESSION_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1
export GDK_BACKEND=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORM=wayland

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland

exec sway
