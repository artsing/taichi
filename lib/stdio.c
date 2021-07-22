#include <stdio.h>
#include <user.h>
#include <fcntl.h>

struct __stdio_file
{
    int fd;
    int readable;
};

static FILE stdin_const = {0, 0};
static FILE stdout_const = {1, 0};
static FILE stderr_const = {2, 0};
/*
FILE *stdin = &stdin_const;
FILE *stdout = &stdout_const;
FILE *stderr = &stdout_const;
*/
/**
 * Open a file and create a new stream for it.
 */
FILE *fopen(const char *restrict filename, const char *restrict mode) {
    int omode = O_RDWR; //HACK
    if(mode == 0){
        omode = O_RDONLY;
    }
    char fname[2048]; //HACK
    int fd = open(strncpy(&fname[0], filename, 2048), omode);
    FILE *result = malloc(sizeof(FILE));
    result->fd = fd;

    return result;
}

/**
 * Open a file, replacing an existing stream with it.
 */
FILE *freopen (const char *filename, const char *modes, FILE *stream) {
    return NULL;
}

/**
 * Create a new stream that refers to an existing system file descriptor.
 */
FILE *fdopen (int __fd, const char *__modes) {
    return NULL;
}

/**
 * Close STREAM.
 */
int fclose(FILE *f) {
    return close(f->fd);
}

/* Remove file FILENAME.  */
int remove (const char *filename) {
    return -1;
}

/* Rename file OLD to NEW.  */
int rename (const char *__old, const char *__new) {
    return -1;
}

/**
 * Seek to a certain position on STREAM.
 */
int fseek(FILE *stream, long offset, int whence) {
    if(whence == SEEK_CUR){
        int result = seek(stream->fd, offset);
        if(result < 0){
            return -1;
        }
        return 0;
    }
    return -1; //not supported at the moment
}

/**
 * Return the current position of STREAM.
 */
long ftell(FILE *stream) {
    int result = seek(stream->fd, 0);
    if(result < 0){
        return -1;
    }
    return result;
}

/**
 * Flush STREAM, or all streams if STREAM is NULL.
 */
int fflush (FILE *stream) {
    return -1;
}

/**
 * Rewind to the beginning of STREAM.
 */
void rewind (FILE *stream) {
    //return -1;
}

/**
 * Read a character from STREAM.
 */
int fgetc(FILE *stream) {
    if(stream->readable == -1){
        return EOF;
    }
    unsigned char buf = EOF;
    stream->readable = read(stream->fd, &buf, sizeof(buf)) == sizeof(buf) ? 1 : -1;
    if(stream->readable == -1){
        return EOF;
    }
    return (int)buf;
}
int getc(FILE *stream) {
    if(stream->readable == -1){
        return EOF;
    }
    unsigned char buf = EOF;
    stream->readable = read(stream->fd, &buf, sizeof(buf)) == sizeof(buf) ? 1 : -1;
    if(stream->readable == -1){
        return EOF;
    }
    return (int)buf;
}

char *fgets(char *restrict buf, int n, FILE *restrict stream) {
    /*
        The fgets( ) function shall read bytes from stream into the array pointed to by s, until n−1 bytes
        are read, or a <newline> is read and transferred to s, or an end-of-file condition is encountered.
        The string is then terminated with a null byte.
        -- POSIX Base Definitions, Issue 6 - page 368
    */

    for(int i = 0; i != (n - 1); i++){
        int c = fgetc(stream);
        if(c == EOF){
            buf[i] = '\0';
            break;
        }
        buf[i] = (char)c;
        buf[i+1] = '\0'; //this only is safe because we're looping until n-1

        if(c == '\n'){
            //unlike the test for EOF, we want to
            //copy the newline to the output buffer
            //before we conclude.
            break;
        }
    }
    return buf;
}

/**
 * Write a character to STREAM.
 */
int fputc (int c, FILE *f) {
    write(f->fd, &c, 1);
    return 1;
}
int putc (int c, FILE *f) {
    write(f->fd, &c, 1);
    return 1;
}

/**
 * Write a string to STREAM.
 */
int fputs (const char *s, FILE *stream) {
    return -1;
}

/**
 * Write a string, followed by a newline, to stdout.
 */
int puts (const char *s) {
    return -1;
}

/**
 * Push a character back onto the input buffer of STREAM.
 */
int ungetc (int c, FILE *stream) {
    return -1;
}


/**
 * Read chunks of generic data from STREAM.
 */
size_t fread (void *ptr, size_t size, size_t n, FILE *stream) {
    return -1;
}

/**
 * Write chunks of generic data to STREAM.
 */
size_t fwrite (const void *ptr, size_t size, size_t n, FILE *s) {
    return -1;
}

/**
 * If BUF is NULL, make STREAM unbuffered.
 * Else make it use buffer BUF, of size BUFSIZ.
 */
void setbuf (FILE *stream, char *buf) {
    //return -1;
}

/**
 * Make STREAM use buffering mode MODE.
 * If BUF is not NULL, use N bytes of it for buffering;
 * else allocate an internal buffer N bytes long.
 */
int setvbuf (FILE *stream, char *buf, int modes, size_t n) {
    return -1;
}

/**
 * Clear the error and EOF indicators for STREAM.
 */
void clearerr (FILE *stream) {
    //return -1;
}

/**
 * Return the EOF indicator for STREAM.
 */
int feof (FILE *stream) {
    return -1;
}

/**
 * Return the error indicator for STREAM.
 */
int ferror (FILE *stream) {
    return -1;
}

/**
 * Get STREAM's position.
 */
int fgetpos(FILE *stream, fpos_t *pos) {
    return -1;
}

/**
 * Set STREAM's position.
 */
int fsetpos(FILE *stream, const fpos_t *pos) {
    return -1;
}

/**
 * Create a temporary file and open it read/write.
 */
FILE *tmpfile (void) {
    return NULL;
}

/**
 * Generate a temporary filename.
 */
char *tmpnam (char *s) {
    return NULL;
}


/**
 * Read a character from stdin.
 */
int getchar (void) {
    return -1;
}


/**
 * Write a character to stdout.
 */
int putchar (int c) {
    return -1;
}



