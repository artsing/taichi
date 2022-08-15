#include <efi.h>
#include <efilib.h>

EFI_GRAPHICS_OUTPUT_PROTOCOL *gfx;

int init_graphic(EFI_SYSTEM_TABLE*);
void clear_screen();

EFI_STATUS
EFIAPI
efi_main (EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
{
    InitializeLib(ImageHandle, SystemTable);

    int err = init_graphic(SystemTable);
    if (err) {
        goto ret;
    }
    clear_screen(SystemTable);

    Print(L"loading kernel ...");
    while(1) ;
ret:
    return EFI_SUCCESS;
}

int init_graphic(EFI_SYSTEM_TABLE *ST) {
	UINTN count;
	EFI_HANDLE * handles;
	EFI_STATUS status;

    EFI_GUID efi_graphics_output_protocol_guid =
        {0x9042a9de,0x23dc,0x4a38,  {0x96,0xfb,0x7a,0xde,0xd0,0x80,0x51,0x6a}};


	status = uefi_call_wrapper(ST->BootServices->LocateHandleBuffer,
                               5,
                               ByProtocol,
                               &efi_graphics_output_protocol_guid,
                               NULL,
                               &count,
                               &handles);
	if (EFI_ERROR(status)) {
        return 1;
    }

	status = uefi_call_wrapper(ST->BootServices->HandleProtocol,
                               3,
                               handles[0],
                               &efi_graphics_output_protocol_guid,
                               (void **)&gfx);
	if (EFI_ERROR(status)) {
        return 1;
    }

	return 0;
}

void clear_screen() {
	memset((void*)gfx->Mode->FrameBufferBase, 0, gfx->Mode->FrameBufferSize);
}