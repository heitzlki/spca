ls
clear
docker run --platform linux/amd64 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $SPCA:/home/user --rm -it sysprog bash
sudo apt update && sudo apt install build-essentials flex bison
exit
