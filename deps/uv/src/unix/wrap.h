#ifndef UV_UNIX_WRAP_H_
#define UV_UNIX_WRAP_H_

#if defined(USE_UV_WRAP)

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <dlfcn.h>

extern char*	(*uv_wrap_getcwd	)(char *buf, size_t size);
extern int		(*uv_wrap_chdir		)(const char *path);
extern int		(*uv_wrap_stat		)(const char *path, struct stat *buf);
extern int		(*uv_wrap_lstat		)(const char *path, struct stat *buf);
extern int		(*uv_wrap_open		)(const char* path, int flags, ...);
extern int		(*uv_wrap_close		)(int fd);
extern int		(*uv_wrap_fstat		)(int fd, struct stat *buf);
extern ssize_t	(*uv_wrap_read		)(int fd, void *buf, size_t count);
extern ssize_t	(*uv_wrap_pread		)(int fd, void *buf, size_t count, off_t offset);
extern ssize_t	(*uv_wrap_write		)(int fd, const void *buf, size_t count);
extern ssize_t	(*uv_wrap_pwrite	)(int fd, const void *buf, size_t count, off_t offset);
extern void*	(*uv_wrap_dlopen	)(const char *filename, int flag);
extern char*	(*uv_wrap_dlerror	)(void);
extern void*	(*uv_wrap_dlsym		)(void *handle, const char *symbol);
extern int		(*uv_wrap_dlclose	)(void *handle);

#define getcwd	uv_wrap_getcwd
#define chdir	uv_wrap_chdir
//#define stat	uv_wrap_stat
#define lstat	uv_wrap_lstat
#define open	uv_wrap_open
#define close	uv_wrap_close
#define fstat	uv_wrap_fstat
#define read	uv_wrap_read
#define pread	uv_wrap_pread
#define write	uv_wrap_write
#define pwrite	uv_wrap_pwrite
#define dlopen	uv_wrap_dlopen
#define dlerror	uv_wrap_dlerror
#define dlsym	uv_wrap_dlsym
#define dlclose	uv_wrap_dlclose

#endif /* defined(USE_UV_WRAP) */

#endif /* UV_UNIX_WRAP_H_ */

