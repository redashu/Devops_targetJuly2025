# Building Container Image Using HTTPD Server 

## Creating `ashu.html` File 

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Docker</title>
</head>
<body>
    <h1>Hello Dockerfile</h1>
    <h2>Hello GitHub Codespace</h2>
    <h2>This is Ashutoshh's container</h2>
</body>
</html>
```

## Dockerfile 

```dockerfile
FROM oraclelinux:8.4 
# Pulling image from Docker Hub 
LABEL name="ashutoshh"
LABEL email="ashutoshh@linux.com"

RUN dnf install httpd -y 
# To run any command inside the image container 
COPY ashu.html /var/www/html/index.html 

# Setting default process to start HTTPD service inside the image container 
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
# systemctl start httpd  -->  /usr/sbin/httpd -DFOREGROUND

# CMD will not run during Docker image build process but will be set as the default process of the image
# Default process will run automatically the moment someone creates a container from this image
```

## Building Image 

```bash
@redashu ➜ /workspaces/mywebapp-docker (master) $ ls
Dockerfile  README.md  ashu.html  myfiles
@redashu ➜ /workspaces/mywebapp-docker (master) $ docker build -t ashuhttp:v1 .
[+] Building 14.9s (5/8)                                                                                                                               docker:default
 => [internal] load build definition from Dockerfile                                                                                                             0.0s
 => => transferring dockerfile: 637B                                                                                                                             0.0s
 => [internal] load metadata for docker.io/library/oraclelinux:8.4                                                                                               3.5s
 => [auth] library/oraclelinux:pull token for registry-1.docker.io                                                                                               0.0s
 => [internal] load .dockerignore                                                                                                                                0.0s
 => => transferring context: 2B                                                                                                                                  0.0s
 => [1/3] FROM docker.io/library/oraclelinux:8.4@sha256:b81d5b0638bb67030b207d28586d0e714a811cc612396dbe3410db406998b3ad                                        11.4s
 => => resolve docker.io/library/oraclelinux:8.4@sha256:b81d5b0638bb67030b207d28586d0e714a811cc612396dbe3410db406998b3ad                                         0.0s
 => => sha256:b81d5b0638bb67030b207d28586d0e714a811cc612396dbe3410db406998b3ad 547B / 547B                                                                       0.0s
 => => sha256:ef0327c1a51e3471e9c2966b26b6245bd1f4c3f7c86d7edfb47a39adb446ceb5 529B / 529B                                                                       0.0s
 => => sha256:97e22ab49eea70a5d500e00980537605d56f30f9614b3a6d6c4ae9ddbd642489 1.48kB / 1.48kB                                                                   0.0s
 => => sha256:a4df6f21af842935f0b80f5f255a88caf5f16b86e2642b468f83b8976666c3d7 90.36MB / 90.36MB                                                                 9.2s
 => => extracting sha256:a4df6f21af842935f0b80f5f255a88caf5f16b86e2642b468f83b8976666c3d7                                                                        2.1s
 => [internal] load build context                                                                                                                                0.0s
 => => transferring context: 354B                                                                                                                                0.0s
```

## verify image build 

```
@redashu ➜ /workspaces/mywebapp-docker (master) $ docker  images
REPOSITORY   TAG       IMAGE ID       CREATED              SIZE
ashuhttp     v1        43d8b63dd220   About a minute ago   590MB
ashunginx    v2        b6abd83b5e17   2 days ago           192MB
ashunginx    v1        8c1075f0cb62   2 days ago           192MB
alpine       latest    aded1e1a5b37   2 months ago         7.83MB

```

### Creating contaienr 

```
@redashu ➜ /workspaces/mywebapp-docker (master) $ docker run -itd --name ashuhtt  -p 2244:80 ashuhttp:v1 
46358fbf1e43f2bdf6cb34cf760ef366712419611f9f97244b3ca7f8786329ad
@redashu ➜ /workspaces/mywebapp-docker (master) $ docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS                                     NAMES
46358fbf1e43   ashuhttp:v1   "/usr/sbin/httpd -DF…"   50 seconds ago   Up 49 seconds   0.0.0.0:2244->80/tcp, [::]:2244->80/tcp   ashuhtt

```
