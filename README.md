# Zero-Trust DevSecOps Pipeline & API Architecture

A production-ready DevSecOps CI/CD pipeline demonstrating automated security auditing, container hardening, and immutable artifact deployment.

## Architecture Overview
This project simulates a hardened enterprise release cycle. Every push to the main branch triggers a strict pipeline that prevents vulnerable code or leaked secrets from reaching the deployment registry.

1. **Continuous Integration (FastAPI):** A high-performance Python API.
2. **Secret Scanning (Gitleaks):** Pre-build auditing to block hardcoded credentials (AWS keys, tokens).
3. **Container Security (Trivy):** Dynamic patching of OS packages (Alpine Linux) and core libraries, enforcing a zero-vulnerability baseline.
4. **Artifact Storage (GHCR):** Successful builds are automatically tagged and pushed to the GitHub Container Registry.
5. **Continuous Deployment:** Managed via docker-compose with strict memory limits and privilege escalation drops.

## Production Deployment
To deploy this secured architecture on any Linux server with Docker installed:

# Download the deployment configuration
curl -O [https://raw.githubusercontent.com/Olamilekan2580/devops-demo/main/docker-compose.yml](https://raw.githubusercontent.com/Olamilekan2580/devops-demo/main/docker-compose.yml)

# Pull the latest secure image and deploy
docker-compose up -d

## Health Verification
Once deployed, verify the API and security headers:
curl -i http://localhost:8080/health
