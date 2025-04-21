# Linux08_定时任务调度

## 1.crond 任务调度

![image-20240724142952167](Linux08_定时任务调度.assets/image-20240724142952167.png)

![image-20240724143528783](Linux08_定时任务调度.assets/image-20240724143528783.png)

![image-20240724145831354](Linux08_定时任务调度.assets/image-20240724145831354.png)

![image-20240724153421154](Linux08_定时任务调度.assets/image-20240724153421154.png)

![image-20240724194302499](Linux08_定时任务调度.assets/image-20240724194302499.png)

![image-20240724194347765](Linux08_定时任务调度.assets/image-20240724194347765.png)

___

## 2.at定时任务

![image-20240724202440154](Linux08_定时任务调度.assets/image-20240724202440154.png)

![image-20240724202512659](Linux08_定时任务调度.assets/image-20240724202512659.png)

## 查看当前进程：ps -ef

### ps -ef：查看当前全部进程

### ps -ef | grep 进程名：筛选查看进程

![image-20240724202526948](Linux08_定时任务调度.assets/image-20240724202526948.png)

![image-20240724202743477](Linux08_定时任务调度.assets/image-20240724202743477.png)

![image-20240724203852099](Linux08_定时任务调度.assets/image-20240724203852099.png)

### 使用方法：

```
at now + 2 minutes（at + 时间）
at> date > /home/date.txt（具体任务）
Ctrl + D 两次退出编辑
```

> [!NOTE]
>
> #### 查看at任务：atq
>
> #### 删除at任务：atrm 任务编号

