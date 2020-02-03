
mkdir build
cd build

%VSINSTALLDIR%\VC\Auxiliary\Build\vcvars64.bat

qmake ../libQGLViewer.pro PREFIX=%LIBRARY_PREFIX% NO_QT_VERSION_SUFFIX=1 

nmake release
nmake install
cd ..

COPY QGLViewer\QGLViewer2.dll %LIBRARY_BIN%
COPY QGLViewer\QGLViewer2.lib %LIBRARY_LIB%
mkdir  %LIBRARY_INC%\QGLViewer
COPY QGLViewer\*.h %LIBRARY_INC%\QGLViewer
mkdir  %LIBRARY_INC%\QGLViewer\VRender
COPY QGLViewer\VRender\*.h %LIBRARY_INC%\QGLViewer\VRender
