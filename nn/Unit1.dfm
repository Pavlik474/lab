object Form1: TForm1
  Left = 192
  Top = 117
  Width = 870
  Height = 500
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FileListBox1: TFileListBox
    Left = 216
    Top = 96
    Width = 145
    Height = 97
    ItemHeight = 13
    TabOrder = 0
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 568
    Top = 144
    Width = 145
    Height = 97
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 1
  end
  object DriveComboBox1: TDriveComboBox
    Left = 280
    Top = 320
    Width = 145
    Height = 19
    DirList = DirectoryListBox1
    TabOrder = 2
  end
  object FilterComboBox1: TFilterComboBox
    Left = 592
    Top = 328
    Width = 145
    Height = 21
    FileList = FileListBox1
    Filter = 'All files (*.*)|*.*|exe|*.exe|txt|*.txt|delphy|delphy.*'
    TabOrder = 3
  end
end
