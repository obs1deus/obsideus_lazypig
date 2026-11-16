# LazyPig

LazyPig is a Vanilla WoW addon for repeatable quest turn-ins, auto-dismount, loot handling, and other shortcuts.

## Install and configure

Install LazyPig with the [Twilight Hammer Toolkit](https://github.com/obs1deus/twilighthammertoolkit) or another addon manager that supports GitHub repositories. To install it manually, follow the steps below.

1. Download and extract the repository ZIP.
2. Rename the extracted folder to `_LazyPig` and move it into your game's `Interface/AddOns` folder. The addon manifest should be at `Interface/AddOns/_LazyPig/_LazyPig.toc`.
3. Start the game or run `/reload`. Type `/lp` to open LazyPig Options. Click **Show Keybinds** to view the available shortcuts.

## Resize the options window

Open `/lp` and click **−** or **+** in the top-right corner. The window defaults to **80%**. Each click changes the scale by five percentage points, within a range of **50% to 100%**. LazyPig saves your selection across reloads and logins.

## Repeatable quest auto-complete

1. Hold **Shift** before opening the quest NPC's dialogue.
2. Keep holding Shift as you complete the first turn-in. If the quest offers a choice of rewards, select the one you want to repeat.
3. Talk to the NPC again while still holding Shift to replay the recorded turn-in.
4. Release Shift to clear the recording and its reward choice.

Repeatable quest recording and replay work independently of the **Special Key Combinations** setting. On the quest detail screen, **Shift** or **Alt** accepts the quest.

## Other features

Use `/lp` to configure auto-dismount, NPC gossip, loot handling, group invites, and chat filters. Some features rely on English client text.

See the [original readme](Readme.txt) for the historical changelog and [CosminPOP's repository](https://github.com/CosminPOP/_LazyPig) for the upstream project.
