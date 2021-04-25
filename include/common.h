struct queue_entry {
    void *data;
    size_t size;
    struct queue_entry *next;
};

struct queue_head {
    struct queue_entry *next;
    struct queue_entry *tail;
    unsigned int num;
};
