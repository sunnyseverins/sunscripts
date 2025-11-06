# SUNSCRIPTS
A bunch of scripts I made for myself. The main idea is to speedup some actions that are not available with keyboard alone, or in turn that are too slow. Works on Windows.

So, instead of typing:
```
Win + R -> typing: "cmd", (Ctrl + Shift +) Enter -> typing: "taskkill /f /im someprocess.exe /t", Enter -> Alt + F4
```
You can:
```
Win -> typing: "kill som", Enter
```
Autocompletion will understand `someprocess` name if there are no similar ones created that also begin with `som`.

## Scripts so far

`create-kill-process`
<br>Prompts for the correct process name without ".exe" part, creates the "kill" script.

`remove-kill-process`
<br>Prompts for the correct process name without ".exe" part, removes the "kill" script.

`create-re(start)-explorer`
<br>Creates `re explorer` script alone.

`remove-all-sunscripts`
<br>Removes all scripts and folders used.

### Disambiguation:

- `create` scripts create both a script and a link for the intended action;
- `remove` removes scripts installed;
- `kill` keyword works with killing processes;
- `re` keyword works with restarting processes.

## Conclusion
Although the realization is weak, it is enough to speed up things.
If you need to finetune/remove stuff created one by one, the folders are:
- Shortcuts: `%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Scripts` or via RMB -> Open File Location.
- Scripts: `%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Scripts`