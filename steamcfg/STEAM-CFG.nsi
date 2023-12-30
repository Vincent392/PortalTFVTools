;Portal TFV Installer
;based on:
;Kerbal-Launcher Installer
;and  that's based on:
;NSIS Modern User Interface
;Welcome/Finish Page Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"
  
;--------------------------------
;Defines
  !define NAME "Steam Windows XP, Vista, 7, 8 and 8.1 .CFG"
  !define APPFILE ""
  !define VERSION "1.0.0"
  !define SLUG "${NAME} v${VERSION}" 
  !define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\win-install.ico"
  !define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\win-uninstall.ico"
  
;--------------------------------
;General

  ;Name and file
  Name "${NAME}"
  Icon "${MUI_ICON}"
  OutFile "SteamWinXP-8.1_CFG.exe"
  Unicode True

  ;Default installation folder
  InstallDir "$PROGRAMFILES\Steam\"

  ;Get installation folder from registry if available
  ;InstallDirRegKey HKCU "Software\" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING
  ;!define MUI_FINISHPAGE_RUN "$INSTDIR\steam.exe"
  !define MUI_HEADERIMAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Header\win.bmp"
  !define MUI_HEADERIMAGE_UNBITMAP "${NSISDIR}\Contrib\Graphics\Header\win.bmp"
  !define MUI_WELCOMEFINISHPAGE_BITMAP "hl.bmp"
  !define MUI_UNWELCOMEFINISHPAGE_BITMAP "hl.bmp"

;--------------------------------
;Pages things

!define MUI_WELCOMEPAGE_TEXT "Welcome to setup!$\n$\nThis installer will guide you through it!$\nPlease make sure to close Steam$\n$\n$\nP.S. I KNOW YOU CAN JUST COPY PASTE THE CFG!"
!define MUI_PAGE_HEADER_TEXT "Installer"
;!insertmacro MUI_WELCOMEPAGE_TEXT

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  ;!insertmacro MUI_PAGE_LICENSE "License.txt"
  ;!insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section ".cfg" SecDummy

  SectionIn RO
  SetOutPath "$INSTDIR"

    File /r "cfg\*.*" 

  ;Store installation folder
  ;WriteRegStr HKCU "Software\KerLauncherJava" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\CFG-Uninstall.exe"
  
  ;delete installer leftovers
  ;Delete "$INSTDIR\INST\tfv.ico"
  ;RMDir "$INSTDIR\INST"

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecDummy ${LANG_ENGLISH} ".CFG File"

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

 Icon "${MUI_UNICON}"

Section "Uninstall"
  
  Delete "$INSTDIR\steam.cfg"

  Delete "$INSTDIR\CFG-Uninstall.exe"

SectionEnd
