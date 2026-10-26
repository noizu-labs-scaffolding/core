# Threat Model — Summary

- **Posture**: in-process library — no listeners, no persistence, no I/O, no
  input parsing. Attack surface = supply chain (Hex release + CI) and the
  trust consumers place in its context/role semantics.
- **Trust boundaries**: developer/CI ↔ Hex registry ↔ downstream consumers;
  none inside a running BEAM host process.
- **Register**: 6 entries — 2 mitigated (dev deps never in release beam; hex
  2FA + manual release), 2 partial (unguarded `dummy*` system-context
  constructors; partially SHA-pinned CI actions), 2 accepted (roles are data
  by design — consumers enforce; exception payloads rely on consumer logging
  hygiene).
- **Residual risk**: any host-process code can mint `Noizu.Context.admin()`;
  authorization is entirely the consumer's responsibility.
- Details and register IDs (T-001…T-006): [THREAT-MODEL.md](THREAT-MODEL.md)
