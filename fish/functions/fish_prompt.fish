function fish_prompt --description 'Write out the prompt'
	
    set stat $status

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_color_blue
        set -g __fish_color_blue (set_color -o blue)
    end

    if not set -q __fish_color_red
        set -g __fish_color_red (set_color -o red)
    end

    #Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $stat -gt 0
        set __fish_color_status (set_color -o red)
    end

    set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
    set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')

    switch "$USER"
        case root toor
            if not set -q __fish_prompt_cwd
                if set -q fish_color_cwd_root
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
                else
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
                end
            end
            printf '%s@%s %s%s%s# ' $USER (prompt_hostname) "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

        case '*'
            if not set -q __fish_prompt_cwd
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end

            printf '%s%s %s%s@%s:%s%s%s%s %s(%s)%s \f\r> ' "$__fish_color_red" (date "+%H:%M:%S") "$__fish_color_blue" $USER (hostname -f) "$__fish_prompt_cwd" $pwd "$__fish_color_red" (__fish_git_prompt) "$__fish_color_status" "$stat" "$__fish_prompt_normal"
    end
end
