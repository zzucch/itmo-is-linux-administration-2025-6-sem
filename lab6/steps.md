# лабораторная 6, вариант 4

по условию система с установленной DE должна загружаться до рабочего стола

снимок исходного состояния виртуальной машины

![image](https://github.com/user-attachments/assets/a87b37d4-f09e-4bc3-b7a7-098cf2c36ba4)

анализ:

ошибки при старте lightdm.service

dpkg --verify lightdm
```
??5??????  /usr/sbin/lightdm
```

cat /usr/sbin/lightdm
```bash
#!/bin/bash
echo "Oh no. X Server... It's broken"
exit -22
```

восстановление состояния:

1. при запуске выбрать `Advanced options for Debian GNU/Linux`
2. затем выбрать `Debian GNU/Linux, with Linux 6.1.0-31-amd64 (recovery mode)`
3. ввести пароль root-пользователя
4. `apt install lightdm --reinstall`
5. `reboot`

результат:

![image](https://github.com/user-attachments/assets/c0f87afb-dcac-4660-aa27-5db62e4adce5)

![image](https://github.com/user-attachments/assets/9c4d74b0-154d-4b85-8fd7-283ddc1fbca0)
