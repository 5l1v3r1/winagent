#define MyAppName "Tactical RMM Agent"
#define MyAppVersion "v0.3.2"
#define MyAppPublisher "wh1te909"
#define MyAppURL "https://github.com/wh1te909"
#define MyAppExeName "tacticalrmm.exe"
#define NSSM "nssm.exe"
#define MESHEXE "meshagent.exe"
#define SALTUNINSTALL "c:\salt\uninst.exe"
#define SALTDIR "c:\salt"

[Setup]
AppId={{0D34D278-5FAF-4159-A4A0-4E2D2C08139D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName="C:\Program Files\TacticalAgent"
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputBaseFilename=winagent-{#MyAppVersion}
SetupIconFile=C:\Users\Public\Documents\tacticalagent\bin\onit.ico
WizardSmallImageFile=C:\Users\Public\Documents\tacticalagent\bin\onit.bmp
UninstallDisplayIcon={app}\{#MyAppExeName}
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\Public\Documents\tacticalagent\VERSION"; DestDir: "{app}";
Source: "C:\Users\Public\Documents\tacticalagent\winagent\dist\tacticalrmm\tacticalrmm.exe"; DestDir: "{app}";
Source: "C:\Users\Public\Documents\tacticalagent\winagent\dist\tacticalrmm\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs
Source: "C:\Users\Public\Documents\tacticalagent\bin\nssm.exe"; DestDir: "{app}";
Source: "C:\Users\Public\Documents\tacticalagent\bin\saltcustom"; DestDir: "{app}";
Source: "C:\Users\Public\Documents\tacticalagent\bin\onit.ico"; DestDir: "{app}";

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent runascurrentuser

[UninstallRun]
Filename: "{app}\{#NSSM}"; Parameters: "stop tacticalagent"; RunOnceId: "stoptacagent";
Filename: "{app}\{#NSSM}"; Parameters: "remove tacticalagent confirm"; RunOnceId: "removetacagent";
Filename: "{app}\{#NSSM}"; Parameters: "stop checkrunner"; RunOnceId: "stopcheckrun";
Filename: "{app}\{#NSSM}"; Parameters: "remove checkrunner confirm"; RunOnceId: "removecheckrun";
Filename: "{app}\{#NSSM}"; Parameters: "stop winupdater"; RunOnceId: "stopwinupdate";
Filename: "{app}\{#NSSM}"; Parameters: "remove winupdater confirm"; RunOnceId: "removewinupdate";
Filename: "{#SALTUNINSTALL}"; Parameters: "/S"; RunOnceId: "saltrm";
Filename: "{app}\{#MESHEXE}"; Parameters: "-fulluninstall"; RunOnceId: "meshrm";
Filename: "{app}\{#MyAppExeName}"; Parameters: "-m cleanup"; RunOnceId: "cleanuprm";

[UninstallDelete]
Type: filesandordirs; Name: "{app}";
Type: filesandordirs; Name: "{#SALTDIR}";

