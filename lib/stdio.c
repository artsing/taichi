#include <stdio.h>
#include <user.h>
#include <fcntl.h>

struct __stdio_file
{
    int flags;
    char *buffer;		/* Base of buffer.  */
    size_t bufsize;		/* Size of the buffer.  */

    int fd;
    char* name;
};

/**
 * Open a file and create a new stream for it.
 */
FILE *fopen (const char *filename, const char *mode) {
    int fd;
    int flags = O_RDONLY;
    FILE* file;

    if (filename == NULL || mode == NULL) {
        return NULL;
    }

    if (mode[0] == 'r') {
        flags = O_RDONLY;
    } else if(mode[0] == 'w'){
        flags = O_WRONLY;
    } else {
        fd = O_RDWR;
    }

    fd = open(filename, flags);
    if (fd < 0) {
        return NULL;
    }

    file = malloc(sizeof(FILE));
    if (file < 0) {
        return NULL;
    }

    file->fd = fd;
    strcpy(file->name, filename);
    file->buffer = malloc(sizeof(BUFSIZ));
    if (file->buffer < 0) {
        free(file);
        close(fd);
        return NULL;
    }
    file->bufsize = BUFSIZ;

    return file;
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
int fclose (FILE *stream) {
    free(stream->buffer);
    free(stream);

    close(stream->fd);
    return 1;
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
int fseek (FILE *stream, long int offset, int whence) {
    return -1;
}

/**
 * Return the current position of STREAM.
 */
long int ftell (FILE *stream) {
    return -1;
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
int fgetc (FILE *stream) {
    return -1;
}
int getc (FILE *stream) {
    return -1;
}

/**
 * Write a character to STREAM.
 */
int fputc (int c, FILE *stream) {
    return -1;
}
int putc (int c, FILE *stream) {
    return -1;
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
    return 0;
}

/**
 * Write chunks of generic data to STREAM.
 */
size_t fwrite (const void *ptr, size_t size, size_t n, FILE *s) {
    return 0;
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



