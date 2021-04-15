VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Begin VB.Form MBOX 
   BackColor       =   &H00C0FFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "MBOX控制系统"
   ClientHeight    =   7245
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   12090
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7245
   ScaleWidth      =   12090
   StartUpPosition =   3  '窗口缺省
   Begin MSWinsockLib.Winsock UDPPort 
      Left            =   3840
      Top             =   4080
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      Protocol        =   1
   End
   Begin VB.Timer SineActionTimer 
      Enabled         =   0   'False
      Left            =   6840
      Top             =   4140
   End
   Begin VB.CommandButton SineActionStop 
      BackColor       =   &H8000000B&
      Caption         =   "停止"
      Height          =   555
      Left            =   10740
      TabIndex        =   39
      Top             =   6180
      Width           =   975
   End
   Begin VB.CommandButton SineActionBegin 
      BackColor       =   &H8000000B&
      Caption         =   "开始"
      Height          =   555
      Left            =   9360
      TabIndex        =   38
      Top             =   6180
      Width           =   975
   End
   Begin VB.CommandButton GoToMiddlePistion 
      BackColor       =   &H8000000B&
      Caption         =   "到达中间位置"
      Height          =   555
      Left            =   5010
      TabIndex        =   37
      Top             =   4740
      Width           =   1935
   End
   Begin VB.CommandButton GoToZeroPistion 
      BackColor       =   &H8000000B&
      Caption         =   "到达零位"
      Height          =   555
      Left            =   8880
      TabIndex        =   36
      Top             =   4740
      Width           =   1935
   End
   Begin VB.CommandButton GoToMaxPistion 
      BackColor       =   &H8000000B&
      Caption         =   "到达最大位置"
      Height          =   555
      Left            =   1140
      TabIndex        =   35
      Top             =   4740
      Width           =   1935
   End
   Begin VB.TextBox F32LeadDistanceUnitMm 
      Height          =   315
      Left            =   2580
      TabIndex        =   34
      Text            =   "5.0"
      Top             =   2220
      Width           =   1575
   End
   Begin VB.TextBox I32OneTurnPulseNum 
      Height          =   315
      Left            =   2580
      TabIndex        =   33
      Text            =   "10000"
      Top             =   3480
      Width           =   1575
   End
   Begin VB.TextBox U16AcceptIPGroup 
      Height          =   315
      Left            =   6060
      TabIndex        =   32
      Text            =   "255"
      Top             =   960
      Width           =   1575
   End
   Begin VB.TextBox U16AcceptIPNode 
      Height          =   315
      Left            =   6060
      TabIndex        =   31
      Text            =   "255"
      Top             =   1680
      Width           =   1575
   End
   Begin VB.TextBox U16ReplyIPGroup 
      Height          =   315
      Left            =   6060
      TabIndex        =   30
      Text            =   "255"
      Top             =   2880
      Width           =   1575
   End
   Begin VB.TextBox U16ReplyIPNode 
      Height          =   315
      Left            =   6060
      TabIndex        =   29
      Text            =   "255"
      Top             =   3540
      Width           =   1575
   End
   Begin VB.TextBox I16HostTxPort 
      Height          =   315
      Left            =   9960
      TabIndex        =   28
      Text            =   "8410"
      Top             =   960
      Width           =   1575
   End
   Begin VB.TextBox I16HostRxPort 
      Height          =   315
      Left            =   9960
      TabIndex        =   27
      Text            =   "8410"
      Top             =   1680
      Width           =   1575
   End
   Begin VB.TextBox I16MboxTxPort 
      Height          =   315
      Left            =   9960
      TabIndex        =   26
      Text            =   "7408"
      Top             =   2880
      Width           =   1575
   End
   Begin VB.TextBox I16MboxRxPort 
      Height          =   315
      Left            =   9960
      TabIndex        =   25
      Text            =   "7408"
      Top             =   3540
      Width           =   1575
   End
   Begin VB.TextBox F32PeakMm 
      Height          =   315
      Left            =   1560
      TabIndex        =   24
      Text            =   "50.0"
      Top             =   6240
      Width           =   1215
   End
   Begin VB.TextBox F32FrequencyHz 
      Height          =   315
      Left            =   4320
      TabIndex        =   23
      Text            =   "1.0"
      Top             =   6240
      Width           =   1215
   End
   Begin VB.TextBox D64SamplingPeriods 
      Height          =   315
      Left            =   7440
      TabIndex        =   22
      Text            =   "0.01"
      Top             =   6240
      Width           =   1215
   End
   Begin VB.TextBox F32AccessDistanceUnitMm 
      Height          =   315
      Left            =   2580
      TabIndex        =   21
      Text            =   "50.0"
      Top             =   960
      Width           =   1575
   End
   Begin VB.Line Line18 
      BorderStyle     =   3  'Dot
      X1              =   8040
      X2              =   8040
      Y1              =   240
      Y2              =   4020
   End
   Begin VB.Line Line17 
      BorderStyle     =   3  'Dot
      X1              =   4600
      X2              =   11800
      Y1              =   2160
      Y2              =   2160
   End
   Begin VB.Line Line16 
      BorderStyle     =   3  'Dot
      X1              =   11800
      X2              =   11800
      Y1              =   6000
      Y2              =   6800
   End
   Begin VB.Line Line15 
      BorderStyle     =   3  'Dot
      X1              =   11800
      X2              =   11800
      Y1              =   4600
      Y2              =   5400
   End
   Begin VB.Line Line14 
      BorderStyle     =   3  'Dot
      X1              =   180
      X2              =   180
      Y1              =   4600
      Y2              =   5400
   End
   Begin VB.Line Line13 
      BorderStyle     =   3  'Dot
      X1              =   180
      X2              =   180
      Y1              =   6000
      Y2              =   6800
   End
   Begin VB.Line Line12 
      BorderStyle     =   3  'Dot
      X1              =   180
      X2              =   11800
      Y1              =   6000
      Y2              =   6000
   End
   Begin VB.Line Line11 
      BorderStyle     =   3  'Dot
      X1              =   180
      X2              =   11800
      Y1              =   6800
      Y2              =   6800
   End
   Begin VB.Line Line10 
      BorderStyle     =   3  'Dot
      X1              =   180
      X2              =   11800
      Y1              =   5400
      Y2              =   5400
   End
   Begin VB.Line Line9 
      BorderStyle     =   3  'Dot
      X1              =   180
      X2              =   11800
      Y1              =   4600
      Y2              =   4600
   End
   Begin VB.Line Line8 
      BorderStyle     =   3  'Dot
      X1              =   4600
      X2              =   4600
      Y1              =   240
      Y2              =   4020
   End
   Begin VB.Line Line7 
      BorderStyle     =   3  'Dot
      X1              =   4600
      X2              =   11800
      Y1              =   240
      Y2              =   240
   End
   Begin VB.Line Line6 
      BorderStyle     =   3  'Dot
      X1              =   11800
      X2              =   11800
      Y1              =   240
      Y2              =   4020
   End
   Begin VB.Line Line5 
      BorderStyle     =   3  'Dot
      X1              =   4600
      X2              =   11800
      Y1              =   4020
      Y2              =   4020
   End
   Begin VB.Line Line4 
      BorderStyle     =   3  'Dot
      X1              =   180
      X2              =   4440
      Y1              =   4020
      Y2              =   4020
   End
   Begin VB.Line Line3 
      BorderStyle     =   3  'Dot
      X1              =   4440
      X2              =   4440
      Y1              =   240
      Y2              =   4020
   End
   Begin VB.Line Line2 
      BorderStyle     =   3  'Dot
      X1              =   180
      X2              =   4440
      Y1              =   240
      Y2              =   240
   End
   Begin VB.Line Line1 
      BorderStyle     =   3  'Dot
      X1              =   180
      X2              =   180
      Y1              =   240
      Y2              =   4020
   End
   Begin VB.Label Label25 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Caption         =   "MBOX的UDP端口"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   315
      Left            =   8820
      TabIndex        =   20
      Top             =   2340
      Width           =   2055
   End
   Begin VB.Label Label24 
      BackColor       =   &H00C0FFFF&
      Caption         =   "点动"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   315
      Left            =   300
      TabIndex        =   19
      Top             =   4320
      Width           =   675
   End
   Begin VB.Label Label23 
      BackColor       =   &H00C0FFFF&
      Caption         =   "正弦"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   315
      Left            =   300
      TabIndex        =   18
      Top             =   5760
      Width           =   675
   End
   Begin VB.Label Label15 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Caption         =   "上位机的UDP端口"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   315
      Left            =   8820
      TabIndex        =   17
      Top             =   480
      Width           =   2055
   End
   Begin VB.Label Label22 
      BackColor       =   &H00C0FFFF&
      Caption         =   "IP Group"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4740
      TabIndex        =   16
      Top             =   2880
      Width           =   975
   End
   Begin VB.Label Label16 
      BackColor       =   &H00C0FFFF&
      Caption         =   "IP Node"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4740
      TabIndex        =   15
      Top             =   3540
      Width           =   855
   End
   Begin VB.Label Label17 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Caption         =   "Who Reply"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   315
      Left            =   5400
      TabIndex        =   14
      Top             =   2340
      Width           =   1755
   End
   Begin VB.Label Label21 
      BackColor       =   &H00C0FFFF&
      Caption         =   "电动缸参数"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   315
      Left            =   1500
      TabIndex        =   13
      Top             =   480
      Width           =   1635
   End
   Begin VB.Label Label20 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      Caption         =   "Who Accept"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   315
      Left            =   5400
      TabIndex        =   12
      Top             =   480
      Width           =   1755
   End
   Begin VB.Label Label19 
      BackColor       =   &H00C0FFFF&
      Caption         =   "IP Group"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4740
      TabIndex        =   11
      Top             =   960
      Width           =   1095
   End
   Begin VB.Label Label18 
      BackColor       =   &H00C0FFFF&
      Caption         =   "IP Node"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4740
      TabIndex        =   10
      Top             =   1680
      Width           =   915
   End
   Begin VB.Label Label14 
      BackColor       =   &H00C0FFFF&
      Caption         =   "峰值(毫米)"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   300
      TabIndex        =   9
      Top             =   6240
      Width           =   1215
   End
   Begin VB.Label Label13 
      BackColor       =   &H00C0FFFF&
      Caption         =   "频率(Hz)"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3240
      TabIndex        =   8
      Top             =   6240
      Width           =   975
   End
   Begin VB.Label Label12 
      BackColor       =   &H00C0FFFF&
      Caption         =   "采样周期(秒)"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5940
      TabIndex        =   7
      Top             =   6240
      Width           =   1455
   End
   Begin VB.Label Label11 
      BackColor       =   &H00C0FFFF&
      Caption         =   "主机发送端口"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   8220
      TabIndex        =   6
      Top             =   960
      Width           =   1515
   End
   Begin VB.Label Label10 
      BackColor       =   &H00C0FFFF&
      Caption         =   "主机接送端口"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   8220
      TabIndex        =   5
      Top             =   1680
      Width           =   1455
   End
   Begin VB.Label Label9 
      BackColor       =   &H00C0FFFF&
      Caption         =   "MBOX发送端口"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   8220
      TabIndex        =   4
      Top             =   2880
      Width           =   1455
   End
   Begin VB.Label Label8 
      BackColor       =   &H00C0FFFF&
      Caption         =   "MBOX接送端口"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   8220
      TabIndex        =   3
      Top             =   3540
      Width           =   1455
   End
   Begin VB.Label Label3 
      BackColor       =   &H00C0FFFF&
      Caption         =   "一圈脉冲数"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   240
      TabIndex        =   2
      Top             =   3480
      Width           =   1335
   End
   Begin VB.Label Label2 
      BackColor       =   &H00C0FFFF&
      Caption         =   "电动缸导程(毫米)"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   240
      TabIndex        =   1
      Top             =   2220
      Width           =   2055
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      Caption         =   "电动缸行程(毫米)"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   240
      TabIndex        =   0
      Top             =   960
      Width           =   2055
   End
End
Attribute VB_Name = "MBOX"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
''定义参数
Dim AccessDistanceUnit As Double '电动缸的行程
Dim LeadDistanceUnit As Double '电动缸的导程
Dim OneTurnPulseNum As Long '一圈脉冲数
Dim AcceptIPGroup As Integer 'Who Accept IP Group
Dim AcceptIPNode As Integer 'Who Accept IP Node
Dim ReplyIPGroup As Integer 'Who Reply IP Group
Dim ReplyIPNode As Integer 'Who Reply IP Node
Dim HostTxPort As Integer '主机发送UDP端口
Dim HostRxPort As Integer '主机接收UDP端口
Dim MboxTxPort As Integer 'MBOX发送UDP端口
Dim MboxRxPort As Integer 'MBOX接收UDP端口

Dim Peak As Double '正弦波的幅值
Dim Frequency As Double '正弦波的频率
Dim SamplingPeriod As Double '正弦波的采样幅值

''定义UDP数据区数据，所有数据均是十六进制
Dim ConfirmCode As Integer '确认码：55aa
Dim PassCode As Integer '通过码：0000
Dim FunctionCode As Integer '功能码：1301绝对时间播放功能码，1401相对时间播放功能码
Dim ChannelCode As Integer '0000：平台是三轴；0001：平台是六轴

Dim WhoAcceptCode As Integer '确定接收UDP指令的平台
Dim WhoReplyCode As Integer '确认应答UDP指令的平台

Dim PlayLine As Long '播放UDP指令的序列，绝对时间播放可设置为：0000，相对时间播放每发一条UDP指令，加1
Dim PlayTime As Long '播放时间

Dim PlayXpos As Long '1号缸位置脉冲数
Dim PlayYpos As Long '2号缸位置脉冲数
Dim PlayZpos As Long '3号缸位置脉冲数
Dim PlayUpos As Long '4号缸位置脉冲数
Dim PlayVpos As Long '5号缸位置脉冲数
Dim PlayWpos As Long '6号缸位置脉冲数

Dim BaseDoutCode As Integer '12路数字开关量输出,低12位有效

Dim DacOneCode As Integer '模拟量1的输出
Dim DacTwoCode As Integer '模拟量2的输出

''定义每轴脉冲数
Dim XPulse As Long '脉冲个数对应，1号轴
Dim YPulse As Long '脉冲个数对应，2号轴
Dim ZPulse As Long '脉冲个数对应，3号轴
Dim UPulse As Long '脉冲个数对应，4号轴
Dim VPulse As Long '脉冲个数对应，5号轴
Dim WPulse As Long '脉冲个数对应，6号轴

'定义存放UDP数据的数组
Dim Buffer(49) As Byte
Dim UDPBuffer(49) As Byte

'定义m，定时器触发一次，m加1作为sin函数的时间t值
Dim m As Long

''参数赋初值
Private Sub Form_Load()
AccessDistanceUnit = Val("50.0")
LeadDistanceUnit = Val("5.0")
OneTurnPulseNum = Val("10000")
AcceptIPGroup = Val("255")
AcceptIPNode = Val("255")
ReplyIPGroup = Val("255")
ReplyIPNode = Val("255")
HostTxPort = Val("8410")
HostRxPort = Val("8410")
MboxTxPort = Val("7408")
MboxRxPort = Val("7408")
Peak = Val("50.0")
Frequency = Val("1.00")
SamplingPeriod = Val("0.01")
m = 0
End Sub

''输入框只能输入数字和小数点

'输入电动缸的行程
Private Sub F32AccessDistanceUnitMm_KeyPress(KeyAscii As Integer)
If KeyAscii = 46 And Not CBool(InStr(F32AccessDistanceUnitMm, ".")) Then Exit Sub
If KeyAscii = 8 Then Exit Sub
If KeyAscii < 48 Or KeyAscii > 57 Then KeyAscii = 0
End Sub
'输入电动缸的导程
Private Sub F32LeadDistanceUnitMm_KeyPress(KeyAscii As Integer)
If KeyAscii = 46 And Not CBool(InStr(F32LeadDistanceUnitMm, ".")) Then Exit Sub
If KeyAscii = 8 Then Exit Sub
If KeyAscii < 48 Or KeyAscii > 57 Then KeyAscii = 0
End Sub
'输入一圈脉冲数
Private Sub I32OneTurnPulseNum_KeyPress(KeyAscii As Integer)
If KeyAscii = 8 Then Exit Sub
If KeyAscii < 48 Or KeyAscii > 57 Then KeyAscii = 0
End Sub

''当参数值改变时重新获取参数的值

'获取电动缸的行程的值
Private Sub F32AccessDistanceUnitMm_Change()
AccessDistanceUnit = Val(F32AccessDistanceUnitMm.Text)
End Sub
'获取电动缸的导程的值
Private Sub F32LeadDistanceUnitMm_Change()
LeadDistanceUnit = Val(F32LeadDistanceUnitMm.Text)
End Sub
'获取一圈脉冲数的值
Private Sub I32OneTurnPulseNum_Change()
OneTurnPulseNum = Val(I32OneTurnPulseNum.Text)
End Sub

'获取Who Accept IP Group的值
Private Sub U16AcceptIPGroup_Change()
AcceptIPGroup = Val(U16AcceptIPGroup.Text)
End Sub
'获取Who Accept IP Node的值
Private Sub U16AcceptIPNode_Change()
AcceptIPNode = Val(U16AcceptIPNode.Text)
End Sub
'获取Who Reply IP Group的值
Private Sub U16ReplyIPGroup_Change()
ReplyIPGroup = Val(U16ReplyIPGroup.Text)
End Sub
'获取Who Reply IP Node的值
Private Sub U16ReplyIPNode_Change()
ReplyIPNode = Val(U16ReplyIPNode.Text)
End Sub
'获取主机发送端口的值
Private Sub I16HostTxPort_Change()
HostTxPort = Val(I16HostTxPort.Text)
End Sub
'获取主机接收端口的值
Private Sub I16HostRxPort_Change()
HostRxPort = Val(I16HostRxPort.Text)
End Sub
'获取MBOX发送接口的值
Private Sub I16MboxTxPort_Change()
MboxTxPort = Val(I16MboxTxPort.Text)
End Sub
'获取MBOX接收端口的值
Private Sub I16MboxRxPort_Change()
MboxRxPort = Val(I16MboxRxPort.Text)
End Sub
'获取正弦的峰值的值
Private Sub F32PeakMm_Change()
Peak = Val(F32PeakMm.Text)
End Sub
'获取正弦波的频率的值
Private Sub F32FrequencyHz_Change()
Frequency = Val(F32FrequencyHz.Text)
End Sub
'获取正弦波采样周期的值
Private Sub D64SamplingPeriods_Change()
SamplingPeriod = Val(D64SamplingPeriods.Text)
End Sub

''建立UDP端口
Private Sub OpenUDPPort_Click()
 With UDPPort
 UDPPort.RemoteHost = "255.255.255.255" '要连接到的计算机名，使用广播模式
 UDPPort.RemotePort = MboxRxPort '要连接到的端口号
 UDPPort.LocalPort = HostTxPort '该Winsock控制将要使用的本地端口号，便于其它端口与该Winsock通讯
 UDPPort.Bind HostTxPort '将该Winsock控制绑定到该本地端口
 End With
End Sub

''发送UDP指令，电动缸到达最大位置
Private Sub GoToMaxPistion_Click()
'建立UDP端口
With UDPPort
 UDPPort.RemoteHost = "255.255.255.255" '要连接到的计算机名，使用广播模式
 UDPPort.RemotePort = MboxRxPort '要连接到的端口号
 UDPPort.LocalPort = HostTxPort '该Winsock控制将要使用的本地端口号，便于其它端口与该Winsock通讯
 UDPPort.Bind HostTxPort '将该Winsock控制绑定到该本地端口
 End With
XPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum
YPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum
ZPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum
UPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum
VPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum
WPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum

'UDP数据区数据赋值
ConfirmCode = &H55AA   '确认码：55aa
PassCode = &H0  '通过码：0000
FunctionCode = &H1301  '功能码：1301绝对时间播放功能码
ChannelCode = &H1    '00001：平台是六轴

WhoAcceptCode = &HFFFF '所有平台均接收
WhoReplyCode = &HFFFF '所有平台均应答
                
PlayLine = &H0 '播放UDP指令的序列，绝对时间播放可设置为：00000000
PlayTime = &H0 '播放时间设置为零，按MBOX控制板卡内部时间播放
PlayXpos = XPulse '1 号缸位置脉冲数
PlayYpos = YPulse '2 号缸位置脉冲数
PlayZpos = ZPulse '3 号缸位置脉冲数
PlayUpos = UPulse '4 号缸位置脉冲数
PlayVpos = VPulse '5 号缸位置脉冲数
PlayWpos = WPulse '6 号缸位置脉冲数
                
BaseDoutCode = &H1234 '12路数字开关量输出,低12位有效

DacOneCode = &H5678 '模拟量1的输出
DacTwoCode = &HABCD '模拟量2的输出
'将双字和字分成字节,并高位在前低位在后
Call CopyMemory(Buffer(0), ConfirmCode, 2)
UDPBuffer(0) = Buffer(1)
UDPBuffer(1) = Buffer(0)
Call CopyMemory(Buffer(2), PassCode, 2)
UDPBuffer(2) = Buffer(3)
UDPBuffer(3) = Buffer(2)
Call CopyMemory(Buffer(4), FunctionCode, 2)
UDPBuffer(4) = Buffer(5)
UDPBuffer(5) = Buffer(4)
Call CopyMemory(Buffer(6), ChannelCode, 2)
UDPBuffer(6) = Buffer(7)
UDPBuffer(7) = Buffer(6)
Call CopyMemory(Buffer(8), WhoAcceptCode, 2)
UDPBuffer(8) = Buffer(9)
UDPBuffer(9) = Buffer(8)
Call CopyMemory(Buffer(10), WhoReplyCode, 2)
UDPBuffer(10) = Buffer(10)
UDPBuffer(11) = Buffer(11)
Call CopyMemory(Buffer(12), PlayLine, 4)
UDPBuffer(12) = Buffer(15)
UDPBuffer(13) = Buffer(14)
UDPBuffer(14) = Buffer(13)
UDPBuffer(15) = Buffer(12)
Call CopyMemory(Buffer(16), PlayTime, 4)
UDPBuffer(16) = Buffer(19)
UDPBuffer(17) = Buffer(18)
UDPBuffer(18) = Buffer(17)
UDPBuffer(19) = Buffer(16)
Call CopyMemory(Buffer(20), PlayXpos, 4)
UDPBuffer(20) = Buffer(23)
UDPBuffer(21) = Buffer(22)
UDPBuffer(22) = Buffer(21)
UDPBuffer(23) = Buffer(20)
Call CopyMemory(Buffer(24), PlayYpos, 4)
UDPBuffer(24) = Buffer(27)
UDPBuffer(25) = Buffer(26)
UDPBuffer(26) = Buffer(25)
UDPBuffer(27) = Buffer(24)
Call CopyMemory(Buffer(28), PlayZpos, 4)
UDPBuffer(28) = Buffer(31)
UDPBuffer(29) = Buffer(30)
UDPBuffer(30) = Buffer(29)
UDPBuffer(31) = Buffer(28)
Call CopyMemory(Buffer(32), PlayUpos, 4)
UDPBuffer(32) = Buffer(35)
UDPBuffer(33) = Buffer(34)
UDPBuffer(34) = Buffer(33)
UDPBuffer(35) = Buffer(32)
Call CopyMemory(Buffer(36), PlayVpos, 4)
UDPBuffer(36) = Buffer(39)
UDPBuffer(37) = Buffer(38)
UDPBuffer(38) = Buffer(37)
UDPBuffer(39) = Buffer(36)
Call CopyMemory(Buffer(40), PlayWpos, 4)
UDPBuffer(40) = Buffer(43)
UDPBuffer(41) = Buffer(42)
UDPBuffer(42) = Buffer(41)
UDPBuffer(43) = Buffer(40)
Call CopyMemory(Buffer(44), BaseDoutCode, 2)
UDPBuffer(44) = Buffer(45)
UDPBuffer(45) = Buffer(44)
Call CopyMemory(Buffer(46), DacOneCode, 2)
UDPBuffer(46) = Buffer(47)
UDPBuffer(47) = Buffer(46)
Call CopyMemory(Buffer(48), DacTwoCode, 2)
UDPBuffer(48) = Buffer(49)
UDPBuffer(49) = Buffer(48)
UDPPort.SendData (UDPBuffer) '发送UDP数据
UDPPort.Close
End Sub

''发送UDP指令，电动缸到达中间位置
Private Sub GoToMiddlePistion_Click()
'建立UDP端口
With UDPPort
 UDPPort.RemoteHost = "255.255.255.255" '要连接到的计算机名，使用广播模式
 UDPPort.RemotePort = MboxRxPort '要连接到的端口号
 UDPPort.LocalPort = HostTxPort '该Winsock控制将要使用的本地端口号，便于其它端口与该Winsock通讯
 UDPPort.Bind HostTxPort '将该Winsock控制绑定到该本地端口
 End With
XPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum / 2
YPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum / 2
ZPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum / 2
UPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum / 2
VPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum / 2
WPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum / 2

'UDP数据区数据赋值
ConfirmCode = &H55AA   '确认码：55aa
PassCode = &H0  '通过码：0000
FunctionCode = &H1301  '功能码：1301绝对时间播放功能码
ChannelCode = &H1    '00001：平台是六轴

WhoAcceptCode = &HFFFF '所有平台均接收
WhoReplyCode = &HFFFF '所有平台均应答
                
PlayLine = &H0 '播放UDP指令的序列，绝对时间播放可设置为：00000000
PlayTime = &H0 '播放时间设置为零，按MBOX控制板卡内部时间播放
PlayXpos = XPulse '1 号缸位置脉冲数
PlayYpos = YPulse '2 号缸位置脉冲数
PlayZpos = ZPulse '3 号缸位置脉冲数
PlayUpos = UPulse '4 号缸位置脉冲数
PlayVpos = VPulse '5 号缸位置脉冲数
PlayWpos = WPulse '6 号缸位置脉冲数
                
BaseDoutCode = &H1234 '12路数字开关量输出,低12位有效

DacOneCode = &H5678 '模拟量1的输出
DacTwoCode = &HABCD '模拟量2的输出
'将双字和字分成字节,并高位在前低位在后
Call CopyMemory(Buffer(0), ConfirmCode, 2)
UDPBuffer(0) = Buffer(1)
UDPBuffer(1) = Buffer(0)
Call CopyMemory(Buffer(2), PassCode, 2)
UDPBuffer(2) = Buffer(3)
UDPBuffer(3) = Buffer(2)
Call CopyMemory(Buffer(4), FunctionCode, 2)
UDPBuffer(4) = Buffer(5)
UDPBuffer(5) = Buffer(4)
Call CopyMemory(Buffer(6), ChannelCode, 2)
UDPBuffer(6) = Buffer(7)
UDPBuffer(7) = Buffer(6)
Call CopyMemory(Buffer(8), WhoAcceptCode, 2)
UDPBuffer(8) = Buffer(9)
UDPBuffer(9) = Buffer(8)
Call CopyMemory(Buffer(10), WhoReplyCode, 2)
UDPBuffer(10) = Buffer(10)
UDPBuffer(11) = Buffer(11)
Call CopyMemory(Buffer(12), PlayLine, 4)
UDPBuffer(12) = Buffer(15)
UDPBuffer(13) = Buffer(14)
UDPBuffer(14) = Buffer(13)
UDPBuffer(15) = Buffer(12)
Call CopyMemory(Buffer(16), PlayTime, 4)
UDPBuffer(16) = Buffer(19)
UDPBuffer(17) = Buffer(18)
UDPBuffer(18) = Buffer(17)
UDPBuffer(19) = Buffer(16)
Call CopyMemory(Buffer(20), PlayXpos, 4)
UDPBuffer(20) = Buffer(23)
UDPBuffer(21) = Buffer(22)
UDPBuffer(22) = Buffer(21)
UDPBuffer(23) = Buffer(20)
Call CopyMemory(Buffer(24), PlayYpos, 4)
UDPBuffer(24) = Buffer(27)
UDPBuffer(25) = Buffer(26)
UDPBuffer(26) = Buffer(25)
UDPBuffer(27) = Buffer(24)
Call CopyMemory(Buffer(28), PlayZpos, 4)
UDPBuffer(28) = Buffer(31)
UDPBuffer(29) = Buffer(30)
UDPBuffer(30) = Buffer(29)
UDPBuffer(31) = Buffer(28)
Call CopyMemory(Buffer(32), PlayUpos, 4)
UDPBuffer(32) = Buffer(35)
UDPBuffer(33) = Buffer(34)
UDPBuffer(34) = Buffer(33)
UDPBuffer(35) = Buffer(32)
Call CopyMemory(Buffer(36), PlayVpos, 4)
UDPBuffer(36) = Buffer(39)
UDPBuffer(37) = Buffer(38)
UDPBuffer(38) = Buffer(37)
UDPBuffer(39) = Buffer(36)
Call CopyMemory(Buffer(40), PlayWpos, 4)
UDPBuffer(40) = Buffer(43)
UDPBuffer(41) = Buffer(42)
UDPBuffer(42) = Buffer(41)
UDPBuffer(43) = Buffer(40)
Call CopyMemory(Buffer(44), BaseDoutCode, 2)
UDPBuffer(44) = Buffer(45)
UDPBuffer(45) = Buffer(44)
Call CopyMemory(Buffer(46), DacOneCode, 2)
UDPBuffer(46) = Buffer(47)
UDPBuffer(47) = Buffer(46)
Call CopyMemory(Buffer(48), DacTwoCode, 2)
UDPBuffer(48) = Buffer(49)
UDPBuffer(49) = Buffer(48)
UDPPort.SendData (UDPBuffer) '发送UDP数据
UDPPort.Close
End Sub

''发送UDP指令，电动缸到达零位
Private Sub GoToZeroPistion_Click()
'建立UDP端口
With UDPPort
 UDPPort.RemoteHost = "255.255.255.255" '要连接到的计算机名，使用广播模式
 UDPPort.RemotePort = MboxRxPort '要连接到的端口号
 UDPPort.LocalPort = HostTxPort '该Winsock控制将要使用的本地端口号，便于其它端口与该Winsock通讯
 UDPPort.Bind HostTxPort '将该Winsock控制绑定到该本地端口
 End With
XPulse = 0
YPulse = 0
ZPulse = 0
UPulse = 0
VPulse = 0
WPulse = 0

'UDP数据区数据赋值
ConfirmCode = &H55AA   '确认码：55aa
PassCode = &H0  '通过码：0000
FunctionCode = &H1301  '功能码：1301绝对时间播放功能码
ChannelCode = &H1    '00001：平台是六轴

WhoAcceptCode = &HFFFF '所有平台均接收
WhoReplyCode = &HFFFF '所有平台均应答
                
PlayLine = &H0 '播放UDP指令的序列，绝对时间播放可设置为：00000000
PlayTime = &H0 '播放时间设置为零，按MBOX控制板卡内部时间播放
PlayXpos = XPulse '1 号缸位置脉冲数
PlayYpos = YPulse '2 号缸位置脉冲数
PlayZpos = ZPulse '3 号缸位置脉冲数
PlayUpos = UPulse '4 号缸位置脉冲数
PlayVpos = VPulse '5 号缸位置脉冲数
PlayWpos = WPulse '6 号缸位置脉冲数
                
BaseDoutCode = &H1234 '12路数字开关量输出,低12位有效

DacOneCode = &H5678 '模拟量1的输出
DacTwoCode = &HABCD '模拟量2的输出
'将双字和字分成字节,并高位在前低位在后
Call CopyMemory(Buffer(0), ConfirmCode, 2)
UDPBuffer(0) = Buffer(1)
UDPBuffer(1) = Buffer(0)
Call CopyMemory(Buffer(2), PassCode, 2)
UDPBuffer(2) = Buffer(3)
UDPBuffer(3) = Buffer(2)
Call CopyMemory(Buffer(4), FunctionCode, 2)
UDPBuffer(4) = Buffer(5)
UDPBuffer(5) = Buffer(4)
Call CopyMemory(Buffer(6), ChannelCode, 2)
UDPBuffer(6) = Buffer(7)
UDPBuffer(7) = Buffer(6)
Call CopyMemory(Buffer(8), WhoAcceptCode, 2)
UDPBuffer(8) = Buffer(9)
UDPBuffer(9) = Buffer(8)
Call CopyMemory(Buffer(10), WhoReplyCode, 2)
UDPBuffer(10) = Buffer(10)
UDPBuffer(11) = Buffer(11)
Call CopyMemory(Buffer(12), PlayLine, 4)
UDPBuffer(12) = Buffer(15)
UDPBuffer(13) = Buffer(14)
UDPBuffer(14) = Buffer(13)
UDPBuffer(15) = Buffer(12)
Call CopyMemory(Buffer(16), PlayTime, 4)
UDPBuffer(16) = Buffer(19)
UDPBuffer(17) = Buffer(18)
UDPBuffer(18) = Buffer(17)
UDPBuffer(19) = Buffer(16)
Call CopyMemory(Buffer(20), PlayXpos, 4)
UDPBuffer(20) = Buffer(23)
UDPBuffer(21) = Buffer(22)
UDPBuffer(22) = Buffer(21)
UDPBuffer(23) = Buffer(20)
Call CopyMemory(Buffer(24), PlayYpos, 4)
UDPBuffer(24) = Buffer(27)
UDPBuffer(25) = Buffer(26)
UDPBuffer(26) = Buffer(25)
UDPBuffer(27) = Buffer(24)
Call CopyMemory(Buffer(28), PlayZpos, 4)
UDPBuffer(28) = Buffer(31)
UDPBuffer(29) = Buffer(30)
UDPBuffer(30) = Buffer(29)
UDPBuffer(31) = Buffer(28)
Call CopyMemory(Buffer(32), PlayUpos, 4)
UDPBuffer(32) = Buffer(35)
UDPBuffer(33) = Buffer(34)
UDPBuffer(34) = Buffer(33)
UDPBuffer(35) = Buffer(32)
Call CopyMemory(Buffer(36), PlayVpos, 4)
UDPBuffer(36) = Buffer(39)
UDPBuffer(37) = Buffer(38)
UDPBuffer(38) = Buffer(37)
UDPBuffer(39) = Buffer(36)
Call CopyMemory(Buffer(40), PlayWpos, 4)
UDPBuffer(40) = Buffer(43)
UDPBuffer(41) = Buffer(42)
UDPBuffer(42) = Buffer(41)
UDPBuffer(43) = Buffer(40)
Call CopyMemory(Buffer(44), BaseDoutCode, 2)
UDPBuffer(44) = Buffer(45)
UDPBuffer(45) = Buffer(44)
Call CopyMemory(Buffer(46), DacOneCode, 2)
UDPBuffer(46) = Buffer(47)
UDPBuffer(47) = Buffer(46)
Call CopyMemory(Buffer(48), DacTwoCode, 2)
UDPBuffer(48) = Buffer(49)
UDPBuffer(49) = Buffer(48)
UDPPort.SendData (UDPBuffer) '发送UDP数据
UDPPort.Close
End Sub

''开始做正弦波运动
Private Sub SineActionBegin_Click()
With UDPPort
 UDPPort.RemoteHost = "255.255.255.255" '要连接到的计算机名，使用广播模式
 UDPPort.RemotePort = MboxRxPort '要连接到的端口号
 UDPPort.LocalPort = HostTxPort '该Winsock控制将要使用的本地端口号，便于其它端口与该Winsock通讯
 UDPPort.Bind HostTxPort '将该Winsock控制绑定到该本地端口
 End With
Peak = Val(F32PeakMm.Text)
Frequency = Val(F32FrequencyHz.Text)
SamplingPeriod = Val(D64SamplingPeriods.Text)
SineActionTimer.Enabled = True
SineActionTimer.Interval = SamplingPeriod * 1000
End Sub

''停止做正弦运动
Private Sub SineActionStop_Click()
SineActionTimer.Enabled = False
UDPPort.Close
End Sub

''发送UDP数据，平台各轴的伸长长度按正弦波运算
Private Sub SineActionTimer_Timer()
m = m + 1
'每时刻电动缸的长度
AccessDistance = Peak * Sin(2 * 3.14 * Frequency * m * SineActionTimer.Interval)
XPulse = AccessDistance / LeadDistanceUnit * OneTurnPulseNum / 2
YPulse = AccessDistance / LeadDistanceUnit * OneTurnPulseNum / 2
ZPulse = AccessDistance / LeadDistanceUnit * OneTurnPulseNum / 2
UPulse = AccessDistance / LeadDistanceUnit * OneTurnPulseNum / 2
VPulse = AccessDistance / LeadDistanceUnit * OneTurnPulseNum / 2
WPulse = AccessDistance / LeadDistanceUnit * OneTurnPulseNum / 2

'UDP数据区数据赋值
ConfirmCode = &H55AA   '确认码：55aa
PassCode = &H0  '通过码：0000
FunctionCode = &H1401  '功能码：1301绝对时间播放功能码
ChannelCode = &H1    '00001：平台是六轴

WhoAcceptCode = &HFFFF '所有平台均接收
WhoReplyCode = &HFFFF '所有平台均应答
                
PlayLine = PlayLine + 1 '播放UDP指令的序列，绝对时间播放可设置为：00000000
PlayTime = SineActionTimer.Interval '播放时间设置为零，按MBOX控制板卡内部时间播放
PlayXpos = XPulse '1 号缸位置脉冲数
PlayYpos = YPulse '2 号缸位置脉冲数
PlayZpos = ZPulse '3 号缸位置脉冲数
PlayUpos = UPulse '4 号缸位置脉冲数
PlayVpos = VPulse '5 号缸位置脉冲数
PlayWpos = WPulse '6 号缸位置脉冲数
                
BaseDoutCode = &H1234 '12路数字开关量输出,低12位有效

DacOneCode = &H5678 '模拟量1的输出
DacTwoCode = &HABCD '模拟量2的输出
'将双字和字分成字节,并高位在前低位在后
Call CopyMemory(Buffer(0), ConfirmCode, 2)
UDPBuffer(0) = Buffer(1)
UDPBuffer(1) = Buffer(0)
Call CopyMemory(Buffer(2), PassCode, 2)
UDPBuffer(2) = Buffer(3)
UDPBuffer(3) = Buffer(2)
Call CopyMemory(Buffer(4), FunctionCode, 2)
UDPBuffer(4) = Buffer(5)
UDPBuffer(5) = Buffer(4)
Call CopyMemory(Buffer(6), ChannelCode, 2)
UDPBuffer(6) = Buffer(7)
UDPBuffer(7) = Buffer(6)
Call CopyMemory(Buffer(8), WhoAcceptCode, 2)
UDPBuffer(8) = Buffer(9)
UDPBuffer(9) = Buffer(8)
Call CopyMemory(Buffer(10), WhoReplyCode, 2)
UDPBuffer(10) = Buffer(10)
UDPBuffer(11) = Buffer(11)
Call CopyMemory(Buffer(12), PlayLine, 4)
UDPBuffer(12) = Buffer(15)
UDPBuffer(13) = Buffer(14)
UDPBuffer(14) = Buffer(13)
UDPBuffer(15) = Buffer(12)
Call CopyMemory(Buffer(16), PlayTime, 4)
UDPBuffer(16) = Buffer(19)
UDPBuffer(17) = Buffer(18)
UDPBuffer(18) = Buffer(17)
UDPBuffer(19) = Buffer(16)
Call CopyMemory(Buffer(20), PlayXpos, 4)
UDPBuffer(20) = Buffer(23)
UDPBuffer(21) = Buffer(22)
UDPBuffer(22) = Buffer(21)
UDPBuffer(23) = Buffer(20)
Call CopyMemory(Buffer(24), PlayYpos, 4)
UDPBuffer(24) = Buffer(27)
UDPBuffer(25) = Buffer(26)
UDPBuffer(26) = Buffer(25)
UDPBuffer(27) = Buffer(24)
Call CopyMemory(Buffer(28), PlayZpos, 4)
UDPBuffer(28) = Buffer(31)
UDPBuffer(29) = Buffer(30)
UDPBuffer(30) = Buffer(29)
UDPBuffer(31) = Buffer(28)
Call CopyMemory(Buffer(32), PlayUpos, 4)
UDPBuffer(32) = Buffer(35)
UDPBuffer(33) = Buffer(34)
UDPBuffer(34) = Buffer(33)
UDPBuffer(35) = Buffer(32)
Call CopyMemory(Buffer(36), PlayVpos, 4)
UDPBuffer(36) = Buffer(39)
UDPBuffer(37) = Buffer(38)
UDPBuffer(38) = Buffer(37)
UDPBuffer(39) = Buffer(36)
Call CopyMemory(Buffer(40), PlayWpos, 4)
UDPBuffer(40) = Buffer(43)
UDPBuffer(41) = Buffer(42)
UDPBuffer(42) = Buffer(41)
UDPBuffer(43) = Buffer(40)
Call CopyMemory(Buffer(44), BaseDoutCode, 2)
UDPBuffer(44) = Buffer(45)
UDPBuffer(45) = Buffer(44)
Call CopyMemory(Buffer(46), DacOneCode, 2)
UDPBuffer(46) = Buffer(47)
UDPBuffer(47) = Buffer(46)
Call CopyMemory(Buffer(48), DacTwoCode, 2)
UDPBuffer(48) = Buffer(49)
UDPBuffer(49) = Buffer(48)
UDPPort.SendData (UDPBuffer) '发送UDP数据
End Sub

''正弦波对应的脉冲计算






