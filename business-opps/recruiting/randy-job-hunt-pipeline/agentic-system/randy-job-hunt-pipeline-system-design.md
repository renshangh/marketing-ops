# Randy Job Hunt Pipeline System Design

## Purpose
Design Randy Job Hunt Pipeline as a candidate-side recruiting operating system that can later generalize into broader recruiting coordination infrastructure.

The goal is not to create random features. The goal is to define:
- core entities
- workflow stages
- agents
- approvals
- metrics
- operational logic

---

## 1. Core Entities

### Candidate
Represents the job seeker using the system.

Fields may include:
- profile
- target roles
- preferred locations
- compensation preferences
- constraints
- resume variants
- outreach preferences

### Company
Represents a hiring organization.

Fields may include:
- company name
- industry
- size
- location
- funding / maturity
- hiring activity signals
- notes
- priority score

### Job Opportunity
Represents a specific role or opportunity.

Fields may include:
- title
- company
- location
- source
- posted date
- compensation if known
- remote/hybrid/on-site
- role requirements
- freshness state
- fit score
- interest score

### Application
Represents the candidate’s progression on a role.

Fields may include:
- linked opportunity
- current stage
- application date
- documents used
- contact points
- follow-up status
- last action date
- next action
- risk/blocker notes

### Contact
Represents recruiter, hiring manager, or internal referral contacts.

Fields may include:
- name
- role
- company
- relationship type
- channel
- contact status
- notes

### Action / Task
Represents a pending workflow step.

Fields may include:
- action type
- related entity
- due date
- owner
- status
- priority
- generated-by-human-or-agent

### Document Packet
Represents materials used in the process.

Fields may include:
- resume version
- cover letter version
- portfolio links
- notes
- tailoring status

---

## 2. Workflow Stages

### Stage A — Intake
- ingest job opportunities
- capture company signals
- deduplicate and normalize data

### Stage B — Qualification
- evaluate fit
- score opportunity relevance
- identify missing information
- decide whether to pursue

### Stage C — Preparation
- select documents
- tailor materials
- prepare outreach or application packet

### Stage D — Submission / Outreach
- apply
- send message
- request referral
- record submission state

### Stage E — Follow-Up
- detect silence or stale state
- trigger reminders
- suggest next action
- draft follow-up communication

### Stage F — Interview / Progress Tracking
- track stage movement
- collect notes
- maintain decision visibility
- update risks and blockers

### Stage G — Close / Archive
- rejection
- withdrawal
- offer
- archived opportunity
- learnings captured

---

## 3. Agents

### Ingestion Agent
Responsible for:
- collecting job data
- parsing and normalizing fields
- deduplicating listings
- flagging freshness changes

### Enrichment Agent
Responsible for:
- company research
- role clarification
- signal enhancement
- filling missing metadata where possible

### Prioritization Agent
Responsible for:
- ranking opportunities
- scoring fit and urgency
- surfacing highest-value next opportunities

### Workflow Agent
Responsible for:
- monitoring application state
- identifying stale items
- recommending next actions
- creating coordination tasks

### Drafting Agent
Responsible for:
- drafting follow-up messages
- summarizing opportunities
- preparing application packet suggestions

### Summary Agent
Responsible for:
- daily/weekly status summaries
- pipeline reviews
- highlighting blockers and drift

---

## 4. Human Approvals and Controls
Even in an agentic workflow, some actions should be human-approved.

### Human approval candidates
- final application submission
- outbound outreach to contacts
- resume/cover-letter finalization
- changes to target role strategy
- withdrawal or decline actions

### Why this matters
This keeps the system useful even when autonomy is imperfect.
It also produces cleaner trust boundaries.

---

## 5. Metrics

### Pipeline Health Metrics
- number of active opportunities
- freshness of tracked opportunities
- stale application count
- average time since last action
- number of next actions queued

### Performance Metrics
- application volume
- response rate
- interview conversion rate
- follow-up completion rate
- role-to-application quality ratio

### Operational Metrics
- agent-generated tasks completed
- time saved via automation
- number of stale-state recoveries
- data completeness and quality

---

## 6. Generalizable Abstractions
To avoid building a one-off personal tool, extract reusable patterns such as:
- opportunity lifecycle
- application stage model
- stale-state detection
- action queue logic
- enrichment workflow
- follow-up timing rules
- human approval points
- summary and review routines

These abstractions are what can later generalize into broader recruiting coordination software.

---

## 7. Design Principles

### Principle 1
Objects should be reusable, not hard-coded around one user.

### Principle 2
Agents should support coordination, not create uncontrolled automation.

### Principle 3
Every stage should produce visible status and next actions.

### Principle 4
The system should optimize for clarity and movement, not just data collection.

### Principle 5
Human review should exist at high-risk action points.

---

## Final Take
Randy Job Hunt Pipeline should be built like a real candidate-side operating system:
- structured objects
- explicit stage logic
- agent support roles
- approval boundaries
- measurable workflow health

That makes it useful now and strategically relevant later.
