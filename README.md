# safe_rm-Fish-Script
Fish script to prevent accidental deletion. For Bash Script, use : [Safe_rm-Bash-Script](https://github.com/alphaxleonidas/Safe_rm-Bash-Script)

```
echo $SHELL
```
It should say: /bin/fish

```
nano ~/.config/fish/config.fish
```
add this:

```
function safe_rm
    set dangerous false
    set critical false
    set recursive false

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

    if test $dangerous = true
        echo "⚠️ Dangerous flag (-f) detected. Operation Blocked."
        return 1
    end

    if test $critical = true
        echo "⚠️ Critical directory detected. Operation Blocked."
        return 1
    end

    if test $recursive = true
        read -P "⚠️ You are about to delete a directory. Confirm? [y/N]: " answer
        if string match -qi 'y*' -- $answer
            command rm -r -i -v $argv
        else
            echo "Deletion cancelled."
        end
        return
    end

    read -P "Confirm deletion? [y/N]: " answer
    if string match -qi 'y*' -- $answer
        command rm -v $argv
    else
        echo "Deletion cancelled."
    end
end

alias rm safe_rm

```
activate using:
```
source ~/.config/fish/config.fish
```
