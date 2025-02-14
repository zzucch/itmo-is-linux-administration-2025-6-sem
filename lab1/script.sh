#!/usr/bin/env bash

log_filename="work3.log"
echo "" >"$log_filename"

# Task 1
while IFS=: read -r line; do
    username=$(echo "$line" | cut -d : -f1)
    user_id=$(echo "$line" | cut -d : -f3)

    echo "user $username has id $user_id" >>"$log_filename"
done </etc/passwd

# Task 2
chage -l root | grep "Last password change" | cut -d : -f2 >>"$log_filename"

# Task 3
cut -d: -f1 /etc/group | tr '\n' ',' | sed 's/,$/\n/' >>"$log_filename"

# Task 4
echo "Be careful!" >/etc/skel/readme.txt

# Task 5
useradd -m -p "$(openssl passwd -6 -salt "-------" "12345678")" u1

# Task 6
groupadd g1

# Task 7
usermod -aG g1 u1

# Task 8
id u1 >>"$log_filename"

# Task 9
usermod -aG g1 myuser

# Task 10
grep "g1" /etc/group | cut -d: -f4 >>"$log_filename"

# Task 11
usermod -s /usr/bin/mc u1

# Task 12
useradd -m -p "$(openssl passwd -6 -salt "-------" "87654321")" u2

# Task 13
mkdir /home/test13
cp "$log_filename" /home/test13/work3-1.log
cp "$log_filename" /home/test13/work3-2.log

# Task 14
usermod -aG u1 u2
chown -R u1:u1 /home/test13
chmod u+rwx,g+rx-w,o-rwx /home/test13
chmod u+rw-x,g+r-wx,o-rwx /home/test13/*

# Task 15
mkdir /home/test14
chown u1:u1 /home/test14
chmod +t /home/test14

# Task 16
cp "$(which nano)" /home/test14/
chmod u+s /home/test14/nano

# Task 17
mkdir /home/test15
touch /home/test15/secret_file
chmod u+x,g+x,o+x /home/test15
chmod u+r,g+r,o+r /home/test15/secret_file

# Task 18
echo "u1 ALL=(root) /usr/bin/passwd" >/etc/sudoers.d/u1
