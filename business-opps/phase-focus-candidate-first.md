# Phase Focus: Candidate First, Recruiter Side Later

## Decision
For this recruiting opportunity, **Phase One should focus on the candidate side**.

The recruiter / employer side is still strategically important, but it should be treated as **Phase Two**, not the starting point.

---

## Why This Is the Right Order

### 1. Candidate side is the cleaner starting wedge
The candidate-side workflow is easier to start with because it allows us to:
- build quickly around a real use case
- learn the workflow through actual operation
- avoid selling into teams too early
- keep the first system narrower and easier to control

This matches the current direction around:
- Randy Job Hunt Pipeline
- Job Hunt Assistant
- candidate-side recruiting coordination

### 2. Recruiter side is more crowded and operationally complex
The recruiter side already includes mature software categories such as:
- ATS platforms
- recruiting CRMs
- sourcing tools
- interview scheduling tools
- outreach automation
- pipeline analytics

That means the recruiter-side opportunity is real, but it is more crowded and likely better approached after the candidate-side workflow is clearer.

### 3. Candidate side produces better first-principles learning
Starting on the candidate side helps us learn:
- what information actually matters
- what pipeline movement looks like in practice
- where agentic assistance is useful
- where coordination breaks down
- which abstractions may later generalize to the recruiter side

This is valuable product learning for a future broader recruiting system.

---

## Phase Structure

### Phase One
**Candidate-side system**

Primary focus:
- Job Hunt Assistant
- Randy Job Hunt Pipeline
- candidate opportunity discovery
- application tracking
- follow-up coordination
- prioritization
- workflow movement

Goal:
Create a strong candidate-side recruiting operating system.

### Phase Two
**Recruiter / employer-side system**

Potential later focus:
- hiring ops assistant
- recruiting coordination system
- recruiter workflow support
- requisition and candidate pipeline hygiene
- employer-side posting and status workflows

Goal:
Expand into the employer/recruiter side after the candidate-side foundation is strong.

---

## Strategic Position
The big picture can still be thought of as a broader recruiting AI operating system.

But the correct sequence is:

1. **candidate-side first**
2. **recruiter-side second**

This keeps the starting wedge simpler and more learnable.

---

## Mobile Pairing Companion Note
When thinking about OpenClaw on mobile, the right model is **not** “fully install OpenClaw on the phone as the primary runtime.”

The better and more accurate structure is:
- **host machine / gateway** runs the main OpenClaw runtime
- **mobile device** acts as a **pairing companion** or paired node
- the phone provides mobile interaction, approvals, and device-side capabilities

### Why this matters
This matters because it shapes product design correctly.

The phone should be treated as:
- a companion interface
- a paired node
- an approval and notification surface
- a mobile input device for things like camera, voice, and location

Rather than as:
- the full unrestricted system host
- the sole runtime for the whole OpenClaw stack

### Why we should describe it this way
Using the “pairing companion” model is more accurate because OpenClaw’s official docs and CLI already frame mobile support around companion apps, pairing flows, and node/device capabilities.

That is a better mental model than saying “install OpenClaw fully on iPhone or Android.”

### Official OpenClaw sources
Relevant official documentation:
- iOS App: <https://docs.openclaw.ai/platforms/ios>
- Android App: <https://docs.openclaw.ai/platforms/android>
- Companion apps directory: <https://docs.openclaw.ai/start/docs-directory#companion-apps>
- Android device + personal data commands: <https://docs.openclaw.ai/nodes/index#android-device-+-personal-data-commands>

### Practical implication
For our strategic thinking, mobile should be treated as:
- **paired companion device first**
- **full local host second, if ever**

That framing is cleaner, more realistic, and better aligned with the OpenClaw platform design.

## Final Take
For now, the right move is to stay disciplined:
- keep the focus on the candidate side
- treat recruiter-side software as a later expansion
- use the candidate workflow to develop the strongest product abstractions first
- treat mobile support as a **pairing companion** model, not a full primary local install model

That is the clearest and most realistic Phase One path.
