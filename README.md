# Cookiecutter Helper Scripts

This repo contains helper scripts to make using [Cookiecutter](https://cookiecutter.readthedocs.io/) easier — especially in GitHub Codespaces or beginner-friendly tutorials.

## 🎯 Purpose

When you generate a project with Cookiecutter inside a GitHub Codespace, the result includes a new Git repo inside the generated project. This can confuse Git and complicate things for new users.

This script **cleans that up** so the generated project replaces your existing repo cleanly.

---

## 🚀 Quick Start

1. Run Cookiecutter:

   ```bash
   cookiecutter gh:your-org/your-template
