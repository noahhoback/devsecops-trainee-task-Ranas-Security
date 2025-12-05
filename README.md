

# DevSecOps Trainee Task – Rana's Security

This repository contains two tasks required for the DevSecOps trainee assignment.

---

## Task 1 – Linux & Bash (Log Checker)

A Bash script `log_checker.sh` that:
- Accepts a log file path as the first argument  
- Prints:  
  - total number of lines  
  - number of lines with INFO  
  - number of lines with WARN  
  - number of lines with ERROR  
- Shows an error if the file does not exist

### Example Usage - Build the Docker image:
sudo docker build -t devsecops-env-info .

Run the container:
sudo docker run --rm devsecops-env-info

Run with custom APP_ENV:
sudo docker run --rm -e APP_ENV=production devsecops-env-info

Requirements

Ubuntu Linux
Bash
Python 3
Docker
Git

Repository Structure
devsecops-trainee-task-Ranas-Security/
│
├── log_checker.sh
├── example.log
├── env_info.py
├── Dockerfile
└── README.md

### Example usage:

```bash
./log_checker.sh example.log
