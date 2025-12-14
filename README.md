# 🤖 .NET Multi-Agent Orchestration System

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![.NET](https://img.shields.io/badge/.NET-8.0+-512BD4?logo=dotnet)](https://dotnet.microsoft.com/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

> **Inspired by [Poetiq's ARC-AGI-2 Solver](https://poetiq.ai)** — An iterative self-improving AI orchestration system specialized in .NET development.

## 🎯 What is this?

A collection of **expert AI agent prompts** designed to work together in an orchestrated loop for .NET software development. The system implements the **ANALYZE → HYPOTHESIZE → CODE → VALIDATE** pattern with continuous self-auditing and refinement.

### Key Principle: *"Never finalize without evidence. Always refine on failure."*

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│              META-SYSTEM (Orchestration Layer)                  │
│           Model Selection   •   Strategy Config                 │
└────────────────────────────────────┬────────────────────────────┘
                                     │
                                     ▼
┌─────────────────────────────────────────────────────────────────┐
│        CORE: Iterative Problem-Solving Loop                     │
│                                                                 │
│    ① ANALYZE ──▶ ② HYPOTHESIZE ──▶ ③ CODE ──▶ ④ VALIDATE      │
│         ▲                                          │            │
│         │◀─────────── ✗ Failed ───────────────────┘            │
│                    (Refine with feedback)                       │
└────────────────────────────────────┬────────────────────────────┘
                                     │ ✓ Passed
                                     ▼
┌─────────────────────────────────────────────────────────────────┐
│                        SELF-AUDITING                            │
│   Validate Outputs • Analyze Failures • Termination Decision    │
└────────────────────────────────────┬────────────────────────────┘
                                     │
              ┌──────────────────────┴──────────────────┐
              ▼                                         ▼
     ┌──────────────┐                          ┌──────────────┐
     │  ✓ FINALIZE  │                          │  ↻ REFINE    │
     └──────────────┘                          └──────────────┘
```

---

## 🧠 Expert Agents

| Agent | Specialty | Phase |
|-------|-----------|-------|
| 🎭 **Orchestrator** | Meta-system, loop control, delegation | All |
| 🏛️ **Architect** | Clean Architecture, DDD, boundaries | HYPOTHESIZE |
| 🌐 **API Specialist** | Minimal APIs, REST, HTTP semantics | CODE |
| ⚡ **Result Pattern** | FluentResults, error handling, railway programming | CODE |
| 💾 **Caching Expert** | Decorator pattern, cache strategies, invalidation | CODE |
| ✅ **Quality Auditor** | Self-audit, validation, termination decisions | VALIDATE |
| 📋 **Task Planner** | Decomposition, dependencies, planning | ANALYZE |
| 🔧 **Code Executor** | Build, test, static analysis | VALIDATE |

---

## 🚀 Quick Start

### Using with AI Coding Assistants (Cursor, Copilot, etc.)

1. Copy the content of `prompts/00-orchestrator.md` as your system prompt
2. Add relevant specialist prompts based on your task
3. Let the AI follow the iterative loop

### Example Prompt Chain

```
System: [00-orchestrator.md content]

User: Create a User entity with email validation and repository pattern

AI: 
→ ANALYZE: Extract requirements, define test cases
→ HYPOTHESIZE: DDD with Email ValueObject, IUserRepository
→ CODE: Generate User.cs, Email.cs, IUserRepository.cs
→ VALIDATE: Check compilation, run tests
→ SELF-AUDIT: Score 0.95 → FINALIZE ✓
```

---

## 📁 Repository Structure

```
dotnet-multi-agents/
├── README.md                          # You are here
├── LICENSE                            # MIT License
└── prompts/
    ├── README.md                      # Detailed documentation
    ├── 00-orchestrator.md             # 🎭 Meta-system
    ├── 01-dotnet-architect.md         # 🏛️ Clean Architecture
    ├── 02-minimal-api-specialist.md   # 🌐 Minimal APIs
    ├── 03-result-pattern-expert.md    # ⚡ FluentResults
    ├── 04-caching-decorator-expert.md # 💾 Caching
    ├── 05-quality-auditor.md          # ✅ Self-Auditing
    ├── 06-task-planner.md             # 📋 Planning
    ├── 07-code-executor.md            # 🔧 Execution
    └── 08-system-overview.md          # 📖 Full architecture
```

---

## ✨ Key Features

### 🔄 Iterative Refinement
The system doesn't just try once — it learns from failures and refines until the solution works.

### 📊 Evidence-Based Decisions
No guessing. The Quality Auditor requires concrete test results before finalizing.

### 🎯 Objective Termination Criteria
```
□ Test pass rate ≥ 85%
□ Requirements coverage ≥ 90%
□ Architecture violations = 0
□ Critical issues = 0
```

### 🛡️ Anti-Hallucination
Active detection of invented APIs, wrong syntax, and fictional packages.

---

## 🛠️ Technology Stack

The agents are specialized for:

- **.NET 8+** — Modern C# features
- **Clean Architecture** — Domain/Application/Infrastructure/API layers
- **Minimal APIs** — Lightweight HTTP endpoints
- **FluentResults** — Explicit error handling
- **Decorator Pattern** — Cross-cutting concerns
- **xUnit** — Testing framework

---

## 📖 Documentation

For detailed documentation on each agent, see the [`prompts/README.md`](prompts/README.md).

---

## 🤝 Contributing

Contributions are welcome! Feel free to:

- Add new specialist agents
- Improve existing prompts
- Add examples and use cases
- Fix documentation

---

## 📜 License

MIT License — Use freely for your projects.

---

## 🙏 Acknowledgments

- **[Poetiq](https://poetiq.ai)** — For pioneering the iterative self-improving AI approach
- **ARC-AGI-2 Challenge** — For inspiring rigorous AI evaluation methods

---

<p align="center">
  <i>Built with ❤️ for the .NET community</i>
</p>

