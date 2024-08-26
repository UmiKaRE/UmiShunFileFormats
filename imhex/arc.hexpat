#pragma magic [ 53 41 43 48 ] @ 0x0
// "SACH" magic


import std.mem;



// ----- File definition

enum ENTRY_TYPE : u32 {
    File = 0x0,
    Folder = 0x80000000,
};

using FOLDER_INFO;
struct FILE_INFO {
    // 0x0: 4bytes ENTRY_TYPE
    // 0x4: 4bytes pointer to file name
    // 0x8: 4bytes pointer to the content (FILE_INFO or byte array for folders/files respectively)
    // 0xc: u32 size of the content (is 0 for folders)

    ENTRY_TYPE type;
    
    // Names are null-terminated string (0x00 is the null character)
    u8 *name[while(std::mem::read_unsigned($, 1) != 0x0)] : u32;
    
    // The size is located after the content (of which we need to know the size beforehand,
    // Hence this weird structure)
    // Size == 0 for folders
    u32 size @ addressof(this) + 0x0C;
    
    
    // If ENTRY_TYPE==folder: location of the FILE_INFO
    if (type == ENTRY_TYPE::Folder) {
        FOLDER_INFO *content : u32;
    } 
    // If ENTRY_TYPE==file: location of the file content
    else if (type == ENTRY_TYPE::File) {
        u8 *content[size] : u32; //if parsing is slow, replace 'size' by '1'
    }
    
    
    $ = addressof(this) + 0x10;
};

struct FOLDER_INFO {
    u32 file_count;
    FILE_INFO files[file_count];
};

// No idea what are these. magic values ?
u8 magic[8] @ 0x0;

// Number of entries at the root of the archive
u32 root_entries_count @ 0x08;

// Total number of entries in the whole .arc file
u32 total_file_count @ 0x0C;

// Adress of where the data starts
u32 *content_start : u32 @ 0x10;


FOLDER_INFO root_files[root_entries_count] @ 0x14;