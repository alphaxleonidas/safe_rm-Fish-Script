# safe_rm-Fish-Script
Fish script to prevent accidental deletion. 
For Bash Script, use : [Safe_rm-Bash-Script](https://github.com/alphaxleonidas/Safe_rm-Bash-Script)


# Configuration:

```
echo $SHELL
```
If Output: /bin/fish , proceed with: 

```
cd ~
git clone https://github.com/alphaxleonidas/safe_rm-Fish-Script/
cp -rv safe_rm-Fish-Script/config.fish ~/.config/fish/
rm -rv safe_rm-Fish-Script
source ~/.config/fish/config.fish
```
This will activate the script.

To edit:

```
nano ~/.config/fish/config.fish
```
