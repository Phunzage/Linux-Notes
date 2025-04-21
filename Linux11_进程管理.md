# Linux11_进程管理

## 1.基本介绍

![image-20240727153640392](Linux11_进程管理.assets/image-20240727153640392.png)

### windows的pid

![image-20240727153744805](Linux11_进程管理.assets/image-20240727153744805.png)

___

## 2.Linux查看进程

![image-20240727161429254](Linux11_进程管理.assets/image-20240727161429254.png)

### 一般 ps -aux 三个混合使用，使用 more 进行筛选

![image-20240727162558813](Linux11_进程管理.assets/image-20240727162558813.png)

![image-20240727162623627](Linux11_进程管理.assets/image-20240727162623627.png)

![image-20240727174313013](Linux11_进程管理.assets/image-20240727174313013.png)

## 3.终止进程

![image-20240727175035744](Linux11_进程管理.assets/image-20240727175035744.png)

![image-20240727201706756](Linux11_进程管理.assets/image-20240727201706756.png)

___

## 4.查看进程树

![image-20240727213005664](Linux11_进程管理.assets/image-20240727213005664.png)

___

## 5.服务（进程）管理

### 1.service服务（老版服务，用途较少，CentOS7之前较多）

![image-20240728114713122](Linux11_进程管理.assets/image-20240728114713122.png)

###### <img src="Linux11_进程管理.assets/image-20240728114729395.png" alt="image-20240728114729395" style="zoom:67%;" />	原理图

![image-20240728114802221](Linux11_进程管理.assets/image-20240728114802221.png)

##### <img src="Linux11_进程管理.assets/image-20240728120306441.png" alt="image-20240728120306441" style="zoom: 50%;" />	tab选择

![image-20240728120542619](Linux11_进程管理.assets/image-20240728120542619.png)

![image-20240728122345638](Linux11_进程管理.assets/image-20240728122345638.png)

![image-20240728124231438](Linux11_进程管理.assets/image-20240728124231438.png)

___

### 2.systemctl（新版服务，用途较多，CentOs7之后）

![image-20240728194856204](Linux11_进程管理.assets/image-20240728194856204.png)

___

## 6.防火墙与进程相关

![image-20240728194833182](Linux11_进程管理.assets/image-20240728194833182.png)

![image-20240728202538923](Linux11_进程管理.assets/image-20240728202538923.png)

### 以远程登陆 telnet 为例

### telnet成功的两个条件：1.防火墙关闭防护；2.防火墙开启防护 但 防火墙内的端口开启（如6下图）

#### 1.开关防火墙用5.2 systemctl 命令

#### 2.打开防火墙的端口相关：

##### firewall-cmd --permanent --add-port=端口号/协议：打开端口

##### firewall-cmd --permanent --remove-port=端口号/协议：关闭端口

##### firewall-cmd --reload：重新载入生效

##### firewall-cmd --query-port=端口/协议：查看端口是否开放

___

## 7.动态查看进程top

![image-20240728210608085](Linux11_进程管理.assets/image-20240728210608085.png)

![image-20240728211010517](Linux11_进程管理.assets/image-20240728211010517.png)

![image-20240728212634380](Linux11_进程管理.assets/image-20240728212634380.png)	

![image-20240728214630249](Linux11_进程管理.assets/image-20240728214630249.png)

___

## 8.监控网络状态

![image-20240729092722985](Linux11_进程管理.assets/image-20240729092722985.png)

![image-20240729093628159](Linux11_进程管理.assets/image-20240729093628159.png)

### （协议	接收	发送	本地地址				外部地址				状态			pid）
