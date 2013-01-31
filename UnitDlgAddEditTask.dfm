object DlgAddTask: TDlgAddTask
  Left = 539
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Add Task'
  ClientHeight = 210
  ClientWidth = 313
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 297
    Height = 161
    Shape = bsFrame
  end
  object lblDateDue: TLabel
    Left = 208
    Top = 21
    Width = 46
    Height = 13
    Caption = 'Date Due'
  end
  object OKBtn: TButton
    Left = 79
    Top = 180
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object CancelBtn: TButton
    Left = 159
    Top = 180
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object memo: TNxMemo
    Left = 13
    Top = 124
    Width = 285
    Height = 41
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 13
    Top = 12
    Width = 185
    Height = 109
    Caption = 'Panel1'
    TabOrder = 0
    object NxPageControl2: TNxPageControl
      Left = 1
      Top = 1
      Width = 183
      Height = 107
      ActivePage = NxTabSheet1
      ActivePageIndex = 0
      Align = alClient
      TabOrder = 0
      Margin = 0
      Options = [pgBoldActiveTab, pgTopBorder]
      Spacing = 0
      TabHeight = 17
      TabStyle = tsFlat
      object NxTabSheet1: TNxTabSheet
        Caption = 'Normal'
        PageIndex = 0
        TabFont.Charset = DEFAULT_CHARSET
        TabFont.Color = clWindowText
        TabFont.Height = -11
        TabFont.Name = 'MS Sans Serif'
        TabFont.Style = []
        object Label3: TLabel
          Left = 16
          Top = 16
          Width = 136
          Height = 39
          Caption = 'Please choose a due date or  make it empty to always show'
          WordWrap = True
        end
      end
      object NxTabSheet2: TNxTabSheet
        Caption = 'Recurring'
        PageIndex = 1
        TabFont.Charset = DEFAULT_CHARSET
        TabFont.Color = clWindowText
        TabFont.Height = -11
        TabFont.Name = 'MS Sans Serif'
        TabFont.Style = []
        object NxPageControl1: TNxPageControl
          Left = 0
          Top = 0
          Width = 183
          Height = 73
          ActivePage = tabRecurringMonthly
          ActivePageIndex = 0
          Align = alTop
          TabOrder = 0
          Margin = 0
          Options = [pgBoldActiveTab, pgTopBorder]
          Spacing = 0
          TabHeight = 17
          TabStyle = tsClassic
          object tabRecurringMonthly: TNxTabSheet
            Caption = 'Monthly'
            PageIndex = 0
            TabFont.Charset = DEFAULT_CHARSET
            TabFont.Color = clWindowText
            TabFont.Height = -11
            TabFont.Name = 'MS Sans Serif'
            TabFont.Style = []
            object Label2: TLabel
              Left = 8
              Top = 8
              Width = 19
              Height = 13
              Caption = 'Day'
            end
            object edtMonthlyDay: TNxSpinEdit
              Left = 33
              Top = 4
              Width = 48
              Height = 21
              TabOrder = 0
              Text = '1'
              Max = 31
              Min = 1
              Value = 1
              Increment = 1
            end
          end
          object tabRecurringWeekly: TNxTabSheet
            Caption = 'Weekly'
            PageIndex = 1
            TabFont.Charset = DEFAULT_CHARSET
            TabFont.Color = clWindowText
            TabFont.Height = -11
            TabFont.Name = 'MS Sans Serif'
            TabFont.Style = []
            object Label4: TLabel
              Left = 86
              Top = 28
              Width = 23
              Height = 13
              Caption = 'Time'
            end
            object cbxMonday: TCheckBox
              Left = 0
              Top = 0
              Width = 33
              Height = 17
              Caption = 'Monday'
              TabOrder = 0
            end
            object cbxTuesday: TCheckBox
              Left = 40
              Top = 0
              Width = 32
              Height = 17
              Caption = 'Tuesday'
              TabOrder = 1
            end
            object cbxWednesday: TCheckBox
              Left = 76
              Top = 0
              Width = 36
              Height = 17
              Caption = 'Wednesday'
              TabOrder = 2
            end
            object cbxThursday: TCheckBox
              Left = 115
              Top = 0
              Width = 32
              Height = 17
              Caption = 'Thursday'
              TabOrder = 3
            end
            object cbxFriday: TCheckBox
              Left = 152
              Top = 0
              Width = 28
              Height = 17
              Caption = 'Friday'
              TabOrder = 4
            end
            object cbxSaturday: TCheckBox
              Left = 0
              Top = 16
              Width = 32
              Height = 17
              Caption = 'Saturday'
              TabOrder = 5
            end
            object cbxSunday: TCheckBox
              Left = 40
              Top = 16
              Width = 32
              Height = 17
              Caption = 'Sunday'
              TabOrder = 6
            end
            object NxTimeEdit1: TNxTimeEdit
              Left = 113
              Top = 24
              Width = 64
              Height = 21
              TabOrder = 7
              Text = '6:57:02 AM'
              SpinButtons = False
            end
          end
          object tabRecurringDaily: TNxTabSheet
            Caption = 'Daily'
            PageIndex = 2
            TabFont.Charset = DEFAULT_CHARSET
            TabFont.Color = clWindowText
            TabFont.Height = -11
            TabFont.Name = 'MS Sans Serif'
            TabFont.Style = []
            object Label1: TLabel
              Left = 8
              Top = 8
              Width = 72
              Height = 13
              Caption = 'Recurring Time'
            end
            object edtDailyTime: TNxTimeEdit
              Left = 87
              Top = 3
              Width = 73
              Height = 21
              TabOrder = 0
              Text = '6:57:02 AM'
              SpinButtons = False
            end
          end
        end
      end
    end
  end
  object dtpDateDue: TNxDatePicker
    Left = 206
    Top = 37
    Width = 89
    Height = 21
    TabOrder = 1
    HideFocus = False
    Date = 41278
    EmptyText = 'Never'
    NoneCaption = 'Never'
    TodayCaption = 'Today'
  end
end
