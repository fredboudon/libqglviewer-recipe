if "%PLATFORM%" == "x86" (
  echo "VS2017 32bit"
  call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat"
) ELSE (
  echo "VS2017 64bit"
  call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"
)