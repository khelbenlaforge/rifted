---
title: Esca - Playbook
tags:
- reference
campaign: Rifted
secret: false
created: 2026-09-06T00:00:00
updated: 2026-09-06T18:08:58
---

# Esca - Playbook

*Companion to [[Esca]] — regenerated from the synced Character Sheet on 2026-09-06. Rerun this skill after any character-sheet-sync update to keep it current.*

*Pronouns not set on the PC note — using they/them by default.*

*Loadout Selection is intentionally omitted for Esca specifically — neither this vault nor Foundry's API reliably tracks a Wizard's full spellbook beyond currently-prepared spells, so no broader swap-in suggestions are made here. Expand this note manually if a fuller spellbook list becomes available.*

**Data flag:** the Character Sheet's Actions + Reactions tables list 11 leveled (non-cantrip) spells (Disguise Self, Mage Armor, Comprehend Languages, Identify, Detect Magic, Find Familiar, Suggestion, Web, Feather Fall, Shield, Silvery Barbs), all treated as currently prepared for this note per DM direction — but Esca's own stated prepared-spell cap (INT mod + Wizard level = 8) is smaller than that. Worth a `character-sheet-sync` recheck to confirm which of these 11 are actually prepared right now.

## Combat Decision Flowchart

**Triage first — check every turn before anything else (Reaction — pick one per round):**
- **Just hit by an attack, or targeted by Magic Missile →** **Shield** (Reaction, +5 AC until the start of your next turn incl. vs. the triggering attack; no damage at all from Magic Missile).
- **Just hit by an attack or failed a save, and no slots to spare →** **Arcane Deflection** (Reaction, +2 AC vs. that attack or +4 to that save, free — but can't cast above a cantrip until the end of your next turn after using it).
- **Any creature within 60 ft. you can see just succeeded an attack, check, or save — not necessarily against you →** **Silvery Barbs** (Reaction, forces a reroll using the lower result, no slot cost, then grants adv. on the next atk/check/save to a creature of your choice, self allowed).
- **Self or a seen creature starts falling →** **Feather Fall** (Reaction, 60 ft., up to 5 creatures, no fall damage).

**Action:**
- **Enemies grouped up →** **Web** (DEX 15, 60 ft., 20-ft. cube; fail = Restrained (Athletics DC 15 to escape), success still gives difficult terrain + lightly obscured, Conc. 1 hr.).
- **One target you'd rather redirect than restrain →** **Suggestion** (WIS 15, 30 ft., Conc.; ends the instant it takes damage).
- **Single-target damage, best accuracy available →** **True Strike** cantrip (R +7 via dagger, 1d4+5 pierce or radiant) — a better attack bonus and bigger die than throwing the Dagger plain (M/R +6, 1d4+4), since it uses INT instead of DEX.
- **Nothing better available →** **Quarterstaff** (M +1, 1d6-1 bludg., 1d8-1 versatile 2H) or **Unarmed Strike** — both weak; avoid melee when a spell or True Strike is available.

**Bonus Action:** None at this level.

**Movement:** Web and Suggestion both reach well past melee (60 ft. / 30 ft.), so hang back rather than closing — Esca's weak melee options (Quarterstaff, Unarmed Strike) are a last resort, not a plan.

**Comparative Notes:**
- *Shield vs. Arcane Deflection, when hit by an attack:* Shield grants a flat +5 AC against the triggering attack (and everything until your next turn) plus full Magic Missile immunity, drawn from a renewable spell slot. Arcane Deflection grants a smaller +2 AC against just that one attack, but costs no slot at all — the price is being locked to cantrips only until the end of your next turn afterward. Reach for Shield when slots are available and the bigger, longer defense matters; reach for Arcane Deflection when slots are running low.
- *Silvery Barbs vs. Shield, defending against an incoming hit:* Silvery Barbs works on any creature's success within 60 ft. — not just an attack against Esca himself — and costs no slot at all, but only forces a reroll (using the lower result), which might still succeed. Shield only protects Esca's own AC, does cost a slot, but guarantees +5 AC and full immunity if the trigger was a Magic Missile. Reach for Silvery Barbs when the threat isn't against Esca, or slots are scarce; reach for Shield when the guaranteed, bigger defense (or Magic Missile immunity) is worth the slot.
- *Web vs. Suggestion for crowd control:* Web can restrain an unlimited number of targets in its 20-ft. cube on a failed DEX save, and even a successful save still leaves difficult terrain and light obscurement behind. Suggestion needs only one WIS save from a single target and doesn't restrain anyone — it just compels a specific ≤25-word action — but ends the instant that target takes any damage. Reach for Web against a group; reach for Suggestion for a single target you'd rather redirect than fight.
- *True Strike vs. Dagger, single-target damage:* True Strike uses Esca's INT-based spell attack bonus (+7) and INT-scaled damage die (1d4+5) instead of the Dagger's own DEX-based numbers (+6, 1d4+4) — a strictly better roll and bigger hit, at the cost of being a spell rather than a weapon attack. Default to True Strike over a plain Dagger throw whenever both are available.

## Non-Combat & Creative Uses

- Need to look like someone else for an infiltration or to dodge recognition → **Disguise Self** (1 hr.; Investigation DC 15 to discern)
- Need to sense whether magic is present nearby, and what school → **Detect Magic** (self, 30 ft.) — cast as a ritual instead of spending a prepared slot, whenever there's time to spare
- Need to learn what a mysterious item actually does → **Identify** (touch, ritual, 1-min. cast)
- Need to understand an unfamiliar language on the fly → **Comprehend Languages** (self, 1 hr., ritual)
- Need a scouting or messenger familiar → **Find Familiar** (10 ft., ritual, 1-hr. cast; Beast(CR0)-form as Fey/Celestial/Fiend, telepathic bond 100 ft.)
- Need higher AC before a fight you can see coming → **Mage Armor** (touch, base AC becomes 13 + DEX = 17 for 8 hrs., unarmored only) — cast it proactively, not mid-fight
- Need a sound or minor visual distraction → **Minor Illusion** (30 ft., sound or 5-ft. image; Investigation DC 15 to discern)
- Need a minor magical trick — a spark, a clean-up, a mark, a flavor change → **Prestidigitation**
- Need to grab or manipulate something at a distance without getting close → **Mage Hand** (30 ft., carries ≤10 lb.)
- Need to recover a spent spell slot mid-adventuring-day → **Arcane Recovery** (1/day after a Short Rest, recover slots totaling ≤2 levels' worth, nothing 6th+)
- Need to investigate a scene, a clue, or figure out how something works → **Investigation +9 (expertise)** — his single strongest stat
- Need to pick a lock, palm something, or work sleight-of-hand → **Thieves' Tools proficiency** + **Sleight of Hand +6**
- Need to notice something at a glance → **Perception +4** *(Keen Senses)*
- Need to see in total darkness → **Darkvision 60 ft.**
- Need the edge of acting first, or to protect a slower ally's turn order → **Alert** *(RAW: proficiency bonus to Initiative; can swap Initiative with a willing, adjacent ally at the start of combat; can't be Surprised while conscious)* stacking with **Tactical Wit** *(RAW: adds INT mod, +5, to initiative rolls)*
- Need to resist a Charm outright, or ignore a magical Sleep effect entirely → **Fey Ancestry** *(RAW: advantage on saves vs. Charmed; immune to magical sleep)*
- Need extra rest efficiency in the field → **Trance** *(RAW: a 4-hr. meditative trance satisfies a Long Rest instead of 8-hr. sleep)*
- Possible DM-adjudicated stretch, not RAW — a former pro StarCraft player's build-order instincts (scouting, resource timing, exploiting a read under pressure) could plausibly translate into reading an enemy formation's structure or a heist's timing window before committing → drawn from his established Origin background, not a listed mechanic, worth proposing to the table as a free flavor read

