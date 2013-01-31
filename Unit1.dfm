object Form1: TForm1
  Left = 208
  Top = 247
  Width = 546
  Height = 312
  Caption = 'Caldo - Calendar Task List'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object nxg: TNextGrid
    Left = 0
    Top = 27
    Width = 345
    Height = 158
    Align = alClient
    Caption = 'Tasks'
    Options = [goHeader, goSecondClickEdit, goSelectFullRow]
    TabOrder = 0
    TabStop = True
    OnAfterEdit = nxgAfterEdit
    OnSelectCell = nxgSelectCell
    object nxcCompleted: TNxCheckBoxColumn
      DefaultWidth = 15
      Options = [coCanClick, coCanInput, coCanSort, coFixedSize, coPublicUsing]
      Position = 0
      SortType = stBoolean
      Width = 15
    end
    object nxcMemo: TNxHtmlColumn
      DefaultWidth = 116
      Header.Caption = 'Memo'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
      Position = 1
      SortType = stAlphabetic
      Width = 116
    end
    object nxcDateDue: TNxHtmlColumn
      DefaultValue = '12/15/2012'
      Header.Caption = 'Date Due'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
      Position = 2
      SortType = stAlphabetic
    end
    object nxcTime: TNxHtmlColumn
      Header.Caption = 'Time'
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
      Position = 3
      SortType = stAlphabetic
    end
  end
  object memo: TMemo
    Left = 0
    Top = 185
    Width = 530
    Height = 89
    Align = alBottom
    TabOrder = 1
  end
  object nxtoolbar: TNxToolbar
    Left = 0
    Top = 0
    Width = 530
    Height = 27
    Align = alTop
    Images = ImageList1
    TabOrder = 2
    object btnAddTask: TNxToolButton
      Caption = 'Add Task'
      OnClick = btnAddTaskClick
      ImageIndex = 0
    end
    object btnDeleteTask: TNxToolButton
      Caption = 'Delete Task'
      Visible = False
      OnClick = btnDeleteTaskClick
      ImageIndex = 1
    end
  end
  object Panel1: TPanel
    Left = 345
    Top = 27
    Width = 185
    Height = 158
    Align = alRight
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 3
    object cal: TMonthCalendar
      Left = -3
      Top = 2
      Width = 191
      Height = 154
      Date = 41250.8983828704
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = calClick
    end
  end
  object ImageList1: TImageList
    Left = 128
    Top = 80
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000504942004942
      3C00463F3A00463F3A00463F3A00463F3A00463F3A0039332F00020101000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000079706800BCBBB900CCCC
      CC00D0D0D000D7D7D700DDDDDD00E4E4E400E9E9E900C3C2C100A8A3A0004A45
      4300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000096908A00CBCBCB00CCCC
      CC00D3D3D300DCDCDC00E6E6E600F0F0F000F6F6F600D4D4D400CAC7C500D5D4
      D4006A6663000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001B3180001B3180001B3180001B31800000000000000
      000000000000000000000000000000000000000000009C969100CCCCCC00CCCC
      CC00D2D2D200DCDCDC00E6E6E600EFEFEF00F6F6F600DCDCDC00CDCAC900F7F7
      F700D2D2D2005F5B580000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001B3180000D21E0000D21E0001B31800000000000000
      00000000000000000000000000000000000000000000A09A9500CCCCCC00CCCC
      CC00C9C8CE00ADACB700DDDDDD00EDEDED00F6F6F600D0CFDE00AEAAAA00FCFC
      FC00F5F5F500CBCACA003A373400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001B3180000D93B0000D93B0001B31800000000000000
      00000000000000000000000000000000000000000000A49E9900CCCCCC00BFBE
      C9004338C700493FD4008C8AA300E3E3E300ACA9D7005148DF00544BBF00BFBC
      BE00D4D0CE00C9C6C30088827D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000001B3
      180001B3180001B3180001B3180000DF590000DF590001B3180001B3180001B3
      180001B3180000000000000000000000000000000000A6A09B00C1C0CB005246
      C700392BD3004037DD006E67DF00817CB8006D67E8004941E6004137DA005348
      B900D9D8DA00F6F6F600C2BFBC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000001B3
      180000E6760000E6760000E6760000E6760000E6760000E6760000E6760000E6
      760001B3180000000000000000000000000000000000A9A39E00BFBBE3006B60
      D900594ED8004135D8004137DE00514AE400453CE2004036DD00382CD5003424
      C600CCCBD800EFEFEF00C2C0BE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000001B3
      180000EC940000EC940000EC940000EC940000EC940000EC940000EC940000EC
      940001B3180000000000000000000000000000000000ADA7A200FAFAFA00A199
      DD00766BDB006257DA00453AD6003A2ED600392ED6003629D2004132C900A19C
      C800E7E7E700E6E6E600BFBCBA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000001B3
      180001B3180001B3180001B3180000F2B20000F2B20001B3180001B3180001B3
      180001B3180000000000000000000000000000000000ADA7A200FBFBFB00FAFA
      FA008579CC007A71E000695FDC004B3FD5003325CF00382ACF007269A500E0E0
      E000DFDFDF00DCDCDC00BCB9B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001B3180000F9CF0000F9CF0001B31800000000000000
      00000000000000000000000000000000000000000000AEA8A300FDFDFD00B2AC
      D2009C94E000938CE6008179E1007167DD004437D3003325CF00402FBA008B87
      9D00D7D7D700D5D5D500B8B5B300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001B3180000FFEC0000FFEC0001B31800000000000000
      00000000000000000000000000000000000000000000AEA8A300D8D4ED00C8C3
      EE00BDB8EF00ABA5EB009A93E7008980E3007269DE00382AD0003325CF005A4C
      C300B2B1B900D8D8D800B9B6B400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001B3180001B3180001B3180001B31800000000000000
      00000000000000000000000000000000000000000000AFA9A400E7E3F300D7D3
      F200D5D2F500C4C0F100BCB7EC00A69FD6009F99E600675DDB00392BD0007F73
      CA00DCDBE000E0E0E000BCB9B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AAA39E00FAFAFA00E5E1
      F300E1DEF600DDDBF600BEB7D800FAFAFA00BCB5E000B1ACEC00A49CDC00E2E1
      E900EBEBEB00E6E6E600B8B5B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080766E00E2E1E000F2F2
      F200DCD8E800D5D0E600F1F1F100F0F0F000EFEFEF00C7C2DF00DEDDE600E9E9
      E900E5E5E500D8D7D70087807900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000746960007469
      6000746960007469600074696000746960007469600074696000746960007469
      6000746960007469600074696000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFC00F00000000FFFF800700000000
      FFFF800300000000FC3F800100000000FC3F800000000000FC3F800000000000
      E007800000000000E007800000000000E007800000000000E007800000000000
      FC3F800000000000FC3F800000000000FC3F800000000000FFFF800000000000
      FFFF800000000000FFFFC0010000000000000000000000000000000000000000
      000000000000}
  end
  object tray: TTextTrayIcon
    CycleInterval = 0
    Icon.Data = {
      0000010001001010040000000000280100001600000028000000100000002000
      0000010004000000000080000000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF000FFFFFFFFFFFF0FFF0FFFFFFFFFFF0FFF0FFFFFFFFFFF0FFF0FFFFFFFFFF
      F0FFF0FFFFFFFFFFF0FFF0FFFFFFFFFFF0FFF0FFFFFFFFFFF0FFF0FFFFFFFFFF
      FF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000}
    IconVisible = True
    IconIndex = 0
    MinimizeToTray = True
    OnDblClick = trayDblClick
    Text = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Border = False
    Options.OffsetX = 0
    Options.OffsetY = 0
    Options.LineDistance = 0
    Left = 176
    Top = 96
  end
end
