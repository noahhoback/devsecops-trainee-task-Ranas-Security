FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Create non-root user and home directory
RUN useradd -m appuser

# Copy script into the image
COPY env_info.py .

# Ensure the script is executable (if not already)
RUN chmod +x env_info.py

# Use non-root user
USER appuser

# Default APP_ENV if not provided at runtime
ENV APP_ENV=default

# Run the script when container starts
CMD ["python", "env_info.py"]
