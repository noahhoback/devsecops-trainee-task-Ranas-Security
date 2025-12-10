# Use a slim Python base image
FROM python:3.12-slim

# Create a non-root user
RUN useradd -ms /bin/bash appuser

# Set working directory
WORKDIR /app

# Copy script into container
COPY env_info.py .

# Change ownership to non-root user
RUN chown appuser:appuser env_info.py

# Switch to non-root user
USER appuser

# Default command
CMD ["python3", "env_info.py"]
