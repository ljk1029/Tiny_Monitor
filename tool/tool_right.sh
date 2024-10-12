#!/bin/bash

# Copyright Notice
copyright_notice=$(cat << 'EOF'
////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//    Copyright© 2023 JK Li. All Rights Reserved.                             //
//                                                                            //
//  All content within this software (including but not limited to text,      //
//  images, audio, video, designs, color schemes, graphic styles, logos, etc.)//
//  is protected under International Copyright Laws. Unauthorized copying,    //
//  publishing, distributing, or any form of usage of the content from this   //
//  software, whether in digital or physical form, is strictly prohibited     //
//  without the prior written consent of JK Li.                               //
//                                                                            //
//  Any unauthorized reproduction or use of the materials contained within    //
//  this software constitutes an infringement of the copyright owner's rights //
//  and may be subject to prosecution under copyright law. For such           //
//  unauthorized activities, you may be held liable to JK Li for any and      //
//  all damages (including the recovery of attorney's fees) that may arise    //
//  as a result of your infringement.                                         //
//                                                                            //
//  Please respect the copyright and contribute to a healthy digital          //
//  environment.                                                              //
////////////////////////////////////////////////////////////////////////////////
EOF
)

# 版权声明中文版
copyright_notice_cn=$(cat << 'EOF'
////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//    Copyright© 2023 李 (JK Li). All Rights Reserved.                        //
//                                                                            //
//  本软件中的所有内容（包括但不限于文本、图片、音频、视频、设计、                //
//  颜色方案、图形样式、标识等）均受国际版权法的保护。未经JK Li                  //
//  先生事先书面许可，不得以任何形式（无论是数字形式还是线下形式）                //
//  复制、传播或使用本软件中的任何内容。                                        //
//                                                                            //
//  任何未经授权的复制、出版、传播或分发本软件中的版权作品，均属侵犯              //
//  版权所有人的权利，可能会受到著作权法的保护。对于此类非法行为，您              //
//  将对JK Li先生承担包括但不限于损害赔偿（包括律师费用的追回）在内的             //
//  全部责任。                                                                 //
//                                                                            //
//  请尊重版权，共创良好网络环境。                                              //
////////////////////////////////////////////////////////////////////////////////
EOF
)



# 函数：显示使用说明
function usage() {
    echo "Usage: $0 <file1> [<file2> ...]" 
    echo "       $0 all [type-c|type-cpp|type-h]"
    echo "       $0 -h"
}

# 检查是否提供了文件路径
function check_input() {
    if [ $# -eq 0 ]; then
        usage
        exit 1
    fi
}

# 函数：在文件顶部添加版权声明
# 函数：在文件顶部添加版权声明
function add_copyright_notice() {
    local file=$1
    if [ -f "$file" ]; then
        # 检查文件顶部是否已经包含版权声明
        if grep -q "Copyright© 2020 Xsense.ai Inc., Xmotors.ai Inc. and Xiaopeng Motors" "$file"; then
            echo "Copyright notice already exists in $file"
        else
            echo "$copyright_notice" | cat - "$file" > temp && mv temp "$file"
            echo "Added copyright notice to $file"
        fi
    else
        echo "File $file does not exist"
    fi
}

# 主函数
function process_main() {
    check_input "$@"
    if [ "$1" == "-h" ]; then
        usage
        exit 0
    elif [ "$1" == "all" ]; then
        # 查找并处理所有文件
        find . -type f | while read -r file; do
            add_copyright_notice "$file"
        done
    elif [ "$1" == "type-c" ]; then
        # 查找并处理所有 .c 文件
        find . -type f -name "*.c" | while read -r file; do
            add_copyright_notice "$file"
        done
    elif [ "$1" == "type-cpp" ]; then
        # 查找并处理所有 .cpp 文件
        find . -type f -name "*.cpp" | while read -r file; do
            add_copyright_notice "$file"
        done
    elif [ "$1" == "type-h" ]; then
        # 查找并处理所有 .h 文件
        find . -type f -name "*.h" | while read -r file; do
            add_copyright_notice "$file"
        done
    else
        # 处理指定的文件
        for file in "$@"; do
            add_copyright_notice "$file"
        done
    fi
}

# 执行主函数    
process_main "$@"
