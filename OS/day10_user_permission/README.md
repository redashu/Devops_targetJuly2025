## User management in Linux based os 

### user story in linux and windows 

<img src=user1.png>

### Creating user in centos machine 

```
[learntechbyme@rhel9-common ~]$ whoami 
learntechbyme
[learntechbyme@rhel9-common ~]$ pwd
/home/learntechbyme
[learntechbyme@rhel9-common ~]$ sudo -i
[root@rhel9-common ~]# whoami
root
[root@rhel9-common ~]# pwd
/root
[root@rhel9-common ~]# echo $HOME
/root
[root@rhel9-common ~]# exit
logout
[learntechbyme@rhel9-common ~]$ echo $HOME
/home/learntechbyme
[learntechbyme@rhel9-common ~]$ sudo -i
[root@rhel9-common ~]# whoami 
root
[root@rhel9-common ~]# echo $HOME
/root
[root@rhel9-common ~]# 


====> Creating 

root@rhel9-common ~]# useradd  ashu
[root@rhel9-common ~]# useradd  ashu
useradd: user 'ashu' already exists
[root@rhel9-common ~]# 

```

### After running useradd command in linux (centos/rhel)

#### Few things to be noticed

1. check users home directory in /home location 

```
[root@rhel9-common ~]# ls  /home/
alkesh  ashu  delvexdrive
```

2. make sure user is having all bash related details in their home directory 

```
[root@rhel9-common ~]# whoami 
root
[root@rhel9-common ~]# su - ashu
[ashu@rhel9-common ~]$ 
[ashu@rhel9-common ~]$ whoami 
ashu
[ashu@rhel9-common ~]$ echo $HOME
/home/ashu
[ashu@rhel9-common ~]$ ls 
[ashu@rhel9-common ~]$ ls -a
.  ..  .bash_logout  .bash_profile  .bashrc
[ashu@rhel9-common ~]$ 

```

3. all users info in linux based os are getting store /etc/passwd

```
[root@rhel9-common ~]# cat  /etc/passwd   | grep ashu
ashu:x:1008:1009::/home/ashu:/bin/bash
[root@rhel9-common ~]# 

username:password_link:uid:gid:comment:home_directory:shell

userid:  power
0 - 65535 
0 -- means root 
1 - 999 (system user) (non login user)
1000 - 65535 (generic user) (normal user with basic permission)
```

### printing file output on behalf of columns 

```
196  cat  /etc/passwd   | cut -d:  -f1
  197  cat  /etc/passwd   | cut -d:  -f3
  198  cat  /etc/passwd   | cut -d:  -f1,3
```

4. Only for info  /etc/shadow -- (user password store)

```
[root@rhel9-common ~]# passwd  ashu
Changing password for user ashu.
New password: 
BAD PASSWORD: The password is a palindrome
Retype new password: 
passwd: all authentication tokens updated successfully.

====>
root@rhel9-common ~]# cat  /etc/shadow  | grep ashu
ashu:$6$rounds=100000$PDbkHC5zCEbCeLIC$Q3Dn5KoM1ncTrN4zN7EvKLc75e4UK/UZ3VuXVHNl8ImdEN6xSyKPzpRkXR6EOLSFakTCMUueQ4hKqu1bHE9Iq/:20180:0:99999:7:::
[root@rhel9-common ~]# 

```

### user password changing game 

```
[root@rhel9-common ~]# su - ashu
Last login: Wed Apr  2 06:44:07 UTC 2025 on pts/0
[ashu@rhel9-common ~]$ 
[ashu@rhel9-common ~]$ 
[ashu@rhel9-common ~]$ passwd  
Changing password for user ashu.
Current password: 
New password: 
BAD PASSWORD: The password is shorter than 8 characters
New password: 
BAD PASSWORD: The password is shorter than 8 characters
New password: 
[ashu@rhel9-common ~]$ passwd  ashu
passwd: Only root can specify a user name.
[ashu@rhel9-common ~]$ 
[ashu@rhel9-common ~]$ passwd  
Changing password for user ashu.
Current password: 
New password: 
BAD PASSWORD: The password fails the dictionary check - it is based on a dictionary word
New password: 
Retype new password: 
passwd: all authentication tokens updated successfully.
[ashu@rhel9-common ~]$ 
[ashu@rhel9-common ~]$ exit
logout
[root@rhel9-common ~]# passwd ashu
Changing password for user ashu.
New password: 
BAD PASSWORD: The password is a palindrome
Retype new password: 
passwd: all authentication tokens updated successfully.
[root@rhel9-common ~]# 

```

### userdel 

```
root@rhel9-common ~]# userdel ashu
[root@rhel9-common ~]# 
[root@rhel9-common ~]# su - ashu
su: user ashu does not exist or the user entry does not contain all the required fields
[root@rhel9-common ~]# 

--->
user with data as well

root@rhel9-common ~]# userdel -r  yj
[root@rhel9-common ~]# 
[root@rhel9-common ~]# su - yj
su: user yj does not exist or the user entry does not contain all the required fields
[root@rhel9-common ~]# ls /home
alkesh  ashu  delvexdrive  g6391782926vs  jitendersingh_tanwar_7665  jitu  learntechbyme  ritik  surbhiveerwani  vikas  yashvi20jain
[root@rhel9-common ~]# 


```