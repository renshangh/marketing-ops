# Agentic AI System Design Diagram

## Purpose
Show where agents operate inside the recruiting AI operating system and how they interact with structured workflow state and human approvals.

---

## Agentic System Shape

```text
[Structured Recruiting Data]
          |
          v
[Workflow State Engine]
          |
          v
+-------------------------------+
|         Agentic Layer         |
|                               |
|  - Ingestion Agent            |
|  - Enrichment Agent           |
|  - Prioritization Agent       |
|  - Workflow Agent             |
|  - Drafting Agent             |
|  - Summary Agent              |
+-------------------------------+
          |
          v
[Human Approval / Review]
          |
          v
[User Action / Pipeline Update]
```

---

## Agent Roles

### Ingestion Agent
- collects and parses new data
- identifies duplicate or missing fields
- prepares structured records

### Enrichment Agent
- adds company and job context
- improves metadata quality
- flags likely-important opportunities

### Prioritization Agent
- scores opportunities
- ranks what needs attention first
- highlights high-value next actions

### Workflow Agent
- monitors stale items
- generates reminders
- creates next-step tasks
- detects process gaps

### Drafting Agent
- drafts follow-up messages
- suggests application or outreach text
- prepares summaries for review

### Summary Agent
- produces daily or weekly reviews
- condenses pipeline status
- highlights bottlenecks and changes

---

## Human Role
Humans should approve or review:
- final submissions
- outreach messages
- strategy changes
- exception handling
- sensitive workflow decisions

---

## Design Boundaries

### Agents may
- assist
- summarize
- prioritize
- draft
- monitor
- remind

### Agents may not
- become the source of truth
- silently change strategy
- bypass approval on sensitive actions
- obscure workflow state

---

## Design Principle
The agentic layer should amplify the workflow, not replace the system.

The system remains structured and auditable; agents help move it forward.
