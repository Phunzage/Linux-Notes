# Linux09_磁盘分区

## 1.原理

![image-20240725150226759](Linux09_磁盘分区.assets/image-20240725150226759.png)

![image-20240725150644820](Linux09_磁盘分区.assets/image-20240725150644820.png)

![image-20240725150658529](Linux09_磁盘分区.assets/image-20240725150658529.png)

![image-20240725152011754](Linux09_磁盘分区.assets/image-20240725152011754.png)

## 2.虚拟机增加硬盘

https://www.bilibili.com/video/BV1Sv411r7vd/?p=59

<img src="Linux09_磁盘分区.assets/image-20240725164046827.png" alt="image-20240725164046827"  />	

![image-20240725165238201](Linux09_磁盘分区.assets/image-20240725165238201.png)

## 2.1具体步骤（一次性挂载）：

<img src="Linux09_磁盘分区.assets/image-20240725163756586.png" alt="image-20240725163756586" style="zoom:50%;" />	

### 1.加载磁盘

##### 	1.虚拟机设置，添加磁盘，此时会多出来一个.vmdk的文件

##### 	2.重启Linux，使磁盘加载，此时使用lsblk查看磁盘信息，显示加载成功

### 2.创建分区

<img src="Linux09_磁盘分区.assets/image-20240725164046827-1723554512446-8.png" alt="image-20240725164046827" style="zoom:33%;" />	

##### 使用fdisk /dev/sdb，进入分区界面，按 m 显示命令列表

<img src="Linux09_磁盘分区.assets/image-20240725164326990.png" alt="image-20240725164326990" style="zoom: 50%;" />	

##### 按 n 创建新分区，按 p 选择创建主分区

<img src="Linux09_磁盘分区.assets/image-20240725164454141.png" alt="image-20240725164454141" style="zoom:50%;" />	

##### 分区号填几就创建几个分区，默认为1，即创建一个分区

<img src="Linux09_磁盘分区.assets/image-20240725164623096.png" alt="image-20240725164623096" style="zoom:50%;" />	

##### 默认时回车

<img src="Linux09_磁盘分区.assets/image-20240725164745995.png" alt="image-20240725164745995" style="zoom:50%;" />	

##### 按 w 保存退出，lsblk 查看，显示分区成功

<img src="Linux09_磁盘分区.assets/image-20240725164828673.png" alt="image-20240725164828673" style="zoom:50%;" />	

<img src="Linux09_磁盘分区.assets/image-20240725165016892.png" alt="image-20240725165016892" style="zoom: 50%;" />	

### 3.格式化分区（指定分区的文件类型）

##### mkfs -t ext4 /dev/sdb1（将 /dev/sdb1 格式化为ext4）

### 4.挂载：将分区与一个目录联系

##### mount 分区名 目录名（e.g. mount /dev/sdb1 /newdisk）

<img src="Linux09_磁盘分区.assets/image-20240725170440870.png" alt="image-20240725170440870" style="zoom:50%;" />	

### 5.卸载分区与目录的关系

##### umount 分区名 目录名（e.g. umount /dev/sdb1 /newdisk）



## 2.2永久挂载：

![image-20240725171306011](Linux09_磁盘分区.assets/image-20240725171306011.png)	

### 进入后用vim 命令yy p复制粘贴输入需要挂载的id等

![image-20240725171612473](Linux09_磁盘分区.assets/image-20240725171612473.png)

___

## 3.磁盘情况查询

<img src="Linux09_磁盘分区.assets/image-20240725172054535.png" alt="image-20240725172054535" style="zoom: 80%;" />	

![image-20240725173049356](Linux09_磁盘分区.assets/image-20240725173049356.png)	

![image-20240725174553534](Linux09_磁盘分区.assets/image-20240725174553534.png)

### 其中：

### grep筛选中的 "^-" 是只筛选文件（文件类型开头为-，见44.）；目录为 "^d" 

### wc -l 为统计个数

### ls -lR：将子文件夹包括在内