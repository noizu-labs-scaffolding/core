# Project Layout — Summary

Quick-reference tree for `noizu_labs_core`. Full descriptions in
[PROJ-LAYOUT.md](PROJ-LAYOUT.md).

```
core/
├── lib/                          # Library source (12 modules, ~1k lines)
│   ├── core.ex                   # Noizu.Core — __using__ macro
│   ├── helpers.ex                # ok?/2, banner_text/4
│   ├── core/exceptions/          # ResultException
│   ├── context/                  # Noizu.Context, Context.Entity, Context.Records
│   ├── entity_reference/         # Protocol, Records, ProtocolException, Tuple/Any impls
│   └── credo/refactor/           # Custom Credo checks (EX4001, EX3023)
├── test/                         # ExUnit suite (2 tests)
├── .github/workflows/ci.yml      # CI: compile + test; PR timing tracker
├── .meta/pointers.yaml           # doc-pointers store (generated)
├── .credo.exs / .formatter.exs   # Tool config
├── AGENT.md / AGENTS.md / CLAUDE.md  # Agent guidance
├── LICENSE                       # MIT
├── mix.exs / mix.lock            # :noizu_labs_core v0.1.8
└── README.md                     # Stale boilerplate — see CLAUDE.md
```
