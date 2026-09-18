---
title: Young Dragon Lair Effects
aliases: []
tags:
- house-rule
campaign: Rifted
introduced: 2026-09-17
secret: false
created: 2026-09-18T14:00:00
updated: 2026-09-18T13:14:07
---

# Young Dragon Lair Effects

## The Rule

RAW (5e 2024, confirmed against `query_5etools.py`): a dragon only carries true lair-tier presence—regional effects and a bonus legendary action while in its lair—at Adult tier and above. **Adult White Dragon** (CR 13, XMM) has `hasLegendary: true`, a 4th legendary action while in its lair (vs. 3 normally), and a 1-mile-radius regional-effects zone: **Frigid Cold** (the area is Extreme Cold, XDMG p.68—DC 10 Constitution save each hour or gain 1 Exhaustion level) and **Glacial Gloom** (lightly obscured by chilly fog; DC 15 Constitution save after finishing a Long Rest there, or Speed −10 ft for 1 hour). **Young White Dragon** (CR 6, XMM) has `hasLegendary: false`—no legendary actions, no regional effects, nothing, at that tier. [[Calcryx]] is a young white dragon, two full age categories below Adult.

This rule lets a sub-legendary dragon (CR 6–9, below the Adult lair threshold) that stays somewhere for an extended period begin generating a scaled-down version of that Adult-tier presence—starting small and expanding the longer it stays—rather than either "nothing at all" (RAW) or the full Adult effect (too strong for its tier).

**The ratio:** this dragon's own current CR ÷ its own Adult-tier CR (the real lair-effects threshold for its kind). For Calcryx: 6 ÷ 13 ≈ **0.46**. Applied to the Adult White Dragon's own 1-mile regional-effect radius, that fraction sets the cap her emergent effect can reach with unbroken residence: 1 mile × 6/13 ≈ **0.46 mile (~2,430 ft)**—never the full mile an Adult commands. For a different sub-legendary dragon, recompute the ratio against that species' own Adult-tier CR and regional-effect radius rather than reusing White Dragon's numbers wholesale.

**Growth curve**, tied to this vault's existing 10-day downtime block:

| Stage | Residence | Radius |
|---|---|---|
| 0 (arrival) | Day 1 | 30 ft—her own Cold Breath cone length, per her own stat block |
| 1 | After 1 block (~10 days) | 630 ft |
| 2 | After 2 blocks (~20 days) | 1,230 ft |
| 3 | After 3 blocks (~30 days) | 1,830 ft |
| 4 (cap) | After 4 blocks (~40 days) | 2,430 ft (~0.46 mile) |

Each step adds a fixed quarter of the distance between the starting scale (her own breath-weapon range—a single room or chamber) and the CR-ratio cap: (2,430 − 30) ÷ 4 ≈ 600 ft per completed block.

**Effects, at any stage:**
- **Reinforcing (non-damaging):** within the current radius, ice and frost knit into gaps and cracks in the terrain she occupies—structural, not harmful. This is the actual mechanism behind her Session 8 deal with [[The Understudies]]: her presence quietly reinforcing the Wall's structure.
- **Cold hazard (Ambient Effect, per [[Environment Actions]]):** within the current radius, a creature other than the dragon or her allies who remains a full hour must succeed on a DC 10 Constitution save (the real Extreme Cold hazard's own DC, XDMG p.68—not an invented fraction) or gain 1 level of Exhaustion. This already happened once at the table before the growth curve was ever formalized (see First Used).
- **At Stage 4 only:** add the lesser Glacial Gloom component too—chilly fog lightly obscures the current (much smaller) radius, DC 15 Constitution save after a Long Rest taken inside it or Speed −10 ft for 1 hour. Never the Adult's full-mile version.

If the dragon dies or leaves the area, every effect ends immediately—mirroring the official regional-effects closing line for a true lair.

## Why This Works

The CR gap between a young dragon and its own Adult tier is exactly the gap 5e itself draws between "no lair presence" and "full lair presence." Using that same ratio to shrink the Adult's own published numbers keeps the scaled-down version anchored to real data instead of a number picked by feel—same grounding method as [[Mounted Travel Pace]]'s speed-stat multiplier. Starting the radius at the dragon's own breath-weapon range (rather than an arbitrary "10 ft") does the same thing at the small end: the first thing a young dragon's presence should measurably touch is the space it can already reach unaided.

## How It Works

Track residence as a running downtime-block count for that location; look up the current stage's radius from the table above. Don't advance the stage if the dragon leaves for an extended stretch mid-block—DM judgment on what counts as "unbroken." This extends [[Environment Actions]]'s Ambient Effects category rather than replacing it: no initiative-count-20 Lair Action exists here, only always-on ambient conditions, matching RAW's own distinction between a young dragon's total lack of one and an Adult's full package of both.

> *What does the slow cold at the edge of the room do to the people who've decided to live near it anyway?*

## First Used

[[Calcryx]], Session 8 (The Understudies)—a fresh Wall breach in [[Stormberg]], negotiated as a deal rather than fought. An involuntary cold sigh during that first encounter cost the party a shared level of Exhaustion, which this rule now formalizes as Stage 0's cold hazard rather than a one-off breath effect.
