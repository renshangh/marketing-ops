# OpenClaw Intro Deck

**Format:** Google Slides-ready content with visual design directions  
**Audience:** General technical audience  
**Style:** Clear, modern, technical, lightly cinematic  
**Aspect ratio:** 16:9  
**Theme recommendation:** Dark background, cool neutrals, cyan/blue accent

---

## Global visual system

### Color palette
- Background: `#0B1020`
- Surface: `#121A2B`
- Primary text: `#F3F7FF`
- Secondary text: `#A9B4C8`
- Accent blue: `#57B5FF`
- Accent cyan: `#5CE1E6`
- Accent purple: `#8B7CFF`
- Success green: `#58D68D`
- Warning amber: `#F5B041`

### Typography
- Title font: Inter SemiBold or Space Grotesk SemiBold
- Body font: Inter Regular
- Code font: JetBrains Mono

### Layout rules
- Keep 1 visual anchor per slide
- Max 4 bullets on most slides
- Use left text, right visual for explanatory slides
- Use full-bleed visual or gradient background for section-impact slides
- Prefer icons, diagrams, and screenshots over dense text

### Icon style
Use simple outline icons for:
- agents
- tools
- memory
- approvals
- sessions
- web/repo/file integrations

---

# Slide 1
## Title
OpenClaw

## Subtitle
An open agent runtime for real work

## Body
- Agents, tools, memory, and approvals in one workflow system
- Built for practical AI operations, not just chat demos
- Designed for technical users who want control and extensibility

## Visual design
- Full dark gradient background from `#0B1020` to `#121A2B`
- Large title on left
- On right, a simple network graphic showing:
  - user
  - runtime
  - tools
  - memory
  - channels
- Use glowing blue connector lines
- Add a small caption at bottom right: `Open runtime. Real workflows.`

## Presenter note
Frame OpenClaw as an operating layer for agents, not just an assistant UI.

---

# Slide 2
## Title
The problem OpenClaw solves

## Body
- Prompt-only assistants are useful, but fragile for real workflows
- Real tasks need tools, memory, sessions, retries, and approvals
- Teams need grounded outputs, traceable actions, and operational control
- OpenClaw bridges the gap between AI demos and AI systems that actually do work

## Visual design
- Left side: text
- Right side: comparison diagram
  - Column 1: `Prompt Demo`
  - Column 2: `Real Workflow`
- Under Prompt Demo: chat bubble, one-shot output
- Under Real Workflow: session, tools, memory, approval, artifact
- Use muted red/orange warning tint behind Prompt Demo
- Use blue/green confidence tint behind Real Workflow

## Presenter note
The runtime problem is often more important than the raw model problem.

---

# Slide 3
## Title
What OpenClaw is

## Body
- An open framework for running AI agents across tools and channels
- A runtime that manages sessions, actions, memory, and approvals
- A system for combining reasoning with execution
- A flexible base for building practical agent workflows

## Visual design
- Centered slide
- Big headline at top
- Below: 4 horizontal cards with icons
  - Open framework
  - Runtime control
  - Reasoning + execution
  - Workflow base
- Each card gets a subtle glow edge in cyan or blue

## Presenter note
Use this slide to define the category before comparing it to anything else.

---

# Slide 4
## Title
Core building blocks

## Body
- **Agents**: specialized roles and behaviors
- **Skills**: reusable workflows and domain knowledge
- **Tools**: shell, files, web, GitHub, media, and more
- **Memory**: continuity across sessions and tasks
- **Approvals**: human oversight for risky or external actions

## Visual design
- Create a hub-and-spoke diagram
- Center node: `OpenClaw Runtime`
- Spokes: Agents, Skills, Tools, Memory, Approvals
- Each spoke uses a different accent color
- Add minimalist icons for each concept

## Presenter note
This is the mental model slide. Keep it clean and memorable.

---

# Slide 5
## Title
How skills work

## Body
- Skills are loaded progressively instead of all at once
- Lightweight metadata helps route the task
- Full instructions are loaded only when relevant
- References, scripts, and assets are loaded on demand
- This makes the system modular, efficient, and specialized

## Visual design
- Use a 3-layer vertical diagram:
  - Layer 1: Metadata
  - Layer 2: SKILL.md
  - Layer 3: Scripts, references, assets
- Show arrows from user request to match to load to execute
- Use dark cards with highlighted edges
- Add small note in corner: `Progressive loading keeps context lean`

## Presenter note
This is one of the strongest technical architecture slides in the deck.

---

# Slide 6
## Title
OpenClaw architecture at a glance

## Body
- User request enters a session-based runtime
- The runtime matches the task to the right skills and tools
- Memory and workspace context ground the response
- Tools execute actions under policy and approval controls
- Outputs return as answers, drafts, or workflow results

## Visual design
- Layered architecture diagram
- Top row: User, Discord, CLI, Web
- Middle: OpenClaw runtime
- Next row: Skills, routing, memory, approvals
- Bottom row: Files, shell, web, GitHub, external systems
- Use clean boxes with arrows, minimal labels

## Presenter note
Emphasize both orchestration and harness responsibilities.

---

# Slide 7
## Title
Why OpenClaw is different

## Body
- More operationally flexible than a standard chatbot
- More open and customizable than many closed assistant products
- More workflow-aware than prompt-only wrappers
- Better suited for tasks that need approvals, persistence, and tool execution

## Visual design
- Split into 3 stacked comparison bands:
  - Chatbot
  - Agent wrapper
  - OpenClaw runtime
- Show maturity increasing from top to bottom
- Highlight OpenClaw row with brighter accent and subtle glow

## Presenter note
The point is runtime design and control, not just intelligence.

---

# Slide 8
## Title
OpenClaw vs other approaches

## Body
- **Typical chat assistant**: fast, simple, but limited operational depth
- **Managed agent platform**: powerful, but often opinionated and vendor-bound
- **OpenClaw**: open, flexible, tool-aware, and suited for custom workflows

## Visual design
- 3-column comparison table
- Columns: Chat assistant, Managed platform, OpenClaw
- Rows: Control, customization, deployment, approvals, memory, tooling
- Use checkmarks and short phrases instead of full sentences
- Make OpenClaw column visually dominant with blue accent border

## Presenter note
Position OpenClaw in the middle ground between shallow chat and heavyweight managed systems.

---

# Slide 9
## Title
Installing OpenClaw

## Body
- Install OpenClaw in your environment
- Start the runtime or gateway
- Configure workspace, skills, and tools
- Connect through supported interfaces
- Grant only the permissions you want the agent to use

## Footer snippet
`openclaw help`  
`openclaw status`  
`openclaw gateway start`

## Visual design
- Left side: body text
- Right side: terminal mockup with the three commands
- Add a setup flow above terminal:
  - Install
  - Configure
  - Start
  - Connect
- Use green success cursor glow in terminal

## Presenter note
Keep this slide high-level. Use appendix or live demo for the exact install flow.

---

# Slide 10
## Title
How you use OpenClaw day to day

## Body
- Ask grounded questions over local docs and knowledge
- Run tool-assisted tasks across files, web pages, and repos
- Route work to specialized agents
- Keep humans in the loop for reviews and approvals
- Continue multi-step work across sessions

## Visual design
- Timeline workflow from left to right:
  - Ask
  - Retrieve
  - Act
  - Review
  - Continue
- Show each stage as a rounded card with small icon
- Add a faint dotted line connecting the stages

## Presenter note
This is the usage pattern slide. Make it feel practical and repeatable.

---

# Slide 11
## Title
Use case: Obsidian knowledge workflow

## Body
- Connect OpenClaw to an Obsidian vault
- Search and synthesize notes across a private knowledge base
- Surface themes, gaps, and useful connections
- Pull in external references when needed
- Produce grounded summaries or next-step drafts

## Visual design
- Left side: 5 bullets
- Right side: mock workflow image
  - Obsidian notes
  - OpenClaw
  - synthesis output
- Add small floating labels: `private notes`, `retrieval`, `grounded output`
- If possible, include a real screenshot later

## Presenter note
This is a compelling demo because it combines local knowledge and synthesis.

---

# Slide 12
## Title
Use case: Red Lobster 3D or creative build workflow

## Body
- Break a complex request into manageable steps
- Use workspace files, tools, and agents to coordinate execution
- Track artifacts and outputs across the workflow
- Keep the user in the review loop
- Turn a vague idea into a concrete deliverable

## Visual design
- Show a production board style visual:
  - idea
  - planning
  - execution
  - artifacts
  - review
- Add thumbnail placeholders for files or renders
- Use purple-blue accent palette to differentiate from the Obsidian slide

## Presenter note
Focus on orchestration of work, not the novelty of the example itself.

---

# Slide 13
## Title
Where OpenClaw fits best

## Body
- Technical teams building internal AI workflows
- Research and synthesis workflows with local context
- Multi-step tasks that need memory and approvals
- Teams experimenting with agent systems before hardening them
- Environments where custom tools and control matter

## Visual design
- Use a quadrant chart
- Axes:
  - Low to high workflow complexity
  - Low to high control/customization need
- Plot:
  - Chat assistants
  - managed copilots
  - OpenClaw
- Put OpenClaw in top-right quadrant

## Presenter note
This helps the audience place the product correctly.

---

# Slide 14
## Title
Limitations and tradeoffs

## Body
- More setup than a plain SaaS assistant
- Best results require thoughtful skill and workflow design
- Some external platforms need dedicated integrations
- Flexibility creates more decisions for the builder

## Visual design
- Use 4 clean caution cards across the slide
- Each card has an icon and one short phrase
- Keep the tone matter-of-fact, not defensive
- Use amber accent instead of red to avoid sounding negative

## Presenter note
This increases credibility with technical audiences.

---

# Slide 15
## Title
Why technical teams should care

## Body
- It makes tools, sessions, and workflows first-class
- It supports grounded outputs and human oversight
- It moves beyond prompt demos into operational systems
- It provides a flexible foundation for real agent workflows

## Closing line
OpenClaw is not just another assistant. It is a practical runtime for getting AI systems to do real work.

## Visual design
- Full-bleed dark background with subtle mesh gradient
- Large centered closing statement
- Smaller supporting bullets beneath
- Add a final visual motif of connected nodes fading into the background

## Presenter note
End on the category definition: runtime, workflow, control, real work.

---

## Optional appendix slides

### Appendix A, More detailed install flow
- installation steps
- gateway lifecycle
- workspace structure
- skill loading basics

### Appendix B, Architecture deep dive
- control plane vs worker plane
- session manager
- tool registry
- approvals and runtime controls

### Appendix C, Product comparison
- OpenClaw vs Claude Code
- OpenClaw vs managed enterprise agent platforms
- OpenClaw vs chatbot-style assistants

### Appendix D, Demo screenshots
- terminal
- Discord or chat workflow
- Obsidian workflow
- approval checkpoint

---

## Build checklist for Google Slides
- Use a dark technical template
- Keep body text at 24 pt or larger
- Titles at 34 to 42 pt
- Use 1 visual anchor per slide
- Replace mock diagrams with clean shapes if needed
- Add screenshots only where they improve clarity
- Keep code snippets very short
- Maintain consistent icon style throughout
