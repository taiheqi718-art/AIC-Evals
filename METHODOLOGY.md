# Evidence methodology

## Purpose

AIC Evals preserves enough public material to identify a candidate, confirm the reported aggregate score, and distinguish a benchmark result from a marketing claim without disclosing the proprietary AIC implementation or protected evaluation material.

## Run protocol

For the first published run, the protocol was:

1. Pin the benchmark task, public instruction, base commit, public check image, and canonical verifier image.
2. Start one AIC run with a single configured model backend.
3. Let AIC route the task through project management, architecture, development, independent acceptance, and final delivery.
4. Review architecture coverage against a host-only gate. This review determines whether the attempt is allowed to continue; it does not edit candidate code.
5. After AIC reaches its delivered terminal state, require a clean committed candidate descended from the pinned base.
6. Freeze that exact candidate as `model.patch` and record its SHA-256 digest.
7. Run the canonical task verifier once against the frozen patch in a pinned container with image pulling disabled and network mode set to `none`.
8. Preserve raw evidence privately; publish aggregate scores, the candidate patch, provenance metadata, and hashes of retained evidence.

## Human involvement

The operator initiated the run, reviewed the architecture gate, monitored runtime health, and launched the post-delivery verifier. The published candidate patch was produced and committed by AIC; the operator did not edit it after delivery.

This is therefore a human-supervised harness evaluation, not an unattended-agent or Pass@1 claim.

## Evidence levels

Each run may publish three evidence layers:

1. **Result** — aggregate verifier counts and reward.
2. **Candidate** — the exact model patch, base commit, delivered commit, and patch digest.
3. **Receipt** — hashes of privately retained raw verifier reports and logs.

The receipt proves identity and later detects drift; it does not reveal or replace the retained artifact.

## Publication exclusions

The following are excluded by default:

- held-out tests, grader source, and reference solutions;
- raw CTRF reports and logs that expose protected test names or failure details;
- private architecture rubrics and internal acceptance probes;
- AIC system prompts, role transcripts, internal schemas, and source code;
- credentials, API responses, local paths, usernames, proxy configuration, and machine identifiers.

## Reproducibility boundary

The public patch can be inspected and applied to the pinned upstream base. Reproducing the official score additionally requires authorized access to the corresponding benchmark verifier materials. Reproducing the complete generation process would require the proprietary AIC runtime and is outside this repository's scope.

## External comparison data

Task-comparison pages are derived from public benchmark-owner datasets, not from AIC logs. Each comparison records the source URLs, retrieval timestamp, and SHA-256 hashes of the source snapshots used for aggregation.

Official trial outcomes are counted only when the benchmark dataset marks them as included in score. Excluded infrastructure or provider errors are disclosed separately. Full-benchmark figures and same-task figures remain separate, and cross-harness results are labelled as contextual rather than controlled rankings.

When a verifier selects a behavior that the public specification does not uniquely determine, the repository may publish a narrowly scoped rubric note. Such notes distinguish ambiguity from contradiction, cite public benchmark-owner material where available, and state whether the candidate implements the verifier-selected behavior.

## Community evidence

The planned desktop and CLI public-export workflow will generate a redacted evidence bundle and complete attempt-series ledger. Community bundles will live separately from maintainer-published runs and carry explicit self-attested, artifact-checked, or future receipt-verified labels.

Hash validation proves that published files have not drifted from the submitted bundle. It does not independently prove execution history. A future signed AIC receipt may strengthen that provenance without disclosing the proprietary runtime.
