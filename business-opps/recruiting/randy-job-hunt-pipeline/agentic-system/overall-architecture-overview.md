# Recruiting Overall Architecture Overview

## Purpose
Describe the major layers of the recruiting AI operating system and how they fit together at a high level.

---

## Layer 1 — Input Sources
The system may ingest information from:
- public job boards
- company websites
- direct employer postings
- recruiter inputs
- candidate-side tracking data
- manual notes and updates

These sources create the raw opportunity and workflow data.

---

## Layer 2 — Data Normalization Layer
Raw data is transformed into structured objects such as:
- companies
- jobs
- candidates
- applications
- contacts
- tasks
- documents

This layer handles:
- deduplication
- field normalization
- freshness tracking
- metadata enrichment

---

## Layer 3 — Workflow State Layer
This layer tracks where each entity is in the process.

Examples:
- opportunity intake
- qualification
- application submitted
- follow-up pending
- interview stage
- closed / archived

It is the operational state machine for the recruiting process.

---

## Layer 4 — Agent Coordination Layer
Agents operate on top of structured data and workflow state.

Examples:
- enrichment agent
- prioritization agent
- workflow agent
- drafting agent
- summary agent

These agents help reduce manual coordination burden.

---

## Layer 5 — Human Control Layer
Humans remain in control of critical decisions.

Examples:
- final application submission
- outbound outreach approval
- strategy changes
- high-risk follow-up decisions

This layer keeps the system bounded and trustworthy.

---

## Layer 6 — User Interaction Layer
The user experiences the system through:
- pipeline views
- task queues
- alerts
- summaries
- edit and approve actions
- status dashboards

This is where the system becomes practical and visible.

---

## Architecture Principle
The architecture should follow this sequence:

**Data in -> normalize -> track state -> agent assist -> human approve -> user act**

---

## Design Rule
Do not let agents become the source of truth.
Structured data and workflow state must remain authoritative.
