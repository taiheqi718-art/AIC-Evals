# Frequently asked questions

## What is AIC Evals?

AIC Evals is a public evidence repository for selected evaluations produced with AIC, a proprietary, host-enforced AI software engineering runtime. It publishes inspectable candidate patches, aggregate verifier outcomes, provenance metadata, integrity hashes, and interpretation limits. It does not publish the AIC product or protected evaluation material.

## What is the headline result?

Qwen3.8-Flash + AIC produced a candidate for the DeepSWE v1.1 `updo-policy-alerting` task that passed 17/17 F2P checks and 123/123 P2P checks under the canonical task verifier. The verifier returned reward 1.0 and exit code 0. Operator-reported model/API cost was $0.31.

The complete public bundle is available in [`runs/deepswe-v1.1/updo-policy-alerting/qwen3.8-flash/attempt-01-post-fix/`](runs/deepswe-v1.1/updo-policy-alerting/qwen3.8-flash/attempt-01-post-fix/).

## Does 1/1 mean AIC has a 100% pass rate?

No. It means the first comparable attempt after the disclosed AIC remediation baseline passed this task. One attempt cannot estimate a stable pass rate and is not labelled Pass@1.

Earlier internal development and recovery rounds used materially different AIC revisions, so they are not counted as comparable attempts in this post-fix series. Their existence is disclosed through the retained internal run ordinal.

## Did AIC outperform the other listed models?

The repository does not make that controlled claim. The listed models were evaluated under DeepSWE's official `mini-swe-agent` harness, while Qwen3.8-Flash used AIC with a different operator protocol and attempt count.

The comparison is still useful: it shows that `updo-policy-alerting` was difficult for several strong models in published same-task trials. It is task-difficulty context, not an apples-to-apples leaderboard. See the [comparison methodology and source hashes](comparisons/deepswe-v1.1/updo-policy-alerting/).

## Was the candidate code manually edited?

No. The operator initiated and monitored the run, reviewed an architecture coverage gate, and launched the post-delivery verifier. The candidate patch was produced and committed by AIC. The operator did not modify it after delivery.

## What can I verify publicly?

You can inspect:

- the exact public task instruction;
- the frozen candidate patch;
- base and delivered commit identities;
- aggregate verifier counts and reward;
- the verifier image identity and network policy;
- SHA-256 hashes for the patch and retained evidence;
- the manifest covering every published run file;
- the same-task comparison derivation and official source snapshot hashes.

Run the bundle's `verify.ps1` script with PowerShell 7 to validate all published file hashes.

## Why are the hidden tests not included?

Held-out tests, protected grader material, private rubrics, and raw reports containing protected test names are intentionally excluded. Publishing them would compromise the benchmark. Aggregate outcomes and retained-artifact hashes provide public evidence without redistributing restricted material.

## Why is AIC closed source?

AIC is proprietary software. This repository separates product source from evaluation evidence so model patches, aggregate verifier outcomes, provenance, and integrity metadata can be inspected without disclosing the runtime implementation, internal prompts, schemas, or private role artifacts.

The planned desktop and CLI clients will allow developers to use AIC while the orchestration implementation remains proprietary.

## What do “observed time” and “effective time” mean?

Observed AIC wall-clock runs from prompt acceptance to the `delivered` terminal state. For this run it was 56m 54.679s, displayed as 56m 55s.

That interval includes six non-passing acceptance-probe executions—three `probe_error` and three `behavior_failed` outcomes—and their corrective turns. The outcomes included probe-construction errors and assertions superseded by corrected evidence; they were not canonical-verifier failures.

Because the retry work is interleaved with valid acceptance work, the repository does not invent a precise adjusted duration. It reports only the defensible bound: effective time was strictly less than 56m 55s.

## Were there ambiguities in the task?

Yes. Two event-ordering details selected by the verifier are more specific than the public prose. The repository documents them as ambiguities rather than hiding them or describing them as contradictions. The delivered candidate implements both verifier-selected interpretations and passes all 17 checks.

See [`RUBRIC-NOTES.md`](comparisons/deepswe-v1.1/updo-policy-alerting/RUBRIC-NOTES.md).

## Is this an official DeepSWE leaderboard submission?

No. It is an independent evidence publication using the canonical task verifier. AIC does not yet have a complete 113-task DeepSWE v1.1 score, so no full-benchmark performance claim is made.

## Can other developers submit AIC results?

The intended community workflow is documented in [`CONTRIBUTING.md`](CONTRIBUTING.md). Once the public desktop and CLI clients are released, developers will be encouraged to export public-safe evidence bundles and submit them through pull requests.

Community results will remain separate from maintainer-published runs and will carry explicit evidence labels.

## How should this result be cited or shared?

Link to the repository or the immutable run directory, state the exact task and attempt scope, and preserve the cross-harness caveat. A concise description is:

> Qwen3.8-Flash + AIC passed all 17/17 canonical checks on the DeepSWE v1.1 `updo-policy-alerting` task for an operator-reported model/API cost of $0.31. The exact patch and public-safe evidence bundle are available in AIC Evals. Same-task model comparisons use a different harness and provide difficulty context rather than a controlled ranking.
