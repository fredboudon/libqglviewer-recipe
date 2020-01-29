mkdir build
cd build

qmake ../libQGLViewer.pro PREFIX=%LIBRARY_PREFIX% NO_QT_VERSION_SUFFIX=1  \
    QTC_PREFIX=%LIBRARY_PREFIX%             \
    QBS_INSTALL_PREFIX=%LIBRARY_PREFIX%     \
    QMAKE_CC=%CC% \
    QMAKE_CXX=%CXX% \
    QMAKE_LINK=%CXX% \
    QMAKE_RANLIB=%RANLIB% \
    QMAKE_OBJDUMP=%OBJDUMP% \
    QMAKE_STRIP=%STRIP% \
    QMAKE_CXXFLAGS_RELEASE="%CXXFLAGS%" \
    QMAKE_CFLAGS_RELEASE="%CFLAGS%" \
    QMAKE_LFLAGS_RELEASE="%LDFLAGS%" 

nmake release
nmake install
cd ..

COPY QGLViewer\QGLViewer2.dll %LIBRARY_BIN%
COPY QGLViewer\QGLViewer2.lib %LIBRARY_LIB%
mkdir  %LIBRARY_INC%\QGLViewer
COPY QGLViewer\*.h %LIBRARY_INC%\QGLViewer
mkdir  %LIBRARY_INC%\QGLViewer\VRender
COPY QGLViewer\VRender\*.h %LIBRARY_INC%\QGLViewer\VRender
