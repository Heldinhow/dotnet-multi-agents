# Multi-Agent Orchestration System Overview

> Complete system architecture aligned with Poetiq's ARC-AGI-2 approach

## Philosophy

This system implements **iterative self-improving AI** for .NET development:

1. **Test-Time Improvement** — The system improves during execution, not training
2. **Evidence-Based Decisions** — Never finalize without validation proof
3. **Targeted Refinement** — Learn from failures, don't just retry

## Complete Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          META-SYSTEM (Orchestration Layer)                  │
│          ┌──────────────────┐          ┌──────────────────┐                │
│          │  Model Selection │          │  Strategy Config │                │
│          │  • fast          │          │  • max_iter: 5   │                │
│          │  • balanced      │          │  • threshold:0.85│                │
│          │  • strong        │          │  • early_exit    │                │
│          └──────────────────┘          └──────────────────┘                │
└────────────────────────────────────┬────────────────────────────────────────┘
                                     │
                                     ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                        LLM-Agnostic Interface                               │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐          │
│  │ Claude  │  │  GPT-4  │  │ Gemini  │  │  Grok   │  │  Local  │          │
│  └─────────┘  └─────────┘  └─────────┘  └─────────┘  └─────────┘          │
└────────────────────────────────────┬────────────────────────────────────────┘
                                     │
                                     ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                    CORE: Iterative Problem-Solving Loop                     │
│                                                                             │
│   ┌───────────────────────────────────────────────────────────────────┐    │
│   │                                                                   │    │
│   │  ① ANALYZE ───────▶ ② HYPOTHESIZE ───────▶ ③ CODE ───────▶ ④ VALIDATE │
│   │     │                    │                    │              │    │    │
│   │     ▼                    ▼                    ▼              │    │    │
│   │  Extract             Generate              Implement          │    │    │
│   │  requirements,       transform rule,       solution with      │    │    │
│   │  I/O pairs,          assign agents,        specialist         │    │    │
│   │  constraints         define behavior       agents             │    │    │
│   │                                                               │    │    │
│   │     ▲                                                         │    │    │
│   │     │◀────────────── ✗ FAILED ───────────────────────────────┘    │    │
│   │                    (refine with targeted feedback)                 │    │
│   └───────────────────────────────────────────────────────────────────┘    │
│                                     │                                       │
│                                     │ ✓ PASSED                              │
│                                     ▼                                       │
└─────────────────────────────────────┬───────────────────────────────────────┘
                                      │
                                      ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                              CODE EXECUTION                                 │
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────────┐      │
│  │  dotnet build    │  │  dotnet test     │  │  Sandboxed           │      │
│  │  (compilation)   │  │  (unit tests)    │  │  Environment         │      │
│  └──────────────────┘  └──────────────────┘  └──────────────────────┘      │
└────────────────────────────────────┬────────────────────────────────────────┘
                                     │
                                     ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                              SELF-AUDITING                                  │
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────────┐      │
│  │ Validate Outputs │  │ Analyze Failures │  │ Termination Decision │      │
│  │ • test I/O pairs │  │ • categorize     │  │ • score >= 0.85?     │      │
│  │ • check coverage │  │ • root cause     │  │ • all criteria met?  │      │
│  │ • verify arch    │  │ • severity       │  │ • can improve more?  │      │
│  └──────────────────┘  └──────────────────┘  └──────────────────────┘      │
│                                     │                                       │
│                  ┌──────────────────┴──────────────────┐                   │
│                  ▼                                     ▼                    │
│         ┌──────────────────┐                 ┌──────────────────┐          │
│         │   ✓ CORRECT      │                 │    ↻ REFINE      │          │
│         │   (Finalize)     │                 │   (Continue)     │          │
│         └────────┬─────────┘                 └────────┬─────────┘          │
│                  │                                    │                     │
└──────────────────┼────────────────────────────────────┼─────────────────────┘
                   │                                    │
                   ▼                                    │
┌──────────────────────────────────┐                   │
│        SOLUTION OUTPUT           │                   │
│  • Optimized .NET code           │◀──────────────────┘
│  • Evidence of validation        │   (after refinement succeeds)
│  • Iteration log                 │
│  • Confidence score              │
└──────────────────────────────────┘
```

## Expert Agents

### Agent Catalog

| Agent | File | Phase | Expertise |
|-------|------|-------|-----------|
| **Orchestrator** | `00-orchestrator.md` | All | Loop control, delegation |
| **Architect** | `01-dotnet-architect.md` | HYPOTHESIZE | Clean Architecture, DDD |
| **API Specialist** | `02-minimal-api-specialist.md` | CODE | Minimal APIs, REST |
| **Result Pattern** | `03-result-pattern-expert.md` | CODE | FluentResults, errors |
| **Caching Expert** | `04-caching-decorator-expert.md` | CODE | Decorator, cache |
| **Quality Auditor** | `05-quality-auditor.md` | VALIDATE | Self-audit, decisions |
| **Task Planner** | `06-task-planner.md` | ANALYZE | Decomposition, planning |
| **Code Executor** | `07-code-executor.md` | VALIDATE | Build, test, analysis |

### Agent Selection by Task

```
┌─────────────────────────────────────────────────────────────────┐
│                      TASK TYPE → AGENTS                         │
├─────────────────────────────────────────────────────────────────┤
│ Architecture Design    → dotnet-architect + task-planner        │
│ API Implementation     → minimal-api-specialist + result-pattern│
│ Error Handling         → result-pattern-expert                  │
│ Performance            → caching-decorator-expert               │
│ Quality Review         → quality-auditor + code-executor        │
│ Complex Planning       → task-planner + orchestrator            │
└─────────────────────────────────────────────────────────────────┘
```

## Execution Flow Example

### Request: "Create a User entity with validation and repository"

```
ITERATION 1
├── ANALYZE
│   ├── Requirements: User entity, Email validation, Repository
│   ├── I/O Pairs: valid email → success, invalid → error
│   └── Complexity: Medium → use "balanced" strategy
│
├── HYPOTHESIZE (dotnet-architect)
│   ├── Approach: DDD with Value Object for Email
│   ├── Agents: architect → api-specialist → result-pattern
│   └── Expected: User.Create validates, returns Result
│
├── CODE (result-pattern-expert)
│   ├── User.cs with Email ValueObject
│   ├── IUserRepository.cs interface
│   └── Uses FluentResults
│
├── VALIDATE (code-executor + quality-auditor)
│   ├── Compile: ✓ SUCCESS
│   ├── Test "valid email": ✓ PASS
│   ├── Test "invalid email": ✗ FAIL (no validation)
│   └── Score: 0.65
│
└── DECISION: REFINE
    └── Focus: Add email format validation

ITERATION 2
├── REFINE (targeted)
│   └── Add regex validation to Email.Create()
│
├── VALIDATE
│   ├── Test "valid email": ✓ PASS
│   ├── Test "invalid email": ✓ PASS
│   └── Score: 0.95
│
└── DECISION: FINALIZE ✓
```

## Key Principles (Poetiq-Aligned)

### 1. Input/Output Pairs as Ground Truth
The system identifies test cases during ANALYZE and uses them as validation criteria. No guessing — the solution must produce expected outputs.

### 2. Transform Rule Generation
Before coding, the system hypothesizes a "transform rule" — a high-level approach that explains HOW the input becomes output.

### 3. Iterative Refinement with Learning
Each iteration builds on previous learnings. Failures are analyzed, not just retried. The refinement targets specific gaps.

### 4. Self-Auditing with Clear Criteria
Termination is not subjective. The Quality Auditor applies objective checklists and scores. Below threshold = refine. Above = finalize.

## Prompt Engineering Best Practices Applied

### 1. Clear Role Definition
Each agent has a specific, non-overlapping role with explicit boundaries.

### 2. Structured I/O Formats
All agents use JSON schemas for inputs and outputs, ensuring consistency.

### 3. Few-Shot Examples
Prompts include examples of expected behavior to guide the LLM.

### 4. Validation Checklists
Explicit checklists replace subjective "quality" assessments.

### 5. Anti-Pattern Documentation
Each prompt includes common mistakes to avoid.

### 6. Context Preservation
Iteration history is passed to agents to enable learning.

### 7. Confidence Scoring
All decisions include confidence levels for transparency.

## Technology Stack

- **.NET 8+** — Target runtime
- **Clean Architecture** — Layer structure
- **Minimal APIs** — HTTP endpoints
- **FluentResults** — Result pattern
- **Decorator Pattern** — Cross-cutting concerns
- **NetArchTest** — Architecture validation
- **xUnit** — Testing framework

## Usage

### For AI Coding Assistants

1. Load the orchestrator prompt as system context
2. Load relevant specialist prompts based on task
3. Follow the ANALYZE → HYPOTHESIZE → CODE → VALIDATE loop
4. Apply self-auditing before finalizing

### For Automation Systems

```python
# Pseudo-code
orchestrator = load_prompt("00-orchestrator.md")
specialists = {
    "architect": load_prompt("01-dotnet-architect.md"),
    "api": load_prompt("02-minimal-api-specialist.md"),
    # ...
}

while not terminated:
    analysis = run_phase("ANALYZE", request)
    hypothesis = run_phase("HYPOTHESIZE", analysis)
    code = run_phase("CODE", hypothesis)
    validation = run_phase("VALIDATE", code)
    
    decision = self_audit(validation)
    
    if decision.action == "FINALIZE":
        terminated = True
    else:
        request = decision.refinement_guidance
```

## Success Metrics

| Metric | Target | Description |
|--------|--------|-------------|
| Test Pass Rate | >= 85% | Input/output pairs validated |
| Requirements Coverage | >= 90% | All requirements addressed |
| Architecture Compliance | 100% | Zero violations |
| Iteration Efficiency | <= 3 avg | Iterations to finalize |
| First-Pass Success | >= 40% | Finalize on first iteration |

## Extending the System

### Adding New Agents

1. Create `prompts/NN-agent-name.md`
2. Follow the standard structure
3. Define clear I/O schemas
4. Include few-shot examples
5. Document anti-patterns
6. Update orchestrator's agent selection matrix

### Customizing for Domains

- Adjust termination thresholds
- Add domain-specific validation rules
- Create specialized agents for the domain
- Update few-shot examples with domain cases

