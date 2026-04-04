# Recruiting Overall Design Diagram

## Purpose
Show the overall structure of the recruiting AI operating system at a design level.

---

## System Shape

```text
[Data Sources]
     |
     v
[Ingestion + Normalization]
     |
     v
[Structured Recruiting Objects]
     |
     v
[Workflow State Engine]
     |
     +----------------------+
     |                      |
     v                      v
[Agent Coordination]    [Human Review / Approval]
     |                      |
     +----------+-----------+
                |
                v
        [User Pipeline / Dashboard]
                |
                v
       [Actions, Follow-up, Archive]
```

---

## Main Components

### Data Sources
Inputs from public and manual sources.

### Ingestion + Normalization
Turns messy source data into clean records.

### Structured Recruiting Objects
Represents jobs, companies, candidates, applications, contacts, and tasks.

### Workflow State Engine
Maintains process stage and next-step logic.

### Agent Coordination
Generates insights, summaries, reminders, drafting support, and prioritization.

### Human Review / Approval
Handles decisions that should not be automated fully.

### User Pipeline / Dashboard
Lets the user see the current state of the recruiting process.

### Actions, Follow-up, Archive
Represents the active operating loop of the system.

---

## Design Principles
- visible state over hidden automation
- structured objects over freeform notes
- human approval over unsafe autonomy
- workflow movement over static storage

---

## Key Design Goal
The system should feel like an operating environment, not a list of jobs.
