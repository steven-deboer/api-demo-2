# My Simple API 🚀

This is a basic API built with Flask, part of the `boeronline/api-demo` repository. It comes with a Dockerfile for containerization and a GitHub Actions pipeline for CI/CD.

## Table of Contents
- [Requirements](#requirements)
- [Getting Started](#getting-started)
- [Docker](#docker)
- [CI/CD Pipeline](#cicd-pipeline)
- [Risks](#risks)

## Requirements
- Docker
- Python 3.x
- Flask

## Getting Started
1. Clone the repository.
   ```bash
   git clone https://github.com/boeronline/api-demo.git
   ```
2. Install the requirements.
   ```bash
   pip install -r requirements.txt
   ```
3. Run the app.
   ```bash
   python app.py
   ```

## Docker 🐳
1. Build the Docker image.
   ```bash
   docker build -t my-api:latest .
   ```
2. Run the container.
   ```bash
   docker run -p 5000:5000 my-api:latest
   ```

## CI/CD Pipeline 🛠️
The `.github/workflows/main.yml` file defines a GitHub Actions pipeline for building and pushing the Docker image to Sonatype Nexus.

### Steps:
- Checkout code
- Build Docker image
- Log in to Nexus
- Tag Docker image
- Push to Nexus

## Risks ⚠️
- Pipeline triggers on every push to `main`.
- No security scans.
- No test stage.