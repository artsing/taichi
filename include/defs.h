struct buf;
struct context;
struct file;
struct inode;
struct pipe;
struct proc;
struct rtcdate;
struct spinlock;
struct sleeplock;
struct stat;
struct superblock;

// bio.c
void            binit(void);
struct buf*     bread(uint, uint);
void            brelse(struct buf*);
void            bwrite(struct buf*);

// console.c
void            consoleinit(void);
int             cprintf(const char*, ...);
void            consoleintr(int(*)(void));
void            panic(char*) __attribute__((noreturn));

// exec.c
int             exec(char*, char**);

// file.c
struct file*    filealloc(void);
void            fileclose(struct file*);
struct file*    filedup(struct file*);
void            fileinit(void);
int             fileread(struct file*, char*, int n);
int             filestat(struct file*, struct stat*);
int             filewrite(struct file*, char*, int n);
int             fileioctl(struct file*, int, void*);

// fs.c
void            readsb(int dev, struct superblock *sb);
int             dirlink(struct inode*, char*, uint);
struct inode*   dirlookup(struct inode*, char*, uint*);
struct inode*   ialloc(uint, short);
struct inode*   idup(struct inode*);
void            iinit(int dev);
void            ilock(struct inode*);
void            iput(struct inode*);
void            iunlock(struct inode*);
void            iunlockput(struct inode*);
void            iupdate(struct inode*);
int             namecmp(const char*, const char*);
struct inode*   namei(char*);
struct inode*   nameiparent(char*, char*);
int             readi(struct inode*, char*, uint, uint);
void            stati(struct inode*, struct stat*);
int             writei(struct inode*, char*, uint, uint);

// ide.c
void            ideinit(void);
void            ideintr(void);
void            iderw(struct buf*);

// ioapic.c
void            ioapicenable(int irq, int cpu);
extern uchar    ioapicid;
void            ioapicinit(void);

// kalloc.c
char*           kalloc(void);
void            kfree(char*);
void            kinit1(void*, void*);
void            kinit2(void*, void*);

// kbd.c
void            kbdintr(void);

// lapic.c
void            cmostime(struct rtcdate *r);
int             lapicid(void);
extern volatile uint*    lapic;
void            lapiceoi(void);
void            lapicinit(void);
void            lapicstartap(uchar, uint);
void            microdelay(int);

// log.c
void            initlog(int dev);
void            log_write(struct buf*);
void            begin_op();
void            end_op();

// mp.c
extern int      ismp;
void            mpinit(void);

// picirq.c
void            picenable(int);
void            picinit(void);

// pipe.c
int             pipealloc(struct file**, struct file**);
void            pipeclose(struct pipe*, int);
int             piperead(struct pipe*, char*, int);
int             pipewrite(struct pipe*, char*, int);

//PAGEBREAK: 16
// proc.c
int             cpuid(void);
void            exit(void);
int             fork(void);
int             growproc(int);
int             kill(int);
struct cpu*     mycpu(void);
struct proc*    myproc();
void            pinit(void);
void            procdump(void);
void            scheduler(void) __attribute__((noreturn));
void            sched(void);
void            setproc(struct proc*);
void            sleep(void*, struct spinlock*);
void            userinit(void);
int             wait(void);
void            wakeup(void*);
void            yield(void);

// swtch.S
void            swtch(struct context**, struct context*);

// spinlock.c
void            acquire(struct spinlock*);
void            getcallerpcs(void*, uint*);
int             holding(struct spinlock*);
void            initlock(struct spinlock*, char*);
void            release(struct spinlock*);
void            pushcli(void);
void            popcli(void);

// sleeplock.c
void            acquiresleep(struct sleeplock*);
void            releasesleep(struct sleeplock*);
int             holdingsleep(struct sleeplock*);
void            initsleeplock(struct sleeplock*, char*);

// string.c
int             memcmp(const void*, const void*, uint);
void*           memmove(void*, const void*, uint);
void*           memcpy(void*, const void*, uint);
void*           memset(void*, int, uint);
char*           safestrcpy(char*, const char*, int);
int             strlen(const char*);
int             strncmp(const char*, const char*, uint);
char*           strncpy(char*, const char*, int);

// syscall.c
int             argint(int, int*);
int             argptr(int, char**, int);
int             argstr(int, char**);
int             fetchint(uint, int*);
int             fetchstr(uint, char**);
void            syscall(void);

// sysfile.c
int             argfd(int, int*, struct file**);
int             fdalloc(struct file*);

// timer.c
void            timerinit(void);

// trap.c
void            idtinit(void);
extern uint     ticks;
void            tvinit(void);
extern struct spinlock tickslock;

// uart.c
void            uartinit(void);
void            uartintr(void);
void            uartputc(int);

// vm.c
void            seginit(void);
void            kvmalloc(void);
pde_t*          setupkvm(void);
char*           uva2ka(pde_t*, char*);
int             allocuvm(pde_t*, uint, uint);
int             deallocuvm(pde_t*, uint, uint);
void            freevm(pde_t*);
void            inituvm(pde_t*, char*, uint);
int             loaduvm(pde_t*, char*, struct inode*, uint, uint);
pde_t*          copyuvm(pde_t*, uint);
void            switchuvm(struct proc*);
void            switchkvm(void);
int             copyout(pde_t*, uint, void*, uint);
void            clearpteu(pde_t *pgdir, char *uva);

// number of elements in fixed-size array
#define NELEM(x) (sizeof(x)/sizeof((x)[0]))


/* Additional definitions */

struct pci_func;

// pci.c
void            pciinit(void);
void            pci_func_enable(struct pci_func *f);

// printfmt.c
void            vprintfmt(void (*)(int, void*), void*, const char*, va_list);
int             snprintf(char *buf, int n, const char *fmt, ...);

// string.c
int             strcmp(const char *p, const char *q);
int             strnlen(const char *s, size_t size);
long            strtol(const char *s, char **endptr, int base);

// assert
#define _str(x) #x
#define _tostr(x) _str(x)
#define _assert_occurs " [" __FILE__ ":" _tostr(__LINE__) "] "
#define assert(x) \
        do { if (!(x)) panic("assertion failed" _assert_occurs #x); } while (0)

// variable length arguments
#define va_start(ap, last) __builtin_va_start(ap, last)
#define va_arg(ap, type) __builtin_va_arg(ap, type)
#define va_end(ap) __builtin_va_end(ap)


/* for Protocol Stack */

struct netdev;
struct netif;
struct queue_head;
struct queue_entry;
struct socket;
struct sockaddr;

// arp.c
int             arp_resolve(struct netif *netif, const ip_addr_t *pa, uint8_t *ha, const void *data, size_t len);
int             arp_init(void);

// common.c
void            hexdump(void *data, size_t size);
uint16_t        hton16(uint16_t h);
uint16_t        ntoh16(uint16_t n);
uint32_t        hton32(uint32_t h);
uint32_t        ntoh32(uint32_t n);
uint16_t        cksum16 (uint16_t *data, uint16_t size, uint32_t init);
struct queue_entry *queue_push(struct queue_head *queue, void *data, size_t size);
struct queue_entry *queue_pop(struct queue_head *queue);
time_t          time(time_t *t);
unsigned long   random(void);

// e1000.c
int             e1000_init(struct pci_func *pcif);
void            e1000intr(void);

// ethernet.c
int             ethernet_addr_pton(const char *p, uint8_t *n);
char *          ethernet_addr_ntop(const uint8_t *n, char *p, size_t size);
ssize_t         ethernet_rx_helper(struct netdev *dev, uint8_t *frame, size_t flen, void (*cb)(struct netdev*, uint16_t, uint8_t*, size_t));
ssize_t         ethernet_tx_helper(struct netdev *dev, uint16_t type, const uint8_t *payload, size_t plen, const void *dst, ssize_t (*cb)(struct netdev*, uint8_t*, size_t));
void            ethernet_netdev_setup(struct netdev *dev);

// icmp.c
int             icmp_tx(struct netif *netif, uint8_t type, uint8_t code, uint32_t values, uint8_t *data, size_t len, ip_addr_t *dst);
int             icmp_init(void);

// ip.c
int             ip_addr_pton(const char *p, ip_addr_t *n);
char *          ip_addr_ntop(const ip_addr_t *n, char *p, size_t size);
struct netif *  ip_netif_alloc(ip_addr_t unicast, ip_addr_t netmask, ip_addr_t gateway);
struct netif *  ip_netif_register(struct netdev *dev, const char *addr, const char *netmask, const char *gateway);
int             ip_netif_reconfigure(struct netif *netif, ip_addr_t unicast, ip_addr_t netmask, ip_addr_t gateway);
struct netif *  ip_netif_by_addr(ip_addr_t *addr);
struct netif *  ip_netif_by_peer(ip_addr_t *peer);
ssize_t         ip_tx(struct netif *netif, uint8_t protocol, const uint8_t *buf, size_t len, const ip_addr_t *dst);
int             ip_add_protocol(uint8_t type, void (*handler)(uint8_t *payload, size_t len, ip_addr_t *src, ip_addr_t *dst, struct netif *netif));
int             ip_init(void);

// mt19937ar.c
void            init_genrand(unsigned long s);
unsigned long   genrand_int32(void);

// net.c
struct netdev * netdev_root(void);
struct netdev * netdev_alloc(void (*setup)(struct netdev *));
int             netdev_register(struct netdev *dev);
struct netdev * netdev_by_index(int index);
struct netdev * netdev_by_name(const char *name);
void            netdev_receive(struct netdev *dev, uint16_t type, uint8_t *packet, unsigned int plen);
int             netdev_add_netif(struct netdev *dev, struct netif *netif);
struct netif *  netdev_get_netif(struct netdev *dev, int family);
int             netproto_register(unsigned short type, void (*handler)(uint8_t *packet, size_t plen, struct netdev *dev));
void            netinit(void);

// tcp.c
int             tcp_init(void);
int             tcp_api_open(void);
int             tcp_api_close(int soc);
int             tcp_api_connect(int soc, struct sockaddr *addr, int addrlen);
int             tcp_api_bind(int soc, struct sockaddr *addr, int addrlen);
int             tcp_api_listen(int soc, int backlog);
int             tcp_api_accept(int soc, struct sockaddr *addr, int *addrlen);
ssize_t         tcp_api_recv(int soc, uint8_t *buf, size_t size);
ssize_t         tcp_api_send(int soc, uint8_t *buf, size_t len);

// udp.c
int             udp_init(void);
int             udp_api_open(void);
int             udp_api_close(int soc);
int             udp_api_bind(int soc, struct sockaddr *addr, int addrlen);
ssize_t         udp_api_recvfrom(int soc, uint8_t *buf, size_t size, struct sockaddr *addr, int *addrlen);
ssize_t         udp_api_sendto(int soc, uint8_t *buf, size_t len, struct sockaddr *addr, int addrlen);

// socket.c
struct file *   socketalloc(int domain, int type, int protocol);
void            socketclose(struct socket*);
int             socketconnect(struct socket*, struct sockaddr*, int);
int             socketbind(struct socket*, struct sockaddr*, int);
int             socketlisten(struct socket*, int);
struct file *   socketaccept(struct socket*, struct sockaddr*, int*);
int             socketread(struct socket*, char*, int);
int             socketwrite(struct socket*, char*, int);
int             socketrecvfrom(struct socket*, char*, int, struct sockaddr*, int*);
int             socketsendto(struct socket*, char*, int, struct sockaddr*, int);
int             socketioctl(struct socket*, int, void*);

#define sizeof_member(s, m) sizeof(((s *)NULL)->m)
#define array_tailof(x) (x + (sizeof(x) / sizeof(*x)))
#define array_offset(x, y) (((uintptr_t)y - (uintptr_t)x) / sizeof(*y))
