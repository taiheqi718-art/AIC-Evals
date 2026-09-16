# AIC Evals

Verified benchmark artifacts, model patches, and integrity receipts for AIC, a closed-source, host-enforced AI software engineering runtime.

This repository publishes inspectable evidence from selected AIC evaluation runs. It does **not** contain the AIC product, source code, internal system prompts, private role artifacts, held-out tests, or credentials.

## Published results

| Benchmark | Task | Model | Attempt | F2P | P2P | Reward |
|---|---|---|---:|---:|---:|---:|
| DeepSWE v1.1 | [`updo-policy-alerting`](runs/deepswe-v1.1/updo-policy-alerting/qwen3.8-flash/attempt-01-post-fix/) | Qwen3.8-Flash | 1 (post-fix) | **17/17** | **123/123** | **1.0** |

![Verified scorecard](runs/deepswe-v1.1/updo-policy-alerting/qwen3.8-flash/attempt-01-post-fix/scorecard.png)

## Same-task context

The official DeepSWE v1.1 data includes repeated `mini-swe-agent` trials for this task. Most of the models below have four trials at each of five reasoning-effort levels:

| Model / system | Harness | Same-task scored passes |
|---|---|---:|
| **Qwen3.8-Flash + AIC** | AIC | **1/1** post-fix attempt |
| GPT-6 Astra | Official `mini-swe-agent` | **14/20** |
| GPT-5.6 Sol | Official `mini-swe-agent` | **12/20** |
| Claude Opus 5 | Official `mini-swe-agent` | **8/20** |
| Gemini 3.8 Flash | Official `mini-swe-agent` | **0/8** across two published effort levels |
| Claude Fable 5 | Official `mini-swe-agent` | **0/20** |
| Claude Opus 4.8 | Official `mini-swe-agent` | **0/19** scored; 1 provider error excluded |
| Claude Sonnet 5 | Official `mini-swe-agent` | **0/20** |

These numbers provide task-difficulty context only. They are **not** an apples-to-apples ranking: the AIC run used a different harness and operator protocol, and one AIC attempt cannot estimate a stable pass rate. See the [effort-by-effort comparison, official source links, snapshot hashes, and derivation](comparisons/deepswe-v1.1/updo-policy-alerting/).

Two verifier-selected event-ordering details are more specific than the public prose. They are documented neutrally in the task's [rubric notes](comparisons/deepswe-v1.1/updo-policy-alerting/RUBRIC-NOTES.md); the delivered candidate implements both and passes 17/17.

## What each run contains

- the exact public task instruction given to the runtime;
- the frozen candidate patch produced by the run;
- the verifier's aggregate `reward.json`;
- public-safe result metadata and integrity hashes;
- a scorecard and its deterministic local renderer;
- the upstream license applicable to the patched project.

Raw test reports, test names, held-out test source, private rubrics, model transcripts, internal AIC role artifacts, and machine-local configuration are intentionally excluded.

## Community submissions

When the public AIC desktop and CLI clients are released, developers will be encouraged to evaluate models and tasks and submit public-safe evidence bundles through pull requests.

Maintainer-published runs and community submissions will remain separate. Community results will disclose complete comparable attempt series and carry an evidence label—self-attested, artifact-checked, or, when supported by the clients, receipt-verified. A successful single attempt will not be presented as Pass@1 or a stable pass rate.

The intended bundle, privacy rules, attempt-disclosure policy, and review process are described in [CONTRIBUTING.md](CONTRIBUTING.md). The clients should generate these bundles automatically so contributors do not need to expose AIC internals or protected verifier material.

## How to interpret the evidence

A published run shows that the frozen patch identified by its SHA-256 digest produced the recorded verifier result under the stated environment. AIC itself is proprietary and is not distributed here, so this repository is an artifact record—not a fully reproducible copy of the orchestration system.

Attempt numbering is scoped to a materially stable AIC baseline. The first published result is post-fix attempt 1; earlier internal development and recovery rounds used materially different harness revisions and are not counted in this series. This repository does not yet represent a complete attempt ledger or a full-benchmark score. These results are independent publications and are not official leaderboard submissions.

See [METHODOLOGY.md](METHODOLOGY.md) for the evidence protocol and [DISCLAIMER.md](DISCLAIMER.md) for scope and interpretation limits.

## Repository layout

```text
runs/
  <benchmark>/
    <task>/
      <model>/
        attempt-<nn>/
          README.md
          task.md
          model.patch
          patch.meta.json
          reward.json
          evidence.json
          manifest.json
          scorecard.png
comparisons/
  <benchmark>/
    <task>/
      README.md
      official-results.json
      RUBRIC-NOTES.md
submissions/
  <benchmark>/
    <task>/
      <model>/
        <generated-run-id>/
```

## Licensing

Original documentation, metadata, and renderer code in this repository are licensed under the [MIT License](LICENSE). AIC itself is not included and is not licensed by this repository. Candidate patches remain subject to the upstream project's license, included with each run where applicable.
