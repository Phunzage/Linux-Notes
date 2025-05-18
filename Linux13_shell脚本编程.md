## shell脚本编程

shell 是一个命令行解释器，它为用户提供了一个向linux内核发送请求以便运行程序的界面系统级程序，用户可以用shell来启动、挂起、停止甚至是编写一些程序
由外向内的关系：外层应用程序 -> shell命令解释器 -> 内核 -> 硬件

### 脚本格式要求

1. 脚本以#!/bin/bash开头
2. 脚本必须有可执行权限

### 脚本执行方式

1. 使用chmod赋予x权限
2. 不用赋予脚本权限，直接使用 sh + 脚本的方式来执行脚本

---
## shell 变量

linux中shell的变量有系统变量和用户自定义变量
系统变量：$HOME, $PWD, $SHELL, $USER要显示变量，使用 `echo $HOME` 
显示当前系统中的变量：set

定义变量：变量名=值（中间不能有空格）

撤销变量：unset 变量

声明静态变量：readonly 变量，静态变量不能unset

### shell变量的定义

> 定义变量的规则
1. 变量名称可以由字母数字下划线组成，但是不能以数字开头
2. 等号两侧不能有空格
3. 变量名称一般大写

> 将命令的返回值赋给变量
1. A=\`data\`反引号，运行里面的命令，并把结果返回给A
2. A=$(date) 等价于反引号

> 使用变量：使用一个定义过的变量，只要在变量名前面加美元符号即可

```
NAME="Tom"
echo $NAME
```

### 普通变量类型

#### 字符串变量

使用单引号 ' 或双引号 " 来定义字符串

```
MY_STRING='hello world'
or
MY_STRING="hello world"

获取字符串长度
echo ${#MY_STRING}    // 4

提取字符串
echo ${MY_STRING:1:4}    // ello
```
#### 整数变量

在一些Shell中，你可以使用 **declare** 或 **typeset** 命令来声明整数变量。这样的变量只包含整数值，例如：
`declare -i my_integer=42` 这样的声明告诉 Shell 将 my_integer 视为整数，如果尝试将非整数值赋给它，Shell会尝试将其转换为整数。

#### 数组变量

```
创建数组
MY_ARRAY=(1 2 3 4 5)

读取数组
echo ${MY_ARRAY[0]}    // 1

关联数组
declare -A site=(["google"]="www.google.com" ["runoob"]="www.runoob.com" ["taobao"]="www.taobao.com")
或
declare -A site  
site["google"]="www.google.com"  
site["runoob"]="www.runoob.com"  
site["taobao"]="www.taobao.com"

访问数组
echo ${site["google"]}

获取数组所有元素的值
echo "数组的元素为: ${site[*]}"  
echo "数组的元素为: ${site[@]}"

获取数组的所有键
echo "数组的键为: ${!site[*]}"  
echo "数组的键为: ${!site[@]}"

获取数组的长度
echo "数组元素个数为: ${#site[*]}"  
echo "数组元素个数为: ${#site[@]}"
```

### 特殊变量类型
#### 设置环境变量

1. export 变量名=变量值    //将shell变量输出为环境变量
2. source 配置文件    //让修改后的环境变量立即生效
3. echo $变量名    //查询环境变量的值

#### 位置参数变量

什么是位置参数：
当我们执行一个shell脚本的时候，如果希望获取一些输入值，进入shell脚本里面执行一些操作，就可以在执行shell脚本时传入一些参数，这些传入的参数就是位置参数

```
编写：
#!/bin/bash
echo "执行的文件名：$0"
echo "第一个参数为：$1"
echo "第二个参数为：$2"
echo "第三个参数为：$3"

执行：
sh ./test.sh 23 45 67

输出
执行的文件名：./test.sh
第一个参数为：23
第二个参数为：45
第三个参数为：67


#!/bin/bash
echo "0=$0 1=$1 2=$2"
echo "所有的参数=$*"
echo "$@"
echo "参数的个数=$#"

执行：
sh demo3.sh 23 56

输出：
0=demo3 1=23 2=56
所有的参数=23 56
23 56
参数的个数=2
```

> $* 表示命令行中所有的参数，把所有参数看作一个整体
> $@ 表示命令行中所有的参数，把每个参数区分对待
> $# 表示命令行中所有参数的个数

#### 预定义变量

预定义变量是shell设计者事先定义好的变量，可以直接在shell脚本中使用

> \$$ 显示当前进程的进程号
> $! 后台运行的最后一个进程的进程号
> $? 最后一次执行的命令的返回状态，如果这个变量的值为0，证明上一个命令正确执行；
> 若为非0，证明上一条命令执行不不正确


---
## 基本运算

### 运算符

```
# 计算(2+3)*4的值
# 两种方法

RES1=$(((2+3)*4))    // $(())
echo "res1=$RES1"

RES2=$[(2+3)*4]    // $[]
echo "res2=$RES2"

# 求出命令行的两个参数的和
SUM=$[$1+$2]
echo "SUM=$SUM"

运行 sh demo4.sh 20 30
输出：
res1=20
res2=20
sum=50
```

| 关系运算符  | 说明                            | 举例                      |
| ------ | ----------------------------- | ----------------------- |
| -eq    | 检测两个数是否相等，相等返回 true。          | [ $a -eq $b ] 返回 false。 |
| -ne    | 检测两个数是否不相等，不相等返回 true。        | [ $a -ne $b ] 返回 true。  |
| -gt    | 检测左边的数是否大于右边的，如果是，则返回 true。   | [ $a -gt $b ] 返回 false。 |
| -lt    | 检测左边的数是否小于右边的，如果是，则返回 true。   | [ $a -lt $b ] 返回 true。  |
| -ge    | 检测左边的数是否大于等于右边的，如果是，则返回 true。 | [ $a -ge $b ] 返回 false。 |
| -le    | 检测左边的数是否小于等于右边的，如果是，则返回 true。 | [ $a -le $b ] 返回 true。  |
|        |                               |                         |
| 字符串运算符 | 说明                            | 举例                      |
| =      | 检测两个字符串是否相等，相等返回 true。        | [ $a = $b ] 返回 false。   |
| !=     | 检测两个字符串是否不相等，不相等返回 true。      | [ $a != $b ] 返回 true。   |
| -z     | 检测字符串长度是否为0，为0返回 true。        | [ -z $a ] 返回 false。     |
| -n     | 检测字符串长度是否不为 0，不为 0 返回 true。   | [ -n "$a" ] 返回 true。    |
| $      | 检测字符串是否不为空，不为空返回 true。        | [ $a ] 返回 true。         |
### 流程控制

#### if else

if 语句语法格式：

```
if condition
then
    command1 
    command2
    ...
    commandN 
fi
```

if else 语法格式：

```
if condition
then
    command1 
    command2
    ...
    commandN
else
    command
fi
```

if else-if else 语法格式：

```
if condition1
then
    command1
elif condition2 
then 
    command2
else
    commandN
fi
```

if else 的 [...] 判断语句中大于使用 -gt，小于使用 -lt。

```
if [ "$a" -gt "$b" ]; then
    ...
fi
```

如果使用 ((...)) 作为判断语句，大于和小于可以直接使用 > 和 <。

```
if (( a > b )); then
    ...
fi
```

#### for 循环

for循环一般格式为：

```
for var in item1 item2 ... itemN
do
    command1
    command2
    ...
    commandN
done
```

写成一行：

```
for var in item1 item2 ... itemN; do command1; command2… done;
```

当变量值在列表里，for 循环即执行一次所有命令，使用变量名获取列表中的当前取值。命令可为任何有效的 shell 命令和语句。in 列表可以包含替换、字符串和文件名。

in列表是可选的，如果不用它，for循环使用命令行的位置参数。

#### while 语句

while 循环用于不断执行一系列命令，也用于从输入文件中读取数据。其语法格式为：

```
while condition
do
    command
done
```

#### until 循环

until 循环执行一系列命令直至条件为 true 时停止。

until 循环与 while 循环在处理方式上刚好相反。

一般 while 循环优于 until 循环，但在某些时候—也只是极少数情况下，until 循环更加有用。

until 语法格式:

```
until condition
do
    command
done

```
condition 一般为条件表达式，如果返回值为 false，则继续执行循环体内的语句，否则跳出循环。

#### case ... esac

**case ... esac** 为多选择语句，与其他语言中的 switch ... case 语句类似，是一种多分支选择结构，每个 case 分支用右圆括号开始，用两个分号 ;; 表示 break，即执行结束，跳出整个 case ... esac 语句，esac（就是 case 反过来）作为结束标记。

可以用 case 语句匹配一个值与一个模式，如果匹配成功，执行相匹配的命令。

**case ... esac** 语法格式如下：

```
case 值 in
模式1
    command1
    command2
    ...
    commandN
    ;;
模式2
    command1
    command2
    ...
    commandN
    ;;
esac
```

case 工作方式如上所示，取值后面必须为单词 **in**，每一模式必须以右括号结束。取值可以为变量或常数，匹配发现取值符合某一模式后，其间所有命令开始执行直至 ;;。

取值将检测匹配的每一个模式。一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令。

#### 跳出循环

在循环过程中，有时候需要在未达到循环结束条件时强制跳出循环，Shell 使用两个命令来实现该功能：**break** 和 **continue**。

##### break 命令

break 命令允许跳出所有循环（终止执行后面的所有循环）。

##### continue

continue 命令与 break 命令类似，只有一点差别，它不会跳出所有循环，仅仅跳出当前循环。

---
## 函数

函数格式

```
[ function ] funname [()]

{

    action;

    [return int;]

}
```

---

## 输入输出重定向

| 命令              | 说明                             |
| --------------- | ------------------------------ |
| command > file  | 将输出重定向到 file。                  |
| command < file  | 将输入重定向到 file。                  |
| command >> file | 将输出以追加的方式重定向到 file。            |
| n > file        | 将文件描述符为 n 的文件重定向到 file。        |
| n >> file       | 将文件描述符为 n 的文件以追加的方式重定向到 file。  |
| n >& m          | 将输出文件 m 和 n 合并。                |
| n <& m          | 将输入文件 m 和 n 合并。                |
| << tag          | 将开始标记 tag 和结束标记 tag 之间的内容作为输入。 |

---

## Shell 文件包含

和其他语言一样，Shell 也可以包含外部脚本。这样可以很方便的封装一些公用的代码作为一个独立的文件。
### 实例

```
创建两个 shell 脚本文件。

test1.sh 代码如下：

#!/bin/bash
# author:菜鸟教程
# url:www.runoob.com

url="http://www.runoob.com"
```

test2.sh 代码如下：

```
#!/bin/bash
# author:菜鸟教程
# url:www.runoob.com

#使用 . 号来引用test1.sh 文件
. ./test1.sh

# 或者使用以下包含文件代码
# source ./test1.sh

echo "菜鸟教程官网地址：$url"
```

接下来，我们为 test2.sh 添加可执行权限并执行：

```
$ chmod +x test2.sh 
$ ./test2.sh 
菜鸟教程官网地址：http://www.runoob.com
```