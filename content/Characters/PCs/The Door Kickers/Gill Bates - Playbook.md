---
title: Gill Bates - Playbook
tags:
- reference
campaign: Rifted
secret: false
updated: 2026-09-21T18:03:11
created: 2026-09-21T17:38:51
---

# Gill Bates - Playbook

*Companion to [[Gill Bates]]—regenerated from the synced Character Sheet on 2026-09-21 (post-inventory-update resync: Fair Catch Tier 2, Spell-Refueling Ring, Stone From Temple Pool). Rerun `pc-playbook` after any `character-sheet-sync` update to keep it current.*

> [!warning] Sheet corrections worth a character-sheet-sync pass
> Live-verified against 5etools while building this note—none of these change how Gill actually plays today, but the sheet itself should be fixed:
> - **Arcana Domain is a 2014 (SCAG) subclass with no 2024/XPHB reprint.** At level 5 its domain spells are *Detect Magic*, *Magic Missile* (1st), *Magic Weapon*, *Nystul's Magic Aura* (2nd), *Dispel Magic*, *Magic Circle* (3rd)—all always prepared, none counting against his 9. The sheet's Features line only credits two of these; *Detect Magic* isn't on the action tables at all. Applying the full list is what makes the sheet's own "Prepared Spells: 9" line resolve cleanly (see Loadout Selection)—this note already uses the corrected version below.
> - The "Divine Order: Thaumaturge" Features bullet reads like it absorbed the Magic Initiate feat's text. Real Thaumaturge (XPHB) grants one extra **Cleric** cantrip and a WIS bonus to Arcana/Religion checks—it does not grant a free wizard spell. The free-1/Long-Rest wizard spell is Magic Initiate's own effect, and Magic Initiate only grants *one* 1st-level spell, not two—worth checking whether Fog Cloud or Magic Missile is the real pick (see Resource Tiering).
> - **True Strike:** the sheet lists "1d6+4 force." RAW (XPHB) is weapon damage + WIS mod, player's choice of Radiant or the weapon's normal type—plus a **Cantrip Upgrade** extra 1d6 Radiant at level 5, which the sheet is missing entirely. With Mace: 1d6 (bludgeoning or radiant) + 4 + 1d6 radiant.

## Combat Decision Flowchart

**Triage first, before anything else:**
- **Ally at 0 HP →** **Healing Word** (BA, 60 ft., 1d4+4, +1d4 per slot above 1st)
- **Several allies down at once →** **Mass Healing Word** (BA, 60 ft., up to 6 creatures, 2d4+4 each, 3rd)
- **Ally dead a minute or less →** **Revivify** (Action, touch, back at 1 HP, 3rd; costly material component)
- **Gill is the one being focused →** **Sanctuary** (BA, WIS DC 15, 30 ft.; attackers save or pick a new target; ends the moment he attacks or casts at a foe)
- **One ally just needs to survive a round →** **Shield of Faith** (BA, 60 ft., +2 AC, Conc., 10 min, 1st)
- **All out of a slot he needs →** **Spell-Refueling Ring** (BA, recover one expended slot of 3rd level or lower, 1/dawn—verified via 5etools, EFA)

**Action:**
- **Default →** **[[Fair Catch]]**, M/R +4, 20/60 ft., 1d6+1 (versatile 1d8+1)—returns to his hand at the start of his next turn once thrown
- **Reliable ranged damage →** **Toll the Dead** (WIS DC 15, 60 ft., 2d8 necrotic, 2d12 if the target is already missing HP)
- **Setting an ally up to swing →** **Guiding Bolt** (M/R +7, 120 ft., 4d6 radiant; next attack against the target has advantage)
- **A cluster standing together →** **Word of Radiance** (CON DC 15, 5-ft. Emanation centered on him, 2d6 radiant each creature of his choice in range—his only area cantrip, and it costs nothing; per a live 5etools lookup, "Emanation" is the exact 2024 term, not a fixed-point radius)
- **One-word solution →** **Command** (WIS DC 15, 60 ft., 1st)
- **Big single swing, heal or harm →** **Divine Spark** (CON DC 15, 30 ft., 2d8+4 heal, or 2d8+4 radiant/necrotic with half on a save; Channel Divinity)
- **Undead →** **Turn Undead** (WIS DC 15, 30 ft., flee 1 min; **Sear Undead** adds CHA-mod radiant, min. 1). No CR cutoff on this one—works on any Undead in range (per a live 5etools lookup of the XPHB feature text).
- **Celestial, elemental, fey, or fiend (not undead or aberration—Arcane Abjuration doesn't reach those)** → **Arcane Abjuration** (WIS DC 15, 30 ft., same Channel Divinity pool): turns the target for 1 min, and at his level (5th) actually *banishes* it for 1 min instead if it's CR ½ or lower and not on its home plane. Above CR ½, it's still just a turn. (Per a live 5etools lookup of the Arcana Domain's Channel Divinity: Arcane Abjuration feature.)
- **An enemy spell has to end →** **Dispel Magic** (120 ft., automatic on 3rd level or lower, roll for higher—always prepared, Arcana Domain)
- **Something extraplanar needs walling off →** **Magic Circle** (10-ft. cylinder, 1 hr. barrier—always prepared, Arcana Domain)
- **Something needs to come to him →** **Lightning Lure** (STR DC 15, 15 ft., pulled 10 ft., 2d8 lightning if pulled within reach)
- **Party needs to vanish →** **Fog Cloud** (120 ft., 20-ft. sphere heavily obscured, Conc. 1 hr; free 1/LR)
- **Damage that can't miss →** **Magic Missile** (120 ft., 3 darts, 1d4+1 each, auto-hit—always prepared *and* free 1/LR)
- **Softening a save before it matters →** **Mind Sliver** (INT DC 15, 60 ft., 2d6 psychic, −1d4 on the target's next save)

**The Fair Catch chain (Tier 2—current):**
1. **Hit** for 1d6+1 (1d8+1 two-handed), +2 to attack and damage
2. **Reel In** *(1/turn on a hit)* → target rolls STR 15 or is pulled up to 10 ft. toward him
3. **Failed Reel In save:** **Sune's Grace** (disadvantage on its next attack against Gill) **and Barbed** (Grappled, escape DC 15, until the start of his next turn—ends immediately if the spear leaves his hand)

**Bonus Action:**
- **Healing →** Healing Word / Mass Healing Word (see Triage)
- **Defense →** Sanctuary / Shield of Faith (see Triage)
- **Recover a burned slot →** Spell-Refueling Ring (see Triage)
- **An ally's weapon isn't landing →** **Magic Weapon** (touch, +1 magical, 1 hr.—always prepared, Arcana Domain)
- **He's hurt and needs it now →** **Potion of Healing** (2 uses; self only at Bonus Action speed—administering it to someone else costs an Action)
- **Fire incoming →** **Potion of Fire Resistance** (2 uses, same self/Action-to-others split, 1 hr.)

**Reaction:**
- **Natural 1 on a Fair Catch attack →** **Adon's Murmur** (1/LR): Gill may choose to reroll—if he does, he must use the new result. Optional, not automatic (per Fair Catch's own text: "Gill can reroll... and must use the new roll"), but rarely worth declining, and easy to forget mid-combat.

**Movement (30 ft.):** AC 17, 49 HP—sturdy enough to hold the front line. Stay within 30 ft. for Channel Divinity and Divine Spark; 60 ft. covers Healing Word, Guiding Bolt, and Magic Weapon.

**Resource tiering, at a glance:**
- **At-will:** Fair Catch, Mace, Net, Unarmed Strike, and every cantrip—Toll the Dead, Word of Radiance, Mind Sliver, Lightning Lure, Guidance, Friends, Thaumaturgy, True Strike
- **Always prepared, still cost a slot (Arcana Domain—none of these count against his 9):** Detect Magic, Magic Missile (1st) · Magic Weapon, Nystul's Magic Aura (2nd) · Dispel Magic, Magic Circle (3rd)
- **Always prepared, separate track (Sacred Sea, doesn't touch the 9 either):** Create or Destroy Water (1st)
- **Passive, no decision point:** Tough (+2 HP/level, already folded into the 49 HP above) · Resourceful (Heroic Inspiration after a Long Rest—free reroll, use it) · Skillful (one bonus proficiency, already folded into the Skills line) · Versatile (the Origin feat pick that granted Tough itself)
- **Spell slots: 1st ×4, 2nd ×3, 3rd ×2**—plus one recoverable 3rd-or-lower slot per dawn via the Spell-Refueling Ring
- **Channel Divinity: one shared pool of 2 uses per Short Rest**, spent on *any* of Turn Undead, Divine Spark, or Arcane Abjuration—the sheet tags all three `2/SR`, but that's 2 total, not 2 each
- **Free 1/Long Rest, no slot:** the sheet credits both *Fog Cloud* and *Magic Missile* to Magic Initiate: Wizard, though that feat only grants one 1st-level spell RAW—worth resolving at the next sync, but until then both are usable as printed
- **1/Long Rest:** Adon's Murmur. **1/day:** Adon's Counsel. **3 uses:** Holy Water.
- **Costly components:** Augury, Magic Circle, and Revivify all need them—check the pouch before counting on Revivify going off.

**Comparative Notes:**

- *Divine Spark's heal vs. Healing Word:* Divine Spark spends a Channel Divinity charge as an Action for 2d8+4; Healing Word costs a renewable 1st-level slot but only a Bonus Action, leaving the Action free to also attack or cast. Standing someone up from 0 rarely needs the bigger number—save Divine Spark's slot-free healing for when the Action itself is worth spending.
- Guiding Bolt and Divine Spark's damage mode both hit one target, but differently: Guiding Bolt is an attack roll for 4d6 radiant that hands the next attacker advantage, while Divine Spark is a CON save for 2d8+4 with half on success—it never fully whiffs. When an ally is already lined up to swing at the same target, Guiding Bolt's advantage is worth more than the raw numbers suggest.
- *Command against a lone, non-immune target, weighed against just attacking it:* Command is entirely save-or-nothing, but a win can end the exchange outright. The spear keeps swinging either way—it's still an attack roll, not automatic, but a miss costs nothing beyond the swing itself. Gamble with Command when a failed save costs him nothing; fall back on the spear when it does.
- Turn Undead and Arcane Abjuration draw from the same 2/SR pool but don't actually overlap—Turn Undead only ever targets Undead, Arcane Abjuration only ever targets celestial/elemental/fey/fiend (per a live 5etools lookup of both features). The real choice is just "what's in front of him": Abjuration additionally banishes rather than merely turning if the target is CR ½ or lower and off its home plane, so a weak outsider is worth spending the charge on; a tougher one still just gets turned.
- Thrown, Fair Catch always comes back—*Returns* fires at the start of his next turn regardless of range, so there's no cost to throwing it. The one exception is Barbed's grapple, which snaps the instant the spear leaves his hand. Keep it in hand only when holding the grapple matters more than the extra reach.

## Loadout Selection

*Cleric (2024) prepares Wisdom modifier + level spells (4+5 = 9 at level 5) from the entire Cleric spell list, swappable after every Long Rest.*

*As the callout above covers: Arcana Domain's six domain spells (Detect Magic, Magic Missile, Magic Weapon, Nystul's Magic Aura, Dispel Magic, Magic Circle) are always prepared and don't touch that count of 9. Once they're set aside, the sheet's remaining leveled spells line up exactly against the stated cap—no trimming, no guessing.*

**Currently prepared (9/9):** *Command* · *Guiding Bolt* · *Healing Word* · *Sanctuary* · *Shield of Faith* · *Augury* · *Revivify* · *Water Walk* · *Mass Healing Word*

**Dungeon / combat-heavy:**
- Keep: *Healing Word*, *Guiding Bolt*, *Revivify*, *Sanctuary*
- Swap in: *Spirit Guardians* (the strongest 3rd-level combat option a Cleric has at this level), *Aid*, *Lesser Restoration*, *Prayer of Healing*
- Swap out: *Augury*, *Water Walk*

**Social / urban:**
- Keep: *Command*, *Augury*, *Sanctuary*
- Swap in: *Zone of Truth*, *Calm Emotions*, *Enhance Ability*
- Swap out: *Revivify*, *Guiding Bolt*

**Wilderness / travel / maritime:**
- Keep: *Water Walk*, *Augury*, *Healing Word*
- Swap in: *Create Food and Water*, *Protection from Poison*, *Lesser Restoration*
- The Fisher background and the [[Istishia]] water-mastery track both point straight here—*Water Walk* is already doing real signature-move work.

**Balanced / unknown:**
- *Healing Word*, *Revivify*, *Sanctuary*, and *Guiding Bolt* are never a bad pick. If one slot is up for grabs, *Spirit Guardians* is the single swap that would change how his combat turns actually look.

## Non-Combat & Creative Uses

- Needs a gut-check before a risky move → **Augury** *(RAW, per a live 5etools lookup: ritual, 1 min. cast; the DM picks an omen—Weal, Woe, Weal and Woe, or Indifference—for a course of action within the next 30 minutes; costly material component. Cast it more than once before a Long Rest and there's a cumulative 25% chance per extra casting of getting no answer at all.)*. Ten minutes of prep can save an hour of regret.
- Anything arcane or religious comes up → **Arcana +8**, **Religion +8**
- Someone's about to attempt something and he can spare a hand → **Guidance** *(RAW: touch, ally adds 1d4 to one ability check within the next minute, Conc.)*. At-will, and the cheapest help he has to give.
- Reading a person, or field medicine → **Insight +7**, **Medicine +7**, **Survival +7**
- Anything the party would otherwise have to swim → **Water Walk** *(RAW: ritual, up to 10 creatures walk on liquid for 1 hour)*. Costs no slot as a ritual, and it's exactly his Fisher/[[Istishia]] throughline.
- Party needs to vanish or break line of sight → **Fog Cloud** *(RAW: 120 ft., 20-ft. sphere, heavily obscured, Conc. up to 1 hr.; free 1/LR)*
- Something extraplanar needs keeping out—or in → **Magic Circle** *(RAW: 10-ft. cylinder, 1 hr. barrier against extraplanar creatures; always prepared, Arcana Domain; costly component)*
- Needs an item's magic hidden, or wants to walk past a detection ward → **Nystul's Magic Aura** *(RAW, from a live lookup since the sheet's summary compresses it: a **creature** gets Mask—treated as a chosen creature type by magic that detects type; an **object** gets False Aura instead—made to register as magical, nonmagical, or a chosen school. Pick one effect per casting; always prepared, Arcana Domain)*
- Needs to know if anything nearby is magical → **Detect Magic** *(always prepared via Arcana Domain, though it isn't on the sheet's action tables yet—flag for the next character-sheet-sync)*
- Fresh drinking water on the road, or an enemy's waterskin needs emptying → **Create or Destroy Water** *(RAW: 30 ft., create or destroy up to 10 gallons of water; always prepared, Sacred Sea track)*. Costs no slot and no thought—cheap utility, easy to forget he has it.
- A curse, contract, or lingering effect needs breaking → **Dispel Magic** *(RAW: 120 ft., automatic against 3rd level or lower; always prepared, Arcana Domain)*
- Needs an answer only the spear can give → **Adon's Counsel** *([[Fair Catch]], RAW: 1/day—ask it a question and Adon answers honestly, water quality permitting)*. Purely a roleplay tool, not a combat one.
- Something needs catching alive → **Net** *(RAW: R +2, 5/15 ft., Large or smaller target Restrained, STR DC 10 to escape)*, or the full Reel In → Barbed chain if it's already close.
- Honest work, or a cover identity on a dock → the **Fisher** background plus its gear (tackle, lamp, rations, tinderbox, pouch), and his standing at the [[Tidecaller's Sanctuary|Temple of Istishia]]
- Wants to be believed when he leans on someone → **Thaumaturgy** *(RAW, per a live 5etools lookup: 30 ft., 1 min.—the Booming Voice option grants Advantage on Charisma (Intimidation) checks for the duration, which does more work than it looks like on a cleric sitting at Intimidation +0. Other options: flickering flames (Fire Play), ground tremors (Tremors), an unexplained sound (Phantom Sound), altered eyes, a door flung open or slammed shut (Invisible Hand). Up to three 1-minute effects running at once.)*
- Needs one person out of the fight, socially, for a minute → **Friends** *(RAW, per a live 5etools lookup: 10 ft., Conc. 1 min.—target makes a Wisdom save or is Charmed; auto-succeeds if it isn't a Humanoid, is already hostile to him, or was charmed by this within the past 24 hours. Ends early if it takes damage, or if he makes an attack roll, deals damage, or forces anyone to make a save. It knows it was Charmed once the spell ends—spend this where the relationship is already burnt.)*
- Wants a weapon swing to run off Wisdom instead of his −1 Strength → **True Strike** *(RAW, XPHB: one attack with the weapon used to cast it, using spellcasting ability instead of STR/DEX for both rolls; damage is Radiant or the weapon's normal type, his choice, plus an extra 1d6 Radiant Cantrip Upgrade at level 5+. See the correction callout above—the sheet currently undercounts this.)*
- A door that needs opening socially → **Guild Brass Armlet** *(guild membership token—no mechanical effect, pure social proof)*. At Persuasion +0, he's leaning entirely on the armlet and whoever's doing the actual talking.
- *Possible DM-adjudicated stretch, not RAW*—using the mere threat of Turn Undead as a bluff against something undead-adjacent but not actually Undead, where the mechanic wouldn't fire → **Turn Undead** *(RAW printed trigger: affects true Undead within 30 ft. that fail a WIS DC 15 save)*
- *Possible DM-adjudicated stretch, not RAW*—a thrown, non-lethal Fair Catch hit in a chase or standoff carrying Reel In's rattled quality outside a structured fight → **[[Fair Catch]]** *(RAW printed trigger: on a hit, target rolls STR 15 or is pulled toward him)*
