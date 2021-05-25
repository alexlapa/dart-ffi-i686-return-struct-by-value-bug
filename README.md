## dart-ffi-i686-return-struct-by-value-bug

Having this C code:
```C
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

```

and this Dart code:

```Dart
import 'dart:ffi';

final nativeLib = DynamicLibrary.open('./libstruct.so');

class MyStruct extends Struct {
  @Uint64()
  external int val;
}

main() {
  final struct = nativeLib.lookupFunction<
      MyStruct Function(),
      MyStruct Function()>('create_my_struct')();
  print('MyStruct.val = ${struct.val}');
}

```

Runing Dart on i686 target would return ~random results:
```
MyStruct.val = 4097305856
...
MyStruct.val = 4097830144
...
MyStruct.val = 4097305856
```

## How to test this

This repro provides a dockerized build, since thats unlikely that you are running 32 bit OS :)
That can be started with:
```
make run.docker
```
