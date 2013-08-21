OUTPUT_ARCH("arm")
ENTRY(MINIX)

_kern_phys_base = 0x82000040;   /* phys 4MB aligned for convenient remapping */
_kern_vir_base =  0xF0400000;   /* map kernel high for max. user vir space */
_kern_offset = (_kern_vir_base - _kern_phys_base);

__k_unpaged__kern_offset = _kern_offset;
__k_unpaged__kern_vir_base = _kern_vir_base;
__k_unpaged__kern_phys_base = _kern_phys_base;


SECTIONS
{
    . = _kern_phys_base;
      __k_unpaged__kern_unpaged_start = .;

    .text :
    {
        *(.text*)
         *(.gnu.linkonce.t*)
    }

    .ctors :
    {
        . = ALIGN(4096);
        start_ctors = .;
        *(.init_array);
        *(.ctors);
        end_ctors = .;
     }

     .dtors :
     {
        . = ALIGN(4096);
         start_dtors = .;
         *(.fini_array);
         *(.dtors);
         end_dtors = .;
      }

    .rodata :
    {
        *(.rodata .rodata*)
        *(.gnu.linkonce.r*)
    }

    .data :
    {
        *(.data)
    }
    __k_unpaged__kern_unpaged__edata = .;
    __k_unpaged__edata = .;

    .bss :
    {
        *(COMMON*)
        *(.bss)
        *(.gnu.linkonce.b*)
   }
    __k_unpaged__kern_unpaged_end = .;
    __k_unpaged__end = .;


    /DISCARD/ :
    {
        *(.comment)
        *(.ARM.exidx*)
    }
}
