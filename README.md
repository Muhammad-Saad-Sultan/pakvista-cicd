# PakVista – CI/CD Pipeline

## Project
**DevOps Fundamentals – Term Project, Spring 2026**
University of Central Punjab | Faculty of Information Technology

---

## Repository Structure

```
pakvista-cicd/
├── .github/
│   └── workflows/
│       ├── ci-dev.yml          ← CI for Development (PR → develop)
│       ├── cd-dev.yml          ← CD for Development (push → develop)
│       ├── ci-staging.yml      ← CI for Staging (PR → staging)
│       ├── cd-staging.yml      ← CD for Staging (push → staging)
│       ├── ci-prod.yml         ← CI for Production (PR → main)
│       └── cd-prod.yml         ← CD for Production (push → main)
├── index.html                  ← Home page (Team Lead)
├── lahore.html                 ← Member 1
├── karachi.html                ← Member 2
├── islamabad.html              ← Member 3
├── murree.html                 ← Member 4
├── hunza.html                  ← Member 5
├── style.css                   ← Shared stylesheet (Team Lead)
├── Dockerfile                  ← nginx:alpine static server (Team Lead)
├── .htmlhintrc                 ← HTMLHint linting config
└── DF_TermProject_Spring2026.docx
```

## Pipeline Flow

```
Feature Branch
    │
    └─→ PR to develop ──→ ci-dev.yml (lint + build + push :dev-latest)
                               │
                        PR merged to develop
                               │
                               └─→ cd-dev.yml → pakvista-dev on Render
                                        │
                               PR: develop → staging
                                        │
                               ci-staging.yml (lint + build + push :staging-latest)
                                        │
                               merge to staging
                                        │
                               cd-staging.yml → pakvista-staging on Render
                                        │
                               PR: staging → main
                                        │
                               ci-prod.yml (lint + build + push :prod-latest)
                                        │
                               merge to main
                                        │
                               cd-prod.yml → pakvista-prod on Render
```

## Setup Checklist (Team Lead)

- [ ] Create GitHub repo `pakvista-cicd` (public)
- [ ] Create branches: `develop` (default), `staging`, `main`
- [ ] Apply branch protection rules
- [ ] Create Docker Hub repo + Access Token
- [ ] Create 3 Render Web Services (dev, staging, prod)
- [ ] Create 3 GitHub Environments (development, staging, production)
- [ ] Add repository secrets: `DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`
- [ ] Add environment secrets: `RENDER_DEPLOY_HOOK_*_URL` for each environment
- [ ] Commit `.docx`, `Dockerfile`, `style.css`, `index.html`, all 6 workflow files to develop
- [ ] Push initial commit

## Team Member Checklist (Each Member)

- [ ] Clone repo, checkout `develop`, pull latest
- [ ] Create branch: `feature/<github-username>/<page-name>`
- [ ] Build assigned HTML page with full, meaningful content
- [ ] Add assigned workflow file in `.github/workflows/`
- [ ] Commit both files and push branch
- [ ] Open PR → `develop`, verify `ci-dev.yml` turns green
- [ ] Request TL review → TL merges → verify `cd-dev.yml` fires
- [ ] Capture all required screenshots
- [ ] Write 4–5 line individual reflection
