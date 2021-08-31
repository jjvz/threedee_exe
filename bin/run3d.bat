@echo off 
rem   Windows batch program run3d.bat  --- JJ van Zyl, Feb 2021
rem   Usage: run3d inputfilename (no ext.)
rem     e.g. C:\3D>run3d ppa-c12-160 (no ext.)
rem    ----------------------------------------------------------------------
rem    %1 : inputfilename (assumed .dat) - the first file following the 
rem    e.g. C:\3D>run3d ppa-c12-160 (no ext.)
rem    ----------------------------------------------------------------------
set inpfile=%1
set inpfile
set rootdir=%~dp0..\
set rootdir
set bindir=%~dp0
set poldir=%rootdir%poltgt\
set inpdir=%rootdir%input\
set outdir=%rootdir%output\
set forces=%rootdir%kelly\forces\

rem : set here the specific dp.dat file to be used
set dpdatfile=%forces%dp.dat
set dpdatfile

rem : change to poltgt directory where threedee expects the input files
cd %poldir%

rem : type %dpfile%
if exist fifteen del fifteen 
if exist sixteen del sixteen

echo.
echo copy inputfile to "infile" for use by threedee.exe...
copy /v /y %inpdir%%inpfile%.dat infile
echo copy dp.dat file to "dpfile" for use by threedee.exe, etc...
copy /v /y %dpdatfile% dpfile

echo.
rem : run the executable
%bindir%threedee
echo threedee.exe has completed...

echo.
echo copy threedee output files to .lst, .plt and .ela...
copy /v outfile %outdir%%1.lst
if exist plotfile ( 
	copy /v plotfile %outdir%%1.plt
	del plotfile
	)
if exist elas_xsec (
	copy /v elas_xsec %outdir%%1.ela
	del elas_xsec
	)
rem del outfile
rem del infile
rem del dpfile
echo temp files deleted...

cd %rootdir%
set thddir=
set inpdir=
set outdir=
set forces=
set dpdatfile=
echo set's cleared...
echo run3d done
