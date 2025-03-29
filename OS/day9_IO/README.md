### IO continue 

### Doing some operations in stored output file 

## dealing with lines 

```
[learntechbyme@rhel9-common ~]$ wc  -l  ashu.txt 
33 ashu.txt


[learntechbyme@rhel9-common ~]$ cat  -n  ashu.txt 
     1  -bash: kkkk: command not found
     2  Fri Mar 28 07:40:26 AM UTC 2025
     3  -bash: date111: command not found
     4  Fri Mar 28 07:42:26 AM UTC 2025
     5  -bash: date444: command not found
     6       March 2025     
     7  Su Mo Tu We Th Fr Sa
     8                     1
     9   2  3  4  5  6  7  8
    10   9 10 11 12 13 14 15
    11  16 17 18 19 20 21 22
    12  23 24 25 26 27 28 29
    13  30 31               

```

### checking with head and tail 

### head 

```
[learntechbyme@rhel9-common ~]$ head  -2  ashu.txt 
-bash: kkkk: command not found
Fri Mar 28 07:40:26 AM UTC 2025

===>
[learntechbyme@rhel9-common ~]$ head   -12 ashu.txt 
-bash: kkkk: command not found
Fri Mar 28 07:40:26 AM UTC 2025
-bash: date111: command not found
Fri Mar 28 07:42:26 AM UTC 2025
-bash: date444: command not found
     March 2025     
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29

[learntechbyme@rhel9-common ~]$ head   -n  12 ashu.txt 
-bash: kkkk: command not found
Fri Mar 28 07:40:26 AM UTC 2025
-bash: date111: command not found
Fri Mar 28 07:42:26 AM UTC 2025
-bash: date444: command not found
     March 2025     
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
```

### Dealing with tail 

```
[learntechbyme@rhel9-common ~]$ tail -2  ashu.txt 
vikas
yashvi20jain

[learntechbyme@rhel9-common ~]$ 
[learntechbyme@rhel9-common ~]$ 
[learntechbyme@rhel9-common ~]$ tail -n 2  ashu.txt 
vikas
yashvi20jain

[learntechbyme@rhel9-common ~]$ tail  ashu.txt 
-bash: lslll: command not found
alkesh
delvexdrive
g6391782926vs
jitendersingh_tanwar_7665
learntechbyme
ritik
surbhiveerwani
vikas

```

### Dealing with Grep 

```
[learntechbyme@rhel9-common ~]$ grep  bash   ashu.txt 
-bash: kkkk: command not found
-bash: date111: command not found
-bash: date444: command not found
-bash: lslll: command not found
-bash: lslll: command not found

[learntechbyme@rhel9-common ~]$ cat ashu.txt 
-bash: kkkk: command not found
Fri Mar 28 07:40:26 AM UTC 2025
-bash: date111: command not found
Fri Mar 28 07:42:26 AM UTC 2025
-bash: date444: command not found


### matching only words with grep 

bash: lslll: command not found
[learntechbyme@rhel9-common ~]$ grep  -w  bash   ashu.txt 
-bash: kkkk: command not found
-bash: date111: command not found
-bash: date444: command not found
hi my name is bash and i am shell of linux based OS 
-bash: lslll: command not found
-bash: lslll: command not found
[learntechbyme@rhel9-common ~]$ 

====>  
[learntechbyme@rhel9-common ~]$ grep   [bB]ash   ashu.txt 
-bash: kkkk: command not found
-bash: date111: command not found
-bash: date444: command not found
hi my name is bash and i am shell of linux based OS 
hi my name is bashand i am shell of linux based OS 
hi my name is Bash and i am not shell of linux based OS 
-bash: lslll: command not found
-bash: lslll: command not found

[learntechbyme@rhel9-common ~]$ vim ashu.txt 
[learntechbyme@rhel9-common ~]$ grep   [bB]ash   ashu.txt 
-bash: kkkk: command not found
-bash: date111: command not found
-bash: date444: command not found
hi my name is bash and i am shell of linux based OS 
hi my name is bashand i am shell of linux based OS 
hi my name is Bash and i am not shell of linux based OS 
-bash: lslll: command not found
-bash: lslll: command not found

[learntechbyme@rhel9-common ~]$ grep   [AbB]ash   ashu.txt 
-bash: kkkk: command not found
-bash: date111: command not found
-bash: date444: command not found
hi my name is bash and i am shell of linux based OS 
hi my name is bashand i am shell of linux based OS 
hi my name is Bash and i am not shell of linux based OS 
hi my name is Aash and i am not shell of linux based OS 
-bash: lslll: command not found
-bash: lslll: command not found

### case insensitive search 

[learntechbyme@rhel9-common ~]$ grep  -i  bash   ashu.txt 
-bash: kkkk: command not found
-bash: date111: command not found
-bash: date444: command not found
hi my name is bash and i am shell of linux based OS 
hi my name is bashand i am shell of linux based OS 
hi my name is Bash and i am not shell of linux based OS 
hi my name is BASH and i am not shell of linux based OS 
-bash: lslll: command not found
-bash: lslll: command not found


```

### Dealing with PIpeline (|)

```
learntechbyme@rhel9-common ~]$ cal 
     March 2025     
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31               
[learntechbyme@rhel9-common ~]$ cal   | 
> tail -2  
23 24 25 26 27 28 29
30 31               
[learntechbyme@rhel9-common ~]$ cal  |  head -2 
     March 2025     
Su Mo Tu We Th Fr Sa
[learntechbyme@rhel9-common ~]$ cal  |  grep 2
     March 2025     
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
[learntechbyme@rhel9-common ~]$ cal  |  grep ma
[learntechbyme@rhel9-common ~]$ cal  |  grep -i ma
     March 2025     
[learntechbyme@rhel9-common ~]$ 


====>

[learntechbyme@rhel9-common ~]$ cal
     March 2025     
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31               
[learntechbyme@rhel9-common ~]$ cal  |  head -4 
     March 2025     
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
[learntechbyme@rhel9-common ~]$ cal  |  head -4  |  tail -1 
 2  3  4  5  6  7  8
[learntechbyme@rhel9-common ~]$ 


===>
[learntechbyme@rhel9-common ~]$ cat  ashu.txt   | grep bash 
-bash: kkkk: command not found
-bash: date111: command not found
-bash: date444: command not found
hi my name is bash and i am shell of linux based OS 
hi my name is bashand i am shell of linux based OS 
-bash: lslll: command not found
-bash: lslll: command not found
[learntechbyme@rhel9-common ~]$ cat  ashu.txt   | grep -i bash 
-bash: kkkk: command not found
-bash: date111: command not found
-bash: date444: command not found
hi my name is bash and i am shell of linux based OS 
hi my name is bashand i am shell of linux based OS 
hi my name is Bash and i am not shell of linux based OS 
hi my name is BASH and i am not shell of linux based OS 
-bash: lslll: command not found
-bash: lslll: command not found
[learntechbyme@rhel9-common ~]$ cat  ashu.txt   | grep -i bash  | wc -l 
9
[learntechbyme@rhel9-common ~]$ cat  ashu.txt   | grep -i bash  | wc -w
78
[learntechbyme@rhel9-common ~]$ cat  ashu.txt   | grep -i bash  | wc -c
382
[learntechbyme@rhel9-common ~]$ cat  ashu.txt   | grep -i bash  | wc -c  >char.txt
[learntechbyme@rhel9-common ~]$ 



```

### Doing Reverse pattern match 

```
[learntechbyme@rhel9-common ~]$ cat ashu.txt | grep -iv  bash
Fri Mar 28 07:40:26 AM UTC 2025
Fri Mar 28 07:42:26 AM UTC 2025
     March 2025     
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31               
hi my name is Aash and i am not shell of linux based OS 
alkesh
delvexdrive
g6391782926vs
jitendersingh_tanwar_7665
learntechbyme
ritik
surbhiveerwani
vikas
yashvi20jain
alkesh
delvexdrive
g6391782926vs
jitendersingh_tanwar_7665
learntechbyme
ritik
surbhiveerwani
vikas
yashvi20jain

```
