object MForm: TMForm
  Left = 0
  Top = 0
  Caption = 'USB Monitor  ver 3.0  ( ActionStar Enterprise Co., Ltd. )'
  ClientHeight = 946
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000007777770000000000000000
    0000000000000007000000000000000000000000000000070000000000000000
    0000000000777007000000000000000000077070007770070000700000000000
    0077000700787000000007000000000007708000077877000070007000000000
    07088807777777770777000700000000008F88877FFFFF077887700700000000
    00088888F88888FF08870070000000000000880888877778F070007000000007
    77088888880007778F770077777000700008F088007777077F07000000700700
    008F08880800077778F7700000700708888F0880F08F807078F7777700700708
    F88F0780F070F07078F7887700700708888F0780F077807088F7777700700700
    008F0788FF00080888F77000007000000008F0780FFFF0088F77007000000000
    0008F07788000888887700700000000000008F07788888880870007000000000
    00088FF0077788088887000700000000008F888FF00000F87887700700000000
    0708F8088FFFFF88078700700000000007708000088888000070070000000000
    0077007000888007000070000000000000077700008F80070007000000000000
    0000000000888007000000000000000000000000000000070000000000000000
    000000000777777700000000000000000000000000000000000000000000FFFF
    FFFFFFFC0FFFFFFC0FFFFFF80FFFFFF80FFFFE180E7FFC00043FF800001FF800
    000FF800000FFC00001FFE00001FE0000001C000000180000001800000018000
    00018000000180000001FC00001FFC00001FFE00001FFC00000FF800000FF800
    001FF800003FFC180C7FFE380EFFFFF80FFFFFF80FFFFFF80FFFFFFFFFFF}
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 12
  object CheckDISK: TButton
    Left = 458
    Top = 32
    Width = 1
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'CheckDISK'
    TabOrder = 0
    Visible = False
    OnClick = CheckDISKClick
  end
  object plLeft: TPanel
    Left = 0
    Top = 0
    Width = 715
    Height = 946
    Align = alClient
    Color = clHighlightText
    ParentBackground = False
    TabOrder = 1
    ExplicitHeight = 739
    object plLoadDUTData: TPanel
      Left = 1
      Top = 366
      Width = 713
      Height = 579
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alBottom
      Color = clCream
      TabOrder = 0
      object pan10: TPanel
        Left = 1
        Top = 348
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 10
        object Panel46: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel47: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel48: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show10: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum10: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid10: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid10: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev10: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem10: TButton
          Tag = 10
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType10: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel50: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pan11: TPanel
        Left = 1
        Top = 383
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 12
        object Panel51: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel53: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel54: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show11: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum11: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid11: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid11: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev11: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem11: TButton
          Tag = 11
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType11: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel56: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pan12: TPanel
        Left = 1
        Top = 418
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 13
        object Panel55: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel57: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel58: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show12: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum12: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid12: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid12: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev12: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem12: TButton
          Tag = 12
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType12: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel60: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pan13: TPanel
        Left = 1
        Top = 453
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 14
        object Panel62: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel63: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel64: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show13: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum13: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid13: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid13: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev13: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem13: TButton
          Tag = 13
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType13: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel66: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pan14: TPanel
        Left = 1
        Top = 488
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 15
        object Panel68: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel69: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel70: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show14: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum14: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid14: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid14: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev14: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem14: TButton
          Tag = 14
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType14: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel72: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pan15: TPanel
        Left = 1
        Top = 523
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 16
        object Panel74: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel75: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel76: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show15: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum15: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid15: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid15: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev15: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem15: TButton
          Tag = 15
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType15: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel78: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pan6: TPanel
        Left = 1
        Top = 208
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 5
        OnExit = edtNum1Exit
        object Panel15: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel16: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel17: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show6: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum6: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid6: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid6: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev6: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem6: TButton
          Tag = 6
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType6: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel44: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object Panel9: TPanel
        Left = 1
        Top = 1
        Width = 711
        Height = 32
        Align = alTop
        TabOrder = 9
        object imgLogo: TImage
          Left = 161
          Top = 1
          Width = 160
          Height = 30
          Align = alRight
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000002B90000
            006A0806000000B86B491C00000001735247420240C07DC50000000970485973
            000017120000171201679FD2520000001974455874536F667477617265004D69
            63726F736F6674204F66666963657FED357100009C344944415478DAEC5D0760
            1CC5D59EB25724DBD8A6B710C780B1091D42B1E9845E0324B2741287C1181302
            988400210423209490620209C69872964EF25112E28484D07B0B29FC81002618
            520809CD55D2959D99FFCDCC96D9BD93AD763ECBEC03DBA7BDD3EDEC9437DF7B
            F3BDF7706B6B2B8A249248228924924822892492F54970047223892492482289
            2492482259DF2402B99144124924914412492491AC771281DC48228924924822
            89249248D63B89406E2491441249249144124924EB9D44203792482289249248
            22892492F54E22901B49249144124924914412C97A2711C88D24924822892492
            48228964BD93CF0CC86D9A77D7D9455EB8F7BE99333FAD755B22892492482289
            24924822A9AE7C26406ED3FCCC29318EDA184227B4CF483F5AEBF64412492491
            441249249144525D59EF41EE5973E78E5D45EA5ED8C2B276F81F2BFD307BD6E9
            DFAE759B2289249248228924924822A9AEACF720B7F1F605378EC2F8228C045A
            CEF99F37E9C607DD3C2BBDB2D6ED8A249248228964DD90D9B3676384EEC1FAA7
            AF09D81745ADDB144924910C5ED66B90DB3C2F731868ADDF51846336523A4B70
            C48FEC9831ED915AB72D9248A46472621BCB46DB22CBDA04D9F6E739222B0942
            FF4488BD974A91BFD5BA7D9144B23E492EC7B7806D6F1C47D696B66D8F47047F
            1E63518705D95208548710874F91026C15EF638C567144FF4908FF27B2F907B6
            85FE916EC0FF1C8A7664B36292DC8E6C1BAF9C3061EC87FBEDB7CCAE75DF4412
            C9FA28EB2DC86DCE6446B3027A7C24217B7471AEAEC16BB4D2E6B775CE4CCFAC
            75FB22F9EC4A363B260E58F6588445A310627724C47694D68119E6388FA429C6
            8AFFC3843F8F08BA25D5401EAF759B238964380AACB584652D9D54E4E8488CC8
            642CC4F6B0CEC65BB43EC1855C6FF047F96FDDB527FFD50E5D8CB1F7DA66791B
            0BFC1EBC7C9363FE174AD1C376BEE7D574BA7E45FFDB247610143F48503CC944
            E93D5E8C37A5D3852101CF9144124950D65B903B757EE68AD188B476715069CE
            215412FEEDE1E29D8DBAD1EE116521925A485B9B381659D637091687129C804D
            D5468C33A43C4858FEEF6EB014FEC41063851E21D8B75A52F8D65AB73D924886
            8B0090DC16217234E0D4536107D817935802130BD61B439CDB8065B5E3430359
            A4312ED666A65C83EA9570DF9757A95A9308FE0858B3CA078BC56244F02264F3
            875329FC44DFDB86BF4B6375D7204C906DAFFA332B262603C8CDD7BACF228964
            7D94F512E44E9D9BDDCFC2F66316C17545B0CC5D45062A4AAA2B8E05FBCA8219
            D316D5BA9D917C76447A6F39597E1D41F47C42A8C578D1DD4AB5802526A7A971
            C5D96463F082D99CB3D301E8666BFD1C9144B22E4B362776030D7F06ACA79308
            4D7C4E2E22CE4B0E68AD40B3C5FA2F6C5C120EE0D5F056BF279CDFF540B1B248
            2960DC187C7F8FA437BC04176E1DF5BFF8A2136615BA7B6B5F6691D89876913F
            106C8D930B9E974A739A9BC585B5EEB74822595F65BD03B9E7CD9953FF6972CC
            83A3283D788563AD7B0F0B7A6903B09E9745948548D6A26432624B6A91DB682C
            799C800D577A92A4B81E23B971FA9BA8DC507DC02BB7544212C8668525712AA6
            3434E0FFD6FA792289645D936C96EE85309B092BA691D244BD104C795CA58800
            B875A02BEC03EAB40451C0C3DC00C0C2F99BB8F016FE30C4E1FB5CFB53AF51EF
            AB10261AECCA7BC2679F128CDD9A4AE15CA576B6778A1B29495EC45849AD7B9B
            DB27A753F897B5EEBF4822595F65BD03B94DF333DFAC17E44779C96B0C3F2C28
            A53868A6A210FFC209B4777B3A1D018648AA2A8B1625EA57ACCA2FB4AC91C733
            A61D3CFE51A8DE2C7DEF90DE90BD4D14F9EF49A0CBED9EA9BD6D9E9144F25994
            6C568C47967521ACA7168213A3B92868B0E9AC2B733DC99F5D1A10E77900AEE2
            5D22D007F099370525EF5A08E5356948FE119B83B1B903FCCE5682DBDB516BC4
            081F388B007076290DD22495EB54512204EBC0DCBE369522AFBB9F6BCB8A14DC
            FF2EAC8F67643B97C6A8D8150CD77FD5BA1F2389647D95F50AE44E9B9FDDBDC0
            ED2792848CCEF320E7CA554A44015D82F2989FDA313D7D7FADDB1CC9DA956C96
            1F8A2CBA31B2F947B69D7C259D2E54959BBDA083DF14B3469ECFEC1E988BBEFB
            C77B25DC43518484EB19323665779326240920377F5D2A852EAB751F461249AD
            45076F2E3F0B217A2921D6D65C9414B8743DACCA0B2B844F4790B8125E7356FC
            3716F80178F5986DA13FAD295B42664EF7086B93BADD3911FB12448E87AF9C4C
            69C2E2DC01BCF25E026B3EAF6798C227491C8151BB940BF210EC39CB0816A319
            C727106A8D04D08C2885F5CC0ABFDDF5AD8927ECD4FA06AB757F4AC9E5C41636
            B71A39E25DD03FEFF162F259D08F5DB56E5724910C46D61B903B359B8DE355A5
            45A3093D72A561699B47C1EA67F8534F08EA12BCBDE3AC744BADDB1DC9DA936C
            167F0DAC9C0518D30413A58F091707A652F88DEADD4F1C8088F5084CC2845014
            05AC81AE40A8D7249CEE09293241AEDEA46D5EBCEDB42614D16C22F94C4B262B
            F6A6D8BA96107A98321725E736B46EA4C8B54364B019220028EDD731C1F3EDA2
            DD914EE30F0774DF4C226959F65E88D86761414F4534562FE9473288CD8B5F73
            8C54DD0EE9358E3B562B52DE63E49C2F525A2F41706BAA115D59EBFE74A5AD53
            DC0206F9B9827364DB3DAF70BBFBE074BA3E02B9910C6B596F406ED3FCCC8C24
            22B71561818A30B0C5C198833AB8D02DF8BF6802479485CF88647289AD092B3E
            65D1F878C5B2E3F957091FFBA5546A59A91AF793C9E5274C6ACD1152F755CEE4
            E6E6849485366277629A5E5C1304BB9FC3248184DD731980F2EB6ADD97914452
            2BC976E2AF0344BC1AC0EB869C1790A60EA0406612F7F443AE19CE8AABB0103F
            B26DF1F38182DB8AEDC88A7D11259762444F54209A17D5757FAFC1EE510D0A24
            7040DAD30BDB1413C23EA525457E55EB3E759EE72481E9BD043A16630B0996BF
            AD2932A823590F64BD00B9CDF333DB0B869E4952B2598F4753F0958D8F27745E
            44195290004553103CDD3E23BDA0D6ED8FA4BA3227D33D62D3785D27C675C74B
            CE9E3E4A2C7CBFB9095D5EAD7B6632621B1A43FF47486CB4CB110C1E693A1BB2
            8B68039E28D32384D56519D8C244E1B89646FC60ADFB339248D6B6C07ADA98C4
            D07594C4A7CB9F65C684700098BF8608A2342E73DBFE8550717EAA013F538D36
            294376E235CD48F0D99826B6E5ACA057AB7102639ED9B86B1F74826CFFBF5751
            BEF7CC06F241ADFB1600EE4484AD8730A19F97B40FE9FD1676F15830A87F5BEB
            B64512C96065D8835CA968DEDA6ADB856309F9DA72EE539BB4020C27F6D622AF
            6F200B4370714F76C6690DB57E8648AA27727E6CBBFDEC9F5856DD055C141D4F
            0AE514970E6D68C04F55EBBE6D59F15542C83D9A72C01D7A20BCC60E8D468432
            2B389EA84A341B09CA39CBBF13B3F001D0E69A6F8A9144B236455605A4CCBA93
            D2D8613A1D98D4F3FEF19C1FF825AFCAAC09D21359CCD896B838DD3074DEDBDE
            E4FE2CDF368F62B7122B76389394040FD73AF424E7B5B99E6D517AF0B446715C
            ADFB3697E31BD9DCFA3DC6F13D259D42E61216DCFE17A362AFB5D1779144526D
            19F620B7696E2615A3B85DFA6F592F3CDCB28786F72553ABC0C5324BA05DDA67
            A6A3E8D6F554DA3BD05584C4BEA723A3B9F6A2B0E25BCC420756538903C86D01
            90BB406F6EDCDF88DD803237D8CC2013FA5C42DF485341673889B8285C996A14
            C37BB14612493F259BE53B0A42EFA534B9A3A4FDF855019D0F18C6A1A401E86C
            E8F6B58BDF9CF8BDD6D637F8006FDB6FC964F826344EEF01007BB0F2E87AA787
            2E0FC90F34C54A0795BED39212D7D7B26F559B63B49DD2C4114CB5597298EB10
            E7DD0B17BFF97A736BEB4EEB44405C24910C468635C86D9E9B198788782281C9
            B81E11CE37EA47A69B56B42B44025DB85424E2CC8EE9E93B6BFD2C910CADCC9E
            7D05DE6EC2D5DF2614DF8094D794A9CD50715B454F7B6A2AAE6AD0A14A174448
            BBEF710A195DEEC1829B424C0864EC87DEA7651436B37B5E5F05A07C6603FEB4
            D6FD1A49246B4B3239B193C5AD8560987E91295EBB9BE336987ACFE3E0E20400
            B4C25DCD4DE88C5AB437B7488C2BAE22BFA72436418862B08D1ED15E7A9A3143
            C43EA45A348A3EF56D468CA114FA36163B52827229BA0F2D9935E25C30A87F5E
            ABB64512C950CAB006B94DF3EEBA7334B1A62DE7BD19EC3E5DC17B6003088F22
            04AD12EC57D9B34E3FA9D6CF12C9D04AB6035D8F69FC1221292C9213ABA60171
            DE65E95423AE2A173B97E3934B9C3E2333674A2F32F67666F96E307FA7927074
            24920037214BFE7ECC48E9E4740D37C4482259DB92CB89CD4B1CFF9692BADD19
            EBF1AEBBA720CE4F5E423E5D8CA1F4AA3D421C9C3E012FAB55BBDB3AF1715890
            FBA199715D1C22B8B415F58817DE6423D181D0CE8F6AD14600B85BD318B983D0
            C4116EF09E7200A88038B62246C5FE0D0DF8AFB5EAC34822194A19B62077EABC
            B613E258FC12C002E11E703539B8266630CEB60C49108C8A5C2C65C43A60E1F4
            D4EB7DBC7524EBB0CC9993A8DF78D3E2F709A1B3E4E62741AE9B8356A6F411DC
            5E8E05DA3D95C2EF56B31D99CCE6492BFEBF67094EECC9451E19F470837B1B3C
            CA344F1C28AD93C1719F32C152E9147EA8D6FD1A49246B4B54096CBC3C67D1BA
            93DC022AAE782774C8D1F64E854058EF12E456DD78ED53FB3BC55D84D49D2E01
            A4799A289500A19A0E00ED6CAC45DBC078D8BEC8718745927B6980EB57569469
            0A192F3ED7D284F7AF751F4612C950C9B004B967CDCD6CD54DF023F5184DEA32
            C082195C264554A030F8D56A74D685915806A0F1AF77CC48DF5AEBE78A647092
            C9756F4ED8C839168D37A80015CF93E2CC0F15C0557AF8EDB7AE380AE6BD18DC
            DDFAD09EAC389A60FA2B4A684CB6C74F7324CACF189CD34C19D9AC397BC5D711
            2F9D9B4A91AA05C74512C9BA286D59F15DCB4A5E23D372057478B8588A13C829
            8FD8617DBDCF4B62F7749AD4C43B6A4AF67E314914F10B18D1D1B224B0992905
            2B8F73E12200B93F5AEBED92857008BD9D90C4782601AED7B748657E01835C1A
            D6AD2DA97527776F24910C568625C89D3A2FF3B30D09FDFA3227C1BEF7301502
            CE82BCAD60F53329F52A67AE780440EE11B57EAE48062EB99CD8C9E6D66D84C4
            267BF933110AA4169209D86DDE75694B23BE616DB50B36EC7300B4FE80D298AA
            74C485ADD30C0927D382D0C784985015190EE07619C73CCB8BFC3AD8B0DFAF75
            BF4612C9DA946C56EC2D307D9C10328273B7A258E82CCE48B1A70DC384CCA6F0
            10121F9F904A6D5495BCD7FD7E8E0E349FD0BA3339EFF1B9B9729D7306DB8D38
            3895C27F58ABEDE9C433A0013F00903D5AF385FDFCBD5A2457988812635F4EA7
            C4E3B5EEBF48D67D69EB14C7131E3F829122970BD1C29A0E688B107D14AE8319
            0AD7E567B43B92C1AA16842F4837E03FC29A3F8CC4EABF5262DDCCA514CAC400
            18C7A92DF2BF0BA7CDCC66E92ED822670A5EC24C59B932DC94C2DFF6A78BDF1C
            734D6BEB323B70FBE106724F9BD7763847FC37147AA0E445A83B0F13A2358603
            13F46B376FAE8E748FC30F79C4575818EFD93E3DFDF75A3F5F24FD17586C8D58
            E01F519ADC42A6C1097A49DD834D799C29BAB16047C006F3DCDA6C5F365B3C10
            D1C4C50068F7C6D8DA447A6AB173D62AF35272BBD025307E9F62B208166E5B2A
            45FEAFD67D1A49246B5B244D41884F17D158FD913AD00C05A33051A8888AE3D4
            2054069C15176D3BEEF953F6DB6F3FBBDF37AE82804E3A120BBA487373B953B5
            D052995D301ABB6B2AB5ACB036DA91C9748FA289915713442FD0DD560AE61676
            FA547A98392BBC1EB3C4410D0DE4935AF75F24EBBE2CE8C03725E21B9CCF9853
            08059918CCCD822283BD5130218004B2B0266CDE3D0D00ECDD6D9DF88A447CA3
            5666AF42E6CE4D6812158BCB1FF8FB5B979FDCDA7A95F0EF2BAE4EC437BCDCCD
            B6224F7464D6A45269F9722CC66E0A6BAB68B6735881DC53E7E6368A93FCA323
            09D96D55856033979F65DAFD7EBEDC200836E3806499DF1EC42F0190FB835A3F
            63247D974C2631D28A17AE04003B8B104AE5620B1652F045E5A66485BF7CF261
            72CAAC5985EE01DD709092CB892F166DB20F4CB74D74794F19E8C157C0927FCD
            B6937F49A70B2B6BDDA79144522B81CDEE648AE9FD3AAF34F7BCB6EEC6675216
            9073D9E79296FEC24B89FD610DAD136568A56EA2F1FC4B842476145C675AD0F9
            AE8B99E6143A7D6DB4219B13BB71466EB168728AE207231E700AF985929CD461
            ACE78E54139A5EEBBE8B6478880CEE26347E09632575DCE2D764F15F69BC6BE0
            2F1DE288E4FE07FFA55A1A4907ACFB8B63B4FE06C6BA020698A4EE316E2FE125
            B19F5BAD100CE118274B1FA53871A0AA32E87D561558F9271663B61FD62077EA
            BCCC8F4613F24D09709D6E733AB352168572AF6E5944BB23B230C40A2E9E5ADE
            FDE9D10FCE9AD5832259E70500E3CE4C583F840DEE08937F2BC504BAC2F198EA
            E8EBE2EDA94634A3D66D8F24924882327BF66B74FB893B3E0860EB48A102B67C
            3A82C763378337CDAC243A1735C3544C4E35E0976BFD2CAEB477E05B61F39D29
            4F6B900372C1103FA32525EEAAF6BDDBB27C1AC114404862D332FA962B5E8C80
            EE546E8B692D2DE2EE5AF75B24C343DA3BC44F2C6B8359B28AA8CE7F2985AB6A
            8452B0CB35423A3734724FD1956B97C92C232A50B42D8B2FB6620072EDAEF28C
            43F0BB8CD853D20DE47979299B153BC0D7BC8AB195404E511837BBCAB007B9A7
            CECF1C90E4F8E118C1C982302D52833C8F10324FB382125CDD66D95F0B06820B
            D463736BCAC299A93FD7FA592359BD643BC559BA7E7D7C3399C4DCB52203C967
            9169FA104D0D60A5135B526451ADDB1F492491040536AF7D05268F614CEAF5E6
            15CA85EBF88084A9C78D131BC9CBB5597E7E4B133EABD6CFE23D5327FE266CC6
            3F12423228D4C6BE02097A402AC5AA4647CA64C4E7688CB642BF4D93D964A4B7
            CB341602312B9E275C06EED9CB5889EF14C50144D2579134418AE35FE1A2C89C
            D06E06C6E686605C1DED7A701DE76211E6DEA380B296497F131754A68A16988B
            5B5229F21CAC938B09ADBF81B32E3F658A326AB1F6E6B2C225B06FAB53F6CE4E
            71B6C0D65C2E79BFC6912DD1C1A7C317E49E37674EDD87F5631E1B83E97E2B3D
            1E6E650F6E25290F48D3D5714CAEEE08F8B91BF1EFB44F4FD7B40A4D24BD0B6C
            84E305A157114C52FAA8BFE897CAF552D0E280F1A32F11994AECBF3615BB46A5
            2A238964DD93B62CBEDC8AD55DCD597740AB0B839A804CAA99FB8BDE3E272B9D
            A11588948E4B35907522A7346CDE0036AD2B64B029259237DCFD925DAC3BAC5A
            940AD08F2709625D4F497C07210A920AE5A54F4401CFB8F3AF97D1252EE91EBF
            6B6912C7D4BACF2219DE92CDD11D11172A1DABA21CA932D1C5A558E0FD5229FC
            56C5DFE91497503AF27A5BA60BF4325F69739692A48C59F94D2A258E773EDB49
            48722A730A98781957649C0B805C315C416ED3ED99D651985EB18A33242ABCEF
            07987114CE935B899EE08BAF4E6596852EC15FD8FEFD77F7BFAAB575AD95838C
            64CD327BF6243261E29B67C0E2B99C58759FD7F92779B09A9D4F032AB37D885C
            28BC70DFDB6F4E6C589BA53E23892492358B0A38434B7F43ACE4E12E55412E6E
            EC5214909F47DA5FD70EE7CF50EEAA780A2BBC16A3FCB88606F28F5A3F575B27
            9A0780F32C797C4B95A7B9A72A9EE65C4E6C61730A1B393E03634A85A46F55DA
            29437C66FD0FD6FAD1CE7F0B80C48F6BDD67910C6FC9DE4F278A827843234FE1
            E4A62F2D8D51BC4F43037EBBE2EFB820D7EED24E2A2EBA605E7E8009DE4E55E0
            E3C52576A97B7784C6231AFFE065584B3B487A22E36C094CE30D312663E47DD0
            7005B9CDF3335F22423C4A11D9A01028D98BBCA032DF531B0CC535F3E68683CF
            F4EFF8A038063FDBA06119C7872F9C995E273C0191E8D4604546AEA6849E24C7
            4A6E18E1E032A3044820559CFB06C6719962E83C50E2B7D4FA7922892492A064
            3262132B465E03B4B5A9AA50E88867C43A29F74C5A92A7CF9DBF5CACEB94C17E
            2466A1E9B0A9FEB396CF955D48EE814DFAAB42A5BA14D2B37A5A4B0AB70DE93D
            72B41971743921B11D646A307D8CEBF75FC0E38D8C9F5DBA24A132D23D8F083F
            34D5805FA8657F4532FC259B135F449CBCE6D315549196A558C426A752ECCD4A
            BFD3961597C4621AE4EA5357FE1F58EECF8081D820A93EB0FE0B98B3FD9125BF
            2CF61C7C80AA9CF7763E2308DF83E0C4CE2A946D38D215A6CECEC6F156F6831B
            10FAE5954AF995572E0B7B6C2BE5CA0D4BB04084CFED1D432CB48CB3EB3A66A4
            2FABF5B357533219BE8965E18D9085C6729B6C0597B6C4586C0C7F9CB9295F89
            026C3AEF5B08BD4708FF182EFF07368D4FD75E1B132389953F8710F26D42929B
            A8D460815470FA5F33A0301C85EDF3CD8AD2923C10DAFF5AADFB7E384926D33D
            3A991CF5394EF838DB4613C07ADE1C8CCDCDB9CABCE732DAD51F6E0BFC3E16F8
            638B588BA1BFDFB32DF441BA01FFAFD6CFB02E4826F37ED2B2B6198790FD0558
            53BB3224C65181360494C1B850265937FCFD3647E4354E4A6FA51BC8E25AB779
            6D0A6C8C7B0B4E5E90E1297A2D8B725DEE78767DD0EB5DF6B2E408EC7A266539
            ECC29398F3335329BCA456CFD5DE011B354DEE2FF3FDC266BD8A51B113AC8921
            F13067C0F88F7172A540F414558E5714839C6561EA463F702F7CB229D3AF313B
            FF0AB79307A4D3857CADFAAA4FCF9C111BA3241A6BD9D66864D9B02790B17079
            238AF9A642A874357AEFC2B848387A9F10B41C74D7FBC846CB407F7D924EE38F
            6BFD0CEB92C8131484966E0D38600CF4D166B07036E1301B08C71F404FFECFB6
            F3FF48A7EBFB45AD7141AE130CEA805C06205700C8C5BD825C0B40AE0E3C93B4
            23FE6F18CD5B603D7F4FE6CB964E2AD8FFCFE5882728A9FBB13CC925882286D8
            4C50A1694293FBC9493D2C416EF3BCCC457584DED803009757C897E8674B302B
            9A95D3142A1784D05E5CF3C87B04AC8A2E8E5EDEA8FB93436E9E35AB2669A6AA
            210018E1D1F207E318DE0F9E7812176C7B9888E3288D8D0AF4092A3FEDD7A571
            ED222C80D7A0CFFE08EF3C1F27FCD70018AB964B319BC5C780DEBE0CE1D814ED
            0171A3354D4F84BFE9A1D0E6879DC177F966F0FB2F6CFB85D107EEB7DFB201E7
            D09C3D7B369E30E126ABD27BE3C7233198EF0EDF07A1AF92D6D69DD8E0BFADFF
            92CD8A899CA0C391B0764198EF0CCA690F42E331775139F52BCA4086B938A1BF
            39F4FE5B0459AF70C1FF4410590456FC5A011B324A7FC284FD49F8FA508D911C
            9FBE54CB9BFDDA6B74FCEBBBEE43193B8620BC2F13621F426323BDC32527D2D8
            EF3A3D5FE5D11E26F84924486EF19BCFDEDFDABA6EE47DADA6643BF149F0F4BF
            08849905B2A30483A63CD0E67E4128A5988EE696E9BAECB731E6D7A41AC55A2F
            F50B3A3769C50B7FA4D6C81D65B36D7BD5CB448C3920BC01F757E6E6F8D81136
            3D17537201C5B18D7555385EF6FCE1E24765E93391EB0488CBAC3337EFBAF3A4
            0B5F7DF5035837EFA0BE16D49034B26AD1BFF43AFEE276F0E59309C1BB83E2D9
            4670FC0568F8D698581B064E697546AAB26773332F01C85AC185789748039CF1
            FF2316790AD91FBE0CCF59F55CC532E55535BFDFB67B121326D4E5FBA3DB6445
            3E9E27A7104A0E148CED8209D94C834BBFE74087F78005F4472C7866FCB8D177
            F7F5FB2B835CE9C9C5BD825C9F930B2057E5B3679F082C4EC75CA6284B7C51B6
            C8E68507E01BA19DB1FD14F6E3C58F60E00F841B746212DB4D377A98D1159AE7
            6776215C3C6E61BA51DE59C461B05AD9B3E7674DF0332F54CA936B5AB75E0C3E
            58C4D0C51C4D5E3833FD62ADFB603092CD7E924068C3FD85A0C70BC28F07B5FF
            394A13315D80C096B318799AC19170189FEB2101A4A8269F8AD695C50B44E95D
            002E39F88EDB87D25322011642D68530C1A711128BE9C8607F070B7AE88DA21E
            F2276104A0E132C0FB5F78F517218F39F428AB84D400E6E4137D0C2F3E461879
            C0087E17700622828B7BE1F91E93D77239BE599191A709B6EAE5110A7C983367
            02C26B59C5E8DFFAB78933F39C390B3F075F23AFDFFDF7749B386873C2B8C530
            B9319D12BF5D5B73059E6D82CDE9C182A1464C31805BBAA14CC9A2D2BCC8E322
            87FF6CA67542A252196DB37C29757217CA2A6FC58F31268F8271755B4B2300B8
            2A4A7B07BE01C064839009CABD098C11C3280FAD7A9F0AD097829745AB86C746
            5F739ECB9B1A1C49A00A1B038076513140359313E308473248A2010BB21BA5C9
            116A36C8345272CD856A391B19BD9DFE23CA30132AED94781C0CCCCB610EAED7
            C7C80072CF02543A0FA9FCB82200FE03257D9D6BAE04D6390A1A5F52E4FC537D
            CC1000E8E275A91479656D3D5326D33DC2B2469CCF89D84A56CC856778BC2585
            EF1BE8F749E36ABB09579E4208BD1436FA3D852A176CFB3A0E218FD6814373CC
            FD3B0C807D1781F8188CD92E5D851149D4FC9ED7C7CEBA30759AD2539C0B6CA1
            D9434971909E5A98FAFB524C0F649C1F0E4FB20DAC870DA5B759392D549A48A6
            F4911B3867CE0B9581C33CD1735FC94A73986A00A5525CD9B228D062F88276BB
            8872E934FE7735E600CCEBE908D1D9300185AA7EA0F480CC04809C7F5D44EE7B
            DFD56EE00CA0DEA5CCE227A161A5310BFAE44F31C2CE6E68201FACB13DB2AC33
            B6CE86561C4E6872AC0EE077F8DBD22DE11A49DA3BA4F24F2B0FA9C8DFCF8AC9
            D3D3E9C2AA35DE0340AE0090EBE5CA559CDCE26A416E1B805C8BFA9E5C98DB2B
            6182ED8B38FE0121C96375FE7BB1029A520FF3C1C22AE342E9F1962671585B87
            F81B258949DA19378C3CB957CCBE02BFBDD5760F8CA1F884E58C07F8B37DA123
            A8070B1CCB54CAA31BFC1ED7FB57270B4308F1C3EC59A77DBBD6FD301001C032
            B668D30650AB8DB05D1EA83C994A3970055A546F28C548D586AAF86CEA382D68
            30844B20BB46812EFF48150D8089E27BB03EAF4835B241F1CC649B6D8E672241
            CF2334BE85CA7B0BCACC3153DC94D24EE37C30EB34CCCBB6611A2E9A73E67C56
            AA6A68AF9F6ACEF9ACFB35CA43298C28640DD298E86A00257E8FFC0828E0ADAD
            44EC5FF27BA4B2554044B64CE6A0749483D6437E6BDDB4475829B5F2D7FAD6BE
            171A23B9787B38D35920AA4EAD0085B48728D1D3E0514F85E7D94A6F1E5C72A2
            D47C313DE24E67AB942E3A3389FCD9DD70B81FBD6D92FE9C2C267A9EA96A4FD2
            C57B1F45F6F5D5AAEAD6D6891F8BD1918772675CF4E6888C9CA0A6044F02FC53
            218C50788EA9CB922F6677335E3A1D00CBBDE637657289AD2D5E3C0BD6473380
            ABF14A5FC11F65502233B5A11F39ECA741C46547F42ED865B04130C4CE4C37E2
            5F567B3ED44A241880E7BD5DCF251100AABAEFDCF5E1F6A1F9A6F13AD07FC833
            1AA4571736C0153022F379B1746B3A4D8655654B58A7FB40D77C17F4C3F10072
            91CE0B2E02866780AA855099A11074E8888053C8D5E97E078782B7DD4BDE774B
            0A58015984ED3C1414B06C56ECCE306E04B3F87098F4BB49308AB0D443F27E3C
            D076ED71F4AD19B5BE3C7A9A517CC0CC2811984F528711074C1119A8B81840E7
            F7ABE1EDCF66D1DD34362A2D8D11D741A41C062EC5DC3D45E6CE7E64E89C32C4
            82C338577A3C8B2B60633B32D5C05E5C7D3BE8DE82D817C3389F4470023A50B7
            23807F0CAA8B6958CAB1904686E05DD7344DC5DF5BE3331B9E5CBD87A8F4746B
            A62B580072591792F39B31B62A6EF1DD8B36CC091ABF4AA7E0F3C71C6BBDF8DD
            9646716D7B077A03F4E444A1F4FC3002B94DF332E7D461F2F3A2843A425404B6
            E59377F5E9C42A2902FF3D5F31CA54622B197F7DE3E4D27D6F4ECF5AA3E5B2AE
            88630537624167C082DA492E64A6526CA11098A74EEEB9623780B577601348C2
            9FEDB12E96505E55C8E823B7EFDC0D5B1E7539C99FE77CFC61F2B259B30AFD2A
            A4A139419FB608629D4F706C17099A14200F8FB9013E850310851B84223C9DEC
            830607E07A46300A07AC98DE0E035C78DE5FA940789E51B6ABCB8FCC64BA3720
            56DD34E8BC8F882CD642C444240858C6E80065739B297A9C36981B90C91BAEB4
            91AB36C300225E7C7EF19B930EA8661608755C55A41762C19BA85537421B3936
            AA14B1AEC799A85430F28100E0BD4FB078071466113E3701FA6A1B4C54042D0A
            AE41135CFA86952AC1CA0A1FDAC8BE1C80DBED43F95CF2F874FB1DDEF8B315DB
            6017EEA49851810B8142216197A09987D51F0C617CC633EF541AA8FCC2E646DC
            E87E3297139BDB363A1B36CC19C44A6CA9BD91665F38DF14EA0BF36839DC57EE
            E7B1332760235F89196B804DE277D59A13B5140D72F1ED7AA3F2777203577946
            2932E869FE3A1781CF999C7CD7A8406040AA930596FF1717FC675D169A37B301
            2FADF5B3AFB65F64E27B8A6681826B2124394238D404538FF86BAB1CE46A35E3
            1B50AE98BA2E7CCD9F930855F2A0BB4013E6E4BF371821763EE104BC6C10CF77
            08A2F40C30AABFE29D78F06240577ACE1827652428C825A06E7BD454216804C1
            E40B7AEF2A197D53F9C4D6DF484C5A4BCCD16BC5F99F8CEC397FD609F543560C
            2A9BA37B405B27409BB7E2427C09EE79AAACCCE9D24B4CFEB4D7EDA13DC3E40F
            9AF3B92F15EA64EC0D8DD18BE0F7CE2516CC1FA6B312858AC206DB60B4C39D47
            58EA3D3BFF3A1BD533257D42FDF2D53FB3E3C955CE33E1A4105B3DC8D5748551
            D7DB6C954B575815A37C4F9BE36D60DD3EA22732F738F730176C68D081F2846B
            4156BC69D1C40E0EAD717880DCE6F999ED60623C9FC46493EEC0316970C3F027
            B30B5A7045F06A5AAD9524FC7B96F60CDA0C8B13DAA7A7D7F94DE585D963ACF7
            26AE6C629C5D0C9BEC17F526ABBD476145A637E99E2E00B9730466F7DB79248F
            691296457682873E0F26E431121004F9CAA1343E659E12AA3D4EA5EE3BDF7EFB
            CAE97DE12B4ABE1A21F92F134A2E06D473809ED84564024E8442F70E7B6991EB
            89F5C1C4EAB22EF8525EF9271C98A188EEACF022B39387AFEE8866CE9C44FDC6
            9B177E4F506C7F9DF521BCC11A6D0D3D4F10FCE90D46E504E4F9D65423BAB21A
            7365CE9CEEBACDB6187D2E58CADFA434B185DE185888FE13A4F7C84D4048E1EC
            77F0D75DDC167F59BA34FFFE3EFB6C595AB264292821B4A7C0F87C42E3FBBB34
            98B2E4F306A7D2ED5FA594ECD24D6FBFFDDAB7868A7F3C7BF61578C284D62F21
            2B390AA1BC6CCA38CCC5F7E11936535E67E4D5CE323CEE2200A64C09D39B742A
            BAEEB3538D789EBC96EDE453C1D0B982D0E424ED5162651B57A508771432E04C
            B0AB3E2682C0845A2AC5D31B16E587343490F52E984FD1151099A7418A6B68F9
            9DE81BA461DDE38D5EC5AC0BA2AC6FB163AC49C054808D18DFFCD1FFE2EDB52A
            F3DD9B80E1B4A1CDC9B7E001D304C7B75294213044F5333933D705FCC8586728
            B49FF5C665EE05D054FA4CA5B54CB47E7C04A34F8FED2B7FD7944C4EEC6C3174
            31C2D6D7C0F088BB86A8B90F4B83449DA6B1C252B8E50B04A3459CF3D76C0BFD
            2B8950219F47289944493030C70942D3F099B4D456FE096090C2E6F70DF23DA6
            3E68726237BAEF5EFCE68E6756CBC1D0D6892F2288DE00BA88E83EF629955A02
            1A29A033D575636F23A41ED9BCEB9B2D8DF82795EE0560F368C1F1F74167ED8E
            D4FC61BE51648E333277C7F2FD4B1B3572BDD8CB191587A51BC81F57F78C414F
            AE4B57902097F631BB82E2F076C1D8EDB9D2122B4632F2062674B4D6AD7AEE31
            517895177B0E4CA7EB57B467D19BD49279A1C5F0E1E436DE7657C7686A35AEE0
            1CF94A0E7B13C27583BB83E24F924A657B83D5D0F477215466D58638BBA35558
            26FB51C78CD32FAA757FAC4EC012DE1BB6C0EF614A8FD3CFEFE7470C002878A1
            7248F2E29B98F019A9065C9622ED8517C6584BDE5BDE0A93EC322E3359E0F022
            0B1919EE2525606DCB63065EB81816DD8D6B6C77A768C124B94083EE82A62B19
            2BCB07DAC63D2A793E3D1EA319A8123CF691ED52475C8E72F39535F650A819BC
            287FA06025DBA5E56D60259FB6A66769EB14E759A4FEA78CF768AF1242C8E558
            854B93BAC404FDA6793C24FF967A0F83F16A1F5E0DDE2A6C9CFBD9DC02A5671D
            A2C657B09007AC02B85273C67E17FE7C279DC2B9DEBE1BC07EDDC69B16AF0465
            78B156DE1C9934126FC84C6302C0068171B1EDE22D7F5F3CFAC2D6D6A109DC0B
            0B00A84B41D15F27B373B8D40BF768CE9CD76E6ED670349369CC09CE5761C4BF
            6459E8239BC16645F099D240E38EE7B61CACA22088303C8FDEFBDEF81BFACBBF
            BDF79E04D836EF9E0573E3A66AF4532DA52D274E249C3CE0F77B65C05FD64F5E
            5A31DF1B8F8CF51F482588C274A49843B3114F2362DF023AF1DE7E35BA8AB2A0
            035F9D8C8FBD5C1D6F2BEFA5798A26E4295CB9916C80A1A098CE8072A78E3C29
            20CEFE691AFA7E3F9707B1515A874A6CE99DCD53F199FD79AE4C2631DA8A172F
            80713B9FD2F846F2F4479DDC61DF5091C7DB723F515E39C999E5FC1ED03DAFAE
            E9BBDBB2F80242E88D18F39870B8EF01076905A3C85C9FF2E45352AA600F9B09
            6BECB66A8CABCA078D973D4668627FF7A4C91F25ECB4D999BB21FA40706CE45E
            A1124A1F974AE147437D2C031E2F85CF5C0AC67D42CF9F72E78A7BD418E6B1EB
            FB2167AC9D5D4B6748E866941FEE96D7EDF51915C8A5AFF9105A52DB589F3CB9
            4C7A7255953ED615A3629FBFFD6DC737B69BF8B7A7294E4C91D943E4D7C9B967
            B36E2FDF747B56BC49ACC40E68B880DCA9F3EF6A4E70D2263BDEAEC8A731A5DC
            831B3CAA28F74456FA7DAF23BC7B0994046094E77C31E95EBA2798F9EB1C6541
            1DF393E5DF809757C0E6379A391BB87F446508D61E5C50287FB4893D1526E9DF
            57F7BD1C2D7D0E14D05E2AA38167E9FA2B245C16D27D4B5ADEA05C96216A1F06
            1BC69F56DBFE4E7C1A6CDBB341C131158C4334CEC59470CC11E5186D09F7ADC7
            C6A20F1EDBF81679A0AE3D0A2B04B9C0F83241C407D816968E1FF283884C51F7
            27FA3D9D56A7F883969498BFC6B1008B19F3F86F05B23DA5E179994D50EDF697
            7743B7BD7ADEF989ECC541439DAA2D9BC5DF807B5F03CF0573A5A0F8C708A350
            9FF9C7937AB3915ECBE29FB060CDA09CDEE8CB7DDA3BC40D84C42FE64E5ED080
            47DBE9003790500F2571B8DDF96FB734921F0EE5331BCF7E14A6B107C1002401
            6A4AC0F385420650708CA4285E1ACB3F43B0B88661AB95E0F8BEEAF4C135C6D4
            BC32398352984F9570B9CDEE31AC778B722FA47F5C6F6C152A0ABEF404E2A38F
            06255EF5A8F0B529D92C9F040AE4CFF0948970C61C6F4B364EEE7AF548EA0E0D
            803D4F43043CC0EED1BCE4EAC3B84A8E2213BFE184DDF2F737777CA4D60563DA
            3AF1D9168A4D83F106ED28E70F75DE918010AC1D817645BA5679908A10A27585
            259C6653FECBB9580CC0F0139992893BE594CDD7FADE4C5D9322AF135A2F31D6
            DCFEF058B339BE1F67D68D168D4DD14E0C9767E90C9A732FD0D79F40BB6EB18B
            F61DE934F957BFFAAD0D2DA4F17883A24EB900CEF87A9FEE86BC75E8AD3F815C
            AEE7125EEADE5D7A09AB33B6E8168BD69FCBECE0E181EF6470F57030D6C4A42E
            E880DEE23F5909ED974EE3FFB8DF91C9886D6271720B2689E365FF4A3D5C66B0
            844EB1D4BB2EE5CFA3FAA1C069933ACD0300994FF083A79F42DE5DFD38BB8167
            EEF7C35C62A5A56048AD9693AB3CB94C7B7239635DB0734F81CFBF9AED103F23
            74C4D719EBD6FBB96A224BA71AB19A7B12E4025ED9415E5FE7E90A676532DB74
            17D0B3498C3FD7D39BF6F2FE25FE005500C2E5C107265FC905C7EE714158C052
            55BF8841F5B11317CE98B6A8D67D638A8CDE8E71000438768AE6C3DA5E37791E
            2A63C3D4C9D10B7F077576044C9A77D7F4FDED1DF856005C3319AB9032D13B03
            D4ABC2EF437D2FCBAA03A0D6BD60D79D773C63A79DDEE8F5085A7AFEC68ECD8F
            F23ADC91A43C95456873C1F0E330D937ADC4A5343DD5EAE71000F6DE933C52B9
            1C983D8BDB3D77235417EF631763FD2C6397F525DD0F6C48C7516CFD9A3B9C56
            33B82900A43CBE6FE50D885AD23BD27DF7698D785A7FE6C3EA644EA67BC4C689
            FA1B09B2CE918F556EB804E904DE9A924691B0DF41B87462AA81BCDED7FB65EF
            17E34501BD06C0B5CE3D5EEA7DC3D5D7253F1C36B62E1879006F435F8E3597A3
            936DCE1E9700CAF70E864E7C0C35E0297863BC747BE5911DFB27AC394C68DDE7
            84C71DB49C233699B49CAD04CCFB1626F83F307763D0A75F04D0BF8DDAD45DA3
            CA98AF2E75C16F53A5E342C3932CD827ACC427C1E6FFD150F7532D45A638A4F1
            C2F392972FBD97614EBBA963CA9C1A4670A9BFB1A232008C03B56D83F5C07490
            5F4C021CC9CBF9559CA2EBC1D07CA9D6FD5249B239BA2F4CA5E724E7A2ACEAA3
            F73C95A97D66BFA84A52C2FE140CDE29BD818F216B73279E2E04B911FA788C4C
            BFAEDB114E6BA68C440EFBD98C9614BE6320F769EB14C78331B808E90202BE46
            330C1BE4FD5CA94F5C5C414E4E35B2AA047AB62F1477503CE20CC6BBFD35AE6E
            1E3E6136DA86032A4AEB67567C66F15B571CE4D20333393E99306BBE45E3931C
            EEB2FB69AFBFBD1FCB6874BEB15DA6AAB1533194F53CFCF62EAF1FD3BAD3EAA9
            65D92CDD85588957BDFE95A775A5E57289EE0CFABDE25E92ED14B363B14DAF74
            3DB9F254D4C6F6DEE906FC876C564CA7B10D6E77F24E20DB5ED1C346A2EDD227
            68709FED401F58B1D19BCBE783F79603C8DD749D05B94DB765E68FA2E4CC9542
            78168C3BD8E520B677606BBE0EF3797BF30A07385E4E60D32842D04A2EEECECE
            386DC840C760454D6461CDB5706267E61CF38717ABD90F4447157F02FAF09854
            8ABDDC977B2CE8C037C568F27CC61CFEBD0980BC0DDA33F7027D2E15A7CD8A6F
            097B8BBDD3E9FF0EC81256694E88F5985AF4DC4D1DE734C479480F9B54084E73
            7F411F2FDB1F322A76A966510258846791D888795CF557A898A6D734EC51032A
            55E1D346974C696637B438D91C062BAAE047C2BA93E0C471661964CF2808B5D1
            ED675D469175D9821D9F4E9127FA73CFB939B1E108869E858D66928EE02D3F4A
            F5A690B1F1482E3228B62731FFF4A8A1CE5D091BDF2994D4DD0B7DE033DF8408
            8C43503760638311FE31A2104E100C463A5ADA5247DE600CCA7CD14F62C1EFB5
            ADE40B288F3E5DB2647CCF8409CF12DBDE70B41527D301CA5F0DBF65B9592874
            5FFB95BC5C7F6D7990A26336A97D57816C9B50B157AA61CDC7B7C34DDAB2FC5A
            2B36F23BEE3A0AF33C7AF54C22D30D621017C22017E15E367AE7827C4F529B90
            F45A15BB0049DC8B78E95600807DD29B6B4B0030B60258BCC2CFB060F2901D3D
            835050177A7DE2B841B0179FF1FBE6467254D5DA9AFD2481F186D7803EBF4807
            8E9582F116DEF068FDC798BD0A60E6DE7D3D392ABF9FD84160FC6758A7759A8E
            15DAFFCD7E4141E797974654965FE63DD7B634E2EF0E757FC82C428C9147118D
            EFA1D2630A5FB794CD51DD319E31ECB2A9B47E827D96177F7A5A13BE405E696B
            E3C7131ABB0B136B23A9EB7DD615365074D031549E7DC3EF9C20B50123A762E8
            85A99498B3A667CCE4C436B4446EF60E1FD48BD22A564497F496AA4DEA688BD6
            9FA61D6B8A939B8761F84EEA14BC249BE33B8A126E45341657734894FEEFB426
            E1657968EF403F4738BE95CAE420EC8FC67F61CCCC704EDF7502E436CFCB9C14
            C7F81E6859CCAE904DA1F74C0A02F9E98CC24A30BC9B87BFC7FC7E7D4C6D7A7A
            E559793763EF903A32A53D9DAE79B047A64D1C6BC56886E0D8468A9385828474
            FD1CC1D41FF0571E31BB25D5C7FC8C3271B5C04B7F070BFD301D08A6BE356830
            20EC1C03B9DE5C646CCA2AC7DDF218113B340C1058B675E21F511CFBA6B24643
            C7DD61AF85EFB130949573451DFF97F2F73537E3AF56735CDADBC51DC44A9EA1
            B84F016E70E88338B0B73ACF8194375C5BAFF6C7B007EC6A1E3F0D54644EDF12
            A70B013C1E2C15879F6B1805361693E7E50204A9404BA2785EBA11F7BB04B20A
            288C171FB448FC50C60ABDF2DF4D4F1372B9CA2A85116B4835882101F9AE7474
            881B11ADBB487372C306AFAB43DCE6B8A827C461332940581F71C36692E718CD
            A39CDD994A91D582CEF64E9185B16852FC73F74B9141C541C6A6A3DE0852ADFC
            9803CE450C1FD6F255F1E450F6D1BA20D20324B0788A103A4667A728AF6CE6E9
            22E41CAF3A068077E41C0E9A72AE95C71594F7BF2BBAABA90EAEE2852ED8DD7F
            6927C48DE953AA93F2AEBFD2DE219E242479903F97DC86233FD3040AD3CCCAC8
            79CE9177E11BA946FCB36AB4F3B5D993E89F77F8DB5C002FD355B961CE7CCF7B
            2016C13D7D5427155D602C4E1E687AC15C8E8E2BD9EC4542ADCD54A05520AE24
            74DC673A240C83DBA223508975FDACA5117D63A8FB2493A3FB5B5CE65DE77197
            5F5D3ECF8DF699A73E2660D7CEA4A9324EA22D2BA60126F83126648CE2AD2A0A
            8E4E9BA7FB9A21F7D4C9A4B3B8FBB7D6BDA20CD8BAF7D70179857FB312DA17F6
            A6F7AB3157AA2D3507B9A766329BC7F2E2E991946EDFA5149830402BEEF5F782
            40D8E1FA09150285EC90AB3EB8B1B9C0B837B2AFC31684DF894B9428D0891D33
            5A6A4A59C8768A3412D61C42C91826AD614399A1B2C9A94595B6643DDF6F6EC2
            97F7F53EB0082753C69E00C0119747ACC1B80DF3C8D03C06F3370C4751E56354
            8C0790BBC6E4D465CF2989F968D953D44AECAB03D20C4BD710D3CBE5FEED2A4F
            CFDA55FCAA7C1358E49DD51A974CA67B1489D5FD8592D878451B0973504DBD2A
            50A83FFDEF91D1F3B65D78E0EF6F7DEFE4D6D6AB443F9A5026B90C005C0A0037
            963C58013BF3E02E3066BE27DE05B95497435DF4F6CE7F3D794DC752BD8C5F02
            91A5BF814DF8CBCCDD844DE56DF2524D63407A961470CC3F8CC5A7C70D2462BB
            F2F8244610ABF027426313747105F398D250F4D8F084211FFC98479CDA00905E
            09199C927F8E507159AA813CDDA77EE9A42D60742DF04E47BC6353E7FB3DAA91
            0BF983EB4B8FA0F4848962DC62BB373490BF0D45FFAC6BD2DE8EE6D058DD056E
            3F791CC2108544BFE77218FD1132FBCEB9D4AB77ACA201ED1E567973C4C91CC3
            7A96C2D50CA3FC8EB591BFBA37919E4A8EC573B04E37F2F2C31AFDE42EAE707A
            44CF50F33C7A3AE17E8C883D414FBF3DF4EDFC04F4C0D89B09A93F4B27F2E701
            A3D2EB6FD36851C0DB12362B2DA468CCB481F0CE3359BE9745622FAB6888503A
            3133455A005E04E693D4C523102F75DF924A89F386BA5F00907E8FD2E455AE81
            52C9AB1DD08BA89CCAA079A9A28711BEA365A30310B1EE866B447AC9750E7399
            1EB4FB23C02F8FC0D37641CFEF48B1E4410BE4669E70FBC4C54DBDD33D099245
            81B8C87B196586A3D41CE436DE7EF74DA3313D7F25E7219E54884B822A654AA8
            60B923B4926234CA0C5CEB2DBD58EFE47C3DC0B206E74AC6B31D67A79B6BD53F
            6D59DE0280F54E242B058892D3273EB833AB94B84F43742685973E29761D36AB
            1FB5A7B359742DB1E2DFD18A0955F04A86229D8D7BEAB1509194CB01E40EC893
            9BCD89DD04C312648F71F9B841168289AEDD0D2D981D411FB9CB8569FF2746F8
            E48621AA155FB9BFF051F0C80FAAB364C451D82237F9D1E6915390678555CE43
            DBEEB9B0A50FC741AB93CC22B109E9B2164A4FAA04B8E1A86877C2609F10EA0F
            A2CE0DBC3446B90C7CFBEB80EEAF3CB9F90761133E94B3209D399CA123681CB9
            C537EC95A0AD0F4AA56410D2508C0FDD5F60F638ACE598DEF45C7DE1BB67DD95
            E429FBD0C687BC715379826D26D84F442971555FAAFFF8EDC05F03F09693C113
            61FA54D93C31834C4C50805C4EAE98984EE38F87A27FD635C964C49634469E05
            60F9052E0ABEC96E66A4F0FE3275B88F58C3A705BEFE377ED11583EB58765A14
            E064EBDCE29C173F04B5D489319B5B6D1E6B2581797406A0B03B841750E43F53
            59BFB8C63F2AD7E3844AA3BAE7C13D76DDF1C4D5C54E0C54DADB39182BF51704
            B8A1AEA11202E666B611E406A2B2D205A00B7FDAEFFEC989AF6111CF4903C033
            4F033820640005AA643A2097D6831EEABEA9792A9A35947D222BD66DBFC3554F
            10123B48E7A32FA7DB7946B6795A11A6DDA82A64C53F724E7E0910E572826952
            1527A232A0A5E7BF80776F178C75BA940FCD77CF5F4949F222E94D77D38BA2F0
            77872E689EBAE4FE767708F1E9E943E578A885D414E436CDBFEB88B8A0BF84AE
            AD2F3954813090F5C5DC817C0FADB650842AE2D02DC4CB0037B244A01FC2A762
            AC579F98E9CD0DBE76BA45FD9D807FF2427C3892D7ED76FBCC867E7B26072BD9
            4E7C0C1224AB8E22149FC9797A81BDA318F779FC5E51A50B7B306147A61AFA17
            C8D3DE8EDA692C99F283CEC2E9B59CBFC29B88D3732A7843945EE1C5C4C10002
            FA0CAEFDE7156711929CE71D75A3F26375BF2186D726E495910B9EB19E7B5A9A
            704335C747F281C0323F87A9743046FA27D5308350E5B6D9E4993B9FD1158CEC
            E598D243530DEC4FFD6C82278B1625EA5774953A2D5A77820653E17BB99C3DAF
            8106A8837650C9BBCADF906AC2970EB40D7373890D47B2C25384C676E2CCD089
            06E52B186C1274752BB0CFF3E7B7348A9B87627CDA3AF1F72D92B84C7BB47543
            5C40E982FB90E98BFC2C0BC81B53653471DE05AFCF4D35B24CBFDB91C55FB7AC
            E4CF38AC2B6182935E3C8EDE32733E26457A146D5E78868AB187AF6FD915027D
            D5C98FA7387E2F744042054AF6D21FC17459A61E34F51332C61BE993046CFACC
            5D0D13A23078DF11A4DB48A0ABD35B153F81F76EB749D74DE986FAFFAEB5BEE9
            10B75B56FD7466073DDD266FD3D3D901901EE49D6A2EF9C080E49A449E3A6212
            BF5BD105CC380077A4FC0314140E9496EF29AE302BBCF1D18789BDFA9BBFB8A3
            03DF8A486CA62E071F5CEBA61163EE2561E346836C7BC8FB2693E3DB11465EA0
            24B6B13002E32AD2EF8C131EFD899027175027426C34E804AA4F2F614E964AF7
            C562FCCA86065C31B8ABAD035D4F897589EC77C1EC10CFD7779CB9F7D01986F2
            BF8D51DE32D4D97ED6B6D40CE49E3A37B7618CF43C358AD09D56717331F89B5E
            98566096F7352E224BA81ACF36D84727C11A798CE5C5FF8DA464FB6E11A43E04
            8360CA17BFC9C99522290B2A818A10A7B7CF48F77B731B8C64B37C2F44ACDF80
            62DD4C5BC4BE12F35E7947F4A69248A212CFDF765A239AD9DF7BB667C5C36081
            1FAE94A86B601BABA12C9D974B1341AE15ACABB02C7E6BF6597D290A51FECCE8
            6E6225D39A478ACA151332AC5BEC6F667EBBB0CB2C451CD9D35A1AF1DDD51A1F
            4555B0EA1E0790BB97C78FABE0553725B8F12287F3A40240FE80C5D22903B596
            65A5AF093BFCED664CEBBEAEF22FE260032A72970D8F974A11C38AFFB04B62FF
            C1D471CF64C4562486FF02C07D6337B5566FA99B2A71C454659D52F1BEB7DF9E
            D830D8344E994C621489F73C4271FD3E0AE456E2A355ECA770FFA8FCB8FF1388
            CD68499101D196B20BC50318254EF479E66B4AF1641E27EAF7549E5CBBE7BA96
            14BA6C30FD321C0480EE4514276ED425A659909A10A0FF987492729EAD39EF7B
            AD9E183AC6C622A8F84488A6A5FFD54187B0D65E858573513857693564EE5C31
            76E468FC02C1D60E6E461DBFF263F8D4D33C0AF77AC53116646069693916629F
            548ABC35946D94552161FF78499659D54013A18A200E959FC0B9960CD1D5D456
            602E0E867EEDF3898ED4C756ACEE25D02193640A31938214BC7F888E14D04F2A
            E56409F6FB23D329FCC450F60D18DCA7534CEF1482E1008D0405E7A1A7A342D4
            AE60FF118FC2045761CF60D7EDFAE65FAFDA690D4575DAB2FC1C983FD7522B31
            463A66E4FAC2C8BF979B3F5AF511676D7669E537AA954A6D6D4ACD406ED3BC05
            3F1C45C8B7BA547DF7B0C20F4638AB2BA105E3BCABAE6D40085AC1EC8E8EB3A7
            A5E4D5C6DB33778C44F88C6EADB502C7ED65641C034C07C1AFDE6347138A9631
            BB73C27FDE4B0D04B80D4474E0107998E0E42E72832EDB7C3D4E5FF8385FA685
            611F324AA6A41B58BFEBB3B77788FB28AD3F457B7245687331F86F21EB1739D6
            24128463523CA9B101FFBABFF7065032925A85BF126A8DE3C2088E0C2DF04A99
            36FC0D09A922035C0571899D01B055CDCB92CD8903B0883DC2054FA8C84EE4B6
            031973A9025DC6E4A3229DFF1490DD0F9A9AC425036E4B96CF4434712B12BEF7
            C4BDB7DF776E6786D7101872342E2B6A5D019BCAD583EC93DD0497D1CD249419
            A3DC7B12F47A6B65AF0B8AD84B3EF9B07B9759B3FA4EB3A924B91CDDC3E6FC79
            98B709C50944BD9F0A98B9325DFA8FFB79C7EBF5BD9694B86660ED486C5A623D
            7F83EFD9A89CE78ECA363AD318F1A9246A336360B89D0486DB6F06D32FC34154
            E5BA8957FD0800CB8548E5FB6421DEE96A24A8101D6332E80850228C7F021E33
            579F85680FE63D9C35AD837BD872C6D8A5303FE656B34F54E11F425ED43397A3
            B007B2BC825EF05CD29D6F44950E2F3D0CFAE6C8A16E635B169F007BC403B0FE
            B1A62984807648170682A9BCE32645CBE901A0796C7F802680C823C040F9357C
            978E27412607D930764273C8EF3FEDA967BCF82E1FD9B35BFA84A10577D92CB9
            9BC6A403473BA7DD206E3FE6C4A720969F5A543014D47E2BB53D3BA73FC52B60
            1E7D0970C255808F8F7201AD7B2BA7B4FB3B9C957EFCF7C5ADB7AE2DBC536DA9
            09C89D3A37BB5F8CDA8F5284EB958F7235BCDBB0175635DA7B2D501DBCCE73F4
            6F46AD03174E4FBD2BDF6F9A77D7F1714C17C943011EF00EAFA623B0096E7D3A
            844CAEDAC3F97FAD24DEB73D9DAE1ABFD315E995DB7EE21B0B28A94B9969BC8C
            AEF03CB8BA8DFEEFEAF427F91FC3A4FFD640EE9DED20D76379A4E15470728FFE
            4CBE50F0E8077B80417A9A5829BF68DB6D479F124EE1D117E9CC8A2F73821F96
            B04FF35B2B7867024ACBEF126470BB64AE7400E9B9962634B59AE394ED4457C2
            33CF560681DB3FA1FC9B6E1F99C02A400DC44ED908C20F4935E0A706D48E9CD8
            5B30FA1021742C3782ABCA1D853E17D7DCFCA4610446C5C7984BCF0E5E32983E
            E9EC148D1C591DFA797D476C800B6B184F410E98FC59A5C95A19B7C44E0D0DF8
            9F831B1F7C096CE8D797657930522AA9BFC39B8D3BC7D47C523F8015CE642ED1
            1707D28EB64EDA0890BF0339F7F4D6ADC9560819AEDE35A73DBA8C6AF1BD9825
            F6837E596BC7E3B5140974B79B70F57709A55729F3DA2D551EF6CA5508BEAA78
            F2A33E840200C73338DD1F1C4BA7E2DA7179A3DE51B2BE89A468C9DF61A27405
            E8DD411989AB13009097536A5DCD0D3E6E25CFAD7E6E7F9D87D9318A67298AE7
            A61AC5CFABD0C62B2C2BD9EAEBC4CAEDAC18F48D5D7D24A941A50F5989EF914E
            933E47F3673B452B2123AE7041A4493DF2C575D6F8ED323DDE3AA346BE3DD584
            5B86B25F6499E6928D5E2234BE9D2E618C90595A38A0B3C37B7DC800D6EDD7B4
            0AC1F2D7A552A4DF273BD9EC273069373E5610DE8C04DD1283F207F9008C9387
            EC225F944EE30F87F2F96B2D6B1DE436CF99331225C73E3AC2A2FBACE44E7051
            1808545A03153CB9B268431CFEF4207B7AC7F4695E02E9E64C660C2FE2979208
            4DC887BC6AFEF7F940D905D1CEA7829F833F7592EF8BEDB3E01E6BAC80355881
            CD79062CF4DBB432E321AF172E83EAFE025000E153D850F7EA4BD1875EEEFD65
            B8CF231A7A71EF0823D02FD8DF14CC82139C179658841DDDD040160FE8DE1DE8
            7A421397702FC93E4266C6842075215839CB5408AA5CA7289C966AC46DD51A23
            1944306162EBB318C727ABE4F5C854E4B8025D00F9EF19FDA8225779E1ED18AD
            DBB7A1A1D06FDE1328CFB13627BFC324B18FE005E4AF2193A3689A77C1001CF9
            39AA83506E6D6E425F1F6CBFB42F4473088A5FE01D550A14A83AE46671A8945F
            4DA76E921E60BB802992A0FF85818F0F00A489573F43496C8AAA7E14062EA123
            C0609278BF8F749EE9C2AB762979503A5D583EA03EC9A2BBA955970E18AC81C7
            77E772F991B36E1F52340EC68A0FB43489AF0C768C869BB4E5F01984E31F6312
            1FAD2B99563A9277E6B98F4343002288F8025E73E77AD0BBDF1B6FB37290A0E4
            D5C36AE68215CF01DD3BE451E852DF6C3761F6639655770833CAC106534686CA
            1DA3F29301C5DD942556399F5C8DC0390572630072ED3C32C975C83048CA0B55
            04697092F20620F9BEE646D1E7D48F329B83C01BFE1ED6C941C2E5E39A9CEA10
            45C5EC3F7FBC85D685C59EA69696A1CDC8234FFD10A74FFB2E19638D5798676E
            9779948E107F57C69C00C0BD77FC17C6340DC4A164CA9C39DD759B6CD2C3873A
            3FF9BA246B1DE436CDCF5C314A90D62EE565751585F69E8639B3666605752510
            20A60B362CE3FCD7EFBEBFE4E4975B5B03832DE9106308FED672E7BBCB2BACAC
            2917AF2F23649605CE1F5A78F6E94757B36FB259F10598C232CFDFA6D29B1AF4
            FA21AF6A8FE194F216B1E6C3762F0070971EE8FDE584DF68D3BA472C6BC414E6
            26650F1B1E264020321A56960C2E2E41A434ADAF2995C232FB8531D6F6EF2E7D
            089EE1301D9C6324C8378F9351889BE7B547034B8254B9C3FF300B4D4937E0F7
            AA384E5FE2183F498955EF5AE695A2BADD310AD0295CE5053F53AB1E31BBFB8E
            54139A3E9076B465D1B5B0A97C873B816FAE785E700532830A32B00688E29BE6
            63941FDA300850E98FE1A74F1352B79FE2281BC690DF2E8170006C18C042F689
            2E7890C742F1F1065C710AC667374EF0D3145BA374B5B1A097744DE28EA5B3E1
            CE696E12170EA41D998CD898C6F15304C7777479F5CE1D9CE7360C35E41E9707
            DBE07A6D98289EDFD2888724206FB84926CBA7106CDD62D1C46EAA1FE598863D
            606E1FE27263C12CBC11E6D77AA7E4C14836143618C37B85F3CA0368AAACB960
            5D88B063077A2AD3EBF3E7C4F6C416CF502BB199E29B7ACC84D00944A8BD61E7
            80AA5CC57B1E42FCD313AA112DDF96E527804EF995CA3BAFA853284005D1ED32
            7E0107AF4BAA19ACFD022525D047E4F9BEDE379711DB97E2F8AF304712660550
            B78FCACAAA878D16D54E4DF58B5176C0401D35BD49B6137F1FD6F065C2CD8E84
            5020A59B19DF120ECA0DC7A5486A1918BCEFB0923868B8E6AD5DDBB25641EEA9
            73E7EF9120D693714C46152A782CCAB9B3BDBD8F5012165251B08F6D123B68E1
            F45459DEC8A6F96D475A0080A56B4FFA8BC3C75CAE0439BFEE3D4CEB17A97CB9
            3D9C2FB528DEBB7D7ABADF5CD7BECA824E71578CD49DCE0DAF9CFFECE1E35D1F
            E06A023A2A71244E6E691483E2ECA980371CBB8FD0C4E7650946698084398C52
            89C92A288C156C4CC44278317B3047DDB91C9F6073F22CC67413AEF854958C1D
            D3E355EE6D478EC74BD8F95F405B4EA9D6184901657EB165D5DFE08D1332015D
            30359477B58C4B4CD4674A8CA7D3A9BED780F7C7494C810DE561E8A57A595B3E
            E07932FB05997D68BCE1F0F3600C9FFEFBE21D0F196CA0D7FCFBC5A4BA027E12
            36AA4D756DFA5ECE88035ED410409199D884C8035038180CA60183DCB64E711E
            C5899F7AB49BF031A037060EC5041B641C4F1FA83525A90A53613EDD3B907664
            73E2302C120F433B486F7CF2B2403384BCD30BDD68D90E2EFB64CFD47A9A1FB7
            2F92CB898D6C4EBF03FD740E6CF4F5DA6830038BCB4F9D82A73E951D28810034
            D32B5AB6762B642D10814F39699CF22F7EFC51E2B0FE6606589DC05AFF2AA6B1
            1C77829690A95F3C0A9B7A9820EF18F9804AD17424DF9595BE05F3F9C7D51823
            9542305678CAA2C9BDDDE22BC2F0267B2E9A0AED2758E77805107E59AA115FD7
            9FFB823E9E09BAEC56CD0316DE4387F572191700F906823200EC9E47B61D3FF6
            98C17A474D91F4C3ED26FEED698B24A7B8D4296F6CCA3CB721A32A74E2E4B499
            D9889D9A6EC40F54630CD747596B20B779CE9C117672ECAF475BE49055A19CB8
            95AC98A025EA821CFDB354FB75B2EC2EE2972E9C9EBEA1D2FD8E9D93D960837A
            FCE2088C27F578C723A217901B3AD40D90C15DCA029629CABEDE31237D6B35FA
            4796B315983E02ED232E9F316069BA0D0BD006DCE33259F8A0B89897BABF3414
            D190CA1386E9A518F1E308A12354EE0A7567AE15BBE01F4880C5857D6F4B237E
            70F0F7C3538915EFD45E1ABD3B799E176C04052114DA8CFCE36F5D094692F18B
            A7A51A49D5A80AB26005C2CB7F0946C0316E1688B0F22CE38E878ECBB0B3E180
            45FE0949E2BD65F9C2FEB461CE9C44DDC69BE67F2D3DDF7EBA3754B6D9E93638
            2D13C1F9A4627365DA303E3489BE65E51D6A25EE14DC741085E0B6032851C0E0
            343FA3F22CE7B1E007A7520303B9AA6A1F5AFE0B6A258F9335D04D5E77D89BA4
            FB43F69939E7F47B4E3ABCFFC489D8A5A1017F3290B62CE8E03FB048FDB775F0
            A8DF0FE132C7659C51A35B74C5A1FC1F58A9EE9081A4E55BDF040C87830427DF
            22981CAF415109B9E59283B4202D2EFF5183D54AC1B3E5271CE63804BDEB28F8
            BD28FC1D4E111A543CA7A561E802D154918C78DD05BAE43136007C708D9BED0A
            8377796AC3995D74CAE656AD2C74262B8EB248EC97B08D2595D7D9F09C57EE77
            DD679C954AF0F3557F5FFCBDEFF7B7204E7BA7B88FE0BA53DC5481E1AC1A2675
            2AE870F07107D11966061D7C1B16D8D77715983C41883556A70EF3BDB826FCF7
            F4B2696485A816B28A6789F52C6819C469ED6751D61EC89D77D745494C6F941C
            5907C2A1206FA89C4B54913E807536856525F6C4920F961CF5726B6BB1B77BA6
            6EBBFBA723283D6F150F06C1540A60EBAD0A9ABB38370050B252F007FFF4EF77
            4E7CA3B5754813682B4E11DAF0D7B0311F6E72AEC291B2C17C8FDE4545980785
            F2F35493387768DB2526C13F3B71423E0FCA9142372E8F5BE48D7CDE5E924EE3
            7F0DD97D3AC55D60499FEE3D3B0EECF3E5C74B861270C18393FEE5439BB03DD2
            0D7D0F58E8AF80129F4831F903DC6FA41BC5EB73FA2A6F98A6F2724581285678
            ACB9097FB9DFFD95C3CD58586D9A2A11AA5FEF3508055264B9DC38D778D0A9B1
            D8FF30924155E49DC1F68B2A6F1CAB3B43013A77D8CC200F8FCB88905F50249C
            C6494656DB05D8EF0E4DA7E37D3EAE0CF44D568CE748A53153548572BE62F0F3
            D81840110697B67D5F73331F505968EDC179E3258AE37BB9C794957CEC6EDF94
            51299CB6A8E4F4A5EE9B9A9B873639FD7096D9B3C75813272E3D9109721E21E4
            205985CE0F96758350110AEC21C63CF0A85F01C05BF9C4A12C2B832365DC77E7
            67998E8FDBC5D7999DD80B8C923C1AA4CC5994A8DFA8ABF022C5B19D7555C572
            EA8D6BACA1900E3053A3697E79F1E9F1E3C61C36949ECA4A026B300D16F45C42
            12491563E1B5C33036886CA1A5C0B75DEAF92B42F6E52D29AB5F29FA32193106
            1EEB4B5890F9B0DEB7A99C95C7F831001A4D8340EE1D36833931653034A95EFA
            E24C62D5CDE7069F3C50ACC3754A78F3B69CEAA68D9498D4D79F62C1249F7A48
            53BFADEFB25640EED4B9D98994D8CFC7311E5B2833978DC678E0D6F5DC9603D2
            842E6BF7B1CDC4D1ED33D3AFACE1BE0759C47E0C7E97AA830C6FA65738D03527
            54059E970C2D28819628117B8FFBA64F7F1D0DA1B4758AE301A83E009B32C1CE
            F3574AB5E2BD761FC33966D59C3DFBF8C152156A21CE11D7AB00FA260823F97B
            78DF29CF71A83FE0F6912E00214BE34E3C65B047EFAB1300E4E7601CFFB97036
            1C21CAE771C013E41ED905C2BD9D4D47E4BF996AC43FE95F7F898D8925647EDE
            9D55AD7251617E845E87373D7DFF7AC459D73D8BDFBA72EA6053C5C0188EA6B1
            C26B300FB796C0BBB7F698FC3CF334C207095EFDFA9D0178BF3BA0F1310C008F
            BF2E1CF3C22B018BBCF5E39D02B8979D8639E33303C6E7F681B583EE2B1803DD
            A379DB6E5FF8F731C70519EDF02BB239793019A0A626D8D8EE19CC18AD8FF2DA
            ECD7E89F277EF124CCADB311E687509AB03455A61404A1DE99BD2B9572A76A8F
            BE40C63EE4BC61F2EACDEF088368E4CC6124C327113B3EDD887F3BD86794F431
            980E2F6262517D8A56CE0DF64A1E783A47F8D405A7D5D258B279CF25B047FC60
            6D8C4D26CB8F26989E078DD85F150F451413BD7723A79A650FBCF82BC7F85E5E
            6499749A7CD4A7EF85FDC2B2F2533821C7C0931D08C3BA27F43996942D845045
            2356982E5CC3D9E06A031900CC78E9555E4AEC3B1486892B2A15DE84ABB2C44A
            36AA533FA741C14057E4B53BA00F0C0345170D529EE6EB529F813CD9432D5507
            B9536767E3622BFBBEB1841C6F96EEADEC5135816E39674FAA7C59D96CB9E0DF
            5938237DFD9AEE7DDE9CCC884F92E8F11194ECDDE594F5AC0C1CC39B9C7A857C
            A02D1702006CC9CD15E2DB1D33D23F1CCA3E6A6FC7BFA2B1C4093C143DEC0D52
            08E099E00039E53E01187C69A0C0A09692CD89FD41E73D0A6020A16B6B63FF88
            D1C8AE607273B57630F49673E42578FE1B004A7E56CDF6B667C5AF01501FA7F9
            CA28E86D17E5A0CE0B30081CD3290F67C1226C4A4303FE637FEEDFD689675924
            F11366147DA85CB61AF99CB800A7598A024F8273FBCC9614BE6BB07DD2D9298E
            84D5F590F48870EEAFB320CFDDE0467A5EDD30975279723F60A5C40EB0D9AC1C
            485BB29DF8170050BFA2F8D246DF0700BFF0316E18BCE80018B5A65632226400
            E3804A1C433B2E85765CE77AB282E38F903F87835E643315945B4A9695D0EEE9
            34FECF60C7697D159512C9DA703260DBD31025C702D8DD4CC24CCDEF0F56F60B
            1C6D8478BB3EA80D1BD4BE1F12FB3B98A7A7821C73ACAA45719EBFB9B9119D3F
            E867EBC4DF0410F723F92CE666E83E4E6F9C615F29610778B315366787A553E4
            95FEB661A0327BF60BD68E3BEEBB7591A39DE1C72DA11F3F2798584E10F98765
            F1D73FF820F96E5FB9CB4E9EE043E181A6C2CA9804FA3EAE9E96DB28907F5AF8
            6B2C10A0ECF65B050C60597532ABC2909F96481E7989A953A5AD7500AC41D532
            8206CB8A9660A32A9FD20352AF963E6125BC27E8817FACADF15B5FA4EA20B769
            5E66663D21B76A9A427073F31A5116495839979ECCA6B082B31768373EA27D56
            BA4FB5E39BE62DF8FE06045FB632640557BAAF161FDC86DF1B2979C0367BB273
            E6E9870C55FF80C5BB1725F419508D499DE4DBE71F7B5E1D6743F4DAED34531D
            434985CAF28F61F1E9B1C3310D48B6537C07E3E4B5D22B193EC4F59FB6726A2C
            6F73013020ECE2525C179B9C3A8555ADA6BCCC7E01AAEA398B26B6703D85BE62
            32C1AE4FBB29ABF0054265F52AD6F3322F250FED0FCF726E4E8C1DC9F01F2889
            6FCB8CFEF21C550690ABC4F5F4CB7AAAD2A44B4169EE3C1411BA0B16A21F5838
            F16DC1FDE957318A3A60B4E837CCFED13C58FB39C2471F9A4A2D2BF6BD055A32
            19B1358DA117005C6EADA3ACCB8BA7B8F7F5388DD8C429FA074AEA10B7BB9E40
            68C3A306D20E87B7FD2B589B4799BCED4AB4844ADC5C9F821343B6283C785A23
            3E6EB063F45991ECFD6212295A5F0350380DD3C4E7552A4463AD061C281E9FDF
            EF7F8CCA8F8C7DA3D5B090100A52209CF7D5C99AAA62587812F3D1470DA604B3
            4A1DB6C395BFB0ACFA93FC52BE2675CDD03F15DAE37E56E91BDE03EBEAD343AA
            9155A15AA24FADC809301C5F13144D06BD3BCA2D17EC950C0ED3D7FCC004E75B
            820BAEFC20597A492DC1B0FDB5960671DF50B6BFB3131F01A6C9EF75FB78AF27
            58616748201015EBA038C17B6E6B1A4015D348AA0C729BE766C631225EAAC764
            D39EDEF8AE6547CFC28D6C56E27A3D1258966A15AB0A0C1DBD7066FAD9BEB661
            DADCCC9402118FC540F394026D501011F91C6084824741E5D5D5E2D02E5BA0E5
            361707411B8684BC9FED443F26A4EE4299B2CB7436F88AD7D8850DEBDC3D7EB3
            683D2AB1EE9FB534A26F54630CAB29D20383C986F763527F3CE73DE5FCB93040
            14A6927715867B94537828D584AB9AE2ADAD539C4E71F2AEB017D7CC50230260
            D77F0E84FCF9AEF30AE77F926A44DFEC577FC91CCAC8BA4D201B0963D32E5390
            080502674C0BC90B5444A5DFB54C15C70C7E0CC724185EFA884593075404B921
            F06FF2718386AD3C2D51F5D2EF6C6EC6670E687CB2F85442680E26030994EC75
            3898E1022A65B40EA43DDF92E36EF3FC35A735E1EF0DA41D990C9F60C5E81F00
            ED6CE0467C9B5EFE70395AFF58D9F734AA384AE88F92289E976E14B70C769C3E
            6B92CB892D8A363A03000CFC898DD71406EE6D387EEAA8A0011A0EDC74057B13
            59787AC705C8FA2A726831D2F566C1B0DBFFB0A838A8A161E09E3798479FC316
            79DAB262E37898CA65B60BA100D0350D5A7549D3D92E6B6914FDCA5A502B915E
            5BD86ABFCA11398560FA059DDE0B0C1565ACE8947AFA9983C64B251A8A2F95AA
            75CA1731182B59D21C4D1EEAD392F60EF11342EB660927F7BBBFB67D8F2DF23C
            B7212FBC6188116C81CD56F84A6A8065C53FEB5235907B0558A1EF6C3D2E3B12
            5B8DAB0447E5183758BBBABC828DFE8C73118D2004AD12E8AA8EB35A66F7AF1D
            AFD177B67EE5A524227BF688D024735B5281BA509E345A2BB70D0895DEE4CB3A
            66A407AD3040896D4263F869421213FDBAF6E55E30DDA04A9BB3E60EDA767E56
            4B0ADF34A403B816249313DB501BBF4CA8B59997DFD07DE6404ECB90B7220058
            9C0210ACF0F5540A5725F3852B1D1D643EA689335594B31B996FBC1F4ED3E57A
            2F7DD7BBCE052BE499BE20C7A552EC777DBDF70B2F8CB1DE7977E9A394D61DE4
            56140A53042B55A5F3DE360C49C55F4685F35B1AC4A0F3AE66B3743741F8D304
            9351DAC352890E547EA41AF06438A2723DF3EE7EF3945D69EB10B783D1375D19
            8C610A54986F699E1A19EDD1191E6C86299605299E19503BB2F80C6AC5EE7039
            E6BD56782AA3B2181E45CD5F2C30C22565A25F9496487CC9E4F8E72D11BF0026
            D63442E36398CAE0C2CB5235053DA30E33129B7C69DF68753DBD9E216ED2739C
            4A79B01256C661EC1A064877516DCFE2A36234F65B218AD8C3440805711D423E
            40772FBAF34A5D5301B90253B127CCE73FD77A3C7A93397312F59B6C923F4810
            720616E4CB72AC7460ADEDAD4F5D861623C60B8BE19F4788108762129B2403CE
            4CEA5A38FD96D74721E35A7B49133233D1A2E64671E2503E4F269318416285C7
            DD746AFE5095EBBD60B53E9F2A235FE9348FC5776354C8B9F441ADC769384AD5
            406ED3BCBB5AE2982E9074701DF4656E7EBD53028293500FF848AC8A31BC0CF3
            F1F0F674BADF29B29AE7672E1989C8F52BB893472F107016BC5FB8CEB9994A4C
            8A4C25D6C3F92BDB8D8C4DBE2A951AD4D18F5662F477BA363B42C1CDD73FF676
            AE201FF4B9DFA0141863189F9A6E14C32E6F5E5B569C48A90CB8B3035C249343
            E7F1AACA8E729C7E905E7FCE97D954EC0D60E0ED6AB51500F9A600C8FF8CA9B5
            A550E3556E89540278EEDB5A09634DAD10A5F75851489EE5B23EDF3F43275B71
            F1187C5152701EBAB7C15B3694A51944E97936E475CE7B60D33B1436BD0195AA
            3525DB89BF011BC5CD3A7D4F653EBD7962E3CD66975EE13C83C3C586DDDC3E3A
            95228FF77B7C64E185188C0FB1B6468ABF68DC0405F99665E364789B95D78BDB
            6FF20FBBF74ACFAA1F50CAAE6C87C8619AFC1A773DDBA2B73951C1A3EB521554
            5AC0C22BBC983874A0FCE475453299EE0D92C9E4E6B2273EF820FFEF59B3EA7B
            D6761B740117721925F4245D1DD267A178D9095C43B4D26943C0D9E0CFA94A9E
            54359BE5E9929D3F10E6F2800C2529ED1DF8064A1317AB0239C67593B685C2A0
            29E414D1B10A853F7EF4BFE441B366AD7B29E860DD6E422C720A3CD35468EF41
            3AE0D396456190ABD734B8458809F65782D83CBB8816A224AA270CFF91126B63
            1DC8E67B72C327A27A7CCA695C6E360C66972E6849899F0EE5736573740FC1C4
            53700F9D8527604CA3C05A771B5429405717F0E8FE65AA919C5CEBB11AAE5215
            90DB3C37B3B520F8D924C19FEF096CC86180E9BD0A6DC8CEA7E1B52CDBCB60D6
            C3CBA3DB67A41F1D487B4E9D9BDD2349EDA709C2236C65C5072BA7F516B853C9
            0163494B1281694DD094F6E9E94191F8DB3BD0CF41899D03961A0A73872A4662
            1BDDA75F5A9278BF125BE2C8C19441AD950018F819A189AF7B1B8E283FDA2FCB
            8B1B9A1FAA1423EB799C88B1C70C86FFB62669EB1427134CEFD7D386578C8A0D
            1F8921FFB2278A435D2A649B9B5173FFEE8F2FB668F206E945F6BC48D84F3BE3
            DDB61783D18554F2FE8C15FEC44A898387023CC1183E8069E2445D89A952B5C2
            F21308B7633C3081F4660C40F96D56C2FB0FA4767A5B273F9660EB37EA29392B
            0BF673A5375EAC6B502A2A895DB8259512E70DA43F5C5E303CCFD6487A722B01
            FC0ABCC960F09253DED4EE9ED79CC2670F768C6A2D60085D0740E54CF960255E
            F84A3A459EAB453B66CF7E8D4E98B07323CC81ABA9951CA74B88F39027AD329F
            DD143FB02978C4ECAB687DA42E58F180540AF7995A678A3CB959F2DEF217E17B
            F694540573FEF8F7F3BD7E656D441AE8C9AC0A9C755D9B6AC4DFAD459FF726D9
            2CDF0594D157A0EDA7131C1B87B0363CB0693CC03599F900F4FBBBF0FA2771C2
            DB1B1AF052F9FBA08F1B294E7608512CD33B4123C4BF6E1AB35A145DB1001DB4
            3B18236F0CE5F37576E2B30549CC35AB5156984AC1A0B3C05C7291AECCFDCECE
            4E358A212F17FD5991AA80DCC6DBEFBE6D34A633567227A210957B96FC6BBAEC
            6E507C0D334A7A7185F871C78CF4B706DA9EBD6767E3DB6E51FAFD688B1EBC82
            87B32CF496362CBC29EBD9279745BD0C40E3E29ACE19A70D88B3274525ADC7CB
            FE0496EB4EDCA9B7ADEE2244E8757073F45BA2BD4E002EFE0B7F4D1E6E991564
            41834D362D3C0F606037CD970B72CA4C091E77FB56AF4B5560A2F4DD9646716D
            35DBDBBE10FD9CE0C4395C55ADA9909756B70A995B5DA5530A59294E887C1A36
            9D3E573993A968B69FD8FA2B4212C77356F4FBC99410D846218F81DF5F124C16
            E7363789FF6FEF3BE0EC2AAAFFCFCCDC5776434802444A1424741095265D1004
            A5C88F9F809BDDB79B0718300A625010FD8B5922C8CF6EB011209497DD97CD22
            360404A54931202A4508108A34E9900492DD57EE9DF99F99B9656ED964F7EDDB
            04C23D9F0FE1B5BD77EED4EF39E77BCEF9E268FBA4BF3FB7658D57FEC9486693
            A0BCB16E8399A333741C47B8C21EE79EE900CAAB0B1DA4AD91B6F4F4C12F18CD
            9D26B8A930C695E7E8FDDD56F94128AAC000D48EEF6A27BF69AC1DE4B314D8D5
            009CE94052F73E249C12487793F0839F4C4F853E7C65AC8AD38E20A97FB4E3B4
            2EA5FBE19DD8760F3DFA3082AD1DE57B6EAF3CB4114B7D33450690227EBA0048
            B643BE0F528E0144F16252A685A827C0CCD0A04579D8642A3CB92F3FD4581BF9
            8739A17753CA360061A6658F566ED3AD4BA6FFC9223E624050E7C866971A6E44
            14707FEEEDC304B73BF1243D0AF7B309926AE079C6CC003F4695323E80DD3A2F
            4BB317B5B5559F33AF555A48E767A8F5790D7283B10AD2249A7B909762CDB0F2
            828E01E0A2763BE1AF7FBAD941DBBA4045EE382FA03AC9BB15350698A2BF5759
            5E56929CF868E13832EA5CE6EF55693AC8ED985FFA2CA2B7DFC8C18B679C3674
            ABA1D21E41301164368395B6745190437A67165F1F4DBB3A2FBDF25B79625D20
            1D3FDC3FF88264F57E0B453C102DDA5695654138F76EB26AF9213F9F35ABA1F2
            8DE57EB1B770C8AD84A2AAADDCAB4614B861E50230709F49EF0437C590537B05
            3F6B4A42FFB529E532DB9383732B3EC3785D963679B147416FD855A736810A11
            6CEF42C169E830198E48EE34CD903B70E3DD511D88A10001A3E0811144107521
            EACF647DFBFAABB8691D849BD6B0B3405C7B6D6EC2DBABAA8F00B1A60883BBEC
            5973BD6EF22414DC14B266EA5F61BF772088EB1B6DBF94FBC47400ABA46F120C
            5288C7E8755328CE22D45A37B882498F0DB6CB1971BB2455C1CAC11D84E477E2
            6E4191646E7DF42F0D0BAF9BDD81F3FA7319260E6C6B23CFADE9BE49D2B350FC
            D462ADB31CB73A55506D2B424F881C7221054566BF10CEEBBCC63F5A2C8E5D61
            93B521A57EB10773C85DB8CEF30AFC91CA4185367AC7BA6E97145448BECC807D
            4F268D0EE80BC405B371778C0996C20BCE23587BF38E49CACB33C21607158B0D
            CE23559A3AFB3355E020048C02B7BCF7599202A7524FA98A86D5FB814FDAA791
            2C21CD12A9E86CFBEF25C752B04EC35EFC38A359A663309C046313D329FC78E5
            369BC3B793ACFE73E70EB46C32B9F57ECA323B980A8A49C50D4A7643A09C4454
            6EAAB24E0C5CD8D5642B777F496C5AB7E021C232EF03953ACCBCEF5045AE20E6
            0194205C3883B7359AE525152D4D05B99DF34A5B0023B7B610B2C32AC1238B33
            2101772CF84B7EAE2DAD96DE6CEA75EE1CBD70E6497F1E6DDB8E9F5FFA90E5C0
            DF7394B4D48547A12031ED6A28AC65B6936A8BAEE3107168EF8C62431A72B98F
            CC40D07299D46281047D954CDE73DF87FA535B72DFAD20576DE2B4F567DC4DB1
            14B24E80080302481E17BD89D7EE58FAD8EC83475A0A72646DE58751C8DE8843
            4EC316E728020FB8B77A67859085550639707BE0B6A553373A7CCE08AA0E7940
            0137FFBC9A2FDEED86315FFDE9A3B86D3275983D4884D8A51996FFDEB2B88A59
            AD450DE822EB5ADDD79BA806E7CCE3A21A8734D1C9D89FE59A573D62AA427FBF
            38A8CED92DD23BEB594F13BD351EC5032064FDF1DAACB35E547F5768170DF1DF
            4AA581F124DB7A8F45323B7B966D20C101170E4C0C9B0DCDB9EF5630BCB1D021
            C6345BC8DA9052597C2D63657F24953335CE4EF5D8AE02F9C3BA6E97273D3DE2
            686AC98A59D94DA582E403242501BF5CCB107C6E11DE0AA457C2E195DB9DDA8B
            47148B531A2A2E800A6489D171D31D3E10E2070324C59D85C19337DF75D5BEDA
            3AAB96272B7952BAC9518EE067A0027990CA92A09409C3C30181A74565C9118E
            2388F3BDD75BF317CE3A263987AE2AEDEC903FE17E282355C3951D49D4D21D8D
            B109A81002171911FCD84261F4453B4CE9298BE309A5FDFA26E1BA44C1BC09E2
            4FA29920BCF34FEE4775A7F28DAE76F1FD75317EEB8B3415E44EBBE4AA9F6DC4
            D8979787CAE80E1D68163FA483A52B73E2AEE0CEA58B4E3DB1299CB4D9DDDDF4
            A92DB6BEB695D1A35671EFA6A6E5D46B4BE0724A4A26EDB5525A73071CE7873D
            5F38F1EB8DB447A60E636CDC99B6B32A9C02CAED98780091A1AA7A51F2CA926B
            23C8ADED5728649F6EDA408EB1C892A7DBEDB8A49FB196E3B95D0959A9938239
            42167E03385295CFB4F2CD4241ACB130C868A4A7CC2F4430F74D1F9003C44B87
            92847603842C0944A7C2F9566184D48A1E591A92B2F9FAAA3C819A6002EB003C
            450329B5A5D25E4CC4EB9F18AD7BAE5412536886DCCBA835C5B436852D128159
            290E0A88FFB9AABEC6077E5E683079FE8285E2FC0CCB9FAB8AA998CD188A5719
            E2EB1A878E4C4DE4D41ACED2512E8BFD652C824A81E872FE93F6BA10688A005D
            E59FC0796DF3CAD978B835B5E8CCDA16B5CE77587235AE9DE3B8CA7821A93AF5
            5370FECF5FD76D33A5DCCF0F029E5984A0693349070A51147C8737B89F052FCC
            390D3E78126E29E65597161AE453A352BB2975E06F8C66A77297D71D224489C0
            83E34972711582F3481C5A2C88B54E0FE9E9E38713C1BE4E293D54196378DDE7
            3F87E8447E16014957B29FE7827FB5ABB0FA7CB53D65F22DCBCA5DE0077646D7
            99DF51062D2AAA502A45B2F294536FF968B1581D56CEFDE1CA823E715186B69C
            E1187C5CFFBE81331BA2D413FF59647FA83E9306097658A1E0AC130EFBFA224D
            03B91DF37A3EC5A8F347DCE033B649FE8EB89A87CE5EE0334D611C2550117CA9
            70060FE99D39B369EEBA8EF9579EB62158BF78DBD5AE824D8186DA65B635DCF6
            803FDCA240AEFD88D820BBC7A24261448041268B17B0EC3A66E50F7370A18697
            7D9295492F53300264F4F70A34BD458438BCD935B7C752E4266E39E401206C33
            E1E6114DA224C4376DB3976467901A30FB938DA67A1A565B4BB93CB32AFFA02C
            BB8B4A099594EE25364F8C39E4531B24F0E19C30B117B6F75F236943B90C1712
            96FFA6CCCF1B0A6E23C68197346788719808E195F6FC0982A786F9ED9EF4F489
            E318C95EE395AC35F96E815D62E8547D415BD5DA5B458483C09BDC37D276286E
            3B7DEB1F94B00F87DAE261FD08A00DFAC66D9FFF2F053C602B5488DDB01D0D15
            1459B0489C6F91DCB99A52C27DBE6D92EB14C06B9F01A084B717011E6E0E1E6E
            E45D7DB8A122B485858A90CC7821A3E5A5926543F582E9D31ACB3F3CA66D2D8B
            4319A57F24405B84C9818D7863A4C45DEC66C093FE0F41DDE7BB0AF48A46DA52
            2E934380B25BB4C5335EA17C28AA4B4CA115B5252B291C38B38DBCB9B6FAB15C
            E63B03B1BE812D6BC33664256756F51904F9BCC3764BE2D20606FF4DB93811E7
            FC6AF746954AF1E915BFA356EE686974F09E3FCE794D50208DE3436571706A3D
            850E98DECCE7C7F362039A1DBC999196BD25080FD32482670E79BB4CBA9B2B4C
            07083F4CC4C43D52AAC2E8A42920F7F879FD1B6749E596718C7EC4A329240598
            258349EF50D2DF59D2A22213555238A17746B1A969B1A6CD9BBF136EB877E609
            DDB83A54BA275F02D06DBA54BCE791E9A8EBD84EDA40D687FE7EBE69DDA17752
            6A6D27DC04D7D11CAB61D0672880061E94EE67ECD71A61FC58044EC3CEB9BAAE
            A5A78F1C4E81DCA41EC7CF72012177BF99522D6A1195A25DFF957B5E7B2D77C8
            AC59D5314B49E472A7FF4A28CBA95430C24837E44A2C7B40C425AFDACB54AA9A
            7F733BB7DF482D070BFAC4955936EE444765561010B344869B1339F4DC06C97F
            65BA1C5E2974B5D385A3EE97322C242CDB1E0EFC30EF1B09E834B882661FE93C
            95830B3BDB49A1B1F1E1FB82436F036F7C200C287D4500A27418C30A07A0025D
            38AFDD067CC2A7F05019716A40591403E8F25BF1C0DECFE186875AC40FE17016
            99703FE9144AD5075FAB6D7EC0ACE2CB4DB530AD6D2997C51184656E50E9A008
            B89E846AC3633DD682FBD23718C9FC9FDE93B9B1E706F3C70C8E8A074D80CB27
            755E77EA8DF3A9172C24E7339A3957A8AC0A61CA4438D56598B260723F9597CB
            59F5AB4207396D6DF4DDDCB903E3369EDC723A9E69B3709C37D3965BC7ED2AC3
            E0E53198DC7FA90E305B4C042F20C05D2385AAD42FB6620EF9279E7D1BCB32F0
            A6F30A22E0DFBC77482900377518A97676B5917233FBA1FC1BBE27D42C995123
            675AAEC56AF6EBA804A9DF6A0D7BB75209A42920B7FDB2D2F72710FAF5B7254D
            C107B0C18C0E5316D427C644F440A4FEED860876DFE4F52BFB4F3DE9E4B178E0
            8ECB4A376D40E8E1AB8459E6D73B94C17F1F6E7B42C7814BA910CECFFA4E39F1
            2B236943A99F6F6B39F46141688E000FFA236435082F86A42C0BFA8D0C52A9CF
            EC6A27978C457F8D85F4F6911F5292390BDB1D047240840B67F4B34F6DF4DD88
            6E926C5EF9093EF7A8AD92AB93729F9843487EB697AA2608368BE6D234F92651
            8BBCA656D87CF0C75DED70D648EE2F5DBEDBEFB4E45A4A5A8E720CBA84D937E1
            39134C5833EA5BE77FADBF8E67F0C1A8103D329A3EE9EF179BD51DB817C7604B
            3986314B29186E421F6887BD10FAF74CBEAF002707160A4E43E9F81098CC6634
            3B877B5915A23C69FF5E6E7BBCEF0CB022BF52FCB77AA5BBAB20BED3483B10D0
            ED8E837C2B9E4E133C1E9E996122C4D536C62EAAF0ABBC9876A55428C089A319
            A377822CEC2317219838438D8DF00FEE07963E3E7BF7B1E4D0372A5A51597637
            8EC11ECA15EEEE3921C5D2A7252525F4779525A77279A1036634D20697E281CA
            52EE202F182E389B0CE551F1CB21F01498F35A1712110EE7EDC5B5909DA35CE6
            0702B1BE8B637DA0B63ED7873C33C3DC654937AB5E6759CE896D6DE48DE1DD4B
            FC0F2A4EBFF772E37A0691C023134E23E60D9C79964A9A9F70EC57202FF66F76
            D6829E3E71B645F33F08A81486D2EF2BD71EB630B90B22A4F8AAD4614EFD4804
            FEEF1AE3D53B55460D72A7CD2F1D6839F0678B927C2DD14A2B5F850733EAB0D0
            8B97AA420B15C7790157C2FEBD338B0D45A5AE493AE65FF9F9BC60F315FD7D35
            81706EF7C0902A17FE4D2BFE3720F86335277FC03533DB86B548A594CAFC1316
            B56ED593DE5C8091E20700605627359BE42D62999CC1E183733BA78933C7A2BF
            9A2DF220E164D92D166BD93F5AB98B1820D6B7977ACF2A0CE04B95EB5FA6C990
            2EDD5BC6AAAD2ACDD9A6951B296BF9B863BBD6B948FF8379E045AC1481288F00
            AA80F60908CA7F3B92362890BBE363D7E3A1F7690FE4C6C0A3F7633F9843BF21
            86D9803065A9BC6F9B0F4ED86FDF1104BD2589CC514949B62C844D8870C32448
            38882214A0176AA4FB31215EA2F3054B1FEB3EB111D0532A6D9667D957FE84C0
            E2602F617E9C8660F497BEB16F890F4648826D5EB5391CD9287FB15C2633A995
            BF18D762480B0983DCE033AF4BC231A5BA221E77781782EDDED18CD1BA96EE9D
            76A2DBCE7EF45E46B27B7AD51C15CF50D45F77A8D8BFD84697AEEB3626092A4D
            673162FD50F3CC87CAFB1CCC9C50496095FA8DE234720EEB6A17B73772FF52BF
            D88E717137AEAFC912C88595C4A1FFCEA429A9580D5E7B6E25838FCE74F3CA8E
            8548DA1DD015E7E0A43D9B42663C57E5CEA3540EF01780E9C550165C218B9D88
            238A4532ECCC492A5520C99EA6956B0367001867A8419F8240F9F656A3323838
            ABFEF4E4E3BB7C66CE9C479DE1DE7B38D25B167FA62C7798328AF86D32070A62
            54B7288D4A0768D69ECD5AB00F82FF97C76AFCDE2B322A90DB3977EE389E9F78
            CB0616DD7B258F7359C324F3B0652BBA60E531C3F0F31AE15D0B679C34661B7C
            E7BCD214C1E0FE0C90C9B5845D239CE6281EFD187241BBB4059B88237B671487
            AD712148E8A2602DD05A6F94789E04B683B6F9144F9F7B95C3FF2B37EB116359
            0CA15952EE17BBE1DE7D3BA1D686C2AFF41671C38181D7447413D36E4FDBA93D
            2EEC17F72C16A78C994B57272CB7FE862D1AE7E5AAF4DD8286592234E70D14E3
            69F03A7B40ED39377BC02B23698304B9DBEEF4D87516C91DE1F81CB404175C74
            AD0104E84A1EBFB2F431AF8EDA7DA941F7922B51B99AEED883312017BAB72151
            B0A05CD74EFD958CC53EDED6E6340478CA6586E32324173D1FE2F8472650CC4B
            1369B3AA2EE6541F7DA33EB8D7AC626355CE7A16911B18648ED039AFCDFD2DB8
            13312BB099FDE3A79D935C4EBE925B62579C27CF8C669CD6B594CBE2A3B83C6E
            C7719EA0C01AF81E28C16DD1D9D525464D99199376F7B30380933BA52B9C4494
            58E2AE79CDA30E83149DB20B95B6FAC04D842CFB4CA1B07143D5307BCAE22466
            65AF90BCEE68018390F313024A947966F96702AF369D6F1AEAA7B2D88130EB67
            40ACC3559A2CD95EEF1C8BD09474E3C17F1695AB1B6A4F918C38AA701C797CF8
            F79C98E3F4CDFB1869D955484BA9EFA9F2FA27A21018FDE47D28035EA9CEF271
            6E57817CB7997DD25F121FA867C4BDB89F6C0E22921ECD8BE3F007D4336E7906
            8280A2272DDC766DB0FCC413DD5D88CFDE711E8F779B8C0AE4765C5AFAF6784A
            BF23016E10FC1276F5C7F8A690C4D715B02165B09CDB572F3AF5C48692C10F57
            6677779327A76CDD3781B2B615B12C10BAFD2A3A1ABC67F17F11790ED7FA8CAF
            061D7149796671E670DBE0590BB4A6CE93373208BBEFBD435BC4D28929ABE62A
            C8B13D0BC7390D05CCAC4DC1673FD1A2B92BBD80BBE0F1840FC802B8661290C1
            07BC5213AF3B033F9BDE4146441319795BC5972DDAF233ED7A0A2CC9497C6933
            A380DAB48CDF2AFEB018FC5D6703A51915C8DD01412E4390EB733D5DF0663627
            C6DBD3BF0BEABE4BFE767D7AA19DF48CA64F4AFDE2FDCC210F516A4D0A0A4084
            93D2FB1C76EF5D64ADCB2FA55BD7E6036777B5D386330894FBC89708CDFC12C1
            72685092BD49C93C6FDD37A80038D5C6A3E14B620B9621FF46C56D234F194ACE
            013E44111AB7EB54CA2751BF89F0099F698417FC4E929E3299C958E6623319BE
            7CA10E707BF0E2AE0EF8D2BA6E6392C842110884EE23946DAC69274364D82151
            B7B88A8FA80BC20FEF6A27B737DC6F0BC56519366E86ED0C44DC00E04FE6A4A0
            6EB35D12443AA232BD6B946B7DC836F6F07662593F6234BB85AA1A07E174A1D1
            2C2221FD525329EA823BC77715E8B523B96FA92CF6B228BD1908DBD0CC17EEDE
            CDA045863E8EECD7328DA263538B1D586873465DD6DC149C3B05A0991E3CD749
            6C3F8A9C65B172D0109CF7B28D75A77E6AB1402E6B66FBDEABD230C8ED9C5FDA
            837172332530B11ACA9010DE004CDE6BDCE6A345BAFD0739BC88D7D9FF9A99C5
            67C6FAA1119C9FD442E81555DCC438445DAC8AF1E9B7D3D3B282191A564F5B10
            9C0F72E7699A23BBF7168B2B86737F3C00CEA5CC3A1F244800118675E6820423
            E0C1BFAB69C533DD1BD5AFA266FAD3B1EEBBD14A6F19AE6256BEE845C60A0399
            99BD6C0652A8F7BED62E7F451149D44F40C0F6BBB16C6BCF42728BC53287A820
            0A3352174C4C1B0E400966B6C70573AB6839D586A2AD95E57487C7AE2734F769
            CE2B61EA86619184F0128CB8E8D43AAC6618DFABAD8DFC7B547D52E63329CB5D
            0C2A38C7B340443D1EF1B9EC77951B6C82A0F246BB9E3D6134E97B7A178A9BF1
            5A87722340276639127A8E99D48550BBD54C53FE98FF2DB48B86025DA5F50DD7
            F3E5F2A23A5B08184A8759529440A2FBD91D3766A912ACDFC079FDAECE8BE9F2
            C84B94B4746A8A4D401F917B1502F9FF3835F1B191B8A9D796A012F701E688BB
            09CD7E00BC6C1DFE3FD178890058C9CC25A8785F32BD03866DEC88DDBB34B021
            CBB62E2632CFB29AD3D1C8FC781053E0D90BA80A08205FB01897054D9E6976FF
            94CBE44B82D08B284EF8A080465C8233CB7BA1F9F2AAAC381FFC4D673B397EC4
            F7EE23A7539AFFB9DC07CD2A8510C97D1DC62211230051057996103E71B76667
            2DE85904BFB048EB698E33106D86F6D688A064B180B8B2A2151495CB7C39C989
            3DD32A67CD9186406E67A994E7157EFD78661DB252F010915A03450A4951A1FA
            3791A8731CF08C2CAC409D2F2C9871D2E56BE3A14F99577AFF4A02F7E4299952
            8D817193B21071A327807709873384C8ACD29DBD338AC3AAD68487F34FF1709E
            A5732046CB10C6332D182CCBB07AE05985B4BBF58109E3F3FB1F334402ED7782
            F4F78B8DEA0EB91F37E22DB94A0EEF3EB708140AAF7A50C83A6A3CB4B27639D5
            E7320CF61E4BBE527F3FDFB6EEC0DFF17E93B85965CC1F0C93B660040C0044E6
            8AB2F0BC4504DFBB91D4540A306CFFD81FA8953F9AF341F7FAEEBD42A9C320B4
            DE8288703792D8AEFD83DBB9431054BEDD689FA8F43DFF59761B1E3407F8163A
            B741499902925206CAB98AF3FE45C2F9A18DA6EA92522E8B1DF1768BF1D92606
            8517DCBE802100768C86045A01E1F60B4E3DB72FF6CD0B8DB4A567215D60B17C
            974CDC1FE7DE06D66BE2F655F42CD67DC7A4456C90011CD9DE209FF39D223245
            20B3C9BF08655BA88C1746DE59A2CE069949C76958A9184BC13D6AABBA23EEC3
            753FD9DCA354FBCD79EEB99FD51C929E9AFAE34ECD390C81FBF30DF75B597CC2
            92C18BEAFA5E96A2B0372F9C6526502E837CB3AAA0C9F54B1F9BFD9966BBBA7B
            FA780785CC02BC1FF3FA4624EC3F494AB79AFFFA4BC1B933BDAB40464C49EC59
            088B18CBB771D7A3153A2B8D7E89A556F3C74A2BD836AF36258D6268EC4AB9F1
            2C5BBD87A282A295EED0B0B9ED89D3CCA23129723FB21DFBE6E905715833DBF7
            5E968640EEB4F9A5B33704FA8301556D24EE3A3139321AF0028416A41B7D2C27
            A90C365BC5E177DB6DC0DABE5328AC35175DC7BCAB4AAD169D3EC87924061A22
            AF21E133EFE0D67F3741512D9CABFA4E2D9E349C7BF794C93718B3FE4F832711
            D1368DCD0B825B061B48B0B304563D591DC592D56D662170B8682CFAAB541293
            AD2C1C8BC3B91CEC49BF6F28CD529F281292B94A080E417A15AF6FC3C0C87F3E
            88F0A09904F4B55F7775C0E7C6E23983B69253B0AD97FA010E8956DAE09D69B1
            33A903441E3ACEE02D444C3AB251CB416FAFB89C65C79DCCBD14622625C250C6
            FCD6F97C38FDC2B25AA1668FCECAA4FAA45F1C089CFD052F9CD329968C1DDCED
            8878F525F70B0910647A25802A77EC4E3CE4AE19790BCCF1119F27243B5F7885
            288688544EA44C4060F961560B38B5816B9EF8E8CED3E67C68E4412808E8DEC7
            EAE42E6A65B65373C51D9398C4DCA6DE877A26C92A67A8A82EE5E361EFE23164
            F968FA665D8BCC396B5176B39EA1112B9B021A5959ECE2FAE9EDE4E875DDD6A8
            E01CFF18CEF17B249C0C19343C4BBC3788467C000276998AE16804ED234A2519
            153C177ECEACECE9C22B6AE2F38001C05CD3B24F4309674D3F38AA49C2390BDB
            F2E366F60B82FF0FD61C721763B929EA71237BF3507B5048F95615CFEA2B56D6
            61E79945F2E248EE2FD799659387F000D85417C411A1D81480088834E79DB207
            101768A382E5D43F8BE76453BD80386FF6014EEF96946812A9F0E80D9111C611
            F6D21A8A0A2579DC070667758DD139FE5E941183DCCEF9A50F310E3733423655
            FAD41089B1E312078EC4FD0FE1CEC344F017B832EA467E305A5D547356239795
            7574C9FB19819D14EB2A16451B24F6360B4084AE61FC3E8B6FEA42BC8447FF6E
            BDC5E21A038B7AFAC41718C9CCD3F923034BAED74D5E60433427AADBF660011B
            1B20556E40E74587DA9F2EB6D151B9A4A3522E8B4F00B57E8C1BC46ECAF26557
            CE2914C40F467A1DA9895BACC5D5C4838D59B820C5DB94C240DFB4ECBA55A9A0
            366A6EE9EAA4BBFB61B6C38EBBF603CD1DA72802EE81E2F57BC86D48C06877F0
            9D3F5A3A0FECECAE76727EA3ED91F93BA9CCDFE95A088479EA0D717F93F6A1E8
            2CA27A3AB6E197A3E997DE85F02BC65ABE188C9FC94BF4C45458C07F4D2955ED
            B0EDCAB77103BF6074E3E356CCA32DC747337404BC45AF3961DA8BD727612B77
            B5E1430595A14FE2D3FD45B8FCCD44BE5D0CE0C6290CCAC2E454FBA617A06334
            7DF34E90850BE17B40B3E7E85452718E2451566B5223BC7644A140D77A35AED5
            09EE75DDC072E779396A95F8C166C643A8F163F27CC1A9543B1BF7A35181CA52
            696002B5F277E2FADA551711706FEDFFE3DED9A001842A2B825C630CF71A6780
            32BE57A18D2E696ABFF4C14F286B3953069BC6D226421C6C7A3115A6D2EB667D
            78C379B565ABE2ACEAB0033CE57EBCCD8E3BFFD222F92FF8732AA25027151032
            83BDE4F8E960D7EAF3993AD9BF6D1416F7E4FE21B3F16C9A1358B88DB56F8C51
            72FA4930F006D408730E2AB491A6F285DFCB3222903B1B0F97A553CEFEC3449A
            39FA2D3768CB4FD7413CC8AA250A0EE39A5EE0C693C8D6D29F4298B0EDF130C1
            B06041044C87179ABE77F0DBA03DE12C0632B3821D0924D37F1376679AC03706
            D2DD36C8AC104C46460BE78405A79EB4460B55A92CF6B7A8759776370B882E54
            DD1A6F03335579F037DB249790E43B7151BDCB21E28462135CF9BA7A4BED4C4A
            E85729B126EA7E70AAC2B1BB5013FEF5C8AE2536A519723BA3D91D83FC8FDED8
            185D2B923E372C81DC59916142724B9F18F6BDCB7CFF49E3C923C70CD342D6DF
            2F36AF3BE40142D8FB40261C8F8016BFCB0D90627E1844D1CB200BA78AED3EBC
            D0E6DCD1E838F4F488A328A3D7EADC694E6426463C2931F717D5E521197C6A34
            95E14A253E8566E8038C5A9B98016701E436815B585951DE1C79C0D4AB176DB3
            CDC4B3469BC20CE7D2FB59463C80D7DC58B88506629CC990853B4CED88F48DAC
            18B82F82AD8640416F2FCCA599DC5754568590B74AC090D62DDF2D20FCF6292E
            A5A89D8860A9349ABE59D722292D4FFF67C5ADB8171DE86503893EBF0A409355
            AE9CC15B793D7F54B158AD3476B7E68ACB8995F99F77144ECD9F57BE0115C0D8
            8AB5EB9BD72B177576C2ACD1DE5B1A1204617F96097BB4972B6CFD362DE26616
            1A9FF2AADA834A24AFDF4BF9848F0FD76B542EBF91E174D209BCD6F2DBA1C641
            AE7D96A192663659183C655FF90FCCA5861126EC1DF50A3EA1D814ECA3DADBE9
            9F87D3BEB973731B6CF2BEDAF9B2C80457419D1C223AABDB4730C4E781318012
            6970A8F67775C0B4D18E57541694C95F2C2BFB4904D121DC61EECF61DA4E9C93
            AFE6131FBCCFA9B71CD2EC52C3EF651911C8ED985F9AD902E4E2AA70EBC1F893
            CA0495714E0C44367FFFE6B1286833B767CC38138040E3048BCE6B333087046A
            AF3FD103EB5394B76782E8848EF23F0FA724F2CEF171B880DF12E2EA45A74E5F
            6376083CA4A7308BFC93506B535CF3D13BB98F18AFB2A6EF6E3273E3C8462F94
            EADF6C2A66161B0C32EAC6836AFBA7971D85BBC2D709C9EDA7DBA836AF2A38F6
            69087047CC9D46E0B88FED5877E246186CE2216BA431561132BE07A498AAD855
            BDCFA96DF1C962F1E5B78673DF9E1EF25996B1AE741CFB174F2EDDF1DB73E63C
            CAD7F43778E09C00D4BA1ABC92C310F152848DB561AB8A31E755900DAF3EE1D4
            2BBB151B4C4D2545514532E42120D6660A74BBF35FB86ECB501D7B43F1D17DA7
            02195ECE5A6CDFB636E79946DB50EE13DD84E4CFD3653AE3BC32DFAAE20DA1D7
            1C417444BD33D04FC51B5D8DA6560A8DA9CCD30B99855A018903CB21DB667296
            D558A9F159DCD941F76BA84F102008BAD1BD7878EE26441DA2F3363E67224ABA
            CF1594964DE76D9215BBBDDB834D70EDEC824F77076132D3841D0B0632FB4507
            CCD6CFE96AC02B341622038299953D5F292C7E70A76F97F78315E59AD2D5DB2A
            97019F787A33029864A6104AF3BF94550DE39E91B0FBDD382243C04E1634417D
            F62ADC9F87459BEB5EBCD8DAFED97D2F20903B07EFFBC5AE029D97D8369535C0
            EAF5F66D75DB8835D56C4A2CBD1A047B02D1815FFFB0A838BEAD8D3C3B647FA8
            7461CB0E43E8FE354A32070B0FE002846952FED91109C68D528304552F702F94
            54A9A656394325605B2B43F16CCB6C265CCA5218EB180A4008EFB89F0B4F6952
            D50E7F5A6887AF36B37DEF751936C89D367FFE3616CFFC55066B0D28E3A331A5
            0DF37C34E824E19600E05946BDF7100374C1F58CAA26227EFDA1EF0310D00EA2
            6D0AACB6513ECF702CB8417B3D0D96401E5F55847885536BFF45330AAB3DA81E
            7EF861F6AF0777B93A63B57E56061385AD5E463FC8D78626EA3E927FFF44F005
            5ED59DDAABF8FE57B8AAFB972E9DF4E49C396BB69EC9F45016A79FC66B1551EB
            DE0F3772EAE086AFA810DCB61DE27CA9D8DE585A130449D309CD97B8538D01C3
            40418A8FA339B42AE88C576FD9EA039B1F7DE0812FAFD1FA8307C70CEC9D9F60
            7F8CC74DDCC1836B0F3C001E5CD3DFE900875C1B57D69CC07AEBB7C7E4E705BA
            53B8BDAEE580436D5EE734F1C546FACC94DE85F40A6CD349F210F4C53550861A
            00610EB33C5440D45FB658E32057826C9C0A77A192B1BDAEFC4612FB25B416D5
            1754CD1DE09585AFD6074F6D34076DAC2F7AA19765720539974C5E5E181C98A4
            0D0855CCF33C220A1438D5D98576D11095A4DCCF3F0E0EBD0908CB7B254C21D6
            9EB0350B206CD1945FAB76F0EACDC0271CF56EAF532FB9D294B6CC972EF768A5
            30CF241AE49F55E9A4061CEE9C502C901BD665BBFBFAC4C18EA0D711CAC679D6
            CAF011A5074D16B400CA6455B379444CFA4AB3C6ABDC0797529A3B45A72B8CA6
            9AF3CEC18435669C0732E8CC71AA3FE8EC10E7ACE97EFDFD7C635B647E8CA351
            D4CAC6AAD79C3AF96831812B2B0B3058347F5A384FF710405784E77714704A61
            D2E3E8549FE642CCA316FC057BFBCD3CE4B11F2BE36D9B6EC7411C4008FF24FE
            722F198321F7613FAE0702A78CBFBE3C453F4AEB0B514C6400B0F36686890F21
            B87EA999730795802E62B52C5067DB10FC4AD348E5B5CFEF43F5BDCEE8C4811F
            DDD54EAE6F66FBDEEB327C907BC955FD1318FBDCDB3E4D21E0AB86F36446C1AB
            F99DF77964B3F7C57C934C0D48069DE64401FF77614A0324DE536BE6F2EF3C7A
            45D4DA6C5A67A8018285F15C7ACA8EA31406B87D62EFA927ADD1E5880B6306B1
            7297095EF75D4FC24C3362BA3CC10055F295495B18C2EAACB9ABD21D5B43144D
            6EC1A6DF8B8FF89865F1176C5BBC625992970C9BDB366C8ABFDB1EFF62375C62
            8748EBB2E476A9CC0F527357C526EC5711E49EDE35428A42F879C96CC23273B8
            30CE84A8B6ED7F6CDAAA83A7579637A7FEC886F666FB1DB31A4BEEBC7EBEF906
            825C40847532515C500B1C7BE016A70ED3D694B608B5F2C92C038B29CB6F2378
            CD88690A8E66DF926A8C8F7708067315DCC8FDDAB1D86F7F68B4DF3CE9E9E387
            3392BD012FCCB801A8CCA560E6DEF02C3F6EF680977073DF77759693D5DEBB2C
            CEB5AC96F3351737EE69483A78A57552A5C381EADC271EDDF96BC3B1A00F4734
            9504EEA62CB735775DCAFEF8048315A2BD0487A3DB76A2A3FCF107325973C354
            125CC3DFA6ACE53BB2D293771FF706463EEB386D2A18303D62129CD49D810BA6
            77906F37A38FD69574777793ED779853C2B5D31502B9E0DB710D800B2E17595A
            AFC4ABC06B0554404715B8D5A894CB7C2F20995F53C6B6729CDA90F35A155411
            1CC53E0FD774C31CFB24E9ED137DA8144FD3594BE2799E833914A10505704957
            11E36BCEC75DEE6787124EFE8FD0CC5EF27ECA88E1547A40BC714AA1B071A8A0
            5077F74E6CBB1D1EBB0115B1C3B5829D8C5C030B6F9025271458E5B6D58BBD50
            165D055011D609FE3AAEC655F86E0AC50348719DD51A760C1BB1089FCBEE4DB5
            370BFC9CD7DAEEE0F60A313087CE13FE9053CBEF1FA50294CB6FE4A2CF3DA2B1
            5B085760FF9CE42B0160D2D9DC1722A2741B9E1CFDDEC297F60B2B57888FCC9C
            49DE6CE6DC7AAFCBB040EEB42B4AC5BC43AE92A794D271132807496EFEA84523
            CA3BF5246E898D9034F5D5E2E4F6487AA2A8B55683D2647A445C5CEE20F1F8C4
            E0B72129554A12D8DE0001D52A217E5B3E65FA716BEAD352496CC232E49FB8C9
            6F697254E36E96287F0FDC833D125013B29878AE4150CF240F12D917327F1F5E
            E32DEC839594AA1D603CBEDF80B156AAB44849EA5755C884EB66969681CA5344
            70DCFCC86DC39F567141A0F473D4E04F57EE1CAFFF48DC7D138A4C359E2D0070
            546E8BC774B58BEBA2F7E87E7827B6FDBF97740841FF1F6392FB6BAB94550856
            EFB06B767B711811BDB2363AD0CC6F001C1672C39946A990BBD0553F42160D2F
            376EFDC58C25F66B145C9AB2B87BA2F5D4766F5E47ADD64F711E18B189B9D19B
            F306C007DA42D45ECB30B2FF4878CC7E7FF4F39D05B76EC3C3E77D8A8B1B0C09
            C42C4E9E655BF5B95D17C299FDE4D2EEEF3752B277F5E363FD5E0523721E5602
            23BC7BFF6089F094755E53C5CF7B682515073752FAB45C9E9811B0EC7A04B987
            A9F18858F71368C08102A0AC4CBA81126C637BEA8E80638A057163B3FA695D88
            4CA344B3D50719C96CAD0384C27D1EEA03630DC9CC125CD8AF0B704EEE6A277F
            5C9B6DEEE9139FA2825E26F3E27A015F51CF9A5ECF32DEA1F63A01E76B8576B2
            A0D9ED2823C8252EC8F5A846669A32D35A691896217444E834746F65283F04D7
            FA3FE3E3C33F605999AFE3949B41A99597E78E2CACC39DC11BECFA0B6D49D523
            714CF32C33782BFE6E5FA1CAF606DFC5D2989938208A85136904DAA814FCC77D
            E55C7FAF2A45D6F067551C81F1015D505F301EDC15748AD906633F7ED2B173BB
            9ADC6354703E82FD7E91236AF31B496B562A0D8CA79996075151D83A463D34C7
            CC8CB70965E1D1E3CC54EAB7C1AB706E0D8B6A92CAF0658D205796C1E544DCD3
            CAE8FB0778D8921A4C36CFE2E9594505ACDEF2EA49C06F0D0794452DB70071BF
            1784AE9B5CE52809D89A99134C009C0464C36D0D3F8707A2BDEF007208720739
            5FD652ABEF71E5E933FEB3A6CEEF2993B3AD4CEE07DAED2A225A9FDBA7EEE54D
            80E5AD62611CAC667A9B10003174056DE9A6C6E6E469C83C6211B4B4154ED837
            39B47E4633EACCE3B37E1D9FF5FBEA5913CDCF107A061862FC3468739EC38FCF
            B1C7ADBA61194CB2A74225BB6A15EC8DD3F30C20D691445902644012FED6A9DD
            F836734E9ED94687E5A2D2AEB996D33C2019A5C424294A81DBCC1F1A959A8ADB
            83BF5E7AFE4ED3E63CDA1C2B66B95FEC2B1C7A0B1E502DB17455E6B2081AE629
            070EE7625A57418C286D171E701358A6F6074A7307E94214A67E62584E0D4F87
            AE495F7F9138F5335131BABA19CF6D8A0CF462D996AFC8622221DEAD8050B611
            FF40352C897E7729054EB6B37271E7B4C62A6F95CA620746E97DF2F0D5E5B9A3
            BF183ACD5B480961B2DC72FD19A796FBF0687218BF130401C3C705A108882833
            0D05C27DD8D81EEBFFC2B5EC0999089A5F00FCF51F8FC6B2361CE97EF861B6ED
            BF77FD322A19DFC1E68EF75CE2A657C6F388690F52F54EDC4CCEC039FDC058B4
            A77791B89C91969355A183847328197C076D759D146E961DFB315400BBB316DC
            F25265B032C96AD9D9A2F4507CD65308B5A67AA92BB5E5B772AD53E35F281693
            0395253716E8F25B656C86A62A452D59E1F326D46677611A882116BC6B521F82
            345A19D055BFAA773201172250FC16A5990374C06BD468665ABA234635308F35
            F98A711CC8B30026A82C339CAEE8600881281BB7A5EDBCB5C2A1622F3CEB4664
            084025E9B31498DC57552198B0153E68679CAEE31975BC3ECCE2F4AAC880EE11
            03ED54562F6B04B91D9795E68F27F4F32B553ED9008C0290D0C20B735DD5A521
            C6310D0184E835C2D75D1D088D726AA31CDAA80537FEF7417BA25C22B3BDD136
            479339478DD2544D5580AA1067F69E5A9CBBA6CE2F95C4449661B73096DD5D95
            6C8D68BD00519786B9D19912B1F242DC7262BE8C7205CD1B6BDEAB83589DCFA5
            F0DA9C661D3678001E022C7713AE642B0820486886094A7C9A80B1310A37150D
            6E78B8ABBC2C08411D4CC83C3E1B5396CF28EB04D1B93A38D42F7EBD3577D6AC
            6116C828F5F3ADA8C3EE41F0B2195716EDB02522002BF1D2BD7E9B89D78FB2AA
            57EDFC8E0E3EBB19FDE7494F597CDBB2F2DFD1F97B798CE093A43FC86A4CDC19
            B8BCD00133867B9FB973FFDBBAD1E429F32D966BF70FB710888C70CA704C64BF
            DBBC7207E5E26CDCACFFDECCE756E383A09B66AAFF6278500BAF36BC01700904
            D4A8304520722117FC63EF9DD4D52EAE6A681CFAC41728C9CEF32ABF01C4A047
            70EF9015CB086E25DA5DEF38F53F757588239BDD5F6B5B50413C8F915CB7179C
            1858D8C1F7D044FB048C3193EB5A5A231D61DF8A40EC82E228BD474349B92CF6
            C29B7523783D4AE5EC762D7006C34459D83595A23E80EFE7DA15EB4254429AC2
            294FECBB3299C1ACCC65B25CAD10719DD8277AF89E2E629C5791B38E2AC549BE
            7C157741D4F6E986F82CE3B4B7CEC675AA529FC96C405738D5B767158BAD432A
            57CA634196DF8A7BEB0142551A8308CD2C6ACD75D51A12F16A24F176FD67F3FE
            A5EEF963BF82FFFCE2B5D7DEFEF1AC59AD83BD0BC94D08720F3753D28538AE11
            F0684AF82CD774462EF803F8D71CDFEF2EBD4EF24A0E1F5CE8D406BF887D31AC
            8066DD376FE404D9F866CA7207682E35C4F6C7501BCD3132D275B801982F728B
            1F3C52909DCA9A65B520B7737EE9B3388A8B70B964ECC8693F54A684A4BADA51
            70B63AAB98F9FBD5363C12811A077FC9191D92EEA5DB14FC5D941A91FC8C00A6
            A5D95BE01BE2FF97737E236C90F99F4585C21A83124A6571A045D91F09B12608
            D75525BC6E769BE35B3803E6028804F01A6E2C181637C3A20BC6DF19CF28A385
            419714BC8F70E71B8582686AFECA6BE70EB4BCF5BE3C02FAD67D75A9CFA0DF93
            948D5890A141D8F7D2D1789B96FE3BEEBA7D72B258C4EB8238E776B5934B86DB
            3E997B75871D1FBB1A37BDE31CA76ACC8DC8669AD0CFA10208EE18A9CA434EF5
            C6428738A299FD88874E96D3659759B465BAA6B9180A83FBC257FA7CFA80645E
            881540EDA30A6DF4EE35DDA31FC1BE2DD84F71F3FD5FE1D40D4F81A98CBA8FAF
            ACB7CAAD5821825F64D7072F1CC94131B267178782AC5D0F3A1E20A4DC860E16
            A3629EA19C84064DFEC79DE908C61BCAB7DCB350FC8ED1FCB1FEE1665E3DDAFF
            E63C125EEA27DD305518C1A920C8A5EF6A902BE7A520CB6EC0F57DA8171C19B8
            D2A9CB3914BA57DC9CC27EC60000634FD2F994858C2500711D3071A55D19BCBB
            19730A15ED3D05235F24821D87F798A041531063E2CD1B499F906F51D1BD1968
            FD025C337F1DEBFE732BAD2D46C0B4B9F02B2C465203BAFD9434BF3C8502FC98
            0E6F7F24EEDEA8536F314BEE8FD5B751C59BB3F4B19D7F3AAC6C337DF01342F3
            67EA221522D41CD5A421009CCF8DF5CF9FB8E14A0B7595BD6A05DBDC83FBD445
            8536F288F7ED823E7191455ACE10A212B20A07FD13F69A846841E10FF45C94B4
            0E65A597FBA2542AEC9FBEF64AEE5BB3665507610452EE13DF242477A1B63073
            309A15B31F054568C21E69E5F5632D924A784B6787CCB99D4AB3654890DB39B7
            F43EDE0A7F1B47E936D28A4BC0CB7317E5E02481DDF0613874E68430E8353F8B
            BA23E2628251FD3E294341B85D267D228976B106646DDC77A86B6725F755C08A
            3A65FB2E9A5178743883A02B816565FA96BC0A448B8D1284168BDF67BE8BDF5F
            32112D1B427D610497BB97D5B5B275259ADACBF8CDCFEDDA0BBF2816A78C0948
            E9E9231D8C64CA32A0800B2764F18F5A08A2201FBCE862C30516709DBC3CA35C
            1E4C3720D83A17C1CBFDC36D171E301B571DF25D8B66FD64E3665F0D65213515
            09F340D26D549F39785E9DDED525E60DA71DC31599BF9858F54B3356AE5D015D
            374023AC38048DD7D66FC97B741EC9507B7A5B1BF957D275E7F58B49E3387450
            42CFC4837E1B79ED68F0A369A1D3AE5C496BA9FC1D51EE37C732B13F3EF33896
            AD5D458975BC5929D0F7AA8031AF4DC52E710FD13945B95D2B777642E748DB52
            2EB32E3C2B2FC6CB8C53656B21EA5676ADB51E20308270F400197C549CB78E63
            BFBCCA167B8CB40AD43B495001D94110F2377C9E8D9497453DB8A50085C3AB03
            40F853D8EBB21B26E33713B0FF5B838925542C80AFB0090D40749AAE2A0EA578
            04AF7D2DE5FCEFB6251E29B6D12787DBAE6BE7E65A576C5A3982023B1EC1E367
            A8D5AAB32744723D83399F79FD716CCB8F804F58B036B35DC842142CD37A9EA3
            285D11ECE97903021F8A416B33CEE2213C7F2ACB8ADAA3EC1B81F23923293680
            F37D4FA0CE5D389E390F80076BCA337A452CB41EC8F439A9D17328E86FC7A9D5
            1084FF8E327131B62BA650C894818CE4176ABE72F85EC95ED5A88219FC4EDFDF
            72E756ED493C31BABBDAC5C2918E554F999C4128FD21259055459DBCBBACC670
            176AABEF7D92DFE96A87ABACFCBE33DBAA69D05993654890DB7EC955176DC8D8
            199AA6E04D0E9D8520D09E22877B845FE3BD8E7FB73ACEAC27267541DF6F6810
            3AB4EB26F6CB44CA443803C47080B5F73E4ABA97DFCB00B4154EFDF445A79E34
            EC0A533D657E321E10BF443092F72C9D8996E888D9D6DC54426D8FB894C3D674
            E25B4C6CA7F23A7ED2EB30E75763ED2AE9DE6927BAFDB797FC1C0F9A2F490E9C
            50395F8D710111521F425CA660A4C1AB56A5FF2EA36A24F07AE511B0F84FC05E
            D6B3BA5CAC7890EC8E7DBC758DD71C4AA98DD3793B427997CE756A2B8B8797B7
            9010C3E51AA14C98B490A172B4AAFCA7AA7412FF35E17013429A176CCB79C1B2
            377A66B487E7B5D7E65ADF1AA87C9788CC19781F1AA314187DEA896BE57E0337
            D712A5FC1AB0C50A90755828D98908BA0F7E7E38F6CDCE2A910DAF87AD468652
            E58301A7F23C27E4123E8EFFB259A568E7CE1D68993C79FC56B2550075B06D32
            0E5F1C8C373C1EE7ECC7F4E990AC14275A77426BC84C55A7F8F436015E02224B
            15F3AA45F92B4B9674DFE305CA4965C2CADB5BAACBDBD816201BE1A156A48415
            F0EF5BBCFCD1DEFD6341A37EABC21C4280B04748CF93FAF578CDF92A210A070B
            C7E7B5A54BBAEF6A66D0DE588A0F44B84E11E8BA9D2B44882B10C15E6A5BF012
            48435C1E265A36B4E2FB4D28A7BB1187EF0D8CEC817DB4B5CEF12D97AE979F1A
            401712612E2F561A779DE785A0FFC529FF3C02E3FFE0EB3770F9A3D6CC9FC79F
            B600A79B71E58C175BE0DCFC0023646BBCD247B492A7293EC1C878F324A3F643
            6E0F3ECB815EC66D7EE57082549B2DCA1A2E9695ADECB8E375760AA3108DB137
            26F2747D0BAEB91EA8096E1FC193FB47944F58D8C8DE535E08DFA3D6B87364CA
            4B45938A7ADA4CC340E4DCF2B724CF922ABD866A19DBAFE2BF7F40007D2582DB
            C543DDBB74AD98C8DE865B99D5BA9B9772D397D8F9E0B31740086F7DE9BE909E
            4AAA02D0AA6FE223F4388EF3231CE71756F7DCB29CB10D562BAEF58D715A6E8C
            6B338B7BC07178AD1370CE10CEC3C166897826C1AB4AC2271DE82C38CE0D84F1
            0BF0FD0AB5B558BA00AC05F6CB6D6D69C685462511E476CE2F1D6B09F29B0C8E
            623D4A1407D39613B0D14C46CC508C4FEF90D19697C0CCE2BBF00062A022AEBF
            46AD36EE6F0C935B98EA0E91169A250701C0043089C16BE16725499B4EE4F356
            DC309773E7EF7C9C75E070280B9E48772C6E4A3F00C67657CFA136E520A8209C
            2A45E81CBA00FEAE171CAC818BC8E4E76A4A02D57FCB6BCFDB02AEC1A535BFD1
            6A4F8D88E4787158711E4EADB328CBC824882E274E246FDE099E03BD7933D74A
            595FCA055C8E40EB4A045AAFADE9FEBDBDE2D72C3BFE78EE0C8007F695E7DAB3
            0E0240546983D06C34675150B58F44564548A170ADCC54592DAA2F388C7F6224
            D6A8D5494F991C8F60FD3C1CDB5D344FD5D1401D0C8B8AD18F9AF748211CFD6E
            BA36EB065836802265AE7B4FF68FF32C22B12BB8857DDED6E4F29865B10F5026
            53B8690BB5776FD536DB7D3EF03780283D3D99EF675A7EFC21959DA15D97A083
            5D6CE7ADDB099F74388280BAEE5B7E0CB35AFEA09F59D32334DFD1516D09DCB2
            51DF8ED9F709F78E89F6A878EE7C65D9A9AFFAE7D4A913F6196D75B8B525B8AE
            2EA799FCC9129C69B06AFF077B7566577B7D8D95ADE6F5F349E36C72188287CF
            605F1C4D586EA2EC34EEEE7FE0F52FD1EB5E079682F606F9EB90FB20CAE5E8F8
            7C604DEB31F32853F53D55B11BD2ABC41FC2315D885B40CFBA00B7A6A8AA6B99
            71DFC2B67E99926C8B00CD1956F30F86F0880271CF05E1EE8B4CF583521838B9
            8783B380DBABCAA3A17C484F4A2653FB0150EB4B4A85501E47AF4D669113EF2F
            0C14E08F9970B9C2E26F9C8B6B71147E5F2890C787737FBD2FD06B28CD4FD1A9
            BACC3D2A30AC85F3536B9A8CFE81237BF219EC94AB89E00B87932F5D4ACF22D1
            6F91D6CFE9220FDEC3C96791CBD203FB6EEA52F79F687060A2273571FF927BB3
            A7D8107F5F769C81AF15DAC54F463DB9DEA31203B9B3BBBBD993EF9F7A430BD0
            8F0D4A425EF05308A062B4646F5C93F33EF734CCD04D43DA4E30218CB8C3E4C6
            FAD660F33751A8AABF4B4A1FE65FDAA75290089835AE478C1F47ACD53E3DC2F5
            2185E9126AAA12ECB855B8691FDD3BA3F8F048064406A3D12C9551BF27339AF9
            A07E5E0D3C42D92622AE729DAEC4FBCA7B066FB1B88158BCFA0AFEEF7E1CBD6B
            788DFF695D6EE8E532DF1F37CCD3B185FB09C2B654005C5908E4F3855D751E00
            F39EC7B6076B8438F703E44A76ADF61B7C8E578773CFB9D7E65A365E35786F36
            337957C9EF527DE6F3C58CEC1610503F922ACD85667414E1245951DD8D50825D
            BBB67CD0CE89DD8AC70D6F731F8EE0C1B809B5C6CFA4944BDACBB6EA96CA2A2D
            8215E529967E5E68C3E3E22B860140D4253B890B2AA44BBD827D2EFE814FB1A8
            56737E5B2CD2FF8EC5BCE8EF17BBD61DD28B2DCBFB8A1A9141224AAB93CD1C87
            FBCF06F80C3CCADD36DB1F3D444402E0D4FB1825EAACA61625A4FE17702675FA
            20B78F1F4E045B6474A0BC2C97213B4271FB20D0AF8DED63284B53622063700D
            A2B456440CA888E0D33A8BA76E3DE17FDE0D205755A722CB1FC0FD6A47F91808
            3E9F21DC9E8640E2DE915F8BEF808A7E275EE37F71BDEC120451452DB0C2B7D4
            2559C6C2E793975546FF87FB87FCF4394AC483388E575AD4FEEB3BCD5286A06E
            6F9C939FC7397A204E8AED296BA56AAF72F9CCA682E52BEBD237A6BC80F41904
            4BF77187F772FBA5DB9B493FEB298B4EBCF79938497797E9C7C0CD78103D97B4
            12A1623C40A630C44F9EC00F6F07EADC64575AFED548D9DA72BFD807C7FC8714
            B207B8B41230A912FAFED40DAC6332373A7E419F14C47E183FFF75963AB7B50D
            33CB8E27BDBD7C2EB55ABEA23D65E09F15A06C4C84708D7E57C8591F645B027F
            FA05852B20182FE337A6E2E2DA14A4B6BB02BFA808B551CB67B1CFEB6A277DCD
            1AC3F79A24815CB2F403537705DBA296651B684302A5A1F65BCBFDFFEAF6E3A1
            FEDEFC7C38D759D3DF78DF5991BFB161646D88FE4DF4BAF6107F0F50C1BECBCB
            BECBC0B3BDC5E28A618D444454F08F4D8E44EDF528C1C5C771FA6F4028238A4F
            A4DDE0EE21ED6DF0DA22295C8B2457BC3331880BE55946E8625C9377E3AE700F
            1E3C8F34D29EB112DCCCB7C686EE0D90D90E17F3F6B8D027084E36C7FD228B4F
            21B7ACB7F1C164B4EDDB84B1E785231098F3C7A74E9DF4D7910280B973732D93
            27573E436976920DEBA0B014CDE234A9ADE4F6E075C5626B43F3627582734616
            F73802E7E35138DE0763E76DA4A905963A1C39705719342CD6BEB2E429126EF9
            4B1970266C99A3F25187D03F33C7B969E9D2476E9F33E743CEE85AB97A59BC78
            A2F5E073CBC64FC256C493D70A310932136CB027E2FE94103023CF9BCC109F79
            FA7AF4B5FB1B0B17950DCB972E3DEF19DC135DBAC2C08696D5B2B577EFF8B587
            BAE77064356D95540DDB7E1BDBF2B4D79677B2E01AFE34B0CC9F54004D7DD572
            60CE31853672E768AE29957D2B4F0FE70E3D8C40FD5378D86F867333A36A0528
            AB20D7CA998B207C1EBCBB2F6A6BBBE4FDD30AE75C02D82705854719178F724A
            9FA29C2FC1BDF0E975DD77C3E8874D2C0BF6C4366F4304DF129F73737CBAF142
            50CEA883CBD9B21119BD843DB18C73F202EA7EAF6469FEC1B6B6EA7363D5A63B
            4BB9FC33D9CAA1B8374B8FE3AED8C953F1FE19371C147507BE920804DA167B02
            6C8EE0963E5428380F35E3DE32A301C046C7E29E76189E71FBE0BDB732ADC6D8
            8E57B15DFF4474793F8EFB92AC05F7A202F372E3F7133B617F6F4781D9E0C539
            2BDD58FE0FCF274EABF8EAB5F0FE10DD6B46B03F5836B52B322B060C0CE6F51D
            5F5AB2F38A39731E1DD37D777D9661573C4B65DD883CF4972E5DB639E2A30FE3
            E2DD950BBE0DA5D6040EF50D40B00D41B9C16139BE1E904C4A46C4F3B8DADEC4
            75B8947278C4B6075F1CAB68F7B190EEEE87D9D4A97BE40196E1029F04CB9681
            BD6CD9D46AB32A66BD1744569E9A3AF5BCF75B16DD033BED4394F25D04C8B468
            7C7399D715B1C044DF97EB09A18829C572DCB7FF0B8CA332411FCC5AF4AE4AC5
            5ADA88D52595F78EF4F4F10E4AB2D2FB640B51ED29B4934B9B79FD79FD62A3F1
            003B802DF64670F74162D12D70EEE2476243C96A20CAAC4E9623BC5A25387F8B
            0B040954BC849AFEB3D4224F59205EAE545A56994500DECD2233C104EF3E27D6
            A522A4F79AEFB5BAFB35B6631959B66C923DD24C058D882C3E025069053C2DF2
            EE67950A549F7EFABC15EF06E53095B52329C87D174BA9B4990483B0BE6CDEA9
            8C9D742F5E6C4D5DBACFA696057830C004B02C02881AC073ACD9B01CBF5B3E1A
            AB472AEF4D91D6B5D75E6BA193270FF2B12EE2608AF6CCBCC85F1BBF059D75CC
            D883AA545249E5DD2729C84D2595545249259554524965BD9314E4A6924A2AA9
            A4924A2AA9A4B2DE490A72534925955452492595545259EF2405B9A9A4924A2A
            A9A4924A2AA9AC779282DC5452492595545249259554D63B49416E2AA9A4924A
            2AA9A4924A2AEB9DA420379554524925955452492595F54E52909B4A2AA9A492
            4A2AA9A492CA7A2729C84D2595545249259554524965BD9314E4A6924A2AA9A4
            924A2AA9A4B2DE490A72534925955452492595545259EF2405B9A9A4924A2AA9
            A4924A2AA9AC77F2FF01E18456FEBEFF93E90000000049454E44AE426082}
          Stretch = True
          OnDblClick = imgLogoDblClick
          ExplicitLeft = 201
        end
        object edtPassWord: TEdit
          Left = 1
          Top = 1
          Width = 80
          Height = 30
          Align = alClient
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 0
          TextHint = 'PASSWORD'
          OnEnter = edtPassWordEnter
          OnKeyDown = edtPassWordKeyDown
          ExplicitHeight = 35
        end
        object btnSet: TButton
          Left = 81
          Top = 1
          Width = 80
          Height = 30
          Align = alRight
          Caption = 'SET'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnSetClick
        end
        object plLoadDUTInfo: TPanel
          Left = 321
          Top = 1
          Width = 389
          Height = 30
          Align = alRight
          Caption = 'plLoadDUTInfo'
          TabOrder = 2
          Visible = False
          object btnLoadDUT: TButton
            Left = 1
            Top = 1
            Width = 312
            Height = 28
            Align = alClient
            Caption = 'Load DUT Infomation'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnLoadDUTClick
          end
          object btn_add: TButton
            Left = 313
            Top = 1
            Width = 75
            Height = 28
            Align = alRight
            Caption = '+'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = btn_addClick
          end
        end
      end
      object pan2: TPanel
        Left = 1
        Top = 68
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 1
        object Panel12: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel13: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel14: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show2: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
        end
        object edit_vid2: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid2: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev2: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object edtNum2: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object btnDeleteItem2: TButton
          Tag = 2
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType2: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel34: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pan5: TPanel
        Left = 1
        Top = 173
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 4
        object Panel19: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel20: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel21: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show5: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum5: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid5: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid5: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev5: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem5: TButton
          Tag = 5
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType5: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel40: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pan4: TPanel
        Left = 1
        Top = 138
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 3
        object Panel25: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel26: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel27: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show4: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum4: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid4: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid4: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev4: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem4: TButton
          Tag = 4
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType4: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel39: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pan1: TPanel
        Left = 1
        Top = 33
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 0
        object Panel11: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel18: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel24: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show1: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum1: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid1: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid1: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev1: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem1: TButton
          Tag = 1
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType1: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel23: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pan3: TPanel
        Left = 1
        Top = 103
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 2
        object Panel31: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel32: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel33: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show3: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum3: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid3: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid3: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev3: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem3: TButton
          Tag = 3
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType3: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel35: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pan8: TPanel
        Left = 1
        Top = 243
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 7
        object Panel36: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel37: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel38: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show7: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum7: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid7: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid7: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev7: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem7: TButton
          Tag = 7
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType7: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel45: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pan7: TPanel
        Left = 1
        Top = 278
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 6
        object Panel28: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel29: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel30: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show8: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum8: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid8: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid8: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev8: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem8: TButton
          Tag = 8
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType8: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel49: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object pan9: TPanel
        Left = 1
        Top = 313
        Width = 711
        Height = 35
        Align = alTop
        Enabled = False
        TabOrder = 8
        object Panel41: TPanel
          Left = 338
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'REV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel42: TPanel
          Left = 241
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'PID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Panel43: TPanel
          Left = 144
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'VID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pan_show9: TPanel
          Left = 435
          Top = 1
          Width = 200
          Height = 33
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object edtNum9: TEdit
          Left = 1
          Top = 1
          Width = 46
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '1'
          TextHint = 'Num'
          OnChange = edtNum1Change
          OnExit = edtNum1Exit
          ExplicitHeight = 31
        end
        object edit_vid9: TEdit
          Left = 183
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 6
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_pid9: TEdit
          Left = 280
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 7
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object edit_rev9: TEdit
          Left = 377
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 8
          OnChange = edit_vid1Change
          ExplicitHeight = 31
        end
        object btnDeleteItem9: TButton
          Tag = 9
          Left = 635
          Top = 1
          Width = 75
          Height = 33
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = btnDeleteItem1Click
        end
        object edtType9: TEdit
          Left = 86
          Top = 1
          Width = 58
          Height = 33
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 5
          OnChange = edit_vid1Change
          OnExit = edit_vid1Exit
          ExplicitHeight = 31
        end
        object Panel6: TPanel
          Left = 47
          Top = 1
          Width = 39
          Height = 33
          Align = alLeft
          Caption = 'Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object plGLPDView: TPanel
        Left = 1
        Top = 543
        Width = 711
        Height = 35
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 11
        ExplicitTop = 566
        object plGLPDResult: TPanel
          Left = 436
          Top = 2
          Width = 198
          Height = 31
          Align = alClient
          Caption = 'WAIT'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
        object edtGLPDVersion: TEdit
          Left = 242
          Top = 2
          Width = 194
          Height = 31
          Align = alLeft
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imSAlpha
          ParentFont = False
          TabOrder = 1
          OnExit = edit_vid1Exit
        end
        object Panel52: TPanel
          Left = 2
          Top = 2
          Width = 240
          Height = 31
          Align = alLeft
          Caption = 'GL - PD Version'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object btnDeleteItem99: TButton
          Tag = 99
          Left = 634
          Top = 2
          Width = 75
          Height = 31
          Align = alRight
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          Visible = False
          OnClick = btnDeleteItem1Click
        end
      end
    end
    object pl_DevData: TPanel
      Left = 1
      Top = 1
      Width = 713
      Height = 352
      Align = alClient
      TabOrder = 1
      ExplicitHeight = 122
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 225
        Height = 350
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alLeft
        TabOrder = 0
        ExplicitHeight = 120
        object pl_main: TPanel
          Left = 1
          Top = 1
          Width = 223
          Height = 32
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          TabOrder = 0
          object Panel22: TPanel
            Left = 1
            Top = 1
            Width = 221
            Height = 28
            Align = alTop
            Caption = 'USB Drive R/W'
            Color = clGradientActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 33
          Width = 110
          Height = 316
          Align = alLeft
          TabOrder = 1
          ExplicitHeight = 86
          object DEVICE01: TPanel
            Left = 1
            Top = 1
            Width = 108
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE01'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
          end
          object DEVICE03: TPanel
            Left = 1
            Top = 38
            Width = 108
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE03'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
          end
          object DEVICE05: TPanel
            Left = 1
            Top = 75
            Width = 108
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE05'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
          end
          object DEVICE07: TPanel
            Left = 1
            Top = 112
            Width = 108
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE07'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 3
          end
          object DEVICE09: TPanel
            Left = 1
            Top = 149
            Width = 108
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE09'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 4
          end
          object DEVICE11: TPanel
            Left = 1
            Top = 186
            Width = 108
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE11'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 5
          end
          object DEVICE13: TPanel
            Left = 1
            Top = 223
            Width = 108
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE13'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 6
          end
          object DEVICE15: TPanel
            Left = 1
            Top = 260
            Width = 108
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE15'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 7
          end
        end
        object Panel4: TPanel
          Left = 111
          Top = 33
          Width = 113
          Height = 316
          Align = alClient
          TabOrder = 2
          ExplicitHeight = 86
          object DEVICE16: TPanel
            Left = 1
            Top = 260
            Width = 111
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE16'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
          end
          object DEVICE14: TPanel
            Left = 1
            Top = 223
            Width = 111
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE14'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
          end
          object DEVICE12: TPanel
            Left = 1
            Top = 186
            Width = 111
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE12'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
          end
          object DEVICE10: TPanel
            Left = 1
            Top = 149
            Width = 111
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE10'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 3
          end
          object DEVICE02: TPanel
            Left = 1
            Top = 1
            Width = 111
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE02'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 4
          end
          object DEVICE04: TPanel
            Left = 1
            Top = 38
            Width = 111
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE04'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 5
          end
          object DEVICE06: TPanel
            Left = 1
            Top = 75
            Width = 111
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE06'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 6
          end
          object DEVICE08: TPanel
            Left = 1
            Top = 112
            Width = 111
            Height = 37
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            BevelKind = bkSoft
            BevelOuter = bvLowered
            BevelWidth = 5
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'DEVICE08'
            Color = clCream
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 7
          end
        end
      end
      object plUSBInfo: TPanel
        Left = 226
        Top = 1
        Width = 316
        Height = 350
        Align = alClient
        Caption = 'plUSBInfo'
        TabOrder = 1
        ExplicitHeight = 120
        object btnFindDevice: TBitBtn
          Left = 226
          Top = 2
          Width = 75
          Height = 25
          Caption = 'btnFindDevice'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
          Visible = False
          OnClick = btnFindDeviceClick
        end
        object plHUB: TPanel
          Left = 1
          Top = 1
          Width = 314
          Height = 28
          Align = alTop
          Caption = 'HUB'
          Color = clGradientActiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object plUSB: TPanel
          Left = 1
          Top = 177
          Width = 314
          Height = 28
          Align = alTop
          Caption = 'USB'
          Color = clGradientActiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
        end
        object LBoxHUB: TListBox
          Left = 1
          Top = 29
          Width = 314
          Height = 148
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 19
          ParentFont = False
          TabOrder = 3
          OnExit = LBoxHUBExit
        end
        object LBoxUSB: TListBox
          Left = 1
          Top = 205
          Width = 314
          Height = 144
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 19
          ParentFont = False
          TabOrder = 4
          OnExit = LBoxHUBExit
          ExplicitHeight = 3
        end
      end
      object plAutoRemoveUSBDisk: TPanel
        Left = 1
        Top = 351
        Width = 711
        Height = 0
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 121
        object Panel7: TPanel
          Left = 111
          Top = 1
          Width = 182
          Height = 28
          Align = alLeft
          TabOrder = 0
          Visible = False
          object edtAutoRemoveNum: TEdit
            Left = 40
            Top = 1
            Width = 35
            Height = 26
            Align = alLeft
            Alignment = taCenter
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -20
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = '1'
            OnChange = edtNum1Change
            OnExit = edtNum1Exit
            ExplicitHeight = 30
          end
          object edtTimeoutRemove: TEdit
            Left = 140
            Top = 1
            Width = 41
            Height = 26
            Align = alClient
            Alignment = taCenter
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -20
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '5'
            ExplicitHeight = 30
          end
          object Panel8: TPanel
            Left = 75
            Top = 1
            Width = 65
            Height = 26
            Align = alLeft
            Caption = 'Time(s)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object Panel10: TPanel
            Left = 1
            Top = 1
            Width = 39
            Height = 26
            Align = alLeft
            Caption = 'Num'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
        object ckbAutoRemoveTime: TCheckBox
          Left = 1
          Top = 1
          Width = 110
          Height = 28
          Align = alLeft
          Caption = 'Auto Remove '
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = ckbAutoRemoveTimeClick
        end
        object btnRemoveUSBDisk: TButton
          Left = 293
          Top = 1
          Width = 417
          Height = 28
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alClient
          Caption = '[RESET] '#31995#32113#31227#38500' DEVICEXX '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnRemoveUSBDiskClick
        end
      end
      object plMoDisk: TPanel
        Left = 542
        Top = 1
        Width = 170
        Height = 350
        Align = alRight
        Caption = 'plMoDisk'
        TabOrder = 3
        ExplicitHeight = 120
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 168
          Height = 28
          Align = alTop
          Caption = 'USB Drive'
          Color = clGradientActiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
        object LBoxDisk: TListBox
          Left = 1
          Top = 29
          Width = 168
          Height = 320
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 19
          ParentFont = False
          TabOrder = 1
          OnExit = LBoxHUBExit
          ExplicitHeight = 90
        end
      end
      object TouchKeyboard: TTouchKeyboard
        Left = 3000
        Top = 149
        Width = 550
        Height = 185
        GradientEnd = clSilver
        GradientStart = clGray
        Layout = 'Standard'
        Visible = False
      end
    end
    object pl_Memo_Switch: TPanel
      Left = 1
      Top = 353
      Width = 713
      Height = 13
      Align = alBottom
      Caption = '^'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = pl_Memo_SwitchClick
      ExplicitTop = 123
    end
  end
  object TimerMain: TTimer
    OnTimer = TimerMainTimer
    Left = 280
  end
  object PopupMenu1: TPopupMenu
    Left = 672
    Top = 65168
    object N1: TMenuItem
      Caption = #21021#22987'USB'#29872#22659
      OnClick = N1Click
    end
  end
end