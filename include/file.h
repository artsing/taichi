struct file {
    enum { FD_NONE, FD_PIPE, FD_INODE, FD_SOCKET } type;
    int ref; // reference count
    char readable;
    char writable;
    struct pipe *pipe;
    struct inode *ip;
    struct socket *socket;
    uint off;
};


// in-memory copy of an inode
struct inode {
    uint dev;           // Device number
    uint inum;          // Inode number
    int ref;            // Reference count
    struct sleeplock lock; // protects everything below here
    int valid;          // inode has been read from disk?

    short type;         // copy of disk inode
    short major;
    short minor;
    short nlink;
    uint size;
    uint addrs[NDIRECT+1];
};

// table mapping major device number to
// device functions
struct devsw {
    int (*read)(struct inode*, char*, int);
    int (*write)(struct inode*, char*, int);
    int (*ioctl)(struct inode*, int request, void* argp);
    int (*select_check)(struct inode*);
    int (*select_block)(struct inode*, int pid);
};

extern struct devsw devsw[];

#define CONSOLE  1
#define LBF      2
#define MOUSE    3
#define KEYBOARD 4

#define F_SEEK_SET 0
#define F_SEEK_CUR 1
#define F_SEEK_END 2