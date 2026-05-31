# Persona: Out of Phase

A Persona 5 demake built in Godot 4.x — a pixel art reimagining based on an original fan fiction.

> **This is a non-commercial fan project.** Persona 5 and all related properties are owned by ATLUS/SEGA. This project is not affiliated with or endorsed by ATLUS or SEGA in any way.

---

## About

Persona: Out of Phase adapts an original Persona 5 fan fiction into a playable 2D top-down demake. The current target is a complete, playable version of the Kamoshida's Palace arc — including daily life activities, social stat progression, and turn-based combat, all rendered in pixel art.

The game opens with Ren Amamiya leaving juvenile detention. The player names him by "signing the release paperwork" at the start.

📖 **Read the fan fiction:** [Persona: Out of Phase on WebNovel](https://www.webnovel.com/book/34622084700862405)

---

## Features (In Progress)

- **Social Stat System** — Raise Knowledge, Guts, Proficiency, Kindness, and Charm through daily activities
- **Time Management** — Day/night cycle with Morning, Afternoon, Evening, and Night time slots; activities are time-restricted
- **Turn-Based Combat** — P5-style layout with Attack and Skill actions, SP management, and damage formulas
- **Daily Life Hub** — Explore Leblanc with activities: studying, working, crafting, showering, and talking to Sojiro
- **NPC System** — NPC type enum (NPC / ENEMY / FRIENDLY_SHADOW) with per-type interaction behaviour
- **Enemy Encounters** — Touching an enemy NPC triggers combat; Jack Frost is the current test enemy

---

## Current Focus

> 🎯 **Sprint goal: Working NPC interaction and basic exploration loop**

- Wire up player interact zone → NPC.interact() in player.gd
- Replace print() dialogue with a proper DialogueBox UI node
- Separate enemy dialogue from instant combat trigger
- Fix confirmed bugs (see below)

---

## Known Bugs

| File | Bug |
|------|-----|
| `battle_rewards.gd` | `reward_yen = exp` typo — yen reward always shows EXP value |
| `combat.gd` | Dead code after `return` in `_on_attack()` — enemy turn never fires on win |
| `title.gd` | Quit button not connected in `_ready()`; also typo `quit_buttom` |
| `player.gd` | `on_interact_zone_entered`, `on_interact_zone_exit`, and `_unhandled_input` are empty stubs — Z key does nothing |
| `main.gd` | `StudyButton` has no time restriction in `update_buttons()` |

---

## Roadmap

| Milestone | Status |
|-----------|--------|
| M0 — Foundation: project setup, title screen, basic movement | ✅ Done |
| M1 — Hub Systems: Leblanc, time manager, social stats, activity loop | 🔄 In Progress |
| M2 — Combat Core: full turn-based loop, skills, damage, rewards | 🔄 In Progress |
| M3 — NPC & Exploration: working NPCs, interaction, free 2D world exploration | 🔄 In Progress |
| M4 — Art Pass: replace placeholders with final pixel art | 🟡 Partial |
| M5 — Palace Stub: Kamoshida's Palace first floor, enemy encounters | ⬜ Not Started |
| M6 — Narrative: dialogue system, story beats, Kamoshida arc | ⬜ Not Started |
| M7 — Polish: audio, transitions, save/load, playtesting | ⬜ Not Started |
| v1.0 — Demo: complete Kamoshida arc, packaged export | ⬜ Not Started |

**Planned party members (Kamoshida arc):** Ren Amamiya (player), Morgana, Ann Takamaki, Ryuji Sakamoto, Shiho Suzui

---

## Changelog

### v0.0.8 — Collisions & Scene Cleanup
- Adjusted scene hierarchy and added working collision shapes on backgrounds
- Resized collision boxes on Player and NPC nodes
- Resized placeholder assets to correct proportions

### v0.0.7 — Leblanc Scene & Player Movement
- Added placeholder Leblanc scene with tileset layout
- Added player character movement in Leblanc
- Added Camera2D tracking
- Added placeholder NPC assets

### v0.0.6 — Combat System
- Added functional combat script with Attack and Skill actions
- Added Battle Rewards scene with EXP and yen summary
- Added test combat button for rapid prototyping
- SP management and damage formulas implemented

### v0.0.5 — Combat Foundation
- Added placeholder assets and began combat script
- Added UpdateUI function and defined future combat functions
- Added partial combat functionality

### v0.0.4 — Time Manager
- Added Time Manager Autoload (Morning, Afternoon, Evening, Night)
- Activities are now time-slot restricted

### v0.0.3 — Player Stats & Database
- Added PlayerStats Autoload (Knowledge, Guts, Proficiency, Kindness, Charm)
- Added combat stats (HP, SP, ATK, DEF, MAG, etc.)
- Added debug UI overlay on Main Hub

### v0.0.2 — Assets & Title Screen
- Added sprite assets and placeholder art
- Added Title Screen with branding
- Added main game hub button functionality

### v0.0.1 — Initial Commit
- Initial Godot 4.x project files
- Organized file and folder structure

---

## Built With

- [Godot 4.x](https://godotengine.org/) — Engine
- GDScript — Scripting
- Pixel art assets — 32×32 tile standard

## Platform

PC (Windows) — primary target. Android and iOS ports planned for a later stage.

## License

Fan project made for fun. All Persona-related intellectual property belongs to ATLUS/SEGA.
