# Linux10_网络配置

## 1.NAT网络

![image-20240726190111736](Linux10_网络配置.assets/image-20240726190111736.png)

___

## 2.设置ip

![image-20240726192229667](Linux10_网络配置.assets/image-20240726192229667.png)

![image-20240726192325901](Linux10_网络配置.assets/image-20240726192325901.png)

![image-20240726193554832](Linux10_网络配置.assets/image-20240726193554832.png)

### 第二种：

#### cd /etc/sysconfig/network-scripts

#### vim ifcfg-ens33

#### 把BOOTPROTO改成"static"

#### 加入：

#### IPADDR="192.168.200.130"	ip地址

#### GATEWAY="192.168.200.2"	网关

#### DNS1="192.168.200.2"		域名解释器

### 再去虚拟机网络界面修改子网和NAT设置

<img src="Linux10_网络配置.assets/image-20240726205452954.png" alt="image-20240726205452954" style="zoom:50%;" />	

### 重启完成

___

## 3.修改主机名

![image-20240726200601010](Linux10_网络配置.assets/image-20240726200601010.png)

### 修改主机名：vim /etc/hostname

![image-20240726201038640](Linux10_网络配置.assets/image-20240726201038640.png)

### 原理：

![image-20240726205141474](Linux10_网络配置.assets/image-20240726205141474.png)