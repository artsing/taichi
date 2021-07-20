#ifndef _STDDEF_H_
#define _STDDEF_H_

#ifndef __PTRDIFF_TYPE__
#define __PTRDIFF_TYPE__ long int
typedef __PTRDIFF_TYPE__ ptrdiff_t;
#endif

#ifndef __SIZE_T__
#define __SIZE_T__ uint32_t
typedef uint32_t size_t;
#endif

#ifndef __WCHAR_T__
#define __WCHAR_T__ int
typedef __WCHAR_T__ wchar_t;
#endif

#ifndef NULL
#define NULL ((void*) 0)
#endif

#ifndef __OFFSETOF__
#define __OFFSETOF__
#define offsetof(type, member)  ((size_t) (&((type*)0)->member))
#endif

#endif /* _STDDEF_H_ */
