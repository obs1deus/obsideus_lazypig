# Obsideus' LazyPig

Obsideus' LazyPig is a World of Warcraft 1.12 addon for repeatable quest turn-ins, auto-dismount, loot handling, and other shortcuts.

## Install and configure

Install LazyPig with the [Twilight Hammer Toolkit](https://github.com/obs1deus/twilighthammertoolkit) or another addon manager that supports GitHub repositories. For a manual installation, follow these steps.

1. Download and extract the repository ZIP.
2. Rename the extracted folder to `_LazyPig` and move it into your game's `Interface/AddOns` folder. The addon manifest should be at `Interface/AddOns/_LazyPig/_LazyPig.toc`.
3. Start the game or run `/reload`. Type `/lp` or `/lazypig` to open the options window. Click **Show Keybinds** to view the available shortcuts.

### Upgrading from another LazyPig fork

Install into the existing `Interface/AddOns/_LazyPig` folder and replace matching files when prompted. Addon managers need to target that same folder. If an older fork uses a different folder name, remove that copy separately so the client loads a single LazyPig installation.

## Resize the options window

Open `/lp` and click **−** or **+** in the top-right corner. The window defaults to **80%**. Each click changes the scale by five percentage points, within a range of **50% to 150%**. LazyPig saves your selection across reloads and logins.

## Repeatable quest auto-complete

1. Hold **Shift** before opening the quest NPC's dialogue.
2. Keep holding Shift as you complete the first turn-in. If the quest offers a choice of rewards, select the one you want to repeat.
3. Talk to the NPC again while still holding Shift to replay the recorded turn-in.
4. Release Shift to clear the recording and its reward choice.

Repeatable quest recording and replay work independently of the **Special Key Combinations** setting. On the quest detail screen, **Shift** or **Alt** accepts the quest.

Common repeatable turn-ins include Argent Dawn scourgestones, Zul'Gurub coins, battleground marks, and Thorium Shells.

## Features

Enable or adjust these features in `/lp`.

| Feature | What it does |
| --- | --- |
| Auto-dismount | Dismounts during supported actions, such as casting or interacting with a flight master. Includes Turtle WoW expansion mounts and AQ40 mounts. |
| NPC gossip | Opens supported NPC services automatically. Hold **Shift** to bypass normal gossip automation. |
| Loot window | Opens the loot frame at the cursor. |
| Improved Right Click | Routes right-clicked bag items into an open trade, auction, or mail window. |
| Chat filters | Filters repeated messages and can hide selected roll and loot messages. World Chat Mute can suppress `/world` in dungeons, raids, or battlegrounds. |
| Group invites | Accepts invites according to your guildmate, friend, and stranger settings. You can pause it in battlegrounds or queues. |
| Summons and resurrection | Can accept summons near expiry and accept resurrection requests out of combat in instances. |
| Duel requests | Can decline automatically. Hold **Shift** to allow the request through. |
| Camera | Extends the maximum camera distance to 50 yards when enabled. |

### Battlegrounds

- Configure automatic queueing, entry, departure after a match, and spirit release on death.
- As group leader, enable queue announcements. You can also block battleground quest-sharing popups.
- Use **Duel / EFC** to target the enemy flag carrier in Warsong Gulch and **Drop WSG Flag** to drop your flag.

### Loot rolls

Choose **Need**, **Greed**, or **Pass** where offered. Disable the corresponding roll option to roll manually.

| Category | Examples |
| --- | --- |
| Zul'Gurub | Hakkari bijous and coins |
| Molten Core | Fiery Core, Lava Core, Blood of the Mountain |
| Ahn'Qiraj | Scarabs, idols, and blue, green, or yellow Qiraji mounts |
| Blackwing Lair | Hourglass Sand and Elementium Ore |
| Naxxramas | Wartorn scraps and thawing items |
| Emerald Sanctum | Dreamscale, Fading Dream Fragment, Small Dream Shard |
| Other loot | Corrupted Sand, white tailoring materials, food and drink, and uncommon items via the green-roll shortcut |

Necrotic Runes are automatically rolled **Need**.

### Buff removal

- **Salvation** can be removed whenever it appears or only when the addon detects a warrior with a shield, a druid in bear form, or a paladin with Righteous Fury.
- **Mana buffs** can be removed automatically, including Wisdom, Intellect, and Spirit buffs.
- **Aspect of the Wolf** has its own removal option.

## Shortcuts and keybinds

| Keys | Action |
| --- | --- |
| **Ctrl + Shift** | Follow a friendly player. |
| **Alt + Shift** | Inspect a player or bid in the auction browser. |
| **Ctrl + Alt** | Initiate or accept a trade, confirm supported popups, send mail, create or buy out auctions, and roll on uncommon loot according to your settings. |
| **Ctrl + Alt + Shift** | Log out. |
| **Alt** with the merchant window open | Sell poor-quality items and repair. |
| **Shift + right-click** in your bags | Start a stack split when **Easy Split/Merge** is enabled. Use **Alt** to increase the split count and **Ctrl** to decrease it. |

Enable **Special Key Combinations** for the multi-modifier shortcuts. Settings for **Logout**, **Unstuck**, **Reload UI**, **Duel / EFC**, **Drop WSG Flag / Remove Slow Fall**, and **Menu** are in the game's Key Bindings menu under **_LazyPig**.

## Compatibility and credits

Some automation relies on English game text. If you also use MailTo, disable **Improved Right Click** and **Easy Split/Merge** in LazyPig to avoid competing bag-click behavior. Auto Profit, Ez Dismount, Automaton, Quick Loot, and Block Salvation overlap with parts of LazyPig.

See the [historical changelog](Readme.txt), [CosminPOP's upstream repository](https://github.com/CosminPOP/_LazyPig), and [loicberland's documentation](https://github.com/loicberland/_LazyPig-master/blob/master/README.md).
