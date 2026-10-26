# Project Schema

**No persistence layer.** `noizu_labs_core` is a pure in-process library: no
Ecto schemas, no Liquibase changelogs, no database service in CI
(`ci.yml`: "Pure Elixir lib (no ecto) — no database service required"), no
Redis/KV, no data files. There is therefore no ERD in this document. Per the
schema-documentation scope, what follows documents the structured data the
library *does* define: its Erlang records, its result/exception contracts,
and its tool configuration. Layout of these sources: [PROJ-LAYOUT.md](PROJ-LAYOUT.md).

## Records (in-memory)

### `:context` — `lib/context/records.ex`

| Field | Default | Description |
|---|---|---|
| `caller` | `nil` | `R.ref(module:, id:)` of the acting entity (role contexts use `Noizu.Context.Entity`) |
| `ts` | `nil` | `DateTime.utc_now()` set by the role constructors |
| `token` | `nil` | reserved credential slot (unused in this repo) |
| `reason` | `nil` | reserved purpose-of-call slot (unused in this repo) |
| `roles` | `nil` | keyword list, e.g. `[system: true]` — data only, not enforcement |
| `options` | `nil` | free-form map read/written by `option/2-3`, `with_option/3`, `with_options/2` |

### `:ref` — `lib/entity_reference/records.ex`

| Field | Default | Description |
|---|---|---|
| `module` | `nil` | module owning the entity's `id/kind/ref/sref/entity` implementations |
| `id` | `nil` | entity identifier (any term; role contexts use atoms such as `:system`) |

## Data-Interface Contracts

### `Noizu.EntityReference.Protocol`

| Function | Signature | Returns |
|---|---|---|
| `id/1` | `id(subject)` | `{:ok, any} \| {:error, any}` |
| `kind/1` | `kind(subject)` | `{:ok, any} \| {:error, any}` |
| `ref/1` | `ref(subject)` | `{:ok, ref} \| {:error, any}` |
| `sref/1` | `sref(subject)` | `{:ok, string_ref} \| {:error, any}` |
| `entity/2` | `entity(subject, context)` | `{:ok, entity} \| {:error, any}` |

Dispatch: `ref` tuples hit the Tuple impl, which forwards to the ref's
`module`; structs get a derived impl via `__deriving__` (forwards to the
module's own functions); all other terms hit the `Any` impl.

### Error / exception shapes

| Shape | Where | Payload fields |
|---|---|---|
| `{:error, {Noizu.EntityReference.Protocol, {:unsupported, {op, subject}}}}` | `Any` fallback impl | operation, original subject |
| `%Noizu.Core.ResultException{}` | raised by `Helpers.ok?/2` on non-`{:ok, _}` | `result`, `requirement`, `message` |
| `%Noizu.EntityReference.ProtocolException{}` | defined; not raised anywhere in this repo | `ref`, `message`, `error` |

### Context role constructors

`restricted/0-1`, `internal/0-1`, `system/0-1`, `admin/0-1`, `dummy/0-1`
produce `context(caller: R.ref(module: Noizu.Context.Entity, id: <role>), ts: DateTime.utc_now(), roles: [<role>: true])`.
The 1-arity context variants replace the roles in an existing context;
`dummy_for_user/1-2` additionally swaps `caller` for the given user's ref.

## Tool & Build Configuration

| File | Kind | Notes |
|---|---|---|
| `mix.exs` | Build config | app `:noizu_labs_core`, version 0.1.8, Elixir ~> 1.14; deps credo + ex_doc, both `runtime: false` |
| `.credo.exs` | Static-analysis config | Credo check configuration |
| `.formatter.exs` | Formatter config | imports formatter config from deps |
| `.github/workflows/ci.yml` | CI config | `mix compile --warnings-as-errors`, `mix test`; warn-only PR timing job |
| `.meta/pointers.yaml` | Generated data | doc-pointers store (46 records) — tool-managed, do not edit by hand |

## Migration History

None — no schema, no migrations. Consumers own all persistence.
