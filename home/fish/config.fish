source /usr/share/cachyos-fish-config/cachyos-config.fish

# Force `done` to use notify-send instead of kitty's OSC 99 protocol.
# Noctalia v5 doesn't merge OSC 99 parts (title d=0 + body d=1) that share
# an i= ID, so each part becomes a separate notification. notify-send fires
# a single org.freedesktop.Notifications call, so we get one toast.
# Variables ($title, $message, $urgency, $__done_notification_duration) are
# set by __done_ended and expand at eval time.
set -g __done_notification_command 'notify-send --hint=int:transient:1 --urgency=$urgency --icon=utilities-terminal --app-name=fish --expire-time=$__done_notification_duration "$title" "$message"'

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# >>>> BEGIN MANAGED DEVIN BLOCK >>>>
# Add ~/.local/bin to PATH for devin
if not contains $HOME/.local/bin $PATH
  set -gx PATH $HOME/.local/bin $PATH
end
# <<<< END MANAGED DEVIN BLOCK <<<<

# Add ~/.cargo/bin to PATH for rust/cargo binaries
if not contains $HOME/.cargo/bin $PATH
  set -gx PATH $HOME/.cargo/bin $PATH
end

# zoxide (smarter cd)
zoxide init fish | source

# Key bindings
function fish_user_key_bindings
    bind \ee 'zeditor .'
end
