#include <efi.h>
#include <efilib.h>

int init_graphics();
void clear_screen();

#define char_height 17
#define char_width  8

int offset_x = 0;
int offset_y = 0;
int center_x = 0;
int center_y = 0;

EFI_GUID efi_graphics_output_protocol_guid =
  {0x9042a9de,0x23dc,0x4a38,  {0x96,0xfb,0x7a,0xde,0xd0,0x80,0x51,0x6a}};

EFI_GRAPHICS_OUTPUT_PROTOCOL * GOP;
EFI_SYSTEM_TABLE *ST;

EFI_STATUS
EFIAPI
efi_main (EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
{
    InitializeLib(ImageHandle, SystemTable);
    ST = SystemTable;
    init_graphics();

    clear_screen();
    draw_logo(10);

    while(1) {
        int code = read_scancode(1);
        if (code != -1) {
            Print(L"%d\n", code);
        }
    }

  return EFI_SUCCESS;
}

int init_graphics() {
	UINTN count;
	EFI_HANDLE * handles;
	EFI_GRAPHICS_OUTPUT_PROTOCOL * gfx;
	EFI_STATUS status;

	status = uefi_call_wrapper(ST->BootServices->LocateHandleBuffer,
			5, ByProtocol, &efi_graphics_output_protocol_guid, NULL, &count, &handles);
	if (EFI_ERROR(status)) goto no_graphics;
	status = uefi_call_wrapper(ST->BootServices->HandleProtocol,
			3, handles[0], &efi_graphics_output_protocol_guid, (void **)&gfx);
	if (EFI_ERROR(status)) goto no_graphics;

	GOP = gfx;

	int total_width = GOP->Mode->Info->HorizontalResolution;
	int total_height = GOP->Mode->Info->VerticalResolution;

	offset_x = (total_width - 80 * char_width) / 2;
	offset_y = (total_height - 24 * char_height) / 2;

	center_x = total_width / 2;
	center_y = total_height / 2;

	return 0;

no_graphics:
	return 1;
}

void clear_screen() {
	memset((void*)GOP->Mode->FrameBufferBase, 0, GOP->Mode->FrameBufferSize);
}

void set_point(int x, int y, uint32_t color) {
	((uint32_t *)GOP->Mode->FrameBufferBase)[(x + offset_x) + (y + offset_y) * GOP->Mode->Info->PixelsPerScanLine] = color;
}

void draw_square(int x, int y, int stage) {
	for (int _y = 0; _y < 7; ++_y) {
		unsigned int color_green = 0xB2 - (y * 8 + _y) * 2;
		unsigned int color_blue  = 0xFF;

		if (stage > 0 && y + 1 != stage) {
			color_green /= 2;
			color_blue  /= 2;
		}

		unsigned int color = 0xFF000000 | (color_green << 8) | color_blue;

		for (int _x = 0; _x < 7; ++_x) {
			set_point(center_x - 32 - offset_x + x * 8 + _x, center_y - 32 - offset_y + y * 8 + _y, color);
		}
	}
}

void draw_logo(int stage) {
	uint64_t logo_squares = 0x981818181818FFFFUL;
	for (int y = 0; y < 8; ++y) {
		for (int x = 0; x < 8; ++x) {
			if (logo_squares & (1 << x)) {
				draw_square(x,y,stage);
			}
		}
		logo_squares >>= 8;
	}
}

#define KBD_SCAN_DOWN  0x50
#define KBD_SCAN_UP    0x48
#define KBD_SCAN_LEFT  0x4B
#define KBD_SCAN_RIGHT 0x4D
#define KBD_SCAN_ENTER 0x1C
#define KBD_SCAN_1     2
#define KBD_SCAN_9     10

int read_scancode(int timeout) {
	EFI_INPUT_KEY Key;
	unsigned long int index;
	if (timeout) {
		EFI_EVENT events[] = {ST->ConIn->WaitForKey, 0};
		uefi_call_wrapper(ST->BootServices->CreateEvent, 5, EVT_TIMER, 0, NULL, NULL, &events[1]);
		uefi_call_wrapper(ST->BootServices->SetTimer, 3, events[1], TimerRelative, 10000000UL);
		uefi_call_wrapper(ST->BootServices->WaitForEvent, 3, 2, events, &index);
	} else {
		uefi_call_wrapper(ST->BootServices->WaitForEvent, 3, 1, &ST->ConIn->WaitForKey, &index);
	}
	EFI_STATUS result = uefi_call_wrapper(ST->ConIn->ReadKeyStroke, 2, ST->ConIn, &Key);

	if (result == EFI_NOT_READY) return -1;
	switch (Key.ScanCode) {
		case 0:
			switch (Key.UnicodeChar) {
				case L'\r':
					return KBD_SCAN_ENTER;
				case L'1':
				case L'2':
				case L'3':
				case L'4':
				case L'5':
				case L'6':
				case L'7':
				case L'8':
				case L'9':
					return Key.UnicodeChar - L'1' + KBD_SCAN_1;
				case L'e':
					return 0x12;
				default:
					return 0xFF;
			}
			break;
		case 0x01: return KBD_SCAN_UP;
		case 0x02: return KBD_SCAN_DOWN;
		case 0x03: return KBD_SCAN_RIGHT;
		case 0x04: return KBD_SCAN_LEFT;
		default:
			return 0xFF;
	}
}