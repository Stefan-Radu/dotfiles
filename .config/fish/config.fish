if status is-interactive
    # vars
    #=======================================================
    set -gx EDITOR nvim
    set -gx QUOTES_PATH '~/Documents/notes/quotes.txt'

    # path stuff
    #=======================================================

    export ANDROID_HOME=/opt/android-sdk/
    export ANDROID_AVD_HOME=$HOME/.android/avd/

    fish_add_path $ANDROID_HOME/platform-tools
    fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin/
    fish_add_path $ANDROID_HOME/emulator
    fish_add_path /opt/ghidra
    fish_add_path ~/.local/bin

    # configs
    #=======================================================

    # vi mode
    fish_vi_key_bindings
    # disable greeting
    set -U fish_greeting

    #prompt
    starship init fish | source

    fish_config theme choose 'Tomorrow Night Bright'
    #fish_config theme choose Lava

    # Aliases
    #=======================================================
    alias mv='mv -i'
    alias t=task
    alias quotes="$EDITOR $QUOTES_PATH"
    alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    alias nb=newsboat
    alias open=xdg-open

    # At startup
    #=======================================================

    # random quote print
    # *spawn only on the first instance (no tmux)
    if [ -z $TMUX ]
        randomquote -f "$HOME/Documents/notes/quotes.txt" | cowsay -f tux | lolcat -F 0.2 -t 
    end

    # init zoxide
    # zoxide init fish | source
end

