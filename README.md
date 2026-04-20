# cilium-proxy-poc

Replica of cilium/proxy's CI workflow.

Demonstrates fork checkout + Docker build code execution:
- `pull_request_target` triggers on any fork PR (no gate, no approval)
- `actions/checkout` checks out the fork's code (`ref: github.event.pull_request.head.sha`)
- `docker/build-push-action` builds `Dockerfile.builder` and `Dockerfile` from the workspace
- Attacker replaces `Dockerfile.builder` — `RUN` commands execute during build
- Built image pushed to `quay.io/cilium/cilium-envoy-dev` (supply chain attack)
- `secrets: inherit` passes all secrets to downstream reusable workflows

Used for authorized security research only.
