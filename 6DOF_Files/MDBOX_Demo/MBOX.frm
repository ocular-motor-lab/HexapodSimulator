VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Begin VB.Form MBOX 
   BackColor       =   &H00C0FFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "MBOX����ϵͳ"
   ClientHeight    =   7245
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   12090
   BeginProperty Font 
      Name            =   "����"
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
   StartUpPosition =   3  '����ȱʡ
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
      Caption         =   "ֹͣ"
      Height          =   555
      Left            =   10740
      TabIndex        =   39
      Top             =   6180
      Width           =   975
   End
   Begin VB.CommandButton SineActionBegin 
      BackColor       =   &H8000000B&
      Caption         =   "��ʼ"
      Height          =   555
      Left            =   9360
      TabIndex        =   38
      Top             =   6180
      Width           =   975
   End
   Begin VB.CommandButton GoToMiddlePistion 
      BackColor       =   &H8000000B&
      Caption         =   "�����м�λ��"
      Height          =   555
      Left            =   5010
      TabIndex        =   37
      Top             =   4740
      Width           =   1935
   End
   Begin VB.CommandButton GoToZeroPistion 
      BackColor       =   &H8000000B&
      Caption         =   "������λ"
      Height          =   555
      Left            =   8880
      TabIndex        =   36
      Top             =   4740
      Width           =   1935
   End
   Begin VB.CommandButton GoToMaxPistion 
      BackColor       =   &H8000000B&
      Caption         =   "�������λ��"
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
      Caption         =   "MBOX��UDP�˿�"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "�㶯"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "����"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "��λ����UDP�˿�"
      BeginProperty Font 
         Name            =   "����"
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
         Name            =   "����"
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
         Name            =   "����"
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
         Name            =   "����"
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
      Caption         =   "�綯�ײ���"
      BeginProperty Font 
         Name            =   "����"
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
         Name            =   "����"
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
         Name            =   "����"
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
         Name            =   "����"
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
      Caption         =   "��ֵ(����)"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "Ƶ��(Hz)"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "��������(��)"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "�������Ͷ˿�"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "�������Ͷ˿�"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "MBOX���Ͷ˿�"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "MBOX���Ͷ˿�"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "һȦ������"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "�綯�׵���(����)"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "�綯���г�(����)"
      BeginProperty Font 
         Name            =   "����"
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
''�������
Dim AccessDistanceUnit As Double '�綯�׵��г�
Dim LeadDistanceUnit As Double '�綯�׵ĵ���
Dim OneTurnPulseNum As Long 'һȦ������
Dim AcceptIPGroup As Integer 'Who Accept IP Group
Dim AcceptIPNode As Integer 'Who Accept IP Node
Dim ReplyIPGroup As Integer 'Who Reply IP Group
Dim ReplyIPNode As Integer 'Who Reply IP Node
Dim HostTxPort As Integer '��������UDP�˿�
Dim HostRxPort As Integer '��������UDP�˿�
Dim MboxTxPort As Integer 'MBOX����UDP�˿�
Dim MboxRxPort As Integer 'MBOX����UDP�˿�

Dim Peak As Double '���Ҳ��ķ�ֵ
Dim Frequency As Double '���Ҳ���Ƶ��
Dim SamplingPeriod As Double '���Ҳ��Ĳ�����ֵ

''����UDP���������ݣ��������ݾ���ʮ������
Dim ConfirmCode As Integer 'ȷ���룺55aa
Dim PassCode As Integer 'ͨ���룺0000
Dim FunctionCode As Integer '�����룺1301����ʱ�䲥�Ź����룬1401���ʱ�䲥�Ź�����
Dim ChannelCode As Integer '0000��ƽ̨�����᣻0001��ƽ̨������

Dim WhoAcceptCode As Integer 'ȷ������UDPָ���ƽ̨
Dim WhoReplyCode As Integer 'ȷ��Ӧ��UDPָ���ƽ̨

Dim PlayLine As Long '����UDPָ������У�����ʱ�䲥�ſ�����Ϊ��0000�����ʱ�䲥��ÿ��һ��UDPָ���1
Dim PlayTime As Long '����ʱ��

Dim PlayXpos As Long '1�Ÿ�λ��������
Dim PlayYpos As Long '2�Ÿ�λ��������
Dim PlayZpos As Long '3�Ÿ�λ��������
Dim PlayUpos As Long '4�Ÿ�λ��������
Dim PlayVpos As Long '5�Ÿ�λ��������
Dim PlayWpos As Long '6�Ÿ�λ��������

Dim BaseDoutCode As Integer '12·���ֿ��������,��12λ��Ч

Dim DacOneCode As Integer 'ģ����1�����
Dim DacTwoCode As Integer 'ģ����2�����

''����ÿ��������
Dim XPulse As Long '���������Ӧ��1����
Dim YPulse As Long '���������Ӧ��2����
Dim ZPulse As Long '���������Ӧ��3����
Dim UPulse As Long '���������Ӧ��4����
Dim VPulse As Long '���������Ӧ��5����
Dim WPulse As Long '���������Ӧ��6����

'������UDP���ݵ�����
Dim Buffer(49) As Byte
Dim UDPBuffer(49) As Byte

'����m����ʱ������һ�Σ�m��1��Ϊsin������ʱ��tֵ
Dim m As Long

''��������ֵ
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

''�����ֻ���������ֺ�С����

'����綯�׵��г�
Private Sub F32AccessDistanceUnitMm_KeyPress(KeyAscii As Integer)
If KeyAscii = 46 And Not CBool(InStr(F32AccessDistanceUnitMm, ".")) Then Exit Sub
If KeyAscii = 8 Then Exit Sub
If KeyAscii < 48 Or KeyAscii > 57 Then KeyAscii = 0
End Sub
'����綯�׵ĵ���
Private Sub F32LeadDistanceUnitMm_KeyPress(KeyAscii As Integer)
If KeyAscii = 46 And Not CBool(InStr(F32LeadDistanceUnitMm, ".")) Then Exit Sub
If KeyAscii = 8 Then Exit Sub
If KeyAscii < 48 Or KeyAscii > 57 Then KeyAscii = 0
End Sub
'����һȦ������
Private Sub I32OneTurnPulseNum_KeyPress(KeyAscii As Integer)
If KeyAscii = 8 Then Exit Sub
If KeyAscii < 48 Or KeyAscii > 57 Then KeyAscii = 0
End Sub

''������ֵ�ı�ʱ���»�ȡ������ֵ

'��ȡ�綯�׵��г̵�ֵ
Private Sub F32AccessDistanceUnitMm_Change()
AccessDistanceUnit = Val(F32AccessDistanceUnitMm.Text)
End Sub
'��ȡ�綯�׵ĵ��̵�ֵ
Private Sub F32LeadDistanceUnitMm_Change()
LeadDistanceUnit = Val(F32LeadDistanceUnitMm.Text)
End Sub
'��ȡһȦ��������ֵ
Private Sub I32OneTurnPulseNum_Change()
OneTurnPulseNum = Val(I32OneTurnPulseNum.Text)
End Sub

'��ȡWho Accept IP Group��ֵ
Private Sub U16AcceptIPGroup_Change()
AcceptIPGroup = Val(U16AcceptIPGroup.Text)
End Sub
'��ȡWho Accept IP Node��ֵ
Private Sub U16AcceptIPNode_Change()
AcceptIPNode = Val(U16AcceptIPNode.Text)
End Sub
'��ȡWho Reply IP Group��ֵ
Private Sub U16ReplyIPGroup_Change()
ReplyIPGroup = Val(U16ReplyIPGroup.Text)
End Sub
'��ȡWho Reply IP Node��ֵ
Private Sub U16ReplyIPNode_Change()
ReplyIPNode = Val(U16ReplyIPNode.Text)
End Sub
'��ȡ�������Ͷ˿ڵ�ֵ
Private Sub I16HostTxPort_Change()
HostTxPort = Val(I16HostTxPort.Text)
End Sub
'��ȡ�������ն˿ڵ�ֵ
Private Sub I16HostRxPort_Change()
HostRxPort = Val(I16HostRxPort.Text)
End Sub
'��ȡMBOX���ͽӿڵ�ֵ
Private Sub I16MboxTxPort_Change()
MboxTxPort = Val(I16MboxTxPort.Text)
End Sub
'��ȡMBOX���ն˿ڵ�ֵ
Private Sub I16MboxRxPort_Change()
MboxRxPort = Val(I16MboxRxPort.Text)
End Sub
'��ȡ���ҵķ�ֵ��ֵ
Private Sub F32PeakMm_Change()
Peak = Val(F32PeakMm.Text)
End Sub
'��ȡ���Ҳ���Ƶ�ʵ�ֵ
Private Sub F32FrequencyHz_Change()
Frequency = Val(F32FrequencyHz.Text)
End Sub
'��ȡ���Ҳ��������ڵ�ֵ
Private Sub D64SamplingPeriods_Change()
SamplingPeriod = Val(D64SamplingPeriods.Text)
End Sub

''����UDP�˿�
Private Sub OpenUDPPort_Click()
 With UDPPort
 UDPPort.RemoteHost = "255.255.255.255" 'Ҫ���ӵ��ļ��������ʹ�ù㲥ģʽ
 UDPPort.RemotePort = MboxRxPort 'Ҫ���ӵ��Ķ˿ں�
 UDPPort.LocalPort = HostTxPort '��Winsock���ƽ�Ҫʹ�õı��ض˿ںţ����������˿����WinsockͨѶ
 UDPPort.Bind HostTxPort '����Winsock���ư󶨵��ñ��ض˿�
 End With
End Sub

''����UDPָ��綯�׵������λ��
Private Sub GoToMaxPistion_Click()
'����UDP�˿�
With UDPPort
 UDPPort.RemoteHost = "255.255.255.255" 'Ҫ���ӵ��ļ��������ʹ�ù㲥ģʽ
 UDPPort.RemotePort = MboxRxPort 'Ҫ���ӵ��Ķ˿ں�
 UDPPort.LocalPort = HostTxPort '��Winsock���ƽ�Ҫʹ�õı��ض˿ںţ����������˿����WinsockͨѶ
 UDPPort.Bind HostTxPort '����Winsock���ư󶨵��ñ��ض˿�
 End With
XPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum
YPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum
ZPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum
UPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum
VPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum
WPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum

'UDP���������ݸ�ֵ
ConfirmCode = &H55AA   'ȷ���룺55aa
PassCode = &H0  'ͨ���룺0000
FunctionCode = &H1301  '�����룺1301����ʱ�䲥�Ź�����
ChannelCode = &H1    '00001��ƽ̨������

WhoAcceptCode = &HFFFF '����ƽ̨������
WhoReplyCode = &HFFFF '����ƽ̨��Ӧ��
                
PlayLine = &H0 '����UDPָ������У�����ʱ�䲥�ſ�����Ϊ��00000000
PlayTime = &H0 '����ʱ������Ϊ�㣬��MBOX���ư忨�ڲ�ʱ�䲥��
PlayXpos = XPulse '1 �Ÿ�λ��������
PlayYpos = YPulse '2 �Ÿ�λ��������
PlayZpos = ZPulse '3 �Ÿ�λ��������
PlayUpos = UPulse '4 �Ÿ�λ��������
PlayVpos = VPulse '5 �Ÿ�λ��������
PlayWpos = WPulse '6 �Ÿ�λ��������
                
BaseDoutCode = &H1234 '12·���ֿ��������,��12λ��Ч

DacOneCode = &H5678 'ģ����1�����
DacTwoCode = &HABCD 'ģ����2�����
'��˫�ֺ��ֳַ��ֽ�,����λ��ǰ��λ�ں�
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
UDPPort.SendData (UDPBuffer) '����UDP����
UDPPort.Close
End Sub

''����UDPָ��綯�׵����м�λ��
Private Sub GoToMiddlePistion_Click()
'����UDP�˿�
With UDPPort
 UDPPort.RemoteHost = "255.255.255.255" 'Ҫ���ӵ��ļ��������ʹ�ù㲥ģʽ
 UDPPort.RemotePort = MboxRxPort 'Ҫ���ӵ��Ķ˿ں�
 UDPPort.LocalPort = HostTxPort '��Winsock���ƽ�Ҫʹ�õı��ض˿ںţ����������˿����WinsockͨѶ
 UDPPort.Bind HostTxPort '����Winsock���ư󶨵��ñ��ض˿�
 End With
XPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum / 2
YPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum / 2
ZPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum / 2
UPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum / 2
VPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum / 2
WPulse = AccessDistanceUnit / LeadDistanceUnit * OneTurnPulseNum / 2

'UDP���������ݸ�ֵ
ConfirmCode = &H55AA   'ȷ���룺55aa
PassCode = &H0  'ͨ���룺0000
FunctionCode = &H1301  '�����룺1301����ʱ�䲥�Ź�����
ChannelCode = &H1    '00001��ƽ̨������

WhoAcceptCode = &HFFFF '����ƽ̨������
WhoReplyCode = &HFFFF '����ƽ̨��Ӧ��
                
PlayLine = &H0 '����UDPָ������У�����ʱ�䲥�ſ�����Ϊ��00000000
PlayTime = &H0 '����ʱ������Ϊ�㣬��MBOX���ư忨�ڲ�ʱ�䲥��
PlayXpos = XPulse '1 �Ÿ�λ��������
PlayYpos = YPulse '2 �Ÿ�λ��������
PlayZpos = ZPulse '3 �Ÿ�λ��������
PlayUpos = UPulse '4 �Ÿ�λ��������
PlayVpos = VPulse '5 �Ÿ�λ��������
PlayWpos = WPulse '6 �Ÿ�λ��������
                
BaseDoutCode = &H1234 '12·���ֿ��������,��12λ��Ч

DacOneCode = &H5678 'ģ����1�����
DacTwoCode = &HABCD 'ģ����2�����
'��˫�ֺ��ֳַ��ֽ�,����λ��ǰ��λ�ں�
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
UDPPort.SendData (UDPBuffer) '����UDP����
UDPPort.Close
End Sub

''����UDPָ��綯�׵�����λ
Private Sub GoToZeroPistion_Click()
'����UDP�˿�
With UDPPort
 UDPPort.RemoteHost = "255.255.255.255" 'Ҫ���ӵ��ļ��������ʹ�ù㲥ģʽ
 UDPPort.RemotePort = MboxRxPort 'Ҫ���ӵ��Ķ˿ں�
 UDPPort.LocalPort = HostTxPort '��Winsock���ƽ�Ҫʹ�õı��ض˿ںţ����������˿����WinsockͨѶ
 UDPPort.Bind HostTxPort '����Winsock���ư󶨵��ñ��ض˿�
 End With
XPulse = 0
YPulse = 0
ZPulse = 0
UPulse = 0
VPulse = 0
WPulse = 0

'UDP���������ݸ�ֵ
ConfirmCode = &H55AA   'ȷ���룺55aa
PassCode = &H0  'ͨ���룺0000
FunctionCode = &H1301  '�����룺1301����ʱ�䲥�Ź�����
ChannelCode = &H1    '00001��ƽ̨������

WhoAcceptCode = &HFFFF '����ƽ̨������
WhoReplyCode = &HFFFF '����ƽ̨��Ӧ��
                
PlayLine = &H0 '����UDPָ������У�����ʱ�䲥�ſ�����Ϊ��00000000
PlayTime = &H0 '����ʱ������Ϊ�㣬��MBOX���ư忨�ڲ�ʱ�䲥��
PlayXpos = XPulse '1 �Ÿ�λ��������
PlayYpos = YPulse '2 �Ÿ�λ��������
PlayZpos = ZPulse '3 �Ÿ�λ��������
PlayUpos = UPulse '4 �Ÿ�λ��������
PlayVpos = VPulse '5 �Ÿ�λ��������
PlayWpos = WPulse '6 �Ÿ�λ��������
                
BaseDoutCode = &H1234 '12·���ֿ��������,��12λ��Ч

DacOneCode = &H5678 'ģ����1�����
DacTwoCode = &HABCD 'ģ����2�����
'��˫�ֺ��ֳַ��ֽ�,����λ��ǰ��λ�ں�
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
UDPPort.SendData (UDPBuffer) '����UDP����
UDPPort.Close
End Sub

''��ʼ�����Ҳ��˶�
Private Sub SineActionBegin_Click()
With UDPPort
 UDPPort.RemoteHost = "255.255.255.255" 'Ҫ���ӵ��ļ��������ʹ�ù㲥ģʽ
 UDPPort.RemotePort = MboxRxPort 'Ҫ���ӵ��Ķ˿ں�
 UDPPort.LocalPort = HostTxPort '��Winsock���ƽ�Ҫʹ�õı��ض˿ںţ����������˿����WinsockͨѶ
 UDPPort.Bind HostTxPort '����Winsock���ư󶨵��ñ��ض˿�
 End With
Peak = Val(F32PeakMm.Text)
Frequency = Val(F32FrequencyHz.Text)
SamplingPeriod = Val(D64SamplingPeriods.Text)
SineActionTimer.Enabled = True
SineActionTimer.Interval = SamplingPeriod * 1000
End Sub

''ֹͣ�������˶�
Private Sub SineActionStop_Click()
SineActionTimer.Enabled = False
UDPPort.Close
End Sub

''����UDP���ݣ�ƽ̨������쳤���Ȱ����Ҳ�����
Private Sub SineActionTimer_Timer()
m = m + 1
'ÿʱ�̵綯�׵ĳ���
AccessDistance = Peak * Sin(2 * 3.14 * Frequency * m * SineActionTimer.Interval)
XPulse = AccessDistance / LeadDistanceUnit * OneTurnPulseNum / 2
YPulse = AccessDistance / LeadDistanceUnit * OneTurnPulseNum / 2
ZPulse = AccessDistance / LeadDistanceUnit * OneTurnPulseNum / 2
UPulse = AccessDistance / LeadDistanceUnit * OneTurnPulseNum / 2
VPulse = AccessDistance / LeadDistanceUnit * OneTurnPulseNum / 2
WPulse = AccessDistance / LeadDistanceUnit * OneTurnPulseNum / 2

'UDP���������ݸ�ֵ
ConfirmCode = &H55AA   'ȷ���룺55aa
PassCode = &H0  'ͨ���룺0000
FunctionCode = &H1401  '�����룺1301����ʱ�䲥�Ź�����
ChannelCode = &H1    '00001��ƽ̨������

WhoAcceptCode = &HFFFF '����ƽ̨������
WhoReplyCode = &HFFFF '����ƽ̨��Ӧ��
                
PlayLine = PlayLine + 1 '����UDPָ������У�����ʱ�䲥�ſ�����Ϊ��00000000
PlayTime = SineActionTimer.Interval '����ʱ������Ϊ�㣬��MBOX���ư忨�ڲ�ʱ�䲥��
PlayXpos = XPulse '1 �Ÿ�λ��������
PlayYpos = YPulse '2 �Ÿ�λ��������
PlayZpos = ZPulse '3 �Ÿ�λ��������
PlayUpos = UPulse '4 �Ÿ�λ��������
PlayVpos = VPulse '5 �Ÿ�λ��������
PlayWpos = WPulse '6 �Ÿ�λ��������
                
BaseDoutCode = &H1234 '12·���ֿ��������,��12λ��Ч

DacOneCode = &H5678 'ģ����1�����
DacTwoCode = &HABCD 'ģ����2�����
'��˫�ֺ��ֳַ��ֽ�,����λ��ǰ��λ�ں�
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
UDPPort.SendData (UDPBuffer) '����UDP����
End Sub

''���Ҳ���Ӧ���������






