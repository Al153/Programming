cd G:\PyGame 3D Pack\Python Code\
cls
@ECHO OFF

:START
cls
echo Do you want to:
echo 1: Run
echo 2: Compile .pyc
echo 3: Compile .pyo
echo 4: Profile
echo 5: Exit
set/p "cho=>"
if %cho%==1 goto RUN
if %cho%==2 goto COMPILEPYC
if %cho%==3 goto COMPILEPYO
if %cho%==4 goto PROFILE
if %cho%==5 goto END
echo That is not a valid answer
pause
goto START

:COMPILEPYC
cls
python Functions.py c
copy "G:\PyGame 3D Pack\Python Code\__pycache__\Py3D.cpython-32.pyc" "E:\My Documents\Python\PyGame 3D Pack\Compiled Files\Py3D.pyc"
pause
goto START

:COMPILEPYO
cls
python -O Functions.py c
copy "G:\PyGame 3D Pack\Python Code\__pycache__\Py3D.cpython-32.pyo" "E:\My Documents\Python\PyGame 3D Pack\Compiled Files\Py3D.pyo"
pause
goto START

:PROFILE
cls
python Functions.py p
pause
goto START

:RUN
cls
game1.py
pause
goto START

:END