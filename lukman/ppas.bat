@echo off
SET THEFILE=e:\ngulik\codelabs_task\single_linked_list\codelabssinglelinkedlist.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  E:\ngulik\codelabs_task\single_linked_list\rsrc.o -s   -b base.$$$ -o e:\ngulik\codelabs_task\single_linked_list\codelabssinglelinkedlist.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
