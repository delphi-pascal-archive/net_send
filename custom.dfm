object Form3: TForm3
  Left = 373
  Top = 193
  BorderStyle = bsToolWindow
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
  ClientHeight = 311
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = Button5Click
  OnDeactivate = FormDeactivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 120
  TextHeight = 16
  object Button1: TButton
    Left = 187
    Top = 10
    Width = 51
    Height = 31
    Hint = #1044#1086#1073#1072#1074#1080#1090#1100
    Caption = '&Add'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = Button1Click
    OnKeyPress = FormKeyPress
  end
  object Button2: TButton
    Left = 187
    Top = 49
    Width = 51
    Height = 31
    Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    Caption = '&Edit'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = Button2Click
    OnKeyPress = FormKeyPress
  end
  object Button5: TButton
    Left = 187
    Top = 226
    Width = 51
    Height = 31
    Hint = #1047#1072#1082#1088#1099#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
    Caption = '&Close'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Button5Click
  end
  object Button3: TButton
    Left = 187
    Top = 89
    Width = 51
    Height = 30
    Hint = #1059#1076#1072#1083#1080#1090#1100
    Caption = '&Delete'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Button3Click
    OnKeyPress = FormKeyPress
  end
  object LB: TListBox
    Left = 10
    Top = 10
    Width = 168
    Height = 247
    Hint = #1057#1087#1080#1089#1086#1082' '#1080#1084#1077#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    MultiSelect = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = LBClick
    OnKeyPress = doedit3
  end
  object CheckBox: TCheckBox
    Left = 10
    Top = 266
    Width = 188
    Height = 21
    Caption = #1059#1074#1077#1076#1086#1084#1083#1103#1090#1100' '#1086' '#1076#1086#1089#1090#1072#1074#1082#1077
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object SoundCB: TCheckBox
    Left = 10
    Top = 286
    Width = 178
    Height = 20
    Caption = #1054#1079#1074#1091#1095#1082#1072
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
end
