# Randy Job Hunt Pipeline Phased Build Plan

## Goal
Build Randy Job Hunt Pipeline as a candidate-side recruiting operating system that can later generalize into a broader recruiting AI operating platform.

The plan should move in stages:
- useful quickly
- structured enough to scale
- generalizable enough to inform a future company

---

## Phase 1 — Candidate Pipeline Core

### Objective
Create a working pipeline system for tracking opportunities, applications, status, and next actions.

### Core capabilities
- ingest job opportunities
- normalize and structure job/company records
- maintain an application pipeline
- track current stage and last action
- generate next-action queues
- flag stale items

### Why this phase matters
This creates the operating backbone.
Without this, everything else becomes scattered or assistant-like instead of system-like.

### Success criteria
- active opportunities are clearly organized
- applications have explicit stages
- stale items are visible
- the system reliably surfaces next actions

---

## Phase 2 — Agent Coordination Layer

### Objective
Add agents that reduce coordination burden across the candidate workflow.

### Capabilities to add
- enrichment agent for company and role context
- prioritization agent for ranking opportunities
- workflow agent for stale detection and task generation
- drafting agent for follow-ups and application support
- summary agent for pipeline reviews

### Why this phase matters
This is where the system becomes meaningfully agentic rather than just a tracker.

### Success criteria
- agents create useful summaries and next actions
- the candidate spends less manual effort on coordination
- the pipeline becomes more current and easier to manage

---

## Phase 3 — Generalizable Recruiting Ops Layer

### Objective
Extract reusable recruiting coordination patterns from the candidate-side workflow.

### What to generalize
- opportunity object schema
- company object schema
- application lifecycle model
- stale-state logic
- approval checkpoints
- notification/reminder patterns
- summary and review loops

### Why this phase matters
This is the bridge from one-user tool to broader recruiting product logic.

### Success criteria
- workflow stages feel reusable
- data model supports more than one user/use case
- system logic can be described without referencing Randy personally

---

## Phase 4 — Broader Recruiting Coordination Platform (Optional Expansion)

### Objective
Explore how the same abstractions might support:
- recruiters
- hiring managers
- recruiting coordinators
- employer-side job and status workflows

### Expansion directions
- company-side posting and updates
- recruiter pipeline coordination
- candidate communication workflows
- employer/recruiter collaboration logic

### Why this phase matters
It tests whether the candidate-side operating system can evolve into a broader recruiting coordination platform.

### Success criteria
- at least one abstraction clearly transfers to a wider recruiting workflow
- there is evidence of product logic beyond personal use

---

## Cross-Phase Rules

### Rule 1
Do not optimize for flashy AI features before workflow clarity exists.

### Rule 2
Use agents to improve coordination and visibility, not to hide the system state.

### Rule 3
Every phase should improve explicit workflow movement.

### Rule 4
Keep track of what is reusable versus what is user-specific.

### Rule 5
Treat Randy as the first instance, not the permanent boundary of the product.

---

## Best Order of Attack
If building immediately, the best sequence is:

1. **pipeline objects and stage tracking**
2. **stale-state and next-action logic**
3. **enrichment and prioritization agents**
4. **follow-up drafting and summary agents**
5. **abstraction extraction for broader recruiting ops**

This keeps the build grounded in workflow reality.

---

## Final Take
The phased plan should be:
- first make the candidate pipeline operational
- then add agent coordination
- then generalize the workflow abstractions
- then explore broader recruiting applications

That sequence keeps the system useful, learnable, and strategically expandable.
