#ifndef _STDIO_H_
#define _STDIO_H_

#include <stdint.h>
#include <stddef.h>
#include <stdarg.h>

/* The possibilities for the third argument to `setvbuf'.  */
#define _IOFBF 0		/* Fully buffered.  */
#define _IOLBF 1		/* Line buffered.  */
#define _IONBF 2		/* No buffering.  */

/* Default buffer size.  */
#define	BUFSIZ 8192

/* End of file character.
   Some things throughout the library rely on this being -1.  */
#define	EOF	(-1)

/* The possibilities for the third argument to `fseek'.
   These values should not be changed.  */
#define	SEEK_SET	0	/* Seek from beginning of file.  */
#define	SEEK_CUR	1	/* Seek from current position.  */
#define	SEEK_END	2	/* Seek from end of file.  */

/* Maximum number of files that can be open at once. */
#define FOPEN_MAX 100

/* Maximum length of a filename. */
#define FILENAME_MAX 14

/* temp file */
#define L_tmpnam 14
#define TMP_MAX 10

typedef struct __stdio_file FILE;
typedef long fpos_t;

/* Standard streams.  */
extern FILE *stdin;		/* Standard input stream.  */
extern FILE *stdout;	/* Standard output stream.  */
extern FILE *stderr;	/* Standard error output stream.  */

/* C89/C99 say they're macros.  Make them happy.  */
#define stdin stdin
#define stdout stdout
#define stderr stderr

/**
 * Open a file and create a new stream for it.
 */
extern FILE *fopen (const char *filename, const char *mode);

/**
 * Open a file, replacing an existing stream with it.
 */
extern FILE *freopen (const char *filename, const char *modes, FILE *stream);

/**
 * Create a new stream that refers to an existing system file descriptor.
 */
extern FILE *fdopen (int __fd, const char *__modes);

/**
 * Close STREAM.
 */
extern int fclose (FILE *stream);

/* Remove file FILENAME.  */
extern int remove (const char *filename);

/* Rename file OLD to NEW.  */
extern int rename (const char *__old, const char *__new);

/**
 * Seek to a certain position on STREAM.
 */
extern int fseek (FILE *stream, long int offset, int whence);

/**
 * Return the current position of STREAM.
 */
extern long int ftell (FILE *stream);

/**
 * Flush STREAM, or all streams if STREAM is NULL.
 */
extern int fflush (FILE *stream);

/**
 * Rewind to the beginning of STREAM.
 */
extern void rewind (FILE *stream);

/**
 * Read a character from STREAM.
 */
extern int fgetc (FILE *stream);
extern int getc (FILE *stream);

extern char *fgets(char *restrict buf, int n, FILE *restrict stream);

/**
 * Write a character to STREAM.
 */
extern int fputc (int c, FILE *stream);
extern int putc (int c, FILE *stream);

/**
 * Write a string to STREAM.
 */
extern int fputs (const char *s, FILE *stream);

/**
 * Write a string, followed by a newline, to stdout.
 */
extern int puts (const char *s);

/**
 * Push a character back onto the input buffer of STREAM.
 */
extern int ungetc (int c, FILE *stream);


/**
 * Read chunks of generic data from STREAM.
 */
extern size_t fread (void *ptr, size_t size, size_t n, FILE *stream);

/**
 * Write chunks of generic data to STREAM.
 */
extern size_t fwrite (const void *ptr, size_t size, size_t n, FILE *s);

/**
 * If BUF is NULL, make STREAM unbuffered.
 * Else make it use buffer BUF, of size BUFSIZ.
 */
extern void setbuf (FILE *stream, char *buf);

/**
 * Make STREAM use buffering mode MODE.
 * If BUF is not NULL, use N bytes of it for buffering;
 * else allocate an internal buffer N bytes long.
 */
extern int setvbuf (FILE *stream, char *buf, int modes, size_t n);

/**
 * Clear the error and EOF indicators for STREAM.
 */
extern void clearerr (FILE *stream);

/**
 * Return the EOF indicator for STREAM.
 */
extern int feof (FILE *stream);

/**
 * Return the error indicator for STREAM.
 */
extern int ferror (FILE *stream);

/**
 * Get STREAM's position.
 */
extern int fgetpos(FILE *stream, fpos_t *pos);

/**
 * Set STREAM's position.
 */
extern int fsetpos(FILE *stream, const fpos_t *pos);

/**
 * Create a temporary file and open it read/write.
 */
extern FILE *tmpfile (void);

/**
 * Generate a temporary filename.
 */
extern char *tmpnam (char *s);

/**
 * Read a character from stdin.
 */
extern int getchar (void);

/**
 * Write a character to stdout.
 */
extern int putchar (int c);

/**
 * get fd
 */
extern int fgetfd(FILE *stream);

#endif /* _STDIO_H_ */
