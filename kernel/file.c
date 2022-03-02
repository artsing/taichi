//
// File descriptors
//

#include "types.h"
#include "defs.h"
#include "param.h"
#include "fs.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "file.h"

struct devsw devsw[NDEV];
struct {
  struct spinlock lock;
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
  initlock(&ftable.lock, "ftable");
}

// Allocate a file structure.
struct file*
filealloc(void)
{
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
  f->ref++;
  release(&ftable.lock);
  return f;
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
  else if(ff.type == FD_SOCKET){
    socketclose(ff.socket);
  }
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
    if(f->type == FD_INODE){
        ilock(f->ip);
        stati(f->ip, st);
        iunlock(f->ip);
        return 0;
    }
    return -1;
}

// open file f
int
fileopen(struct file *f)
{
    int r;
    if (f->type == FD_INODE) {
        ilock(f->ip);
        r = openi(f->ip);
        iunlock(f->ip);
        return r;
    }
    return 1;
}

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
    ilock(f->ip);
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  if(f->type == FD_SOCKET)
    return socketread(f->socket, addr, n);
  panic("fileread");
}

// Seek file f
int
fileseek(struct file *f, int offset, int whence) {
    if (f->readable == 0) {
        return -1;
    }

    if (f->type == FD_INODE) {
        if (whence == F_SEEK_SET) {
            f->off = 0;
            return 0;
        } else if (whence == F_SEEK_CUR) {
            f->off += offset;
            return f->off;
        } else if (whence == F_SEEK_END) {
            f->off = f->ip->size;
                return f->off;
            } else {
                return -2;
            }
        }

    return -100;
}

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
    int r;

    if(f->writable == 0)
        return -1;
    if(f->type == FD_PIPE)
        return pipewrite(f->pipe, addr, n);
    if(f->type == FD_INODE){
        // write a few blocks at a time to avoid exceeding
        // the maximum log transaction size, including
        // i-node, indirect block, allocation blocks,
        // and 2 blocks of slop for non-aligned writes.
        // this really belongs lower down, since writei()
        // might be writing a device like the console.
        int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
        int i = 0;
        while(i < n){
            int n1 = n - i;
            if(n1 > max)
                n1 = max;

            begin_op();
            ilock(f->ip);
            if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
                f->off += r;
            iunlock(f->ip);
            end_op();

            if(r < 0)
                break;
            if(r != n1) {
                panic("short filewrite");
            }
            i += r;
        }
        return i == n ? n : -1;
    }
    if(f->type == FD_SOCKET)
        return socketwrite(f->socket, addr, n);
    panic("filewrite");
}

int
fileioctl(struct file *f, int req, void *arg)
{
    int r = -1;
    if(f->type == FD_SOCKET) {
        return socketioctl(f->socket, req, arg);
    }

    if(f->type == FD_INODE){
        ilock(f->ip);
        r = ioctli(f->ip, req, arg);
        iunlock(f->ip);
        return r;
    }

    return r;
}

int
fileselect(int n, struct file **files, int *fds)
{
    int r = -1;
    for (int i = 0; i < n; i++) {
        struct file *f = files[i];
        if (f == NULL) {
            return -1;
        }

        r = select_checki(f->ip);
        if (r < 0) {
            return r; // error
        }

        if (r > 0) {
            return fds[i]; // ok
        }
    }

    for (int i = 0; i < n; i++) {
        struct file *f = files[i];
        int fd = fds[i];

        r = select_blocki(f->ip, fd);
        if (r < 0) {
            return r;  // error
        }
    }

    return 0;  // block
}
