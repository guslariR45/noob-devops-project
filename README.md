# noob-devops-project
First devops project made by noob guy

Small end-to-end DevOps pipeline I built to learn the full flow from code to a running app in Kubernetes — GitHub Actions for CI/CD, Docker Hub for image storage, and ArgoCD doing GitOps deployment onto a k3s cluster. No manual deploy steps — everything ships by merging a PR.

## Structure

- `application/` — the app itself (Python scripts + `server.py`, a small HTTP server) and its `Dockerfile`/`docker-compose.yaml`.
- `k8s/` — Deployment and Service manifests for the app.
- `argocd/` — ArgoCD Application manifests, using the app-of-apps pattern: `root-app.yaml` bootstraps everything under `argocd/apps/`, which currently deploys `k8s/` via `moj-projekat`.
- `terraform/` — manages the `guslariR45` GitHub organization: teams, their repo permissions, and team membership.
- `.github/workflows/` — CI: app build/push (`ci.yml`), commit message linting (`commit-check.yml`), and Terraform plan/apply (`terraform.yml`).

## CI/CD flow

On every merge to `main`, GitHub Actions builds the app image tagged with the source branch + commit SHA, pushes it to Docker Hub, and commits the new tag into `k8s/test-deploy.yaml`. ArgoCD watches this repo and automatically syncs that change onto the k3s cluster — no manual deploy step.

## Access management

`noob-devops-project` is owned by the `guslariR45` GitHub organization. Team membership and repo permissions are managed as code in `terraform/`, applied automatically by `terraform.yml` on every merge to `main` (state is stored remotely in HCP Terraform).