### checking shell details 

```

### current shell 

learntechbyme@rhel9-common ~]$ echo $SHELL
/bin/bash

### all available shells 

[learntechbyme@rhel9-common ~]$ cat  /etc/shells 
/bin/sh
/bin/bash
/usr/bin/sh
/usr/bin/bash
[learntechbyme@rhel9-common ~]$ 

```

### changing shell temporary 

```
[learntechbyme@rhel9-common ~]$ SHELL=/bin/sh
[learntechbyme@rhel9-common ~]$ 
[learntechbyme@rhel9-common ~]$ echo $SHELL
/bin/sh
[learntechbyme@rhel9-common ~]$ 

```

## Changing shell permanently 

```
vikas@rhel9-common ~]$ chsh 
Changing shell for vikas.
New shell [/bin/bash]: /bin/sh
Password: 
Shell changed.

```

### Method 2 changing anything related to shell permanently 
---> /home/username/.bashrc (hidden file )

```
[vikas@rhel9-common ~]$ ls
Chat_Hub  package-lock.json  traning_web_admin_portal
[vikas@rhel9-common ~]$ ls  -a
.   .bash_history  .bash_profile  Chat_Hub  .mongorc.js  .nvm               .ssh
..  .bash_logout   .bashrc        .dbshell  .npm         package-lock.json  traning_web_admin_portal
[vikas@rhel9-common ~]$ 

```

### .bashrc 

```
learntechbyme@rhel9-common ~]$ cat  .bashrc 
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
        for rc in ~/.bashrc.d/*; do
                if [ -f "$rc" ]; then
                        . "$rc"
                fi
        done
fi

unset rc

SHELL=/bin/sh

```
### You can close terminal or use source command to load 

```
source  .bashrc 
 echo $SHELL
/bin/sh

```

### changing path variable 

```
[learntechbyme@rhel9-common ~]$ which date
/usr/bin/date
[learntechbyme@rhel9-common ~]$ pwd
/home/learntechbyme
[learntechbyme@rhel9-common ~]$ ls
hello.txt
[learntechbyme@rhel9-common ~]$ mkdir mycommands
[learntechbyme@rhel9-common ~]$ ls
hello.txt  mycommands
[learntechbyme@rhel9-common ~]$ sudo mv /usr/bin/date mycommands/
[learntechbyme@rhel9-common ~]$ 
[learntechbyme@rhel9-common ~]$ which date
/usr/bin/which: no date in (/home/learntechbyme/.local/bin:/home/learntechbyme/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin)
[learntechbyme@rhel9-common ~]$ 
[learntechbyme@rhel9-common ~]$ date
-bash: date: command not found
[learntechbyme@rhel9-common ~]$ ls mycommands/
date
[learntechbyme@rhel9-common ~]$ pwd
/home/learntechbyme
[learntechbyme@rhel9-common ~]$ /home/learntechbyme/mycommands/date 
Fri Mar 21 07:08:13 AM UTC 2025
[learntechbyme@rhel9-common ~]$ echo $PATH
/home/learntechbyme/.local/bin:/home/learntechbyme/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
[learntechbyme@rhel9-common ~]$ PATH=$PATH:/home/learntechbyme/mycommands
[learntechbyme@rhel9-common ~]$ echo $PATH
/home/learntechbyme/.local/bin:/home/learntechbyme/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/learntechbyme/mycommands
[learntechbyme@rhel9-common ~]$ 
[learntechbyme@rhel9-common ~]$ date
Fri Mar 21 07:10:30 AM UTC 2025
[learntechbyme@rhel9-common ~]$ 

```

## History command in bash 

```
[learntechbyme@rhel9-common ~]$ echo $HISTSIZE
1000

==
[learntechbyme@rhel9-common ~]$ HISTSIZE=5
[learntechbyme@rhel9-common ~]$ 
[learntechbyme@rhel9-common ~]$ echo $HISTSIZE
5
[learntechbyme@rhel9-common ~]$ date
Fri Mar 21 07:20:10 AM UTC 2025
[learntechbyme@rhel9-common ~]$ ls
hello.txt  mycommands
[learntechbyme@rhel9-common ~]$ pwd
/home/learntechbyme
[learntechbyme@rhel9-common ~]$ cal
     March 2025     
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31               
[learntechbyme@rhel9-common ~]$ history 
  118  date
  119  ls
  120  pwd
  121  cal
  122  history 
[learntechbyme@rhel9-common ~]$ vim .bashrc 
[learntechbyme@rhel9-common ~]$ source .bashrc 
[learntechbyme@rhel9-common ~]$ echo $HISTSIZE
5000
[learntechbyme@rhel9-common ~]$ 


===### history is getting stored after user logs out or we close terminal 

### in a file called .bash_history 

learntechbyme@rhel9-common ~]$ whoami 
learntechbyme
[learntechbyme@rhel9-common ~]$ ls -a
.  ..  .bash_history  .bash_logout  .bash_profile  .bashrc  hello.txt  .lesshst  mycommands  .ssh  .viminfo
[learntechbyme@rhel9-common ~]$ cat  .bash_history 
whoami
pwd
ls  /home
```
### using alias in shell

```
arntechbyme@rhel9-common ~]$ alias  myip='ifconfig   | grep 10.190  | cut -d" " -f10'
[learntechbyme@rhel9-common ~]$ myip 
10.190.0.18
[learntechbyme@rhel9-common ~]$ 
[learntechbyme@rhel9-common ~]$ alias   d=date
[learntechbyme@rhel9-common ~]$ d
Fri Mar 21 07:35:56 AM UTC 2025
[learntechbyme@rhel9-common ~]$ date
Fri Mar 21 07:36:09 AM UTC 2025
[learntechbyme@rhel9-common ~]$ vim .bashrc 
[learntechbyme@rhel9-common ~]$ 

```

