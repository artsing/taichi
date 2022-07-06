#include<stdio.h>
#include<time.h>
#include "../boot/ext2_fs.h"


#define BLOCK_SIZE 1024
#define INODE_SIZE 128
#define ENTRY_SIZE 5

struct ext2_super_block ext2_sb;
struct ext2_group_desc ext2_gd;
struct ext2_inode ext2_i[INODE_SIZE];
struct ext2_dir_entry_2 ext2_entry[ENTRY_SIZE];

void raw_read_block(FILE* fp, __u32 block, __u32 size, __u8* buffer);

void dumpUUID(const char*, __u8*);
void dumpSuperBlock(struct ext2_super_block);
void dumpGroupDesc(struct ext2_group_desc);
void dumpInode(int inode, struct ext2_inode);
void dumpEntry(struct ext2_dir_entry_2);

void read_ext2() {
    FILE *fp;
    fp=fopen("fs.img","rb");

    // boot
    fseek(fp, BLOCK_SIZE, 0);

    // super block
    fread(&ext2_sb, sizeof(struct ext2_super_block), 1, fp);
    dumpSuperBlock(ext2_sb);

    // group desc
    fread(&ext2_gd, sizeof(struct ext2_group_desc), 1, fp);
    dumpGroupDesc(ext2_gd);

    fseek(fp, 8*BLOCK_SIZE, 0);

    fread(ext2_i, sizeof(struct ext2_inode), INODE_SIZE, fp);
    dumpInode(2, ext2_i[1]);
    dumpInode(12, ext2_i[11]);

    fseek(fp, 24*BLOCK_SIZE, 0);
    // .
    fread(ext2_entry, 12, 1, fp);
    dumpEntry(ext2_entry[0]);
    // ..
    fread(ext2_entry+1, 12, 1, fp);
    dumpEntry(ext2_entry[1]);
    // lost+found
    fread(ext2_entry+2, 20, 1, fp);
    dumpEntry(ext2_entry[2]);
    // hello.txt
    fread(ext2_entry+3, 20, 1, fp);
    dumpEntry(ext2_entry[3]);
    // boot
    fread(ext2_entry+4, 12, 1, fp);
    dumpEntry(ext2_entry[4]);
    // main.c
    fread(ext2_entry+5, 16, 1, fp);
    dumpEntry(ext2_entry[5]);

    // inode
    fseek(fp, 38*BLOCK_SIZE, 0);
    // .
    fread(ext2_entry, 12, 1, fp);
    dumpEntry(ext2_entry[0]);
    // ..
    fread(ext2_entry+1, 12, 1, fp);
    dumpEntry(ext2_entry[1]);
    // kernel
    fread(ext2_entry+2, 20, 1, fp);
    dumpEntry(ext2_entry[2]);

    fclose(fp);
}

/**
 * read n block data to buffer
 * @param fp   FILE
 * @param block the block number
 * @param size  read size
 * @param buffer the buffer of read
 */
void raw_read_block(FILE* fp, __u32 block, __u32 size, __u8* buffer) {
    fseek(fp, BLOCK_SIZE * block, 0);
    fread(buffer, BLOCK_SIZE, size, fp);
}

void dumpSuperBlock(struct ext2_super_block sb) {
    printf("-------------------------------------------------\n");
    printf("                ext2 super block\n");
    printf("-------------------------------------------------\n");

    printf("s_inodes_count : %d\n", sb.s_inodes_count);
    printf("s_blocks_count : %d\n", sb.s_blocks_count);
    printf("s_r_blocks_count : %d\n", sb.s_r_blocks_count);
    printf("s_free_blocks_count : %d\n", sb.s_free_blocks_count);
    printf("s_free_inodes_count : %d\n", sb.s_free_inodes_count);
    printf("s_first_data_block : %d\n", sb.s_first_data_block);
    printf("s_log_block_size : (2^%d*1024)\n", sb.s_log_block_size);
    printf("s_log_frag_size : (2^%d*1024)\n", sb.s_log_frag_size);
    printf("s_blocks_per_group : %d\n", sb.s_blocks_per_group);
    printf("s_frags_per_group : %d\n", sb.s_frags_per_group);
    printf("s_inodes_per_group : %d\n", sb.s_inodes_per_group);

    printf("s_mtime : %d\n", sb.s_mtime);
    printf("s_wtime : %d\n", sb.s_wtime);
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

    printf("i_mode : %-d\n", i.i_mode);
    printf("i_uid : %-d\n", i.i_uid);
    printf("i_size : %-d\n", i.i_size);

    printf("i_atime : %s\n", timeToString(i.i_atime, str, sizeof(str)));

    printf("i_ctime : %s\n", timeToString(i.i_ctime, str, sizeof(str)));
    printf("i_mtime : %s\n", timeToString(i.i_mtime, str, sizeof(str)));
    printf("i_dtime : %s\n", timeToString(i.i_dtime, str, sizeof(str)));
    printf("i_gid : %-d\n", i.i_gid);
    printf("i_links_count : %-d\n", i.i_links_count);
    printf("i_blocks : %-d\n", i.i_blocks);
    printf("i_flags : %-d\n", i.i_flags);
    for (int j=0; j<i.i_blocks; j++) {
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
