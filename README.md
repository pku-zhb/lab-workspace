# Lab Workspace

This repository tracks the workspace layout for local lab projects.

It intentionally stores only:

- submodule pointers for reusable projects;
- small workspace scripts;
- this README and ignore rules.

It intentionally does not track local sandboxes, build outputs, archives,
`node_modules`, `target`, temporary experiments, or machine-local backups.

## Sync

From `~/lab`:

```bash
scripts/sync.sh
```

The script pulls this workspace repo, initializes submodules, and fast-forwards
each submodule to the branch configured in `.gitmodules`.

After changing a child repository, push that child repository first. Then commit
the updated submodule pointer in this workspace repo so the other machine can
reproduce the same state.
