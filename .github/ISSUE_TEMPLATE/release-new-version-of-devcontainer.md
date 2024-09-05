---
name: Release new version of devcontainer
about: Steps to take before release
title: Release version [number]
labels: ''
assignees: ''

---

Checklist for release:

- [ ] Update NEWS file
- [ ] Update CITATION.cff
- [ ] Update VERSION
- [ ] In devcontainer.json, update `"image": "ghcr.io/r-devel/r-dev-env:devel"` to `"image": "ghcr.io/r-devel/r-dev-env:main"`,,
- [ ] Make PR to main branch - needs approving review!
- [ ] Make sure docker container is rebuilt
- [ ] Test container and fix any issues
- [ ] Make GitHub release
