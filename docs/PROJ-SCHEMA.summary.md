# Project Schema — Summary

- **No persistence layer**: no Ecto, no Liquibase, no DB service in CI, no KV,
  no data files. No ERD — by design of the repo, not an omission.
- **In-memory records** (Erlang records):
  - `:context` — `caller`, `ts`, `token`, `reason`, `roles`, `options`
    (all default `nil`); `roles` is an advisory keyword list, `options` a
    free-form map.
  - `:ref` — `module`, `id`; lightweight entity identity tuple.
- **Interface contract**: every `Noizu.EntityReference.Protocol` function
  returns `{:ok, _} | {:error, _}`; unsupported terms yield
  `{:error, {Noizu.EntityReference.Protocol, {:unsupported, {op, subject}}}}`.
- **Exceptions**: `Noizu.Core.ResultException` (`result`, `requirement`,
  `message`) raised by `Helpers.ok?/2`; `Noizu.EntityReference.ProtocolException`
  (`ref`, `message`, `error`) defined but never raised in this repo.
- **Config surfaces**: `mix.exs` (v0.1.8, no runtime deps), `.credo.exs`,
  `.formatter.exs`, `.github/workflows/ci.yml`, generated
  `.meta/pointers.yaml`.
- Details: [PROJ-SCHEMA.md](PROJ-SCHEMA.md)
