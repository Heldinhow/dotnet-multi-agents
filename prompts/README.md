# .NET Multi-Agent Orchestration System

> **Inspired by Poetiq's ARC-AGI-2 Solver: Iterative Solution Generation**

## Overview

This is a multi-agent orchestration system specialized in .NET development, implementing the **iterative self-improving AI** approach pioneered by Poetiq. The system uses an **ANALYZE → HYPOTHESIZE → CODE → VALIDATE** loop with continuous self-auditing and refinement.

### Core Philosophy

1. **Test-Time Improvement** — Improve during execution, not training
2. **Evidence-Based Decisions** — Never finalize without validation proof
3. **Targeted Refinement** — Learn from failures, don't just retry

## Architecture (Poetiq-Aligned)

```
┌─────────────────────────────────────────────────────────────────┐
│              META-SYSTEM (Orchestration Layer)                  │
│           Model Selection   •   Strategy Config                 │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│              LLM-Agnostic Interface (Any Provider)              │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│            CORE: Iterative Problem-Solving Loop                 │
│                                                                 │
│    ① ANALYZE ──▶ ② HYPOTHESIZE ──▶ ③ CODE ──▶ ④ VALIDATE      │
│         ▲                                          │            │
│         │◀─────────── ✗ Failed ───────────────────┘            │
│                    (Refine with feedback)                       │
└────────────────────────────┬────────────────────────────────────┘
                             │ ✓ Passed
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                        SELF-AUDITING                            │
│   Validate Outputs • Analyze Failures • Termination Decision    │
└────────────────────────────┬────────────────────────────────────┘
                             │
              ┌──────────────┴──────────────┐
              ▼                             ▼
     ┌──────────────┐              ┌──────────────┐
     │  ✓ FINALIZE  │              │  ↻ REFINE    │
     └──────────────┘              └──────────────┘
```

## Agent Catalog

| # | Agent | File | Phase | Responsibility |
|---|-------|------|-------|----------------|
| 00 | **Orchestrator** | `00-orchestrator.md` | All | Meta-system, loop control, delegation |
| 01 | **Architect** | `01-dotnet-architect.md` | HYPOTHESIZE | Clean Architecture, DDD, boundaries |
| 02 | **API Specialist** | `02-minimal-api-specialist.md` | CODE | Minimal APIs, REST, HTTP semantics |
| 03 | **Result Pattern** | `03-result-pattern-expert.md` | CODE | FluentResults, error handling |
| 04 | **Caching Expert** | `04-caching-decorator-expert.md` | CODE | Decorator pattern, cache strategies |
| 05 | **Quality Auditor** | `05-quality-auditor.md` | VALIDATE | Self-audit, termination decisions |
| 06 | **Task Planner** | `06-task-planner.md` | ANALYZE | Task decomposition, planning |
| 07 | **Code Executor** | `07-code-executor.md` | VALIDATE | Build, test, static analysis |
| 08 | **System Overview** | `08-system-overview.md` | Reference | Complete architecture documentation |

## Key Differentiators (Poetiq Approach)

### 1. Input/Output Pairs as Ground Truth
During ANALYZE, the system identifies concrete examples of inputs and expected outputs. These become the validation criteria — no guessing.

### 2. Transform Rule Generation
Before CODE, the system generates a "transform rule" — a hypothesis of HOW inputs become outputs. This guides implementation.

### 3. Self-Auditing with Objective Criteria
The Quality Auditor applies explicit checklists:
- Test pass rate >= 85%
- Requirements coverage >= 90%
- Architecture violations = 0
- Critical issues = 0

### 4. Targeted Refinement
When refinement is needed, the system:
1. Analyzes the specific failure
2. Identifies root cause
3. Targets the fix (not retry blindly)
4. Tracks progress across iterations

## Termination Criteria

The system only finalizes when ALL conditions are met:

```
□ All input/output pairs pass validation
□ Score >= 0.85 (configurable threshold)
□ Requirements coverage >= 90%
□ Architecture violations = 0
□ Critical issues = 0
□ Hallucination check passed
```

If ANY condition fails → REFINE with targeted feedback.

## Execution Flow Example

```
REQUEST: "Create User entity with email validation"

ITERATION 1
├── ANALYZE: Extract requirements, define I/O pairs
├── HYPOTHESIZE: DDD approach with Email ValueObject
├── CODE: Generate User.cs with Result pattern
├── VALIDATE: Test fails (no email validation)
└── DECISION: REFINE (score 0.65)

ITERATION 2
├── REFINE: Add email format validation
├── VALIDATE: All tests pass
└── DECISION: FINALIZE (score 0.95) ✓
```

## Technology Stack

- **.NET 8+** — Target runtime
- **Clean Architecture** — Domain/Application/Infrastructure/Api
- **Minimal APIs** — HTTP endpoints
- **FluentResults** — Result pattern library
- **Decorator Pattern** — Caching, logging
- **NetArchTest** — Architecture validation
- **xUnit** — Testing framework

## Prompt Engineering Techniques Used

| Technique | Application |
|-----------|-------------|
| **Role Definition** | Clear, non-overlapping agent responsibilities |
| **Structured I/O** | JSON schemas for all inputs/outputs |
| **Few-Shot Examples** | Concrete examples in each prompt |
| **Validation Checklists** | Objective criteria replace subjective judgment |
| **Anti-Pattern Documentation** | Common mistakes to avoid |
| **Context Preservation** | Iteration history passed between cycles |
| **Confidence Scoring** | Quantified decision transparency |

## Usage

### For AI Coding Assistants

```
1. Load 00-orchestrator.md as primary system prompt
2. Load relevant specialist prompts based on task type
3. Follow ANALYZE → HYPOTHESIZE → CODE → VALIDATE loop
4. Apply self-auditing before any finalization
```

### For Automation Systems

```python
orchestrator = load_prompt("00-orchestrator.md")
auditor = load_prompt("05-quality-auditor.md")

while not terminated:
    result = execute_loop(request, orchestrator)
    decision = self_audit(result, auditor)
    
    if decision.action == "FINALIZE":
        terminated = True
        output(result)
    else:
        request = decision.refinement_guidance
```

## Extending the System

### Adding a New Agent

1. Create `prompts/NN-agent-name.md`
2. Follow the standard structure:
   - System Prompt (with role and philosophy)
   - Input/Output JSON schemas
   - Validation checklists
   - Few-shot examples
   - Anti-patterns
   - Rules
3. Update orchestrator's agent selection matrix
4. Update this README

### Customizing Thresholds

Adjust in the orchestrator's Strategy Configuration:
```json
{
  "max_iterations": 5,
  "confidence_threshold": 0.85,
  "requirements_coverage_min": 0.9
}
```

## Success Metrics

| Metric | Target |
|--------|--------|
| Test Pass Rate | >= 85% |
| Requirements Coverage | >= 90% |
| Architecture Compliance | 100% |
| Average Iterations | <= 3 |
| First-Pass Success | >= 40% |

## Files in this Directory

```
prompts/
├── README.md                      # This file
├── 00-orchestrator.md             # Meta-system, loop control
├── 01-dotnet-architect.md         # Clean Architecture, DDD
├── 02-minimal-api-specialist.md   # Minimal APIs, REST
├── 03-result-pattern-expert.md    # FluentResults, errors
├── 04-caching-decorator-expert.md # Decorator, cache
├── 05-quality-auditor.md          # Self-audit, decisions
├── 06-task-planner.md             # Planning, decomposition
├── 07-code-executor.md            # Build, test, analysis
└── 08-system-overview.md          # Complete architecture
```

## License

MIT License — Use freely for your .NET development workflows.

---

*Inspired by [Poetiq](https://poetiq.ai) and their ARC-AGI-2 Solver approach to iterative AI problem-solving.*
