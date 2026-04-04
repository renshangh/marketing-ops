# Sequential Data Diagram

## Purpose
Show how data moves through the recruiting AI operating system from raw input to action.

---

## Sequential Flow

```text
1. Raw job/company data arrives
   -> from public sources, postings, manual input, or recruiter/company sync

2. Ingestion layer captures the data
   -> stores the raw record and source metadata

3. Normalization layer cleans and structures it
   -> deduplicates, standardizes fields, and extracts useful attributes

4. Enrichment layer adds context
   -> company signals, job freshness, role notes, fit indicators

5. Workflow engine assigns state
   -> intake, qualified, applied, follow-up, interview, closed

6. Prioritization logic scores the item
   -> based on fit, urgency, freshness, and user intent

7. Agent layer generates support output
   -> summaries, reminders, drafts, suggested next actions

8. Human review occurs where needed
   -> approve, edit, reject, or redirect

9. User action is taken
   -> apply, follow up, archive, change status, or queue another task

10. State updates are recorded
   -> history, timestamps, outcomes, and next-step logic are saved
```

---

## Important Data Transformations

### Raw to Structured
Turns messy source content into usable objects.

### Structured to Stateful
Attaches lifecycle stage and process status.

### Stateful to Actionable
Generates next steps and coordination tasks.

### Actionable to Recorded
Logs what happened so the pipeline remains current.

---

## Design Rule
Every transformation should improve clarity and actionability.

If a transformation does not help the workflow move forward, it is probably unnecessary.
