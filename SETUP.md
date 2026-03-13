# SETUP.md — New Project Setup Interview

When a user asks to set up a new project, run this interview **one section at a time**.  
Ask each section's questions, wait for the answers, then move to the next.  
At the end, generate the full `AGENTS.md` and folder structure automatically.

---

## How to Run This

1. Tell the user: *"Let's set up your project. I'll ask you a few questions — answer as much or as little as you know. You can always say 'default' or 'skip' for anything you're unsure about."*
2. Go through each section below in order
3. After the last section, summarize the choices back to the user and ask for confirmation
4. Then scaffold the project structure and write `AGENTS.md`

---

## Section 1 — Project Identity

Ask:

> **What is the name of your project?**

> **In one or two sentences, what does it do?**  
> *(e.g. "A budgeting app for freelancers" or "A CLI tool that converts PDF to Markdown")*

> **Who is it for?**  
> *(yourself, a client, a team, open source, etc.)*

> **Is this a new project from scratch, or are you adding Claude setup to an existing codebase?**

---

## Section 2 — Platform & Application Type

Ask:

> **What type of application is this?** *(choose one or more)*

| # | Type | Examples |
|---|---|---|
| 1 | Web app (browser) | SaaS, dashboard, e-commerce, blog |
| 2 | Mobile app | iOS, Android, cross-platform |
| 3 | Desktop app | macOS, Windows, Linux |
| 4 | CLI tool | Terminal utility, dev tool, script |
| 5 | API / Backend only | REST API, GraphQL, gRPC service |
| 6 | Library / Package | npm package, PyPI module, C library |
| 7 | Game | 2D, 3D, browser game |
| 8 | Embedded / Systems | Firmware, OS, low-level C/C++ |
| 9 | Data / ML pipeline | ETL, training scripts, notebooks |
| 10 | Browser extension | Chrome, Firefox plugin |

> **If web or mobile — is it:**
>
> - Frontend only
> - Backend only
> - Full-stack (both)

> **If full-stack — are the frontend and backend in the same repo (monorepo) or separate repos?**

---

## Section 3 — Language

Ask:

> **What programming language(s) will this project use?**

| Language | Common use cases |
|---|---|
| TypeScript / JavaScript | Web, Node, React Native, Electron |
| Python | Backend, ML/AI, scripting, data |
| C | Systems, embedded, 42 School projects |
| C++ | Games, desktop, high-performance |
| Go | Backend APIs, CLI tools, DevOps |
| Rust | Systems, WebAssembly, CLI |
| Swift | iOS, macOS |
| Kotlin | Android |
| Dart | Flutter (cross-platform mobile) |
| Java | Android, enterprise backend |
| PHP | Web backend, WordPress |
| Ruby | Rails apps |
| C# | .NET, Unity, Windows |
| Other | *(specify)* |

> **What version? (if relevant — e.g. Python 3.12, Node 22, C17)**

> **Are there any language constraints?** *(e.g. 42 School Norme, no external libraries, MISRA-C, etc.)*

---

## Section 4 — Framework & Runtime

*Show only the relevant options based on the language chosen in Section 3.*

### Web Frontend

| Framework | Notes |
|---|---|
| Next.js | React, full-stack capable, SSR/SSG |
| React (Vite) | SPA, flexible |
| Vue 3 | Lightweight SPA |
| Nuxt | Vue, full-stack |
| SvelteKit | Svelte, performance-focused |
| Angular | Enterprise, opinionated |
| Astro | Content-heavy, multi-framework |
| Vanilla JS | No framework |

### Web Backend

| Framework | Language |
|---|---|
| Express / Hono / Fastify | Node / TypeScript |
| NestJS | TypeScript, opinionated |
| FastAPI | Python |
| Django | Python, batteries included |
| Flask | Python, minimal |
| Rails | Ruby |
| Laravel | PHP |
| Spring Boot | Java |
| Gin / Echo | Go |
| Actix | Rust |

### Mobile

| Framework | Notes |
|---|---|
| React Native | JS/TS, iOS + Android |
| Flutter | Dart, iOS + Android + Web |
| Swift (native) | iOS / macOS only |
| Kotlin (native) | Android only |
| Expo | React Native, easier setup |

### Desktop

| Framework | Language |
|---|---|
| Electron | JS/TS, cross-platform |
| Tauri | Rust + Web frontend |
| Qt | C++ / Python |
| SDL2 | C/C++, games & GUIs |
| .NET MAUI | C#, cross-platform |
| SwiftUI | macOS / iOS native |

### CLI

| Framework | Language |
|---|---|
| No framework (raw args) | Any |
| Click / Typer | Python |
| Cobra | Go |
| Clap | Rust |
| Commander.js | Node |
| oclif | TypeScript |

### Game

| Engine / Library | Notes |
|---|---|
| SDL2 + OpenGL | C/C++, low-level |
| Raylib | C, beginner-friendly |
| Unity | C# |
| Unreal | C++ |
| Godot | GDScript / C# |
| Pygame | Python |
| Phaser | JS, browser games |

---

## Section 5 — Database

Ask:

> **Does your project need a database?** *(yes / no / not sure yet)*

If yes:

> **What kind of data are you storing?**  
> *(structured/relational, documents, key-value, files, time-series, vectors...)*

> **Which database?**

| Database | Type | Best for |
|---|---|---|
| PostgreSQL | Relational SQL | Most apps, complex queries |
| MySQL / MariaDB | Relational SQL | Web apps, shared hosting |
| SQLite | Relational SQL (file) | Local apps, CLI tools, mobile |
| MongoDB | Document (NoSQL) | Flexible schemas, JSON data |
| Redis | Key-value / cache | Sessions, queues, caching |
| Supabase | Postgres + auth + storage | BaaS, rapid development |
| Firebase | Document + realtime | Mobile apps, realtime sync |
| PlanetScale | Serverless MySQL | Scalable SaaS |
| Turso | SQLite edge | Edge / embedded |
| InfluxDB | Time-series | Metrics, IoT |
| Pinecone / pgvector | Vector | AI/ML, embeddings |
| None | — | CLI, library, stateless API |

> **Will you use an ORM or query builder?**

| ORM / Query builder | Language |
|---|---|
| Prisma | TypeScript |
| Drizzle | TypeScript |
| TypeORM | TypeScript |
| SQLAlchemy | Python |
| Django ORM | Python |
| GORM | Go |
| ActiveRecord | Ruby |
| Raw SQL | Any |

---

## Section 6 — Authentication & Auth

Ask:

> **Does your app need user accounts or authentication?** *(yes / no / not sure)*

If yes:

> **What auth method?**

| Option | Notes |
|---|---|
| Email + password | Classic, needs password hashing |
| OAuth / Social login | Google, GitHub, Discord, etc. |
| Magic link (email) | Passwordless |
| API key | For developer-facing APIs |
| JWT | Stateless token auth |
| Session-based | Server-side sessions |

> **Will you use an auth library or service?**

| Library / Service | Notes |
|---|---|
| NextAuth / Auth.js | Next.js focused |
| Clerk | Drop-in auth UI + backend |
| Supabase Auth | Postgres-native |
| Firebase Auth | Google ecosystem |
| Auth0 | Enterprise, flexible |
| Passport.js | Node, many strategies |
| DIY (custom) | Full control |

---

## Section 7 — Testing

Ask:

> **Do you want automated tests?** *(yes / no / later)*

If yes:

> **What types of tests?**
>
> - Unit tests
> - Integration tests
> - End-to-end (E2E) tests
> - All of the above

> **Which testing framework?**

| Framework | Language / Use |
|---|---|
| Jest | JavaScript / TypeScript |
| Vitest | TypeScript, Vite projects |
| Pytest | Python |
| Go test | Go (built-in) |
| Criterion | Rust |
| Unity (test framework) | C (not the game engine) |
| Playwright | E2E, browser |
| Cypress | E2E, browser |
| Detox | React Native E2E |

> **Do you follow TDD (test-driven development)?** *(yes / no)*

---

## Section 8 — DevOps & Deployment

Ask:

> **Where will this be deployed (if anywhere)?**

| Target | Notes |
|---|---|
| Vercel | Best for Next.js |
| Netlify | Static + serverless |
| Railway | Full-stack, easy |
| Render | Backend + static |
| Fly.io | Containers, global |
| AWS | Full control, complex |
| GCP / Firebase Hosting | Google ecosystem |
| DigitalOcean | VPS / App Platform |
| Self-hosted / VPS | Full control |
| Docker + anywhere | Portable containers |
| App Store / Play Store | Mobile |
| No deployment needed | Local / internal tool |

> **Do you need CI/CD?** *(automated testing + deployment on push)*

> **If yes — which platform?**
>
> - GitHub Actions
> - GitLab CI
> - CircleCI
> - Other / Not sure

> **Do you use Docker?** *(yes / no / not sure)*

---

## Section 9 — Code Style & Conventions

Ask:

> **Any specific code style rules?**  
> *(e.g. 42 School Norme, Airbnb style guide, Google style, custom, none)*

> **Indentation:** tabs or spaces? How many spaces?

> **Quotes:** single or double? *(for JS/TS/Python)*

> **Do you want a linter?**

| Linter | Language |
|---|---|
| ESLint | JavaScript / TypeScript |
| Biome | JS/TS (faster alternative) |
| Ruff | Python |
| Clippy | Rust |
| golangci-lint | Go |
| None | — |

> **Do you want auto-formatting?**

| Formatter | Language |
|---|---|
| Prettier | JS / TS / CSS / HTML |
| Black | Python |
| gofmt | Go |
| rustfmt | Rust |
| clang-format | C / C++ |
| None | — |

---

## Section 10 — Additional Tools & Integrations

Ask:

> **Any of these do you want included from the start?**

| Tool | Purpose |
|---|---|
| Stripe | Payments |
| Resend / SendGrid | Transactional email |
| Cloudinary / S3 | File / image storage |
| Sentry | Error tracking |
| PostHog / Plausible | Analytics |
| OpenAI / Anthropic API | AI features |
| Twilio | SMS / phone |
| Mapbox / Google Maps | Maps |
| Socket.io / Ably | Realtime / websockets |
| None of the above | — |

> **Any other libraries, SDKs, or tools you know you'll need?**

---

## Section 11 — Constraints & Special Requirements

Ask:

> **Are there any hard constraints on this project?**  
> *(e.g. no external dependencies, must compile with a specific toolchain, school project rules, budget limits, must run offline, accessibility requirements, specific OS target)*

> **Is there an existing codebase, API, or design to match?**

> **Any security or privacy requirements?**  
> *(e.g. GDPR, HIPAA, no telemetry, end-to-end encryption)*

---

## Section 12 — Plans & Roadmap

Ask:

> **Do you already have a list of features or tasks planned?**  
> *(yes → offer to create `.plans/ROADMAP.md` / no → skip)*

> **What's the very first thing you want to build?**  
> *(this becomes the first entry in `.plans/SPRINT-1.md`)*

---

## After the Interview — What Claude Does Next

Once all sections are answered, Claude should:

1. **Summarize** all choices back to the user in a clean table for confirmation
2. **Scaffold** the folder structure appropriate for the chosen stack
3. **Write `AGENTS.md`** with:
   - Project name and description
   - Full stack declaration
   - Key commands (build, test, lint, run)
   - Code conventions
   - References to `.plans/` if plans were created
4. **Create `.plans/ROADMAP.md`** if the user provided feature ideas
5. **List what was created** and suggest the next step

---

## Quick Reference — Defaults by Project Type

If the user says "just use defaults" or "standard setup", use these:

| Type | Default stack |
|---|---|
| Web full-stack | Next.js 16, TypeScript, PostgreSQL, Prisma, Tailwind, Vitest |
| Web backend only | Node + Hono, TypeScript, PostgreSQL, Prisma |
| Web frontend only | React + Vite, TypeScript, Tailwind |
| Mobile | React Native + Expo, TypeScript |
| CLI tool | Node + TypeScript, Commander.js |
| Python backend | FastAPI, Python 3.12, PostgreSQL, SQLAlchemy |
| C project | C17, Makefile, no external deps |
| C++ game | C++17, SDL2 + OpenGL, CMake |
| Go API | Go 1.22+, Gin, PostgreSQL |
