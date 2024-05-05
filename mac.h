#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^
#define HOOK(offset, ptr, orig) MSHookFunction((void *)getRealOffset(offset), (void *)ptr, (void **)&orig)
#define HOOK_NO_ORIG(offset, ptr) MSHookFunction((void *)getRealOffset(offset), (void *)ptr, NULL)
#include "switches.h"
#include <substrate.h>
#include <mach-o/dyld.h>
static View *osiris;
static pidoras *pidorasi = [[pidoras alloc]init];
uint64_t getRealOffset(uint64_t offset){
	return _dyld_get_image_vmaddr_slide(0) + offset;
}

bool patchOffset(uint64_t offset, unsigned long long data) {
	if(data < 0xFFFFFFFF) {
		data = _OSSwapInt32(data);
		return MemoryPatch(NULL,offset, &data, sizeof(uint32_t)).Modify();
	} else {
		data = _OSSwapInt64(data);
		return MemoryPatch(NULL,offset, &data, sizeof(uint64_t)).Modify();
	}
}