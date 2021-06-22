#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "pci.h"

int
lbf_video_init(struct pci_func *pcif)
{
    cprintf("[lbfvideo] dev_id = %02x dev_class = %02x.\n", pcif->dev_id, pcif->dev_class);

    return 0;
}
