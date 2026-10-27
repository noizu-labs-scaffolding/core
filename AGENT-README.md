# AGENT-README

> Orientation for AI coding agents working in this repo. Human docs: README.md.

## Type

elixir-lib

## Purpose

`noizu_labs_core` — core Noizu scaffolding: entity model, FieldProtocol, and scaffolding base used by nearly all Noizu Elixir apps (TRP, BOE, learns/knows, NPL, ...).

## Stack

Elixir ~> 1.14; Hex package `noizu_labs_core` (v0.1.x, MIT).

## Dev mode

```bash
mix deps.get && mix compile
mix test
mix format   # also: mix credo, mix dialyzer
```

## Ports / URLs

- none (library/CLI)

## Tests

```bash
mix test
```

## Gotchas

- README.md is a stale scaffold ("NoizuErp", "TODO: Add description") — the repo CLAUDE.md is the real identity doc.
- Adding entities: the FieldProtocol compiler warning is benign — don't chase it.
- Raw SQL in migrations/tests: strict `PostgrexTypes` rejects string uuids — cast properly.
- API stability matters most here (many consumers): prefer additive changes; version breaking changes.
- Hex-published: bump `version` in mix.exs + CHANGELOG on release; hex publish discipline (2FA).
