#ifndef OS_API_H_
#define OS_API_H_

// 判断操作系统
#if defined(_WIN32) || defined(_WIN64)
    #define OS_WINDOWS
#elif defined(__linux__)
    #define OS_LINUX
#else
    #error "Unsupported OS"
#endif

// 设置库导出 API
#ifdef OS_WINDOWS
    #ifdef BUILD_DLL
        #define OS_API __declspec(dllexport)
    #else
        #define OS_API __declspec(dllimport)
    #endif
#else
    #define OS_API
#endif

#endif // OS_API_H