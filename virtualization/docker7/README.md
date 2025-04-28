## Creating python container and checking info inside running container 

```
[learntechbyme@devops-class ~]$ docker images
REPOSITORY    TAG        IMAGE ID       CREATED        SIZE
yjpython      pycodev1   c5f0e0658f19   24 hours ago   1.02GB
hello-world   latest     8a065188c637   2 days ago     1.02GB
ashupython    pycodev3   c648b105fb01   3 days ago     1.02GB
ashupython    pycodev2   ddfb1f51bf17   3 days ago     1.02GB
ashupython    pycodev1   c39e5bbe8f8a   3 days ago     1.02GB
mysql         latest     4b2d796bebc2   13 days ago    859MB
python        latest     f285e872b452   2 weeks ago    1.02GB
ubuntu        latest     602eb6fb314b   2 weeks ago    78.1MB
hello-world   <none>     74cc54e27dc4   3 months ago   10.1kB
[learntechbyme@devops-class ~]$ 
[learntechbyme@devops-class ~]$ 
[learntechbyme@devops-class ~]$ docker run -itd --name x1 c648b105fb01  
bc64eb35acc99e20b631c25123257e3a4a449e1965c865844f4e43d636a54045
[learntechbyme@devops-class ~]$ docker  ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS     NAMES
bc64eb35acc9   c648b105fb01   "python /mycode/ashu…"   3 seconds ago   Up 2 seconds             x1
[learntechbyme@devops-class ~]$ docker logs  x1
Hello all , welcome to python..!!
Welcome to Devops session..
Welcome to Dockerfile ..!!
______________________
Hello all , welcome to python..!!
Welcome to Devops session..
Welcome to Dockerfile ..!!
______________________
Hello all , welcome to python..!!
[learntechbyme@devops-class ~]$ docker  exec -it x1  bash 
root@bc64eb35acc9:/# python3 -V
Python 3.13.3
root@bc64eb35acc9:/# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  mycode  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@bc64eb35acc9:/# cat  /etc/os-release 
PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
NAME="Debian GNU/Linux"
VERSION_ID="12"
VERSION="12 (bookworm)"
VERSION_CODENAME=bookworm
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
root@bc64eb35acc9:/# 
exit
[learntechbyme@devops-class ~]$ 

```

## Installing python in custom dockerfile -- ubuntu:22.04 

### dockerfile 

```
[learntechbyme@devops-class ashu-images]$ cat  ubuntu.dockerfile 
FROM ubuntu:22.04 
# it will pull docker image from docker hub 
RUN  apt  update  && apt install python3 -y 
RUN  mkdir  /mycode 
# try to run any linux command in above image if command is present 
COPY ashu.py /mycode/ashu.py 
# copy file / folder from current location to docker image 
CMD  ["python3" , "/mycode/ashu.py"] 
# to set default process for this image 
[learntechbyme@devops-class ashu-images]$ 

```

## build image 

```
[learntechbyme@devops-class ashu-images]$ ls
ashu.py  Dockerfile  ubuntu.dockerfile
[learntechbyme@devops-class ashu-images]$ 
[learntechbyme@devops-class ashu-images]$ 
[learntechbyme@devops-class ashu-images]$ docker build -t ashupy:v4  -f ubuntu.dockerfile   .   


===>  

[learntechbyme@devops-class ashu-images]$ docker images
REPOSITORY    TAG        IMAGE ID       CREATED              SIZE
ashupy        v4         5ec047a22fbb   About a minute ago   170MB
yjpython      pycodev1   c5f0e0658f19   24 hours ago         1.02GB
hello-world   latest     8a065188c637   2 days ago           1.02GB
ashupython    pycodev3   c648b105fb01   3 days ago           1.02GB
ashupython    pycodev2   ddfb1f51bf17   3 days ago           1.02GB
ashupython    pycodev1   c39e5bbe8f8a   3 days ago           1.02GB


```