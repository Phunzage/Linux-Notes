#!/bin/bash

# 案例1：定义变量A
A=100

echo A=$A
echo 'A=$A'
echo "A=$A"

# 撤销变量
unset A

echo A=$A

# 静态变量

readonly B=2
echo $B

C=`date`

echo $C
