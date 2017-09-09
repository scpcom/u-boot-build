/*
 * Copyright (c) 2006 - 2017, Intel Corporation. All rights reserved.
 * Portions copyright (c) 2008 - 2009, Apple Inc. All rights reserved.
 * This program and the accompanying materials
 * are licensed and made available under the terms and conditions of the BSD
 * License which accompanies this distribution.  The full text of the license
 * may be found at http://opensource.org/licenses/bsd-license.php.
 *
 * THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
 * WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
 */

#include <stdint.h>

typedef uint16_t	CHAR16;
typedef uint8_t		UINT8;
typedef uint16_t	UINT16;
typedef uint32_t	UINT32;
typedef uint64_t	UINT64;

#define EFI_IMAGE_SIZEOF_SHORT_NAME	8

#define EFI_IMAGE_SUBSYSTEM_EFI_APPLICATION	10

/* Directory Entries */
#define EFI_IMAGE_DIRECTORY_ENTRY_BASERELOC	5
#define EFI_IMAGE_DIRECTORY_ENTRY_DEBUG		6

#define CODEVIEW_SIGNATURE_RSDS  SIGNATURE_32('R', 'S', 'D', 'S')

#define EFI_IMAGE_NUMBER_OF_DIRECTORY_ENTRIES 16

#define SIGNATURE_16(A, B)        ((A) | (B << 8))
#define SIGNATURE_32(A, B, C, D)  (SIGNATURE_16 (A, B) | \
				  (SIGNATURE_16 (C, D) << 16))

/* EXE file formats */
#define EFI_IMAGE_DOS_SIGNATURE     SIGNATURE_16('M', 'Z')
#define EFI_IMAGE_NT_SIGNATURE      SIGNATURE_32('P', 'E', '\0', '\0')

#define EFI_IMAGE_FILE_EXECUTABLE_IMAGE	0x0002
#define EFI_IMAGE_FILE_32BIT_MACHINE	0x0100
#define EFI_IMAGE_FILE_DLL		0x2000

/* Section Flags Values */
#define EFI_IMAGE_SCN_CNT_CODE			0x00000020
#define EFI_IMAGE_SCN_CNT_INITIALIZED_DATA	0x00000040
#define EFI_IMAGE_SCN_CNT_UNINITIALIZED_DATA	0x00000080
#define EFI_IMAGE_SCN_MEM_NOT_PAGED		0x08000000
#define EFI_IMAGE_SCN_MEM_EXECUTE		0x20000000
#define EFI_IMAGE_SCN_MEM_READ			0x40000000
#define EFI_IMAGE_SCN_MEM_WRITE			0x80000000

#define EFI_IMAGE_NT_OPTIONAL_HDR32_MAGIC	0x10b
#define EFI_IMAGE_NT_OPTIONAL_HDR64_MAGIC	0x20b

#define EFI_IMAGE_MACHINE_IA32			0x014C
#define EFI_IMAGE_MACHINE_X64			0x8664
#define EFI_IMAGE_MACHINE_ARMTHUMB_MIXED	0x01C2
#define EFI_IMAGE_MACHINE_AARCH64		0xAA64

#define EFI_IMAGE_DEBUG_TYPE_CODEVIEW	2

typedef struct {
	UINT32  Data1;
	UINT16  Data2;
	UINT16  Data3;
	UINT8   Data4[8];
} GUID;

/* Section Table. This table immediately follows the optional header. */
typedef struct {
	UINT8 Name[EFI_IMAGE_SIZEOF_SHORT_NAME];
	union {
		UINT32  PhysicalAddress;
		UINT32  VirtualSize;
	} Misc;
	UINT32  VirtualAddress;
	UINT32  SizeOfRawData;
	UINT32  PointerToRawData;
	UINT32  PointerToRelocations;
	UINT32  PointerToLinenumbers;
	UINT16  NumberOfRelocations;
	UINT16  NumberOfLinenumbers;
	UINT32  Characteristics;
} EFI_IMAGE_SECTION_HEADER;

/*
 * PE images can start with an optional DOS header, so if an image is run
 * under DOS it can print an error message.
 */
typedef struct {
	UINT16  e_magic;
	UINT16  e_cblp;
	UINT16  e_cp;
	UINT16  e_crlc;
	UINT16  e_cparhdr;
	UINT16  e_minalloc;
	UINT16  e_maxalloc;
	UINT16  e_ss;
	UINT16  e_sp;
	UINT16  e_csum;
	UINT16  e_ip;
	UINT16  e_cs;
	UINT16  e_lfarlc;
	UINT16  e_ovno;
	UINT16  e_res[4];
	UINT16  e_oemid;
	UINT16  e_oeminfo;
	UINT16  e_res2[10];
	UINT32  e_lfanew;
} EFI_IMAGE_DOS_HEADER;

/* COFF File Header (Object and Image). */
typedef struct {
	UINT16  Machine;
	UINT16  NumberOfSections;
	UINT32  TimeDateStamp;
	UINT32  PointerToSymbolTable;
	UINT32  NumberOfSymbols;
	UINT16  SizeOfOptionalHeader;
	UINT16  Characteristics;
} EFI_IMAGE_FILE_HEADER;

/* Header Data Directories. */
typedef struct {
	UINT32  VirtualAddress;
	UINT32  Size;
} EFI_IMAGE_DATA_DIRECTORY;

/* Optional Header Standard Fields for PE32. */
typedef struct {
	UINT16                    Magic;
	UINT8                     MajorLinkerVersion;
	UINT8                     MinorLinkerVersion;
	UINT32                    SizeOfCode;
	UINT32                    SizeOfInitializedData;
	UINT32                    SizeOfUninitializedData;
	UINT32                    AddressOfEntryPoint;
	UINT32                    BaseOfCode;
	UINT32                    BaseOfData;
	UINT32                    ImageBase;
	UINT32                    SectionAlignment;
	UINT32                    FileAlignment;
	UINT16                    MajorOperatingSystemVersion;
	UINT16                    MinorOperatingSystemVersion;
	UINT16                    MajorImageVersion;
	UINT16                    MinorImageVersion;
	UINT16                    MajorSubsystemVersion;
	UINT16                    MinorSubsystemVersion;
	UINT32                    Win32VersionValue;
	UINT32                    SizeOfImage;
	UINT32                    SizeOfHeaders;
	UINT32                    CheckSum;
	UINT16                    Subsystem;
	UINT16                    DllCharacteristics;
	UINT32                    SizeOfStackReserve;
	UINT32                    SizeOfStackCommit;
	UINT32                    SizeOfHeapReserve;
	UINT32                    SizeOfHeapCommit;
	UINT32                    LoaderFlags;
	UINT32                    NumberOfRvaAndSizes;
	EFI_IMAGE_DATA_DIRECTORY  DataDirectory[EFI_IMAGE_NUMBER_OF_DIRECTORY_ENTRIES];
} EFI_IMAGE_OPTIONAL_HEADER32;

typedef struct {
	UINT32                      Signature;
	EFI_IMAGE_FILE_HEADER       FileHeader;
	EFI_IMAGE_OPTIONAL_HEADER32 OptionalHeader;
} EFI_IMAGE_NT_HEADERS32;

/* Optional Header Standard Fields for PE32+. */
typedef struct {
	UINT16                    Magic;
	UINT8                     MajorLinkerVersion;
	UINT8                     MinorLinkerVersion;
	UINT32                    SizeOfCode;
	UINT32                    SizeOfInitializedData;
	UINT32                    SizeOfUninitializedData;
	UINT32                    AddressOfEntryPoint;
	UINT32                    BaseOfCode;
	UINT64                    ImageBase;
	UINT32                    SectionAlignment;
	UINT32                    FileAlignment;
	UINT16                    MajorOperatingSystemVersion;
	UINT16                    MinorOperatingSystemVersion;
	UINT16                    MajorImageVersion;
	UINT16                    MinorImageVersion;
	UINT16                    MajorSubsystemVersion;
	UINT16                    MinorSubsystemVersion;
	UINT32                    Win32VersionValue;
	UINT32                    SizeOfImage;
	UINT32                    SizeOfHeaders;
	UINT32                    CheckSum;
	UINT16                    Subsystem;
	UINT16                    DllCharacteristics;
	UINT64                    SizeOfStackReserve;
	UINT64                    SizeOfStackCommit;
	UINT64                    SizeOfHeapReserve;
	UINT64                    SizeOfHeapCommit;
	UINT32                    LoaderFlags;
	UINT32                    NumberOfRvaAndSizes;
	EFI_IMAGE_DATA_DIRECTORY  DataDirectory[EFI_IMAGE_NUMBER_OF_DIRECTORY_ENTRIES];
} EFI_IMAGE_OPTIONAL_HEADER64;

typedef struct {
	UINT32                      Signature;
	EFI_IMAGE_FILE_HEADER       FileHeader;
	EFI_IMAGE_OPTIONAL_HEADER64 OptionalHeader;
} EFI_IMAGE_NT_HEADERS64;

/* Debug Directory Format. */
typedef struct {
	UINT32  Characteristics;
	UINT32  TimeDateStamp;
	UINT16  MajorVersion;
	UINT16  MinorVersion;
	UINT32  Type;
	UINT32  SizeOfData;
	UINT32  RVA;
	UINT32  FileOffset;
} EFI_IMAGE_DEBUG_DIRECTORY_ENTRY;

/* Debug Data Structure defined in Microsoft C++. */
#define CODEVIEW_SIGNATURE_RSDS  SIGNATURE_32('R', 'S', 'D', 'S')
typedef struct {
	UINT32  Signature;
	UINT32  Unknown;
	UINT32  Unknown2;
	UINT32  Unknown3;
	UINT32  Unknown4;
	UINT32  Unknown5;
} EFI_IMAGE_DEBUG_CODEVIEW_RSDS_ENTRY;
