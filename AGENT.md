# AGENT.md — noizu-labs-scaffolding/core

Guidance for coding agents (Grok, Codex, Claude, Cursor). Monorepo ops → `../../../../../CLAUDE.md` (trl-infra root).

## Identity

`noizu_labs_core` (v0.1.8, MIT) — core Noizu scaffolding: entity model, FieldProtocol, scaffolding base used by nearly all Noizu Elixir apps (TRP, BOE, learns/knows, NPL, …). Hex-published: bump `version` in mix.exs + CHANGELOG on release; hex publish discipline applies (2FA).

## Stack & Commands

Elixir ~> 1.14. `mix deps.get && mix compile`; `mix test` (unit suite; add `--exclude integration` if tagged suites present). `mix format`, `mix credo`, `mix dialyzer`.

## Gotchas

- Adding entities: the **FieldProtocol warning is benign** — don't chase it.
- Raw SQL in migrations/tests: strict `PostgrexTypes` **rejects string uuids** — cast properly.
- API-stability matters most here: consumers are many; prefer additive changes, version breaking changes.

## Universal Rules (compressed)

- **Trinity Protocol REQUIRED**: Orientation → Friction → Response (full text: monorepo `protocols/the-trinity-protocol.md`).
- **No shell in main thread** — delegate to taskers.
- **Worktrees**: all work on worktrees; `epic.<group>` consolidation branches off `develop`; squash-PR provenance into epics.
- MAIN checkout owns `deps/_build`; worktrees symlink deps (absolute path).
