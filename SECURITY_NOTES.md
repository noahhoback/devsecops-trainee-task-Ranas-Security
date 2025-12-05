# SECURITY_NOTES

**Risks of running random Docker images from the internet:**

- The image could contain malware or backdoors that compromise the host system.
- Images might run processes as root, giving full access to the host.
- Vulnerabilities in the image (OS or software) could be exploited by attackers.
- Untrusted images may contain outdated software with known security holes.
- Sensitive data or credentials could be exposed if the image is malicious.
- Images may connect to external networks and exfiltrate data.
- Running many unknown images increases attack surface and risk.

**How to reduce these risks:**

- Only pull images from trusted sources (official Docker Hub images or verified publishers).
- Inspect Dockerfiles and image layers before running them.
- Use non-root users inside containers.
- Keep Docker and the host system up to date with security patches.
- Run containers with limited permissions (e.g., using `--read-only` and `--cap-drop` flags).
- Use vulnerability scanning tools for images (e.g., Trivy, Clair).
- Avoid storing secrets inside images; use environment variables or secret management.
