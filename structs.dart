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
