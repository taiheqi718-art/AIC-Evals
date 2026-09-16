# Contributing evaluation results

Community evaluation submissions will open when the public AIC desktop and CLI clients are released. Developers will be encouraged to test models and tasks, export a public-safe evidence bundle, and submit it through a pull request.

The contribution format is provisional until those clients ship. This document records the intended evidence and review policy so the public workflow is designed into the clients rather than added later.

## Repository lanes

- `runs/` contains results published or independently reverified by the AIC maintainers.
- `submissions/` will contain community-contributed results.
- `comparisons/` contains clearly sourced contextual analysis; it is not a leaderboard submission lane.

Community submissions will never be silently presented as maintainer-run results.

## Evidence levels

Every community result will carry one of these labels:

1. **Self-attested** — submitted by the operator with the required public artifacts, but not independently re-run.
2. **Artifact-checked** — schema, hashes, patch integrity, attempt ledger, and internally consistent aggregate results pass repository validation.
3. **Receipt-verified** — reserved for a future AIC-generated signed receipt that can be validated without publishing the proprietary runtime.

Artifact checks establish consistency and provenance; they do not make a community run an official benchmark submission or prove that every external service behaved as reported.

## Required submission bundle

The desktop or CLI public-export workflow is expected to produce, at minimum:

- the public task instruction and benchmark/version identifier;
- AIC client and evaluation-profile versions;
- model, provider, reasoning configuration, and declared harness settings;
- task base commit and verifier/container identity where available;
- the frozen candidate patch and its SHA-256 digest;
- aggregate verifier output that is safe to redistribute;
- a public-safe run record and file manifest;
- an attempt-series ledger, including unsuccessful attempts and excluded infrastructure failures;
- a short README stating human involvement and known limitations.

Generated bundles should be submitted without hand-editing. If redaction is necessary, disclose exactly which files or fields were removed and why.

## Attempt disclosure

Successful-run cherry-picking is not acceptable. A submission must identify its attempt series, attempt ordinal, selection policy, and all earlier comparable attempts under the same materially stable AIC baseline.

Material changes to AIC, the evaluation profile, task instruction, model configuration, or verifier begin a new series and must be disclosed. Provider, verifier, and network failures may be excluded from a scored denominator only when the exclusion reason is recorded.

One successful attempt may be published, but it must not be labelled Pass@1 or a 100% pass rate unless the sampling protocol supports that claim.

## Protected and private material

Do not submit:

- held-out tests, private grader source, reference solutions, or protected test names;
- credentials, tokens, cookies, authorization headers, or private endpoints;
- raw model transcripts or internal AIC role artifacts unless a future export format explicitly permits them;
- absolute local paths, usernames, machine identifiers, or proxy configuration;
- third-party source or data that cannot legally be redistributed.

Aggregate scores, public task text, public upstream links, candidate patches, hashes, and redacted public-safe metadata are preferred.

## Pull-request review

A community-results pull request should:

1. contain one generated submission bundle or one explicitly related attempt series;
2. complete the repository pull-request template;
3. pass automated schema, hash, secret, and path checks;
4. preserve the submitted artifacts byte-for-byte after export;
5. resolve factual or licensing questions raised during review.

Acceptance records evidence; it is not an endorsement of the model, provider, benchmark, or submitter.

## Licensing

By submitting original metadata, documentation, or validation code, contributors agree that it may be distributed under this repository's MIT License. Candidate patches and upstream material remain subject to their respective upstream licenses.
