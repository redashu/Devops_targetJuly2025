## steps to run python code in any linux / windows / mac 

### Step 1:  check if python in installed or not 

```
[learntechbyme@devops-class ashu-images]$ python3 -V
Python 3.9.21
[learntechbyme@devops-class ashu-images]$ 
[learntechbyme@devops-class ashu-images]$ python  -V
Python 3.9.21
[learntechbyme@devops-class ashu-images]$ 


```

### RUn file using python or python3 

```
learntechbyme@devops-class ashu-images]$ python  ashu.py 

Hello all , welcome to python..!!
Welcome to Devops session..
Welcome to Containers ..!!
______________________
Hello all , welcome to python..!!
Welcome to Devops session..
Welcome to Containers ..!!
______________________
Hello all , welcome to python..!!
Welcome to Devops session..

```

## Building image of python code using dockerifil 

```
[learntechbyme@devops-class ashu-images]$ ls
ashu.py  Dockerfile

==> ashu.py 

learntechbyme@devops-class ashu-images]$ cat ashu.py 
import time

while True:
    print("Hello all , welcome to python..!!")
    time.sleep(3)
    print("Welcome to Devops session..")
    time.sleep(2)
    print("Welcome to Containers ..!!")
    print("______________________")
    time.sleep(3)

===> Dockerfile 

[learntechbyme@devops-class ashu-images]$ cat  Dockerfile 
FROM python
# it will pull docker image from docker hub 
COPY ashu.py /ashu.py 
# copy file / folder from current location to docker image 
CMD  ["python" , "/ashu.py"] 
# to set default process for this image 

```

## Running Dockerfile to build new docker image 

```
[learntechbyme@devops-class ashu-images]$ ls
ashu.py  Dockerfile
[learntechbyme@devops-class ashu-images]$ 
[learntechbyme@devops-class ashu-images]$ docker  build  -t  ashupython:pycodev1  . 
[+] Building 28.6s (7/7) FINISHED                                                                                                docker:default
 => [internal] load build definition from Dockerfile                                                                                       0.0s
 => => transferring dockerfile: 309B                                                                                                       0.0s
 => [internal] load metadata for docker.io/library/python:latest                                                                           3.1s
 => [internal] load .dockerignore                                                                                                          0.0s
 => => transferring context: 2B                                                                                                            0.0s
 => [internal] load build context                                                                                                          0.0s
 => => transferring context: 338B                                                                                                          0.0s
 => [1/2] FROM docker.io/library/python:latest@sha256:34dc8eb488136014caf530ec03a3a2403473a92d67a01a26256c365b5b2fc0d4                    23.7s
 => => resolve docker.io/library/python:latest@sha256:34dc8eb488136014caf530ec03a3a2403473a92d67a01a26256c365b5b2fc0d4                     0.0s
 => => sha256:23b7d26ef1d294256da0d70ce374277b9aab5ca683015073316005cb63d33849 48.49MB / 48.49MB                                           1.0s
 => => sha256:07d1b5af933d2dfc3d0dd509d6e20534825e4
```

## creating contaienr from new image with default process

```
[learntechbyme@devops-class ashu-images]$ docker run -itd --name ashuc1 ashupython:pycodev1  
4fbe2f3adb748284e96839e8d1269f5c0989d505fe3717df31266368408713ef
[learntechbyme@devops-class ashu-images]$ 
[learntechbyme@devops-class ashu-images]$ docker  ps
CONTAINER ID   IMAGE                 COMMAND             CREATED          STATUS          PORTS     NAMES
4fbe2f3adb74   ashupython:pycodev1   "python /ashu.py"   5 seconds ago    Up 5 seconds              ashuc1
5f3d91b086ad   ubuntu                "/bin/bash"         16 minutes ago   Up 16 minutes             x2
a5d83dbd6019   alpine                "/bin/sh"           16 minutes ago   Up 16 minutes             x1
[learntechbyme@devops-class ashu-images]$ 
[learntechbyme@devops-class ashu-images]$ docker logs ashuc1
Hello all , welcome to python..!!
Welcome to Devops session..
Welcome to Containers ..!!
______________________
Hello all , welcome to python..!!
Welcome to Devops session..

```

### container memory status 

```
learntechbyme@devops-class ashu-images]$ docker  stats ashuc1 


```
