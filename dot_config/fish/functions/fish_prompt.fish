function fish_prompt
    set -g __fish_git_prompt_showdirtystate yes
    set -g __fish_git_prompt_showuntrackedfiles yes
    set -g __fish_git_prompt_showstashstate yes
    set -g __fish_git_prompt_color yellow

    set_color green
    echo -n (prompt_pwd)
    set_color yellow
    echo -n (fish_git_prompt)
    set_color normal
    echo -n '$ '
end

function fish_right_prompt
    set_color brblack
    date '+%H:%M'
end