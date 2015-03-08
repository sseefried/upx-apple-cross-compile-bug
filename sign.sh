TARGET_PLATFORM=`xcrun --show-sdk-path --sdk iphoneos`
TARGET_GCC=`xcrun -f clang`
TARGET_CFLAGS="-isysroot $TARGET_PLATFORM -miphoneos-version-min=4.3"

CC="$TARGET_GCC $TARGET_CFLAGS -arch armv7"

rm -f test
$CC test.c -o test

upx test

codesign --force --sign 4874A84CCB54F378F6F2B099D7AFA3384881F3FD test
