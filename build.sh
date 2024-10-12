#!/bin/bash

# 设置项目根目录
PROJECT_ROOT=$(dirname "$(realpath "$0")")

# 设置构建目录
BUILD_DIR="${PROJECT_ROOT}/build"

# 如果构建目录存在，则删除其中所有文件
if [ -d "$BUILD_DIR" ]; then
    rm -rf "$BUILD_DIR"/*
else
    mkdir "$BUILD_DIR"
fi

# 进入构建目录
cd "$BUILD_DIR"

# 运行 cmake 命令生成构建文件
cmake ../code/

# 运行 make 命令进行编译
make

# 返回项目根目录
cd "$PROJECT_ROOT"