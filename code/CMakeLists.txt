# 设置版本
cmake_minimum_required(VERSION 3.10)
project(TinyMonitor)

# 根路径
#CMAKE_SOURCE_DIR
# 当前路径
#CMAKE_CURRENT_SOURCE_DIR

# 生成gdb的调试信息和不进行代码优化 
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0 -g") 
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -g")

# 设置输出目录
set(OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../build/output)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_DIRECTORY}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_DIRECTORY}/lib)
set(CMAKE_INCLUDE_OUTPUT_DIRECTORY ${OUTPUT_DIRECTORY}/include)

# 拷贝输出文件
file(MAKE_DIRECTORY ${CMAKE_INCLUDE_OUTPUT_DIRECTORY})
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/manager.h ${CMAKE_INCLUDE_OUTPUT_DIRECTORY} COPYONLY)

# 设置开源库
#link_directories(./thirdparty/protobuf/lib)
#find_library(LIB_PROTOBUF protobuf HINTS ./thirdparty/protobuf/lib) 

# 添加头文件
include_directories(${CMAKE_CURRENT_SOURCE_DIR}) 
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/core) 
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/network) 
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/process)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/system)  

# 添加所有源文件
file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

# 剔除特殊文件
list(REMOVE_ITEM SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp")

# 生成可执行文件
add_executable(main 
    main.cpp
    ${SOURCES}
)

# 生成动态库
add_library(tiny_monitor SHARED ${SOURCES})

# 链接库
target_link_libraries(main 
    # -lpthread 
) 

# 添加子模块构建
#add_subdirectory(base_file)