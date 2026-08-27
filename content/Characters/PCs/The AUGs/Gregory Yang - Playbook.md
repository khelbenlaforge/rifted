---
title: Gregory Yang - Playbook
tags:
- reference
campaign: Rifted
secret: false
created: 2026-08-26T19:16:54
updated: 2026-08-26T19:48:54
---

# Gregory Yang - Playbook

*Companion to [[Gregory Yang]] — regenerated from the synced Character Sheet on 2026-08-26. Rerun this skill after any character-sheet-sync update to keep it current.*

**Known data gap:** Eldritch Cannon's firing mode/stat block wasn't present in the synced Foundry data (per Gregory's own Character Sheet Features note). It's included below as an available Action, but its concrete damage/effect isn't listed here — re-run character-sheet-sync once the live Foundry feature has it filled in before relying on it tactically.

## Combat Decision Flowchart

**Triage first:**
- About to be hit by an attack and an L1 slot is available → **Shield** (Reaction, +5 AC until the start of Gregory's next turn, applies even against the triggering attack) — this costs a slot every time (no free-cast clause on this one), but can turn a hit into a miss outright
- About to make a saving throw → **Thumb to the Crack** (Reaction, 1/Short Rest, free — no slot) — advantage on that save. Only one Reaction is usable per round total, so if both an attack and a forced save land on Gregory in the same round, he has to pick one

**Action:**
- Default ranged attack → **Fire Bolt** (spell attack +7, 120 ft, 1d10 fire, unlimited) — the first time each turn this hits, **Steady Hands** adds an extra 1d6 force damage
- Wants to use a held weapon's attack instead, or needs radiant damage specifically → **True Strike** (attack with the Dagger at its own range — 5 ft melee or 20/60 ft thrown — using INT instead of the weapon's normal ability for both the attack roll and damage; choose weapon damage or radiant; the cantrip itself adds no bonus damage until level 5) — **True Strike is a weapon attack made as part of casting a spell, not a spell attack roll itself** *(confirmed via this item's own DM Notes — Codex flagged this exact distinction during design)*, but it still triggers Steady Hands' extra 1d6 force the first time each turn, same as Fire Bolt
- Multiple enemies grouped around Gregory → **Thunderwave** (Action, CON DC 15, self 15-ft cube, 2d8 thunder, 10-ft push on a fail, half damage/no push on success, L1 slot)
- Wants to weaken a group before focusing them down → **Faerie Fire** (Action, DEX DC 15, 60 ft, 20-ft cube, Conc. 1 min, L1 slot) — outlined targets grant advantage on attacks against them; **Held Ground** gives advantage on the Concentration saves needed to keep this up under fire
- Expects to get meleed and wants a buffer plus retaliation → **Armor of Agathys** (Action, self, L1 slot) — 5 temporary HP; while any of it remains, a creature that hits Gregory with a melee attack takes 5 cold damage
- Ally down or hurt → **Cure Wounds** (Action, touch, 2d8+5, L1 slot)
- Wants to deploy the cannon → **Eldritch Cannon** (Action, 1/Long Rest or spend a spell slot, 5 ft, lasts 1 hour or until it drops to 0 HP, only one active at a time) — see the data-gap note above before relying on its exact numbers
- Need a sound or minor visual illusion instead of damage (a diversion, a fake noise, a small hidden image) → **Minor Illusion** (30 ft, 1 min, unlimited — granted via Magic Initiate: Wizard, not the Artificer spell list)
- Nothing else fits → **Dagger** (M/R +3, 1d4+1 pierce) or **Unarmed Strike** (M +0, 1 bludgeon) — ordinary weapon attacks, not spell attacks or attacks made while casting a spell, so **neither triggers Steady Hands**

**Bonus Action:** None at this level, per the sheet.

**Reaction:** covered under Triage above (Shield, Thumb to the Crack).

**Movement:** 30 ft base, no special movement type.

**Comparative Notes:**
- *Fire Bolt vs. True Strike, both able to trigger Steady Hands:* Fire Bolt is a straightforward 120 ft ranged spell attack for 1d10 fire. True Strike uses the Dagger's own (short) range instead, lets Gregory swap in INT for the attack and damage roll, and offers a choice between the weapon's damage type or radiant — but adds nothing extra from the cantrip itself before level 5. Reach for Fire Bolt when range is what matters; reach for True Strike specifically for the radiant option or when INT-scaling on a weapon attack is the point.
- *The shared L1 slot pool (3 per Long Rest):* Armor of Agathys, Cure Wounds, Faerie Fire, Shield, and Thunderwave all draw from the same 3 slots — Alarm and Mage Armor each get one free cast per Long Rest via Mark of Warding on top of that pool, so they don't compete for it on their first use each day. Since Shield is a Reaction Gregory might need at any moment, it's worth holding at least one slot in reserve rather than spending all 3 proactively on Action-turn spells.
- *Arcane Lock's free cast is currently its only use:* Arcane Lock (L2) also gets one free cast per Long Rest via Mark of Warding, but Gregory has **zero L2 spell slots** at character level 3 — so that free cast is the only way he can use Arcane Lock at all right now, not just the cheapest way. Don't spend it on something minor.
- *Shield vs. Thumb to the Crack when both trigger the same round:* only one Reaction is usable per round total. Shield costs a slot but can turn a hit into an outright miss; Thumb to the Crack is free but only grants advantage on a save, not a guaranteed result. If a slot is available and an attack roll is what's actually at stake, Shield is the stronger single response — save Thumb to the Crack for saving throws specifically, or for after slots run out.

## Loadout Selection

*Artificer prepares from its own spell list and can change its list after every Long Rest — pick the set below that matches the next expedition. **Gregory is currently only using 3 of his 6 allowed prepared-spell slots** (Armor of Agathys, Cure Wounds, Faerie Fire) — this is the single most actionable finding in this section: he can fill the other 3 for free at his next Long Rest, no level-up required. *(The max of 6 is confirmed via the Artificer class's own prepared-spells formula, floor(level ÷ 2) + INT modifier = floor(3 ÷ 2) + 5 = 1 + 5 = 6 — matching the sheet exactly, not a guess.)* Candidates below are pulled from a live query of the actual modern Artificer L1–L2 spell list, not just illustrative examples.*

**Dungeon / combat-heavy:**
- Fill the empty slots with: *Grease* (L1) — battlefield control that pairs with Thunderwave's push
- Fill with: *Enlarge/Reduce* (L2) — a versatile buff/debuff option this kit otherwise lacks
- Keep: *Armor of Agathys, Faerie Fire* — already strong for a fight

**Social / exploration-heavy:**
- Fill with: *Disguise Self* (L1) — infiltration utility fitting a House Kundarak Heir working a room
- Fill with: *Identify* (L1) — matches Gregory's whole artificer/scholar identity for appraising a find on the spot
- Keep: *Cure Wounds* — never a bad slot to hold

**Balanced / unknown expedition type:**
- Fill the 3 open slots with a mix — one damage/control option, one defensive option, one utility option — rather than leaving them empty by default

## Non-Combat & Creative Uses

- Need rope, caltrops, a torch, or similar simple gear on short notice → **Tinker's Magic** *(RAW: while holding Tinker's Tools, create one item from the PHB tinker's-tools list within 5 ft, lasts until the next Long Rest; 5 uses per Long Rest, equal to his INT modifier)*
- Need to produce a minor magic item overnight → **Replicate Magic Item** *(RAW: 4 known plans, up to 2 crafted per Long Rest with Tinker's Tools — the specific 4 plans aren't in the synced sheet data; confirm with the player)*
- Need an ally to act earlier in a specific fight's turn order → **Alert** *(RAW: after rolling Initiative, Gregory can swap his result with a willing, non-Incapacitated ally)*
- Need a safety net for one crucial roll each day → **Resourceful** *(RAW: Heroic Inspiration after every Long Rest)*
- Need to tell whether someone is being genuine or just performing → **Practiced Composure** *(RAW: advantage on Insight checks for this)*
- Need to fix a torn cloak, a broken strap, or a split link on the spot → **Mending**
- Need to pick a lock or disarm a mechanical trap → **Thieves' Tools proficiency**
- Need to recall arcane theory, historical precedent, or piece together a mystery from physical clues → **Arcana, History, and Investigation, all at +7** — an unusually deep knowledge base across the board
- Need to ward a camp or room overnight → **Alarm** *(free 1/Long Rest via Mark of Warding, 20-ft cube, alerts mentally or audibly for 8 hr)*
- Need to lock something so only he — or someone who knows the password — can open it → **Arcane Lock** *(free 1/Long Rest via Mark of Warding — see Comparative Notes above: this is currently his only way to cast it at all)*

## Completeness Check

Every Actions/Reactions table row (Bonus Actions has none at this level, per the sheet), every Feature, and the Spellcasting section on Gregory's sheet is addressed above or explicitly excluded with a stated reason, with the Eldritch Cannon's exact numbers flagged as a known data gap rather than guessed at. Skillful is left out because it's already folded into a proficiency reflected on the sheet's skill line, with no separate decision to make. Magic Initiate: Wizard is addressed via its actual grants (Minor Illusion and True Strike, both in the Action tier above) rather than named as a source in its own right. Mundane inventory with no distinct mechanical effect (Backpack, Oil, Rations, Rope, Tinderbox, Torches, Waterskin, Fine Clothes) is left out for the same reason as the other AUGs playbooks; Crowbar and Caltrops are covered by Thieves'/Tinker's Tools proficiency and Tinker's Magic above rather than getting separate entries.

