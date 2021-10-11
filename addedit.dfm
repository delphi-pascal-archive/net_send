object Form4: TForm4
  Left = 343
  Top = 182
  BorderStyle = bsToolWindow
  Caption = 'Add/Edit'
  ClientHeight = 110
  ClientWidth = 208
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
  OnDeactivate = FormDeactivate
  PixelsPerInch = 120
  TextHeight = 16
  object Button1: TButton
    Left = 10
    Top = 73
    Width = 90
    Height = 27
    Caption = '&OK'
    TabOrder = 0
    OnClick = Button1Click
    OnKeyPress = doedit
  end
  object GroupBox1: TGroupBox
    Left = 10
    Top = 6
    Width = 188
    Height = 59
    Caption = #1048#1084#1103' '#1080#1083#1080' IP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object NameEdit: TEdit
      Left = 10
      Top = 20
      Width = 168
      Height = 24
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnKeyPress = doedit
    end
  end
  object Button2: TButton
    Left = 108
    Top = 73
    Width = 90
    Height = 27
    Caption = '&'#1057'ancel'
    TabOrder = 2
    OnClick = Button2Click
  end
end
