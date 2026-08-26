---
title: Shen - Playbook
tags:
- reference
campaign: Rifted
secret: false
updated: 2026-08-24T21:50:37
created: 2026-08-24T20:34:24
---

# Shen - Playbook

*Companion to [[Shen]] — regenerated from the synced Character Sheet on 2026-08-24. Rerun `pc-playbook` after any `character-sheet-sync` update to keep it current.*

*No Loadout Selection section below — Warlock spells are fixed once known (2024 rules classify Warlock as `preparedSpellsChange: "level"`, meaning spells only change on level-up, not after every long rest), so there's no daily loadout to suggest.*

## Combat Decision Flowchart

**Triage first:** Shen has no healing on his kit at all — if an ally goes down, the honest answer is he can't fix it directly. His best contribution in a crisis is control (lock the threat down) or repositioning (Misty Step to reach/retreat), not first aid.

**Action:**
- Default, no reason to spend anything else → **Eldritch Blast** (R +7, 120 ft, 2 beams each 1d10+4 force via Agonizing Blast, each beam pushes 10 ft via Repelling Blast) — free, no slot, his bread and butter
- Dangerous single target, worth burning a resource up front → **Classify** (30 ft, 1 round to observe, then attacks against that target crit on 19–20 until the start of Shen's second-next turn; relayed to allies within 30 ft via Awakened Mind for free) — spends one of the shared 2/LR Unclassified Specimen uses (see Resource tiering below); the item's own notes call this the actual combat payoff of that pool, not just an info-gathering tool, so it's worth spending on a real threat rather than saving it purely for exploration
- One dangerous enemy needs to be taken out of the fight → **Tasha's Hideous Laughter** (WIS DC 15, 30 ft, Prone + Incapacitated up to 1 min, repeat save, Conc., always prepared) or **Hold Person** (WIS DC 15, 60 ft, Paralyzed up to 1 min, repeat save, Conc.)
- Multiple enemies clustered → **Hunger of Hadar** (DEX DC 15, 150 ft, 20 ft sphere of magical darkness, cold + acid damage in the area, Conc., always prepared) — area denial, not just damage
- Need Shen himself to survive a bad exchange → **Mirror Image** (Self, three illusory duplicates defend him for 1 min)
- Cheap follow-up, save the Pact slots → **Chill Touch** (M +7, Touch, 2d10 necrotic; target can't regain HP until Shen's next turn) or **Infestation** (CON DC 15, 30 ft, 2d6 poison, failed save also moves the target 5 ft randomly) — both cantrips, free
- Want information before committing → **Detect Thoughts** (WIS DC 15, Self, Conc., always prepared) or **Phantasmal Force** (INT DC 15, 60 ft, ongoing 2d8 psychic per turn, Conc., always prepared) for sustained pressure without repeat-save risk
- Single target, want damage plus forced repositioning → **Dissonant Whispers** (WIS DC 15, 60 ft, 3d6 psychic; on a failed save the target must immediately move using its Reaction, always prepared) — a good opener to knock a target out of position before Shen commits further
- Everything above is gone or off the table → weapon attack with **Sickle** or **Dagger** (M +4, 5 ft, 1d4+1, both Nick — the light-weapon extra attack folds into the same Action) or thrown **Dagger** (R +4, 20/60 ft, 1d4+1) — rarely the right call at AC 11, but real if it happens

**Bonus Action** (independent of the above):
- Opening a fight at range → **Hex** (90 ft, Conc., +1d6 necrotic per hit, disadvantage on one of the target's ability checks) — curse first, then Eldritch Blast into it
- Need out, now → **Misty Step** (Self, teleport up to 30 ft to a visible unoccupied space)
- **Note:** Sickle/Dagger both have the *Nick* mastery property, so the light-weapon extra attack already folds into the Attack action once per turn — Shen doesn't need his Bonus Action for a second weapon swing, which is exactly what frees it up for Hex or Misty Step instead.
- **Psychic Spells** lets any damaging Warlock spell's damage type be swapped to Psychic, and lets his Enchantment/Illusion Warlock spells (Tasha's Hideous Laughter, Hold Person, Suggestion, Phantasmal Force) be cast with no Verbal or Somatic components — worth remembering when a fight calls for a silent, still cast rather than an obvious one.

**Reaction:** None at this level (per the sheet) — nothing to branch here, don't invent one.

**Movement:**
- AC 11 with no reason to be in melee — hold at range for Eldritch Blast/Hunger of Hadar whenever the fight allows it (Chill Touch is the one melee-range exception, per its Touch range)
- Misty Step doubles as pure repositioning (teleport up to 30 ft to a visible unoccupied space) when Shen needs to reach a sightline or bail out of a bad spot

**Resource tiering, at a glance:**
- **At-will:** Eldritch Blast, Chill Touch, Infestation (cantrips), Sickle/Dagger (Nick)
- **Pact Magic — 2 slots, both cast at 3rd level, recover on a Short Rest** (not a long rest — this is the headline difference from a long-rest caster). Covers Hold Person, Mirror Image, Suggestion, Misty Step, Remove Curse, plus the always-prepared spells when a slot is spent on them.
- **Magical Cunning (1/LR):** a separate 1-minute rite that regains up to half (round up) of Shen's *expended* Pact Magic slots — not a spell itself, a slot-refresh tool layered on top of the short-rest recovery.
- **Unclassified Specimen investigative pool — one shared pool of 2 uses/LR**, spent on any combination of Classify, Excavation, Speak with Dead, or Strata. Confirmed via the item's own note (`[[Unclassified Specimen]]`, Tier 2/current: "Active uses increase to 2/Long Rest," shared across all four options — not 2 uses of each; the sheet's repeated `Pool 2/LR` tag alone doesn't say this on its own, the item note is the actual source). Mostly non-combat, but Classify also has a combat payoff: attack rolls against the observed creature score a critical hit on 19–20 until the start of Shen's second-next turn.

**Comparative Notes:**
- *Classify vs. saving the pool for non-combat:* Classify spends one of the shared 2/LR Unclassified Specimen uses for a combat crit-window; the same pool also covers Excavation/Speak with Dead/Strata for investigation outside a fight. Spend it in combat only against a real threat worth the crit window — with just 2 uses shared across four different tools, it's easy to burn the pool on convenience instead.
- *Tasha's Hideous Laughter vs. Hold Person, single dangerous enemy:* both are WIS DC 15, concentration, repeat-save locks. Tasha's is shorter range (30 ft) but adds Prone on top of Incapacitated; Hold Person reaches further (60 ft) and Paralyzed is the stronger denial (per the Paralyzed condition, confirmed live via 5etools: attack rolls against a paralyzed creature have advantage, and any hit is an automatic critical hit if the attacker is within 5 ft). Reach for Hold Person at range or when a martial ally can follow up in melee; reach for Tasha's when the target's already close.
- *Eldritch Blast vs. Chill Touch as the default cantrip:* Eldritch Blast is a 120 ft ranged spell attack with push utility built in (still an attack roll, not automatic); Chill Touch only reaches Touch range but denies the target healing until Shen's next turn. Reach for Chill Touch specifically against a target that heals itself or has a healer nearby; otherwise Eldritch Blast's range and push make it the default.

## Non-Combat & Creative Uses

- Need reliable navigation or alibi-checking → **Keen Mind** *(RAW: always knows north, always knows elapsed time, perfect recall of anything recently seen/heard)*
- *Possible DM-adjudicated stretch, not RAW* — that same perfect recall could let Shen compare a claim against his own memory and catch an inconsistency, even though the feature itself doesn't grant lie detection → **Keen Mind** *(RAW printed trigger: perfect recall of anything recently seen/heard, nothing about detecting falsehoods)*
- Need to send covert instructions or questions in a room where talking out loud would blow a cover → **Awakened Mind** *(RAW: telepathically speak to a visible creature within 30 ft, no shared language needed — the sheet doesn't grant a telepathic reply back from the target, so any answer comes however the table decides the target responds)*
- Need pure reconnaissance before ever engaging → **Classify** *(RAW: observe a creature for 1 round, 30 ft; learn its type/CR bracket/one immunity or resistance/one behavioral fact; relayed via Awakened Mind for free)*
- Want a full alternative to a fight — get a person to leave, talk, or stand down → **Suggestion** *(RAW: target follows a reasonable course of action for up to 8 hours, Pact slot)*
- Need long-range scouting without putting anyone at risk, before the party commits to a room or route → **Clairvoyance** *(RAW: invisible sensor for sight or hearing up to 1 mile away, lasting up to 10 min, Pact slot, always prepared)*
- Need to investigate "what happened here" at a specific location → **Excavation** *(RAW: 1-minute touch, ask the patron 3 yes/no questions about events at a location, answers appear as marginalia in Shen's notes)*
- Need expertise reading ancient, extinct, or undead subjects → **Deep Time / Ancient Repository** *(RAW: passive — senses an object's approximate age on touch; advantage on Intelligence (History) and Intelligence (Arcana) checks about ancient/extinct/undead subjects)* — pairs naturally with his Scribe background and Investigation/History/Arcana proficiencies (all +7)
- *Possible DM-adjudicated use* — scouting ahead, delivering a message, or slipping into a space Shen can't fit, leaning on whichever form's specific senses/abilities the table agrees fits the moment → **Shen's familiar (Pact of the Chain)** *(RAW printed trigger: imp, pseudodragon, quasit, or sprite form; the familiar can take its own action instead of yours; (re)summoned via **Find Familiar**, cast as a Ritual — no slot needed, but Find Familiar's own casting time is 1 hour per its full spell text, confirmed live via 5etools, so it's worth doing ahead of time rather than mid-scene)*
- Something the party picked up or got hit with turns out to be cursed → **Remove Curse** *(RAW: touch, end one curse affecting a creature or object, Pact slot)* — the party's actual answer, not just a combat spell sitting unused
- Need direct interrogation of a body instead of Excavation's location-based questions → **Speak with Dead** *(RAW: touch, as the 3rd-level spell — question a corpse, voice sounds older than the individual, one of the Unclassified Specimen's shared 2/LR pool)*
- History or mystery-solving at a specific spot, at the real cost of a save Shen might fail → **Strata** *(RAW: touch an object/surface for a 6-second psychic flash of the site's most significant event; DC 13 CON save or Stunned until end of next turn — also part of the shared 2/LR pool)*
- Party's about to walk into a spot that smells like an ambush → **Alert (feat)** *(RAW: +5 initiative, can't be surprised, hidden attackers get no advantage against him)*

