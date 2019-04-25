REM For appveyor.com
REM mute output
@echo off

cd %APPVEYOR_BUILD_FOLDER%

REM leave some space
echo:
echo Platform: %PLATFORM%
echo Default build folder: %APPVEYOR_BUILD_FOLDER%
echo:

REM we need to update PATH with MSYS2 dirs, also it resolves ZLIB dependency and finds static one at C:/msys64/mingw64/lib/libz.dll.a,
REM while dynamic zlib is in C:\msys64\mingw64\bin\zlib1.dll
set PATH=C:\msys64\mingw64\bin;C:\msys64\usr\bin;%PATH%
REM cmake will unable to compile without "MinGW\bin" path to PATH
REM set PATH=C:\MinGW\bin;%PATH% - is 32bit
set PATH=C:\mingw-w64\x86_64-7.2.0-posix-seh-rt_v5-rev1\mingw64\bin;%PATH%
cd C:\mingw-w64
dir
cd C:\mingw-w64\x86_64-7.2.0-posix-seh-rt_v5-rev1
dir
cd mingw64
dir
cd bin
dir

REM let us see what is installed within MSYS2
bash -lc "pacman -Q"

REM Add doxygen dependencies
REM bash -lc "pacman -S --needed --noconfirm mingw64/mingw-w64-x86_64-doxygen"
REM
REM let us see what is installed now within MSYS2
REM bash -lc "pacman -Q"

REM Remove the zlib
REM bash -lc "pacman -Rs --noconfirm mingw-w64-x86_64-zlib"

REM let us see what is installed now within MSYS2
REM bash -lc "pacman -Q"

REM To break find static lib first
REM ren C:\msys64\mingw64\lib\libz.dll.a nofile.dll.a
REM ren C:\msys64\mingw64\lib\libz.a nofile.a

REM Create downloads folder for external dependencies
REM mkdir %APPVEYOR_BUILD_FOLDER%\downloads

REM Make own zlib
REM cd %APPVEYOR_BUILD_FOLDER%\downloads
REM curl -kLO https://www.zlib.net/zlib-1.2.11.tar.gz -f --retry 4
REM dir
REM 7z x zlib-1.2.11.tar.gz
REM dir
REM 7z x zlib-1.2.11.tar -ozlib
REM cd %APPVEYOR_BUILD_FOLDER%\downloads\zlib
REM mkdir bin
REM mkdir include
REM mkdir lib
REM cd %APPVEYOR_BUILD_FOLDER%\downloads\zlib\zlib-1.2.11
REM dir
REM make -f win32/Makefile.gcc BINARY_PATH=C:/msys64/mingw64/bin INCLUDE_PATH=C:/msys64/mingw64/usr/include LIBRARY_PATH=C:/msys64/mingw64/usr/lib install

REM unmute output
@echo on
