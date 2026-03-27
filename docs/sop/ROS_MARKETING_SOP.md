# ROS_MARKETING_SOP.md

## Purpose
Define the Randy Operating System marketing workflow so drafting, approval, queue management, and posting remain reliable and non-disruptive.

This SOP separates **production posting** from **draft generation**.

---

## Core Rule
- **GitHub is the drafting lane** for batch content development, deeper topic packets, and background ideation.
- **The approved queue is the production lane** for daily posting.
- **Social does not publish directly.**
- **Mark owns strategy, review, queue management, and posting operations.**

---

## Operating Model
The correct model is:
- Randy + Aether = decision loop
- Mark = strategist, editor, queue manager, posting operator
- Social = draft-production lane only
- GitHub = batch drafting workflow, not the live posting loop

This prevents:
- broken cadence
- mixed sources of truth
- accidental posting from draft material
- operational interruptions during daily publishing

---

## Lane A — Production Lane
### Source of Truth
- `x-content-queue.md`
- `memory/x-posting-state.json`

### Purpose
This lane runs the live daily posting loop.
Only approved content belongs here.

### Production Rule
Daily posting should stay simple:
1. check queue
2. post next approved item
3. log the result
4. move on

### Production Guardrail
- No unreviewed Social output should be posted directly.
- No GitHub draft should enter production automatically.
- Only approved queue items may be published.

---

## Lane B — Drafting Lane
### Source of Truth
- GitHub issues
- draft packets
- topic-development notes

### Purpose
This lane is for deeper topic development, background content generation, and packet drafting.

### Drafting Rule
- Social produces long-form or deeper draft packets in GitHub.
- Mark reviews, compresses, improves, and converts the strongest ideas into posting-ready assets.
- Aether and Randy approve direction when needed.
- Only then is content moved into `x-content-queue.md`.

### Drafting Guardrail
GitHub should **not** become the daily posting loop.
GitHub is for content development, not live publication execution.

---

## Roles and Responsibilities

### Mark
Mark owns:
- strategy
- messaging direction
- editorial judgment
- queue management
- posting operations
- deciding what becomes production-ready

Mark is the final operational owner of the live posting cadence.

### Social
Social owns:
- deeper post concepts
- batch draft packets
- social content ideation
- outbound support drafts
- topic development in GitHub

Social is a **draft-production lane**, not a live publishing operator.

### Aether
Aether owns:
- workflow structure
- issue creation and coordination when needed
- approval routing
- making sure production and drafting lanes stay separate

### Randy
Randy owns:
- final directional judgment when needed
- strategic approval of major content direction

---

## Approval Model
### Content must pass this chain before production
1. Social drafts in GitHub (if applicable)
2. Mark reviews and edits
3. Aether/Randy approve when needed
4. Mark moves the approved content into `x-content-queue.md`
5. Production posting proceeds from the queue only

---

## Daily Posting Loop
The live posting loop should remain operationally lightweight.

### Daily operator
- Mark

### Daily source of truth
- `x-content-queue.md`
- `memory/x-posting-state.json`

### Daily rule
- Do not stop the posting loop just because GitHub drafting is active.
- Do not insert draft packets directly into production.
- Keep cadence stable.

---

## Batch Drafting Loop
GitHub should be used for:
- deeper topic development
- concept exploration
- packet drafting
- long-form support material
- background queue feeding

This loop should improve quality without interrupting cadence.

---

## What Must Never Happen
- Social output must not auto-post.
- GitHub must not become the live queue.
- Draft material must not bypass Mark review.
- Production cadence must not depend on draft completion.

---

## Success Condition
This model is working when:
- daily posting continues smoothly
- draft generation happens in the background
- approvals stay clear
- queue remains the production source of truth
- GitHub improves depth without disrupting reliability

---

## One-Line Operating Rule
**GitHub is the drafting lane. The queue is the production lane. Social drafts. Mark approves and posts.**
