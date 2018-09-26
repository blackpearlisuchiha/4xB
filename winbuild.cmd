@echo off

mkdir build
del /s /q build
cd build

if "%1"=="dyn" goto :dyn
echo Static Build
cmake.exe -G  "Visual Studio 14 2015 Win64"  ..
msbuild 4xBIT.sln /p:Configuration=Release


EXIT /B 



:dyn
echo Dynamic Build
cmake.exe -G  "Visual Studio 14 2015 Win64"  -DSTATIC=NO  ..
msbuild 4xBIT.sln /p:Configuration=Release

echo Copying libs
del /s /q \opt\4xBIT\libs
md \opt\4xBIT\libs
for /r "\opt\4xBIT" %%x in (*.lib) do copy "%%x" "\opt\4xBIT\libs"

 

