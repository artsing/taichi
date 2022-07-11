#include<stdio.h>
#include<time.h>
#include "../boot/ext2_fs.h"
#include <math.h>

#define BOOT_SIZE 1024
#define INODE_SIZE 128

__u32 BLOCK_SIZE;
#define ENTRY_SIZE 10

struct ext2_super_block ext2_sb;
struct ext2_group_desc ext2_gd;
struct ext2_inode ext2_i[INODE_SIZE];
struct ext2_dir_entry_2 ext2_entry[ENTRY_SIZE];

char* timeToString(__u32 tm, char *buf, int size);

void dumpUUID(const char*, __u8*);
void dumpSuperBlock(struct ext2_super_block);
void dumpGroupDesc(struct ext2_group_desc);
void dumpInode(int inode, struct ext2_inode);
void dumpEntry(struct ext2_dir_entry_2);
struct ext2_inode* findInode(char*, struct ext2_inode *);
int equalsString(char *s, char *d, int sn, int dn);
void fetchName(char *path, char **s, char **e, __u32 *length);
__u32 readFile(struct ext2_inode *inode, __u8* buf, __u32 offset, __u32 size);

FILE *fp;

void read_ext2() {
    fp=fopen("fs.img","rb");

    // boot
    fseek(fp, BOOT_SIZE, 0);

    // super block
    fread(&ext2_sb, sizeof(struct ext2_super_block), 1, fp);
    dumpSuperBlock(ext2_sb);


    // group desc
    fread(&ext2_gd, sizeof(struct ext2_group_desc), 1, fp);
    dumpGroupDesc(ext2_gd);

    // inode table
    fseek(fp, ext2_gd.bg_inode_table *BLOCK_SIZE, 0);
    fread(ext2_i, sizeof(struct ext2_inode), INODE_SIZE, fp);

    // search kernel image
    struct ext2_inode* inode = findInode("/boot/kernel", ext2_i);
    if (inode == NULL) {
        printf("not found\n");
    }

    fclose(fp);
}

__u32 readFile(struct ext2_inode *inode, __u8 *buf, __u32 offset, __u32 size) {
    if (inode == NULL || buf == NULL) {
        return -1;
    }

    if (offset > inode->i_size || size > BLOCK_SIZE) {
        return -1;
    }

    __u32 b1 = offset / BLOCK_SIZE;
    __u32 s1 = offset % BLOCK_SIZE;
    __u32 e1 = BLOCK_SIZE - s1;

    __u32 b2 = (offset + size) / BLOCK_SIZE;
    __u32 s2 = 0;
    __u32 e2 = (offset + size) % BLOCK_SIZE;

}

struct ext2_inode* findInode(char *path,  struct ext2_inode *table) {
    char *s = path;
    char *e = s;
    __u32 length = 0;

    char buf[BLOCK_SIZE];

    int file_type = 2;
    int found = 0;
    int ino = 2;
    struct ext2_inode *inode = &(table[ino-1]);
    dumpInode(2, *inode);
    int bytes = inode->i_size;

    do {
        fetchName(path, &s, &e, &length);
        path = e;

        if (length <= 0) {
            if (found) {
                return inode;
            } else {
                return NULL;
            }
        }

        found = 0;
        for (int bx = 0; bx < inode->i_blocks * 512 / BLOCK_SIZE; bx++) {
            fseek(fp, inode->i_block[bx]*BLOCK_SIZE, 0);
            fread(buf, sizeof(buf), 1, fp);

            __u8 *pos = (__u8*) buf;
            struct ext2_dir_entry_2 *entry;

            while (bytes > 0) {
                entry = (struct ext2_dir_entry_2*) pos;
                dumpEntry(*entry);

                if (entry->rec_len <= 0) break;

                pos += entry->rec_len;
                bytes -= entry->rec_len;

                if (equalsString(s, entry->name, length, entry->name_len)) {
                    file_type = entry->file_type;
                    ino = entry->inode;
                    inode = &(table[ino - 1]);
                    bytes = inode->i_size;
                    dumpInode(ino, *inode);
                    found = 1;
                    break;
                }
            }

            if (found == 1) {
                break;
            }
        }

        if (!found) {
            return NULL;
        }
    } while (length > 0);

}

void fetchName(char *path, char **s, char **e, __u32 *length) {
    *s = path;
    while(**s == '/') (*s)++;

    *length = 0;
    for (*e = *s; **e; (*e)++) {
        if (**e == '/') {
            break;
        }
        (*length)++;
    }
}

int equalsString(char *s, char *d, int sn, int dn) {
    if (sn != dn || sn < 0) {
        return 0;
    }

    while (sn--) {
        if (*s++ != *d++) {
            return 0;
        }
    }
    return 1;
}

void dumpSuperBlock(struct ext2_super_block sb) {
    printf("-------------------------------------------------\n");
    printf("                ext2 super block\n");
    printf("-------------------------------------------------\n");
    char str[100];

    printf("s_inodes_count : %d\n", sb.s_inodes_count);
    printf("s_blocks_count : %d\n", sb.s_blocks_count);
    printf("s_r_blocks_count : %d\n", sb.s_r_blocks_count);
    printf("s_free_blocks_count : %d\n", sb.s_free_blocks_count);
    printf("s_free_inodes_count : %d\n", sb.s_free_inodes_count);
    printf("s_first_data_block : %d\n", sb.s_first_data_block);
    double a  = pow(2, (double)sb.s_log_block_size);
    BLOCK_SIZE = (__u32) a * 1024;
    double b = pow(2, (double)sb.s_log_frag_size);
    printf("s_log_block_size : %d\n", BLOCK_SIZE);
    printf("s_log_frag_size : %d\n", (int)b * 1024);
    printf("s_blocks_per_group : %d\n", sb.s_blocks_per_group);
    printf("s_frags_per_group : %d\n", sb.s_frags_per_group);
    printf("s_inodes_per_group : %d\n", sb.s_inodes_per_group);

    printf("s_mtime : %s\n", timeToString(sb.s_mtime, str, sizeof(str)));
    printf("s_wtime : %s\n", timeToString(sb.s_wtime, str, sizeof(str)));
    printf("s_mnt_count : %d\n", sb.s_mnt_count);
    printf("s_magic : 0x%X\n", sb.s_magic);
    printf("s_state : %d\n", sb.s_state);

    printf("s_first_ino : %d\n", sb.s_first_ino);
    printf("s_inode_size : %d\n", sb.s_inode_size);
    printf("s_block_group_nr : %d\n", sb.s_block_group_nr);
    printf("s_last_mounted : %s\n", sb.s_last_mounted);

    dumpUUID("s_uuid : ", sb.s_uuid);
    printf("-------------------------------------------------\n");
}

void dumpGroupDesc(struct ext2_group_desc gd) {
    printf("-------------------------------------------------\n");
    printf("                ext2 group desc\n");
    printf("-------------------------------------------------\n");

    printf("bg_block_bitmap : %-d\n", gd.bg_block_bitmap);
    printf("bg_inode_bitmap : %-d\n", gd.bg_inode_bitmap);
    printf("bg_inode_table : %-d\n", gd.bg_inode_table);
    printf("bg_free_blocks_count : %-d\n", gd.bg_free_blocks_count);
    printf("bg_free_inodes_count : %-d\n", gd.bg_free_inodes_count);
    printf("bg_used_dirs_count : %-d\n", gd.bg_used_dirs_count);
    printf("bg_flags : %-d\n", gd.bg_flags);
    printf("bg_itable_unused : %-d\n", gd.bg_itable_unused);
    printf("bg_checksum : %-d\n", gd.bg_checksum);
    printf("-------------------------------------------------\n");
}

char* timeToString(__u32 tm, char *buf, int size) {
    time_t ts = tm;
    struct tm *time = localtime(&ts);
    strftime(buf, size, "%F %T", time);
    return buf;
}

void dumpInode(int inode, struct ext2_inode i) {
    printf("-------------------------------------------------\n");
    printf("                   ext2 inode %d\n", inode);
    printf("-------------------------------------------------\n");

    char str[100];

    printf("i_mode : %x\n", i.i_mode);
    printf("i_uid : %-d\n", i.i_uid);
    printf("i_size : %-d\n", i.i_size);

    printf("i_atime : %s\n", timeToString(i.i_atime, str, sizeof(str)));

    printf("i_ctime : %s\n", timeToString(i.i_ctime, str, sizeof(str)));
    printf("i_mtime : %s\n", timeToString(i.i_mtime, str, sizeof(str)));
    printf("i_dtime : %s\n", timeToString(i.i_dtime, str, sizeof(str)));
    printf("i_gid : %-d\n", i.i_gid);
    printf("i_links_count : %-d\n", i.i_links_count);
    printf("i_blocks : %-d\n", (i.i_blocks * 512/BLOCK_SIZE));
    printf("i_flags : %-d\n", i.i_flags);
    for (int j=0; j<(i.i_blocks * 512 / BLOCK_SIZE); j++) {
        printf("i_block[%d] : %-d\n", j, i.i_block[j]);
    }
    printf("i_generation : %-d\n", i.i_generation);
    printf("i_file_acl : %-d\n", i.i_file_acl);
    printf("i_dir_acl : %-d\n", i.i_dir_acl);
    printf("i_faddr : %-d\n", i.i_faddr);

    printf("-------------------------------------------------\n");
}

void dumpEntry(struct ext2_dir_entry_2 entry) {
     printf("-------------------------------------------------\n");
     printf("inode : %-d\n", entry.inode);
     printf("rec_len : %-d\n", entry.rec_len);
     printf("name_len : %-d\n", entry.name_len);
     printf("file_type : %-d\n", entry.file_type);
     printf("name : %s\n", entry.name);
     printf("-------------------------------------------------\n");

}

void dumpUUID(const char *name, __u8* uuid) {
    printf("%s", name);
    for (int i=0; i<16;) {
        printf("%02x", ((unsigned char*) uuid)[i++]);
        if (i == 4 || i == 6 || i==8 || i==10) {
            printf("%c", '-');
        }
    }
    printf("\n");
}

int main(int argc, char** argv) {
	read_ext2();
	return 0;
}
