VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "ieframe.dll"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmConnect 
   BorderStyle     =   0  'None
   Caption         =   "Inmortal AO"
   ClientHeight    =   9000
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   12000
   ClipControls    =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   600
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   800
   StartUpPosition =   2  'CenterScreen
   Begin SHDocVwCtl.WebBrowser WebBrowser1 
      Height          =   3495
      Left            =   1800
      TabIndex        =   3
      Top             =   4920
      Width           =   8415
      ExtentX         =   14843
      ExtentY         =   6165
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
   Begin InetCtlsObjects.Inet mInet 
      Left            =   840
      Top             =   480
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin VB.TextBox Passtxt 
      Appearance      =   0  'Flat
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   300
      IMEMode         =   3  'DISABLE
      Left            =   1815
      PasswordChar    =   "*"
      TabIndex        =   2
      Top             =   2715
      Width           =   2355
   End
   Begin VB.TextBox Usertxt 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   300
      Left            =   1845
      TabIndex        =   0
      Top             =   1860
      Width           =   4215
   End
   Begin VB.ListBox lst_servers 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   2175
      ItemData        =   "frmConnect.frx":0000
      Left            =   6525
      List            =   "frmConnect.frx":0002
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   1845
      Width           =   3645
   End
   Begin VB.Image cmdMinimizar 
      Height          =   345
      Left            =   11280
      Top             =   60
      Width           =   345
   End
   Begin VB.Image cmdCerrar 
      Height          =   345
      Left            =   11640
      Top             =   60
      Width           =   375
   End
   Begin VB.Image cmdConnect 
      Height          =   630
      Left            =   4335
      Top             =   2460
      Width           =   1800
   End
   Begin VB.Image cmdNewAccount 
      Height          =   780
      Left            =   1770
      Top             =   3300
      Width           =   2100
   End
   Begin VB.Image cmdNotReme 
      Height          =   780
      Left            =   3975
      Top             =   3300
      Width           =   2100
   End
End
Attribute VB_Name = "frmConnect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim Botones(1 To 3) As clsButton
Public LastPressed As clsButton


Private Sub c_Click()

End Sub

Private Sub cmdCerrar_Click()
End
End Sub

Private Sub cmdMinimizar_Click()
Me.WindowState = 1
End Sub

Private Sub cmdNotReme_Click()
    ShellExecute Me.hwnd, "open", "http://inmortalao.com.ar/login.php?action=lostpassword", "", "", 1
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyEscape Then
        prgRun = False
    End If
End Sub

Private Sub Form_Load()
Dim servers() As String
Dim i As Integer

    Me.Picture = LoadInterface("conectar")
    Me.Icon = frmMain.Icon
    
    Set Botones(1) = New clsButton
    Set Botones(2) = New clsButton
    Set Botones(3) = New clsButton
    Set LastPressed = New clsButton
    
    Botones(1).Initialize cmdConnect, _
            "connect-conectar-over", _
            "connect-conectar-down", _
            Me, True
    
    Botones(2).Initialize cmdNotReme, _
            "pass-conectar-over", _
            "pass-conectar-down", _
            Me, True
            
    Botones(3).Initialize cmdNewAccount, _
            "cuenta-conectar-over", _
            "cuenta-conectar-down", _
            Me, True
    
    

    Usertxt.refresh
    
    Me.Visible = True
    
    
    If perm = True Then
        'WebBrowser1.Navigate ("http://inmortalao.com.ar/index2.php?noticias=true")
        'serverList = mInet.OpenURL("http://inmortalao.com.ar/getserver2.php")
    End If

'Castelli no entiendo para que se lo puso aca :S
'Para que no se bugee el GIU
    DoEvents
    
    lst_servers.Clear
    
    If Len(serverList) > 0 Then
    
        'servers = Split(serverList, vbNewLine, 10)
        'servers = serverList
        
        Debug.Print serverList
        'Recorremos el arreglo y vamos insertando _
        los elementos del array en el ListBox
        'For i = 1 To UBound(servers)
            lServer(1).Ip = ReadField(1, serverList, 59)
            lServer(1).port = val(ReadField(2, serverList, 59))
            lServer(1).name = ReadField(3, serverList, 59)
            lServer(1).id = val(ReadField(4, serverList, 59))
            lst_servers.AddItem lServer(1).name
            
            Debug.Print "---------------"
            Debug.Print ">" & lServer(1).Ip
            Debug.Print ">" & lServer(1).port
            Debug.Print ">" & lServer(1).name
            Debug.Print ">" & lServer(1).id
        'Next
    Else
        lServer(1).Ip = "200.43.192.242"
        lServer(1).port = 7777
        lServer(1).name = "InmortalAO [Estado no reconocible]"
        lServer(1).id = 0
        lst_servers.AddItem lServer(1).name
    End If

    lServer(1).Ip = "192.168.0.222"
    lServer(1).port = 7777
  
    lst_servers.ListIndex = 0
    
    
    frmMain.Visible = False

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = vbLeftButton And mueve = 1 Then Auto_Drag Me.hwnd
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LastPressed.ToggleToNormal
End Sub

Private Sub cmdNewAccount_Click()

    ShellExecute Me.hwnd, "open", "http://inmortalao.com.ar/login.php?action=register", "", "", 1
End Sub

Private Sub cmdConnect_Click()
On Error Resume Next

perm = False
    cCursores.Parse_Form frmConnect, E_WAIT
    
    If frmMain.Socket1.Connected Then
    
        frmMain.Socket1.Disconnect
        frmMain.Socket1.Cleanup
        DoEvents
    End If
        
    UserAccount = Usertxt.Text
    UserPassword = Passtxt.Text
    
    If Not UserAccount = "" And Not UserPassword = "" Then
        EstadoLogin = E_MODO.ConectarCuenta
        frmMain.Socket1.HostName = CurServerIp
        frmMain.Socket1.RemotePort = CurServerPort
        frmMain.Socket1.Connect
        
        DoEvents
    Else
    
    frmMensaje.msg.Caption = "Complete los campos de Usuario y Contrase?a para poder ingresar."
    frmMensaje.Show
    
    End If
End Sub

Private Sub lst_servers_Click()
    CurServerIp = lServer(lst_servers.ListIndex + 1).Ip
    CurServerPort = lServer(lst_servers.ListIndex + 1).port
End Sub

Private Sub Passtxt_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyReturn Then
        cmdConnect_Click
        
        Call Audio.PlayWave(SND_CLICK)
    End If
End Sub

Private Function LeerInt(ByVal Ruta As String) As Integer
Dim f As Integer
    f = FreeFile
    Open Ruta For Input As f
    LeerInt = Input$(LOF(f), #f)
    Close #f
End Function
