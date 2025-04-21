# Linux05_用户管理

![image-20240714102556269](Linux05_用户管理.assets/image-20240714102556269.png)

### 1.添加用户

![image-20240713212746128](Linux05_用户管理.assets/image-20240713212746128.png)

![image-20240713213718773](Linux05_用户管理.assets/image-20240713213718773.png)	

> [!NOTE]
>
> 注意：
>
> ​	1）创建新用户要在root用户下创建
>
> ​	2）两种代码格式：
>
> ```
> 	1.useradd john（用户名）
> 	2.useradd -d /home/test phz（在home文件夹下创建了一个属于phz用户的文件夹test）
> ```

### 2.更改用户密码

![image-20240713214738790](Linux05_用户管理.assets/image-20240713214738790.png)	

### 3.删除用户

<img src="Linux05_用户管理.assets/image-20240713215458893.png" alt="image-20240713215458893" style="zoom: 50%;" />	

### 4.访问用户信息

<img src="Linux05_用户管理.assets/image-20240714090009310.png" alt="image-20240714090009310" style="zoom:50%;" />	

### 5.切换用户

![image-20240714093026789](Linux05_用户管理.assets/image-20240714093026789.png)

> [!NOTE]
>
> ###### 	都可一直回退到上个用户，但 logout 更专注于结束登录会话，而 exit 是一个更通用的命令，用于从各种环境退出
>
> ###### 	在Linux图形界面的终端，可以使用 exit 以退出终端



### 6.查看当前用户/登录用户

![image-20240714094216782](Linux05_用户管理.assets/image-20240714094216782.png)

![image-20240714094410428](Linux05_用户管理.assets/image-20240714094410428.png)	

### 7.用户组相关

![image-20240714095947232](Linux05_用户管理.assets/image-20240714095947232.png)

<img src="Linux05_用户管理.assets/image-20240714101211391.png" alt="image-20240714101211391" style="zoom:50%;" />	

​	

> [!NOTE]
>
> 未定义组而直接 useradd 用户，则此用户默认在以这个用户名命名的组中
>
> ![image-20240714095437069](Linux05_用户管理.assets/image-20240714095437069.png)

![image-20240714103045882](Linux05_用户管理.assets/image-20240714103045882.png)

![image-20240714103234000](Linux05_用户管理.assets/image-20240714103234000.png)