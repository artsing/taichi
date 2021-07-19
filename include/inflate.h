#include "types.h"

struct huff_ring;

struct inflate_context {
	void * input_priv;
	void * output_priv;

	uint8_t (*get_input)(struct inflate_context * ctx);
	void (*write_output)(struct inflate_context * ctx, unsigned int sym);

	int bit_buffer;
	int buffer_size;

	struct huff_ring * ring;
};

int deflate_decompress(struct inflate_context * ctx);
int gzip_decompress(struct inflate_context * ctx);
