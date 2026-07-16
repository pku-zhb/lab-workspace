#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

git pull --ff-only
git submodule sync --recursive
git submodule update --init --recursive

git submodule foreach --recursive '
  branch="$(git config -f "$toplevel/.gitmodules" "submodule.$name.branch" || true)"
  if [ -n "$branch" ]; then
    git fetch origin "$branch"
    git checkout "$branch"
    git merge --ff-only "origin/$branch"
  fi
'

git status --short
