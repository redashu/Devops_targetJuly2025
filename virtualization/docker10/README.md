## Intro to github codespace 

<img src="gitc.png">


### checking codespace terminal details 

```
@redashu ➜ /workspaces/mywebapp-docker (master) $ uname -r
6.8.0-1026-azure
@redashu ➜ /workspaces/mywebapp-docker (master) $ uname 
Linux
@redashu ➜ /workspaces/mywebapp-docker (master) $ cat  /etc/os-release 
NAME="Ubuntu"
VERSION="20.04.6 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.6 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal
@redashu ➜ /workspaces/mywebapp-docker (master) $ free  -m
              total        used        free      shared  buff/cache   available
Mem:           7938        1386         170          74        6381        6161
Swap:             0           0           0
@redashu ➜ /workspaces/mywebapp-docker (master) $ free  
              total        used        free      shared  buff/cache   available
Mem:        8129228     1417408      189712       63188     6522108     6325924
Swap:             0           0           0
@redashu ➜ /workspaces/mywebapp-docker (master) $ free  -m
              total        used        free      shared  buff/cache   available
Mem:           7938        1393         175          61        6369        6168
Swap:             0           0           0
@redashu ➜ /workspaces/mywebapp-docker (master) $ free  -g
              total        used        free      shared  buff/cache   available
Mem:              7           1           0           0           6           6
Swap:             0           0           0
@redashu ➜ /workspaces/mywebapp-docker (master) $ 

```

### build ops

<img src="b1.png">

### 

```
docker  build  -t  ashunginx:v1   . 

redashu ➜ /workspaces/mywebapp-docker (master) $ docker  images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
ashunginx    v1        8c1075f0cb62   2 minutes ago   192MB
alpine       latest    aded1e1a5b37   2 months ago    7.83MB

```

## Creating container to verify 

```
@redashu ➜ /workspaces/mywebapp-docker (master) $ docker  images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
ashunginx    v1        8c1075f0cb62   4 minutes ago   192MB
alpine       latest    aded1e1a5b37   2 months ago    7.83MB
@redashu ➜ /workspaces/mywebapp-docker (master) $ docker run -itd --name ashuc1   ashunginx:v1   
be93217937b31baa6d5a3736509e721a6619a78bafc6011bb2060c3ede931ce1
@redashu ➜ /workspaces/mywebapp-docker (master) $ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS     NAMES
be93217937b3   ashunginx:v1   "/docker-entrypoint.…"   3 seconds ago   Up 3 seconds   80/tcp    ashuc1
@redashu ➜ /workspaces/mywebapp-docker (master) $ 
```
### more option

```
@redashu ➜ /workspaces/mywebapp-docker (master) $ docker run -itd --name ashuc2  -p 1234:80    ashunginx:v1   
30a478c302cef8356e65d203441966d036cd5268239bdafc70388a647d8ee32d
@redashu ➜ /workspaces/mywebapp-docker (master) $ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                                     NAMES
30a478c302ce   ashunginx:v1   "/docker-entrypoint.…"   58 seconds ago   Up 57 seconds   0.0.0.0:1234->80/tcp, [::]:1234->80/tcp   ashuc2
be93217937b3   ashunginx:v1   "/docker-entrypoint.…"   3 minutes ago    Up 3 minutes    80/tcp                                    ashuc1
@redashu ➜ /workspaces/mywebapp-docker (master) $ 

```
