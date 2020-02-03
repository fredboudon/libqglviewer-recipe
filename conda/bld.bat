
mkdir build
cd build

call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.cmd" /x64
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86_amd64
if errorlevel 1 exit 1


qmake ../libQGLViewer.pro PREFIX=%LIBRARY_PREFIX% NO_QT_VERSION_SUFFIX=1 
if errorlevel 1 exit 1

nmake release
if errorlevel 1 exit 1
nmake install
if errorlevel 1 exit 1

cd ..

COPY QGLViewer\QGLViewer2.dll %LIBRARY_BIN%
COPY QGLViewer\QGLViewer2.lib %LIBRARY_LIB%
mkdir  %LIBRARY_INC%\QGLViewer
COPY QGLViewer\*.h %LIBRARY_INC%\QGLViewer
mkdir  %LIBRARY_INC%\QGLViewer\VRender
COPY QGLViewer\VRender\*.h %LIBRARY_INC%\QGLViewer\VRender
if errorlevel 1 exit 1
