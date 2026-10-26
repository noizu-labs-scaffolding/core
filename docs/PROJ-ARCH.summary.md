# Project Architecture — Summary

- **What**: pure in-process Elixir scaffolding library (`noizu_labs_core`
  v0.1.8, MIT, Hex-published) for Noizu apps. No runtime deps, no processes,
  no I/O, no persistence.
- **Two building blocks**:
  1. `Noizu.EntityReference.Protocol` — polymorphic identity (`id/kind/ref/
     sref/entity`) over any term, backed by a `ref(module:, id:)` record.
     Ref tuples delegate to their module; structs use `__deriving__`;
     everything else gets `{:error, {:unsupported, _}}` via the `Any` fallback.
  2. `Noizu.Context` — `context(caller, ts, token, reason, roles, options)`
     record with role constructors (`restricted/internal/system/admin`,
     `dummy`, `dummy_for_user`) and option accessors (`option/2-3`,
     `with_option/3`, `with_options/2`).
- **Entry macro**: `use Noizu.Core` injects the `R` records alias and
  `Context` imports into consumer modules.
- **Error style**: `{:ok, _} | {:error, _}` everywhere; `Helpers.ok?/2` is the
  opt-in raising path (`Noizu.Core.ResultException`).
- **Dev tooling**: two custom Credo checks (ABC-size EX4001, single-pipe
  EX3023); CI compiles with `--warnings-as-errors` and runs `mix test`.
- **Key constraint**: context roles are data, not enforcement — consumers own
  authorization.
- Components ↔ directories: [PROJ-LAYOUT.md](PROJ-LAYOUT.md) · full text:
  [PROJ-ARCH.md](PROJ-ARCH.md)
