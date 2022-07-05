#include<stdio.h>
#include "../boot/ext2_fs.h"

#define BLOCK_SIZE 1024

struct ext2_super_block ext2_sb;
struct ext2_group_desc ext2_gd;

void dumpUUID(const char*, __u8*);
void dumpSuperBlock(struct ext2_super_block);
void dumpGroupDesc(struct ext2_group_desc);

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

    fclose(fp);
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

void dumpUUID(const char *name, __u8* uuid) {
    printf(name);
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
