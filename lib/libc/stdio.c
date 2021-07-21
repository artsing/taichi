#include <stdio.h>

struct __stdio_file
{
  /* Magic number for validation.  Must be negative in open streams
     for the glue to Unix stdio getc/putc to work.
     NOTE: stdio/glue.c has special knowledge of these first four members.  */
  int __magic;
#define	_IOMAGIC	0xfedabeeb	/* Magic number to fill `__magic'.  */
#define	_GLUEMAGIC	0xfeedbabe	/* Magic for glued Unix streams.  */

  char *__bufp;			/* Pointer into the buffer.  */
  char *__get_limit;		/* Reading limit.  */
  char *__put_limit;		/* Writing limit.  */

  char *__buffer;		/* Base of buffer.  */
  size_t __bufsize;		/* Size of the buffer.  */
  __ptr_t __cookie;		/* Magic cookie.  */
  __io_mode __mode;		/* File access mode.  */
  __io_functions __io_funcs;	/* I/O functions.  */
  __room_functions __room_funcs;/* I/O buffer room functions.  */
  fpos_t __offset;		/* Current file position.  */
  fpos_t __target;		/* Target file position.  */
  FILE *__next;			/* Next FILE in the linked list.  */
  char *__pushback_bufp;	/* Old bufp if char pushed back.  */
  unsigned char __pushback;	/* Pushed-back character.  */
  unsigned int __pushed_back:1;	/* A char has been pushed back.  */
  unsigned int __eof:1;		/* End of file encountered.  */
  unsigned int __error:1;	/* Error encountered.  */
  unsigned int __userbuf:1;	/* Buffer from user (should not be freed).  */
  unsigned int __linebuf:1;	/* Flush on newline.  */
  unsigned int __linebuf_active:1; /* put_limit is not really in use.  */
  unsigned int __seen:1;	/* This stream has been seen.  */
  unsigned int __ispipe:1;	/* Nonzero if opened by popen.  */
};
