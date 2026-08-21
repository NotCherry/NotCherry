# Dawid — Personal Page & Portfolio Design Reference

## Status

- Version: 1.0
- Direction: locked
- First implementation target: one-page narrative portfolio
- Framework direction: Astro page shell with React islands

## Product Intent

Build personal site for Dawid: Computer Science student in Poland and software builder interested in robotics education, reinforcement learning, automation, backend systems, and practical infrastructure.

Site should tell an honest learning-in-public story. It must not turn unfinished experiments or short professional assignments into inflated case studies.

Site must make three things clear within first screen:

1. Who Dawid is.
2. What kind of systems he builds and supports.
3. Where to follow his current learning direction or contact him.

Portfolio should feel like an engineer's field notebook made intentional—not generic startup marketing, developer template, or résumé dump.

## Audience

- Engineering recruiters and hiring managers
- Software developers and technical peers
- People interested in manufacturing software, backend systems, and practical automation

## Design Direction

### Industrial editorial

Visual language combines:

- Industrial precision: grids, labels, coordinates, system-like metadata
- Editorial confidence: large statements, unusual composition, deliberate whitespace
- Human presence: first-person writing, specific work context, visible learning path

Avoid:

- Generic blue SaaS gradients
- Stock photography
- Excessive terminal decoration
- Dashboard-like card grids everywhere
- Decorative animation with no information value

## Visual System

### Color tokens

Use dark-first palette:

| Token | Value | Use |
|---|---|---|
| `ink` | `#171717` | Main page background |
| `graphite` | `#222222` | Cards, panels, secondary surfaces |
| `steel` | `#383838` | Borders, muted structural lines |
| `warm-white` | `#F2EEE6` | Primary text and display type |
| `ash` | `#B9B4AA` | Secondary text and metadata |
| `signal-amber` | `#F2A900` | Links, active states, key markers |
| `amber-dark` | `#A96F00` | Hover-safe amber on light surfaces |

Rules:

- Amber is signal, not fill. Reserve it for interaction, status, and emphasis.
- Maintain readable contrast for all body text and controls.
- Do not use color as the only indicator of state.
- Light sections are allowed only as intentional editorial breaks, using `warm-white` background and `ink` text.

### Typography

Typography uses serif display type paired with sans-serif utility and body type.

- Display: expressive serif with strong italics or distinctive letterforms
- Body: neutral, highly readable sans-serif
- Metadata: sans-serif with uppercase labels and increased tracking
- Code/technical values: monospace fallback or dedicated mono face

Hierarchy:

1. Hero statement: oversized serif, tight leading, short line count
2. Section title: serif, medium-large, often paired with numeric label
3. Body copy: sans-serif, comfortable measure, plain language
4. Metadata: sans-serif, compact uppercase label
5. Technical values: monospace, used sparingly

Typography must remain readable without relying on animation or hover.

### Grid and spacing

Use asymmetric grid with stable alignment anchors.

- Desktop: 12-column grid
- Tablet: 8-column grid
- Mobile: 4-column grid
- Page gutters: generous desktop gutters, reduced but consistent mobile gutters
- Base spacing unit: 4px or 8px scale
- Use large vertical gaps between narrative sections
- Align labels, headings, and project metadata to shared grid lines

Composition should feel offset but never chaotic. Every unusual block needs a clear alignment relationship.

### Geometry and texture

Use abstract geometry as supporting material:

- Thin grid lines
- Angular frames
- Connected nodes
- Offset rectangles
- Coordinate marks
- Small system labels

Geometry should suggest data flow and system boundaries without pretending to depict real confidential ZF systems.

Do not expose confidential employer data, diagrams, names, screenshots, or production details.

## Information Architecture

One-page narrative order:

1. **Hero** — identity, focus, location, primary action
2. **Current direction** — robot-learning education idea and honest status
3. **Learning threads** — Unitree G1 exploration and systems background
4. **Evidence-linked skills** — capabilities attached to known threads
5. **About** — study, interests, and current learning path
6. **Contact** — LinkedIn and concise closing statement

Navigation should use anchor links with a persistent but compact header. Mobile navigation must remain obvious and keyboard accessible.

## Content Model

### Person

- Name: Dawid
- Role: C# developer at ZF
- Education: Computer Science student
- Location: Poland
- Interests: software development, robotics education, reinforcement learning, automation, backend systems, and infrastructure
- Current direction: educational tools for learning with URDF robots, starting from the Unitree G1 and later moving toward lower-resource robot training
- Contact: LinkedIn — `https://linkedin.com/in/notcherry`

### Content distinctions

Use precise labels instead of calling every technical activity a project:

- **Project** — public artifact or demonstrable result that can support a case study.
- **Learning thread** — ongoing exploration, unfinished attempt, or idea with honest limits.
- **Professional background** — work context that informs Dawid's skills but is not presented as a public case study.

Each published project needs:

- Title
- Short plain-language summary
- Role or relationship to work
- Relevant technologies
- Context label: personal, academic, or professional
- Public-safe outcome, artifact, or current status
- Optional link or case-study expansion

Do not invent metrics, client names, dates, responsibilities, project completion, or outcomes. Missing detail stays explicitly omitted until supplied.

Current narrative candidates:

- **Robot learning education** — current idea for a simple educational site where students and less experienced learners can perform imaginative tasks with URDF robots; later direction may become a more sophisticated, resource-efficient robot-training tool.
- **Unitree G1 / MuJoCo / skrl exploration** — private reinforcement-learning work and a difficult attempt to make a humanoid robot stand or walk. Treat as a learning thread until public artifacts exist.
- **Early e-learning platform** — an early-stage pre-COVID idea using React and JavaScript/TypeScript. Mention only as formative history unless concrete evidence is supplied.
- **Infrastructure and systems background** — Linux and Windows use, game-server hosting, bots, terminal tools, Vim, Docker, and early Kubernetes exposure. Use as background signals, not as fake project case studies.

Current ZF work is intentionally excluded from the first public version. It may inform tone and technical maturity privately, but must not appear as a featured project or experience section without a later explicit decision.

### Skill group

Do not publish a broad résumé keyword wall in first version. Attach a small set of capabilities to honest narrative items:

- Robot-learning thread: Python, MuJoCo, skrl, URDF
- Software background: C#, .NET, TypeScript, React, Angular
- Systems background: Linux, Windows, terminal tools, Docker, early Kubernetes exposure

Only show skills Dawid can explain in conversation. A skill appears when connected to a known thread, artifact, or experience—not because it was once tried.

## Section Guidance

### Hero

Use a short, specific statement. Suggested content direction:

> I learn by building tools that make difficult systems easier to approach.

Support with factual role line:

> Computer Science student · robotics, software, and systems · Poland

Primary action: explore current direction.
Secondary action: open LinkedIn.

Hero geometry should provide visual tension on one side while keeping copy dominant.

### Current direction and learning threads

Use editorial narrative blocks, not generic project cards. First release is story-first: no finished-project claims, no fake demo links, and no invented outcomes.

Current direction block:

- Label: `LEARNING THREAD / IN PROGRESS`
- Title: Robot-learning education
- Summary: a simple educational site for students and less experienced learners to perform imaginative tasks with URDF robots
- Technology context: Python, MuJoCo, skrl, URDF
- Status: idea taking shape; no shipped tool claimed

Supporting thread blocks may cover Unitree G1 exploration and systems background. Each block must expose its status clearly.

Suggested visual pattern:

- Large thread index (`01`, `02`, `03`)
- Offset title and summary
- Technology line
- Abstract geometry, not an unprovided screenshot
- Hover/focus state that reveals detail without hiding it from keyboard or touch users

### Professional background

Do not feature current ZF work in first version. Do not create an experience timeline from partial or short-term assignments.

If professional context is later added, describe it only with confirmed public facts and avoid implying ownership, confidential access, or completed outcomes beyond supplied facts.

### About

Connect work to learning:

- Computer Science studies
- Interest in automation and backend systems
- Current robot-learning education idea
- Unitree G1, MuJoCo, skrl, and Python exploration
- Assembly and systems learning as a longer-term low-level path

Voice: direct, curious, technically grounded.

### Contact

Keep close simple. Show LinkedIn as primary public contact. Do not add email or other channels until supplied.

## Interaction and Motion

Motion direction: editorial.

Use:

- Staggered section reveals on first entry
- Directional transition between project states
- Project hover/focus image or geometry shift
- Small metadata transitions
- Scroll-linked movement only when it preserves reading order

Rules:

- Respect `prefers-reduced-motion` with instant or low-motion alternatives.
- Never hide essential content behind hover.
- Keep interaction feedback under a short, predictable duration.
- Keyboard focus states must be visible and stylistically integrated.
- Motion must clarify hierarchy, sequence, or state.

## Responsive Behavior

### Mobile

- Collapse asymmetric layouts into readable vertical flow.
- Keep index labels and metadata visible.
- Preserve serif/sans hierarchy at smaller sizes.
- Avoid horizontal scrolling except for intentionally labeled code snippets.
- Convert persistent navigation to a compact menu or anchor bar.

### Tablet

- Keep offset composition where it remains readable.
- Reduce geometry density before reducing content clarity.

### Desktop

- Use full asymmetric grid and editorial spacing.
- Keep reading measure controlled; do not stretch paragraphs across viewport.

## Accessibility

- Semantic landmarks: header, nav, main, section, footer
- One logical `h1`; section headings follow hierarchy
- Full keyboard navigation
- Visible `:focus-visible` states
- Text alternatives for meaningful visuals
- Decorative geometry hidden from assistive technology
- Contrast checked for warm-white, ash, and amber combinations
- Reduced-motion mode
- Links describe destination
- No essential information conveyed by color, hover, or animation alone

## Astro + React Boundary

Astro owns:

- Page structure
- Semantic content sections
- Static profile and portfolio content
- SEO metadata
- Responsive layout shell

React islands own only interaction that benefits from client-side behavior:

- Project gallery or filter, if needed
- Motion-heavy visual treatment
- Expandable project detail
- Menu state, if native HTML/CSS is insufficient

Default stance: static first. Add client JavaScript only when interaction earns its cost.

## First Implementation Slice

Build in this order:

1. Global tokens, typography, and responsive grid
2. Header and hero
3. Current direction and learning-thread blocks with honest status labels
4. Evidence-linked skills and About sections
5. About and contact
6. React interaction islands
7. Motion polish and reduced-motion behavior
8. Accessibility and responsive verification

## Acceptance Criteria

Design is working when:

- Visitor understands Dawid's role and focus immediately.
- Page feels industrial/editorial, not like a default portfolio template.
- Serif display and sans utility typography have clear jobs.
- Amber accent guides attention without taking over.
- Abstract geometry supports content and reveals no confidential information.
- Work sections show evidence and context, not only technology names.
- Page remains usable with keyboard, reduced motion, and mobile viewport.
- Astro remains responsible for static content; React is limited to meaningful interaction.
