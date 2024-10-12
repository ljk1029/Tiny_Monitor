#!/bin/bash

TAR_FILE="XP_ALL.tar.gz"

# 展示当前目录下的文件大小
function check_file_size() {
    du -sh .[!.]* * */
}

# 压缩排除特定文件和目录
function create_tarball() {
    local exclude_list=(
        './.repo'
        './vscode'
        './third_party'
        './toolchains'
        './xpos'
        './xpos.tar'
    )

    local exclude_args=()
    for dir in "${exclude_list[@]}"; do
        exclude_args+=(--exclude="$dir")
    done

    tar "${exclude_args[@]}" -zcvf ${TAR_FILE} ./*
}

# 压缩排除大文件和目录
function auto_create_tarball() {
    local exclude_args=()

    local large_items=$(du -sh .[!.]* * 2>/dev/null | awk '$1 ~ /[0-9\.]+G/ {print $2}')
    for item in $large_items; do
        if [ "$item" != "." ]; then
            echo "Excluding large item: $item"
            exclude_args+=(--exclude="$item")
        fi
    done

    tar "${exclude_args[@]}" -zcvf ${TAR_FILE} ./*
}

# 检查文件大小
check_file_size
# 创建tar包
auto_create_tarball
