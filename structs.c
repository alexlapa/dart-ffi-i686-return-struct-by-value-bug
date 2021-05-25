#include <stdint.h>

struct MyStruct
{
    uint64_t val;
};

struct MyStruct create_my_struct()
{
    struct MyStruct myStruct;
    myStruct.val = 123;
    return myStruct;
}
