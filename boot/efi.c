#include <efi.h>
#include <efilib.h>

int init_graphics();
#define char_height 17
#define char_width  8
static int offset_x = 0;
static int offset_y = 0;
static int center_x = 0;
static int center_y = 0;
static EFI_GUID efi_graphics_output_protocol_guid =
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

  Print(L"offset = %d \n", offset_x);

  while(1) {
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