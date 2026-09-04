---
title: Shen - Playbook
tags:
- reference
campaign: Rifted
secret: false
updated: 2026-09-04T17:16:40
created: 2026-09-04T17:16:40
---

# Shen - Playbook

*Companion to [[Shen]]—regenerated from the synced Character Sheet on 2026-09-04. Rerun `pc-playbook` after any `character-sheet-sync` update to keep it current.*

*No Loadout Selection section below: Warlock spells are fixed once known (2024 rules classify Warlock as `preparedSpellsChange: "level"`, meaning the list changes on level-up, not after a Long Rest), so there is no daily loadout to suggest.*

## Combat Decision Flowchart

**Triage first, before anything else:**
- **He has no healing at all.** If an ally drops, his answer is control or repositioning, never first aid. Don't look for a heal on this sheet.
- **AC 11, 35 HP.** Being reachable is his failure state.
- **About to be focused →** **Mirror Image** (Self, three illusory duplicates, 1 min, 2nd) or **Misty Step** (BA, 30 ft., 2nd)
- **Concentration is up and he's being hit →** CON save is only **+2**. Hex, Hunger of Hadar, Hold Person, Tasha's and Phantasmal Force are all Concentration.

**Action:**
- **Default →** **Eldritch Blast** (R +7, 120 ft., **2 beams**, each 1d10+4 force via Agonizing Blast, each hit pushes 10 ft. via Repelling Blast; each beam is a separate attack roll)
- **Enemies clustered →** **Hunger of Hadar** (DEX DC 15, 150 ft., 20-ft. sphere of magical darkness, cold and acid in the area, Conc., 3rd)
- **One dangerous creature must stop →** **Hold Person** (WIS DC 15, 60 ft., Paralyzed up to 1 min, repeat save, Conc.) or **Tasha's Hideous Laughter** (WIS DC 15, 30 ft., Prone and Incapacitated, repeat save, Conc.)
- **Want a real threat to die faster →** **Classify** ([[Unclassified Specimen]], 30 ft., observe 1 round): attacks against it then crit on **19–20 until the start of his second next turn**, relayed to every ally within 30 ft. free via Awakened Mind
- **Single target, want damage plus displacement →** **Dissonant Whispers** (WIS DC 15, 60 ft., 3d6 psychic; on a failure it must immediately flee using its Reaction, 1st)
- **Sustained pressure with no repeat save →** **Phantasmal Force** (INT DC 15, 60 ft., up to 2d8 psychic per turn, Conc., 2nd)
- **Cheap follow-up, save the slots →** **Chill Touch** (M +7, Touch, 2d10 necrotic, target can't regain HP until his next turn) or **Infestation** (CON DC 15, 30 ft., 2d6 poison, failed save also moves it 5 ft. randomly)
- **Talk instead of fight →** **Suggestion** (WIS DC 15, 30 ft., Conc., 2nd)
- **Everything is gone →** **Sickle** or **Dagger** *(both Nick)*, M +4, 1d4+1. At AC 11 this is a bad place to be.

**Bonus Action:**
- **Opening at range →** **Hex** (90 ft., +1d6 necrotic on every hit of his, disadvantage on one ability's checks, Conc., 1st), then Eldritch Blast into it
- **Needs out →** **Misty Step** (30 ft., 2nd)
- **Nick means his Bonus Action stays free.** Both Sickle and Dagger have the *Nick* mastery, so the light-weapon extra attack already folds into the Attack action — he never needs the Bonus Action for a second swing.

**Reaction:**
- **None at this level**, per the sheet. Nothing to decide; don't invent one.

**Movement (30 ft.):**
- **Hold range.** AC 11 even in Leather Armor, and no Reaction to fall back on, so distance is his only real defence. Chill Touch is the sole reason to ever be adjacent.
- **Misty Step doubles as pure repositioning** when he needs a sightline rather than an escape.
- **Alert** gives +5 initiative, means he cannot be surprised, and denies hidden creatures advantage against him.

**Psychic Spells changes what casting looks like:** he can swap **any damaging Warlock spell's damage type to Psychic**, and his Enchantment and Illusion Warlock spells (Tasha's, Hold Person, Suggestion, Phantasmal Force) can be cast **with no Verbal or Somatic components**. A silent, motionless Suggestion in a crowded room is a real option and easy to forget.

**Resource tiering, at a glance:**
- **At-will:** Eldritch Blast, Chill Touch, Infestation, Sickle / Dagger (Nick)
- **Pact Magic: 2 slots, both cast at 3rd level, recovering on a Short Rest** — not a long rest. This is the headline difference from every other caster in the party: his slots come back between fights.
- **Magical Cunning (1/LR):** a 1-minute rite that regains up to **half** his *expended* Pact slots, rounded up. A separate tool layered on top of short-rest recovery.
- **[[Unclassified Specimen]]: one shared pool of 2 uses per Long Rest**, spent on any combination of **Classify**, **Excavation**, **Speak with Dead** or **Strata**. Confirmed from the item's own note (Tier 2: "Active uses increase to 2/Long Rest," across all four) — the sheet's repeated `Pool 2/LR` tag on four separate rows does **not** mean 2 uses of each.
- **Passive, always on:** Deep Time (senses an object's approximate age on touch) and Ancient Repository (advantage on INT History and INT Arcana about ancient, extinct or undead subjects).

**Comparative Notes:**

- *Hold Person vs. Tasha's Hideous Laughter on one dangerous enemy.* Both WIS DC 15, both Concentration, both repeat-save locks. Tasha's is 30 ft. and adds Prone on top of Incapacitated. Hold Person reaches 60 ft., and **Paralyzed is the stronger condition** — attacks against a paralyzed creature have advantage, and any hit from within 5 ft. is an automatic critical *(condition text confirmed via a live 5etools lookup; it isn't on the sheet)*. **Hold Person at range or when a melee ally can follow up; Tasha's when the target is already close and he wants it out of the fight now.**
- *Classify vs. saving the pool for investigation.* Classify spends one of only two daily Specimen uses to buy a crit window against one creature, and that same pool is the only source of Excavation, Speak with Dead and Strata outside combat. **Spend it on something genuinely dangerous; with two uses covering four tools, it is very easy to burn the pool on convenience.**
- *Eldritch Blast vs. Chill Touch as the default cantrip.* Eldritch Blast is two attack rolls at 120 ft. with built-in push — still attack rolls, not automatic. Chill Touch only reaches Touch range but stops the target regaining hit points until his next turn. **Chill Touch specifically against something that heals itself or has a healer behind it; Eldritch Blast every other time.**
- *Hunger of Hadar vs. Hold Person, when both are available and slots are short.* Both cost a 3rd-level Pact slot (everything he casts does). Hunger of Hadar denies a 20-ft. area and damages everything in it without targeting anyone specifically; Hold Person removes exactly one creature but does nothing if it saves. **Count the threats first.** More than one, Hunger of Hadar; exactly one, Hold Person.

## Non-Combat & Creative Uses

- Anything ancient, extinct, or undead → **Ancient Repository** *(RAW: advantage on Intelligence (History) and Intelligence (Arcana) checks on those subjects)* on top of **Arcana +7**, **History +7**, **Investigation +7** and **Nature +7**. Research questions should route to him by default.
- Wants to know how old something is → **Deep Time** *(RAW: passive, senses the approximate age of any object or surface he touches — always on, never requested)*
- Needs to say something in a room where speaking would blow the cover → **Awakened Mind** *(RAW: telepathically speak to a creature he can see within 30 ft., no shared language needed; the sheet grants no telepathic reply back, so how the target answers is the table's call)*
- Needs to know what he is looking at before committing → **Classify** *(RAW: observe a creature 1 round at 30 ft.; learn its type, CR bracket, one immunity or resistance, and one behavioural fact, relayed free to allies within 30 ft.)*
- Needs to know what happened in a place → **Excavation** *(RAW: 1 minute in contact with a surface or object, three yes/no questions about events at that location, answered as marginalia in his notes)*, or **Strata** for a 6-second psychic flash of the site's most significant event *(RAW: **CON DC 13** or Stunned until the end of his next turn — it has a real cost)*
- Needs to question the dead → **Speak with Dead** *(RAW: touch, as the 3rd-level spell; part of the same 2/LR pool)*
- Scouting a room, route or building before anyone enters → **Clairvoyance** *(RAW: invisible sensor for sight or hearing up to **1 mile** away, up to 10 min, Conc., Pact slot, always prepared)*. Nothing else in the party reaches this far.
- Needs a scout that can act on its own → **his familiar** *(Pact of the Chain, RAW: imp, pseudodragon, quasit or sprite; the familiar can take its own action instead of his)*. **Find Familiar** is a Ritual so it costs no slot, but its casting time is **1 hour** *(confirmed via a live 5etools lookup)* — summon it before the scene, not during.
- Wants someone to leave, talk, or stand down without a fight → **Suggestion** *(RAW: a reasonable course of action for up to 8 hours, Pact slot)* — and via Psychic Spells he can cast it **with no Verbal or Somatic components**, which makes it usable in plain sight.
- Something is cursed → **Remove Curse** *(RAW: touch, ends one curse on a creature or object, Pact slot)*
- Needs to know whether someone is lying about what they're thinking right now → **Detect Thoughts** *(RAW: WIS DC 15, reads surface thoughts; a deeper probe allows a save, Conc., always prepared)*
- Navigation, timekeeping, or recalling exactly what was said → **Keen Mind** *(RAW: always knows north, always knows time elapsed, and perfectly recalls anything seen or heard recently)*
- Walking into somewhere that smells like an ambush → **Alert** *(RAW: +5 initiative, cannot be surprised, and hidden creatures gain no advantage on attacks against him)*
- Medical or field-triage questions, even without healing magic → **Medicine +6**, plus Herbalism proficiency and the herbalist society membership from Session 22
- *Possible DM-adjudicated stretch, not RAW* — using Keen Mind's perfect recall to catch a contradiction between what someone says now and what they said before → **Keen Mind** *(RAW printed trigger: perfect recall of what he has seen or heard; it grants nothing about detecting falsehood, so all he can do is set one account beside another and see where they diverge)*
- *Possible DM-adjudicated stretch, not RAW:* reading a room through Awakened Mind by opening a channel and gauging the reaction instead of sending words → **Awakened Mind** *(RAW printed trigger: one-way telepathic speech to a visible creature within 30 ft. The feature transmits; it does not receive.)*

