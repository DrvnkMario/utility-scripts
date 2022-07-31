# This is a simple script to create an ansible inventory.yaml file populated with IP addresses of containers running on Linux machine.

## Usage
Simply download the script and then run it on Linux machine. The script should create inventory.yaml file with IP addresses of running containers with this
structure:
```yml
containers:
  hosts:
    container1:
      ansible_host:
    container2:
      ansible_host
etc.
```
The file will be created in directory in which script was ran.
## Requirements
- Bash shell
- Docker engine
