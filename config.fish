
function safe_rm

# Creating local flags for case classification:

    set dangerous false
    set critical false
    set recursive false

# Defining dangerous, critical, and recursive flags:

    for arg in $argv
        if string match -rq '^-.*f' -- $arg
            set dangerous true
        end

        if string match -rq '^-.*r' -- $arg
            set recursive true
        end

        if string match -rq '^/($|etc|bin|usr|var|tmp|dev|proc|sys)' -- $arg
            set critical true
        end
    end

# Dangerous Flag:


    if test $dangerous = true
        echo "⚠️ Dangerous flag (-f) detected. Operation Blocked."
        return 1
    end

# Critical Flag:

    if test $critical = true
        echo "⚠️ Critical directory detected. Operation Blocked."
        return 1
    end

# Recursive Flag:

    if test $recursive = true
        read -P "⚠️ You are about to delete a directory. Confirm? [y/N]: " answer
        if string match -qi 'y*' -- $answer
            command rm -r -i -v $argv
        else
            echo "Deletion cancelled."
        end
        return
    end

# Rest of the situations:

    read -P "Confirm deletion? [y/N]: " answer
    if string match -qi 'y*' -- $answer
        command rm -v $argv
    else
        echo "Deletion cancelled."
    end
end

# script ends

# Aliases

alias rm safe_rm
