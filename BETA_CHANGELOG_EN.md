# Lore-Hardcore — BETA changelog (EN)

> ⚠️ **THIS IS A BETA BUILD.** From the beta channel, NOT from the Steam Workshop. It may
> contain rough edges and bugs. The stable version lives on the Steam Workshop. The beta is
> for early testing of new features before they ship to Steam.
>
> ⚠️ **If you have the Steam Workshop version installed — UNSUBSCRIBE from it or disable it
> in the launcher.** Do not run the Steam version and the beta at the same time (two copies
> of the same module conflict).

**Last stable Steam Workshop release:** v0.1.7.5
**Current beta:** v0.1.9.82

This file is updated on every beta publish. Newest on top.

---

## New in beta v0.1.9.82 (since v0.1.9.57)

### ⭐ Devotion to the Four (Chaos)
- Spend Dark Energy to deepen your devotion to **each** of the four Dark Gods (ranks 0–10). Each rank strengthens that God's battle boon (Khorne damage / Nurgle health / Tzeentch Winds of Magic / Slaanesh speed) and **stacks** with your patron's boon.
- **Milestones:** ranks 3 and 7 grant battle-spells to the sorcerer Gods (Tzeentch: Fireball → Flame Storm; Nurgle: Curse of Years → Purple Sun); Khorne & Slaanesh gain renown instead. **Rank 5** grants a unique signature weapon; **rank 10** the full war-panoply + a legendary capstone (Khorne heals & shockwaves on kills, Nurgle regenerates, Tzeentch restores Winds of Magic, Slaanesh seduces nearby foes).
- Open it from the **"Deepen Devotion"** button on the Chaos Status panel.

### 😈 Lord Seduction (Chaos)
- With devotion to **Slaanesh (rank 4)**, whisper enemy lords to your side: meet a lord and pick **"Whisper of the Dark Gods"** (500 Dark Energy + 200 Influence). The lord joins your retinue; their clan promotes a successor and survives. Faction leaders can't be seduced.

### 🔧 TOR Tweaks (new settings — Common tab, for every race)
- **Lords rebuild army from scratch** (released AI lords respawn almost empty), **remove skill learning cap**, and **Focus points per level** (1–5) / **Levels per attribute point** (1–4) sliders.

### 🖥 Chaos Status panel — clarity & tooltips
- Devotion to the gods is now a readable list "name (colour) + rank/10 + boon" (was the cryptic "K1 N0 T0 S0").
- **Hover tooltips on every element** of the panel — what it is, what it's for, how it works; in all 12 languages.
- Glory bar: the count caps at "X/X ✓" once the threshold is reached; the golden marker hides once passed.

### 🛡 Stability & polish
- Full code audit + fixes: Lord Seduction is transactional (no resource loss on failure), cooldowns/progress survive save/load, combat boons fall away when you leave the Chaos kingdom, signature weapons are unique per God.
- Removed the "Supporters" button from settings. Localization fixes (the Russian "What's new" pop-up is no longer shown in English, raw tags removed).

---

## New in beta v0.1.9.57 (hotfix over v0.1.9.56)

### 🛠 Fixed: crash when starting a NEW game
- Starting a brand-new campaign could **crash on load** (`NullReferenceException` in the name generator during minor-faction hero spawn).
- Cause: an old balance patch deleted 14 named orc-lord characters but left dangling hero references in TOR data, producing broken heroes that crashed name generation. Loading an existing save was unaffected, which is why it only showed up on **new games**.
- The lord-deletion patch was **removed entirely**. Orc army size is still tamed by the existing clan-tier reduction. No save-breaking change — data only.

---

## New in beta v0.1.9.56 (since v0.1.9.45)

### ⭐ Dark Gods system (new Chaos feature)
- When you join Chaos you pledge to one of **four Dark Gods** — Khorne, Nurgle, Tzeentch or Slaanesh. **The choice is permanent.**
- Once your **personal kill count** reaches a threshold, your god grants you their **full top-tier set of armour and weapon** (default 1000 kills) — each god has their own kit.
- At a higher kill count (default 2000 total) you unlock the **challenge against the Chaos Overlord** — a duel for his throne.
- Two **configurable thresholds** in settings (new "Dark Gods" tab, range 500–2000 each) with "?" hover hints.

### 🩸 Chaos — peace with beastmen and cults
- After you join Chaos, **beastmen** (Brass Keep / Beastmen) and the dark cults **no longer war with you** or declare war every day — they become allies. (Before joining they stay hostile, as before.)

### 📖 In-game guide (hotkey)
- The guide now opens with **Alt+H** (plain "H" used to fire even while typing a lord's name / in menus and **crashed the game** — fixed).
- Opening the guide now **pauses the game**.
- Fixed the **section order** — it now reads top-to-bottom, important topics first (the list used to be upside down).

### 💬 Text and terms
- "Chaos King" → **"Chaos Overlord"** across all dialogue and localization.
- Fixed line breaks in the **"Gift of Chaos accepted"** message (literal `\n` used to show).
- Tidied the god-choice window (text no longer crowds the buttons).

### ⚔️ Chaos recruiting
- **Chaos Portal:** 10 different soldiers per summon (5% Minotaur chance), weekly cooldown.
- **Beastmen lair:** up to 20 max-tier troops (Ungors/Gors/Minotaur), plus a **"who and how many were recruited" report**.
- Minotaur removed from ordinary settlement recruiting; its party-size penalty eased (−7 → −2).

### 🛠 Stability
- Fixed a **load-time freeze** when loading a save where the god set was already earned.
- Guard against a crash when a **Chaos Lord (Mortkin)** is captured by an ordinary lord.

---

## What changed in the beta since the last Steam release (v0.1.7.5 → v0.1.9.45)

### 💛 Supporters wall
- The mod settings now have a separate **"♥ Supporters"** button (bottom of the left column) — a list of people who supported the mod financially, ranked with stars by contribution. Thank you! ♥

### ⚔️ Overthrow the Chaos King — reworked fight
- Fully reworked Chaos King fight ("player + companions" vs "King + 2 elite bodyguards").
- **Player magic works inside the fight** — spells, raising skeletons and undead.
- The King is **invulnerable while at least one bodyguard is alive** (red Khorne warriors); after the guards die he becomes tougher.
- **Disintegration aura**: summoned undead near the King crumble.
- Field battle is **mounted**; the castle fight is on foot.
- **Escort selection** via checkboxes (which companions to bring); the King brings an equal number of fighters.
- **Reliable exit** from the fight and correct win/loss detection (including when you raised lots of skeletons).
- A ~10 second pause after the outcome — for the death animation, before the result menu opens.
- **Magic fully polished** (large batch of fixes): after casting there is no more "fire on the hands", the weapon is usable immediately, and casting with LMB **no longer triggers an extra weapon attack** — neither for aimed spells (arrow/fireball) nor for summons.

### 🪙 Orc economy
- **Elite teef upkeep**: orc elite (Tier 4+) now costs teef per day. Configurable multiplier in the settings (0 = off, 1 = normal, 2–3 = hardcore). If you run out of teef, morale drops and the elite gradually deserts. T1–T3 orcs and goblins are free.

### 🩸 Chaos — diplomacy
- **Fixed the war-declaration spam**: Beastmen and Brass Keep declared war every tick (dozens of notifications per minute). Players serving a NON-chaos faction (e.g. via the Serve As Soldier mod) no longer get an endless war↔peace toggle.

### 🧩 Quests and misc
- Orc career teef-quests: goals converted to teef, fixed double-counting of earned teef.
- Hideouts/caves: reactivation cooldown for cleared camps, bandit density caps.
- **Compatibility with TOR "War in the Mountains" 1.16**.
- A series of crash and stability fixes.

---

## Known beta limitations
- The beta may break saves between versions — keep backups.
- Not meant for long campaigns — it's for feature testing.
