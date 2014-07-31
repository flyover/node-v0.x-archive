#if defined(USE_UV_WRAP)

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <dlfcn.h>

char*	(*uv_wrap_getcwd	)(char* buf, size_t size)								= getcwd;
int		(*uv_wrap_chdir		)(const char* path)										= chdir;
int		(*uv_wrap_stat		)(const char* path, struct stat* buf)					= stat;
int		(*uv_wrap_lstat		)(const char* path, struct stat* buf)					= lstat;
int		(*uv_wrap_open		)(const char* path, int flags, ...)						= open;
int		(*uv_wrap_close		)(int fd)												= close;
int		(*uv_wrap_fstat		)(int fd, struct stat* buf)								= fstat;
ssize_t	(*uv_wrap_read		)(int fd, void* buf, size_t count)						= read;
ssize_t	(*uv_wrap_pread		)(int fd, void* buf, size_t count, off_t offset)		= pread;
ssize_t	(*uv_wrap_write		)(int fd, const void* buf, size_t count)				= write;
ssize_t	(*uv_wrap_pwrite	)(int fd, const void* buf, size_t count, off_t offset)	= pwrite;
void*	(*uv_wrap_dlopen	)(const char* filename, int flag)						= dlopen;
char*	(*uv_wrap_dlerror	)(void)													= (char*(*)(void)) dlerror;
void*	(*uv_wrap_dlsym		)(void* handle, const char* symbol)						= dlsym;
int		(*uv_wrap_dlclose	)(void* handle)											= dlclose;

#endif /* defined(USE_UV_WRAP) */

