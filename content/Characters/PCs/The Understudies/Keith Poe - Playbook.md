---
title: Keith Poe - Playbook
tags:
- reference
campaign: Rifted
secret: false
created: 2026-09-06T00:00:00
updated: 2026-09-06T19:02:22
---

# Keith Poe - Playbook

*Companion to [[Keith Poe]] — regenerated from the synced Character Sheet on 2026-09-06. Rerun this skill after any character-sheet-sync update to keep it current.*

*Pronouns not set on the PC note — using they/them by default.*

*Arcane Armor conversion isn't yet confirmed active at the table — Foundry still lists his equipped armor as plain Studded Leather, not converted via Smith's Tools. Treat the no-STR-requirement and spellcasting-focus-through-armor benefits as pending until confirmed, and don't rely on them here.*

## Combat Decision Flowchart

**Only one Armor Model is active at a time** (Dreadnaught, Guardian, or Infiltrator — swappable with Smith's Tools on a Short or Long Rest, not mid-fight), so the model-specific attacks below aren't a live turn-by-turn choice — they're a pre-fight decision about which model to swap into.

**Triage first — check every turn before anything else:**
- **Ally down or dying →** Kay has no healing prepared right now — that's the party's other casters' job.
- **Just rolled a natural 1 on any d20 Test →** **Warping Flesh** triggers automatically: CON save (DC 15) or Stunned until the end of your next turn. Not a choice, just track it.
- **Bloodied and Guardian model is active →** **Defensive Field** (BA, gain temp HP = 3, lost if armor is doffed).

**Action:**
- **Dreadnaught model active, want reach and to shove/pull something off you or an ally →** **Force Demolisher** (M +6, 10 ft. reach, 1d10 force; push or pull 10 ft. if the target is ≤1 size smaller).
- **Guardian model active, want to peel attention off an ally →** **Thunder Pulse** (M +6, 5 ft., 1d8 thunder; target has disadv. on attacks against anyone but you until the start of your next turn).
- **Infiltrator model active, want range →** **Lightning Launcher** (R +6, 90/300 ft., 1d6 lightning; once/turn on hit, +1d6 lightning).
- **Single target, guaranteed damage regardless of AC →** **Magic Missile** *(always prepared)* (120 ft., 3 darts, 1d4+1 force each, auto-hit, splittable across targets).
- **Enemies grouped close to you →** **Thunderwave** *(always prepared)* (self, 15-ft. cube, CON 14, 2d8 thunder + pushed 10 ft. on fail; ½ dmg no push on success).
- **An unattended 1–5 lb. object is within 60 ft. and worth throwing →** **Catapult** (DEX 14, 60 ft.; 3d8 bludgeoning to the struck creature and the object on a fail).
- **Nothing else worth spending →** **Dagger** (M/R +3, 1d4+1 pierce, thrown) or **Unarmed Strike**.

**Bonus Action** (independent of the above):
- **Dreadnaught model active, need reach or size right now →** **Giant Stature** (self, 1 min: reach +5 ft., becomes Large if room allows, 4/LR).
- **Guardian model active and Bloodied →** **Defensive Field** (see Triage).

**Reaction:**
- **Self or a seen creature starts falling →** **Feather Fall** (60 ft., up to 5 creatures, no fall damage if landing before the effect ends, 1 min).

**Movement:** Dreadnaught and Guardian both want to be in melee (5–10 ft.); Infiltrator wants range (90/300 ft.) and also grants **Powered Steps** (+5 ft. Speed while active) and **Dampening Field** (advantage on Stealth while active) — neither is captured in any table, but both apply automatically whenever Infiltrator is the active model. Since the model can't be swapped mid-fight, plan the model choice around the expected fight before it starts, not around this turn's positioning.

**Comparative Notes:**
- *Magic Missile vs. Catapult, single target:* Magic Missile auto-hits for a flat 1d4+1 per dart across up to 3 darts, splittable, with no save or attack roll to miss. Catapult needs an unattended 1–5 lb. object on hand and forces a DEX save for a bigger one-shot (3d8) but does nothing on a success. Landing damage matters more than volume against a single target, which is where Magic Missile wins out — Catapult only makes sense with a suitable object in reach and an appetite for the bigger, riskier hit.
- *Choosing an Armor Model before the fight:* Force Demolisher (Dreadnaught) trades range for reach and a forced-movement rider; Thunder Pulse (Guardian) trades damage for a control debuff that protects allies rather than Kay; Lightning Launcher (Infiltrator) trades melee presence for range and repeatable bonus damage on a hit. This isn't a mid-turn choice — it's set on the last Short or Long Rest, so pick based on what the next fight is expected to need.
- *Thunderwave vs. Magic Missile against multiple enemies:* Thunderwave hits everyone in a 15-ft. cube from you at zero risk of missing entirely (save for half, no push on success), but requires enemies to be close. Magic Missile's darts can be split across separate targets at 120 ft. with guaranteed damage on each, but each dart alone is small. A cluster near him is Thunderwave's moment. Scattered targets at range belong to Magic Missile instead, for guaranteed chip damage on each.

## Loadout Selection

*Artificer prepares from its full class spell list (legacy — Artificer has no 2024-updated version, so its spell list is queried from 2014-era sources). A Long Rest lets Kay change which spells are prepared; currently prepared: Catapult, Detect Magic, Identify, Feather Fall (Magic Missile and Thunderwave are always prepared separately and don't count against the total).*

**Dungeon / combat-heavy:**
- Swap in: *Absorb Elements* (Reaction, resistance to the triggering attack's damage type, plus bonus melee damage on your next hit) and *Grease* (10-ft. square of difficult terrain, DEX save or fall Prone)
- Keep: *Catapult*, *Magic Missile* — always useful

**Social / exploration-heavy:**
- Swap in: *Alarm* (ritual, 20-ft. cube perimeter alarm — useful setting camp in hostile territory) and *Disguise Self* (alter appearance for 1 hr.)
- Keep: *Identify* — never a bad slot to hold

**Balanced / unknown expedition type:**
- Default to what's currently prepared — it's already a reasonable spread

*Candidates pulled from the full Artificer spell list at accessible levels (query_5etools.py, legacy edition) — not just what's currently on the sheet.*

## Non-Combat & Creative Uses

- Sensing whether magic is present nearby, and what school → **Detect Magic** (self, 30 ft.); ten minutes of ritual casting keeps the prepared use in reserve
- Learning what a mysterious item actually does → **Identify** (touch, ritual, 1-min. cast — properties, attunement requirement, charges)
- Need to fix a broken tool, lock, or object on the fly → **Mending** (touch, 1-min. cast, repairs a single break/tear ≤1 ft.; free, doesn't count against prepared spells)
- Crafting a one-off magical gadget for a specific problem → **Tinker's Magic** (Magic action with Tinker's Tools in hand, create one Tinker's Magic item from the XPHB list within 5 ft.; usable 4×/day, lasts until Long Rest)
- Need to grab or manipulate something at a distance without getting close → **Mage Hand** (30 ft., carries ≤10 lb., can move up to 30 ft. as a Magic action)
- Expecting a stealth- or speed-heavy stretch coming up (scouting, infiltration, covering ground fast) → swap into **Infiltrator model** at your next Short or Long Rest for **Dampening Field** (adv. on Stealth) and **Powered Steps** (+5 ft. Speed), both automatic while it's active — not a mid-scene switch, so plan ahead
- Need a minor magical trick — a spark, a clean-up, a mark, a flavor change → **Prestidigitation** (10 ft., 1 of 6 minor effects)
- Speaking to an ally silently across a room without a shared language → **Limited Telepathy** *(Verdan, RAW: 30 ft., no shared language needed, but the target must understand at least one language; simple ideas only)*
- Need an edge resisting a Charm or Fear effect → **Telepathic Insight** *(Verdan, RAW: advantage on all WIS and CHA saving throws)*
- Holding his breath through gas, smoke, or submersion → **Breathless** *(Aberrant Anatomy, RAW: hold breath for 1 hour)*
- Need to spot something everyone else missed → **Perception +8 (expertise)** paired with **Blindsight 15 ft.**
- Investigating a scene, chasing a lead, or piecing together what happened → **Investigation +6**, **History +6**, **Arcana +6** — the old journalist's instincts didn't retire
- Need to talk your way past someone → **Persuasion +2** *(Verdan)*
- Building, repairing, forging, or faking an ID → **Smith's Tools**, **Tinker's Tools**, **Disguise Kit**, **Thieves' Tools** proficiencies
- Need a better night's recovery after a rough Short Rest → **Black Blood Healing** *(Verdan, RAW: reroll a 1 or 2 on any Hit Die spent at the end of a Short Rest, must use the new roll)*
- Possible DM-adjudicated stretch, not RAW — Aberrant Anatomy's Warping Flesh is written as an involuntary liability (a natural 1 risks Stunning him), but the same unstable biology could plausibly be provoked deliberately in the right narrative moment rather than only triggering by accident → the sheet only describes the accidental version, so a deliberate trigger would need the table to agree it works that way

*Replicate Magic Item plans (4 known) aren't itemized in Foundry — no specific creative uses can be built for them until confirmed at the table.*

