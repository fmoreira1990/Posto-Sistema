inherited VendaRelatorio: TVendaRelatorio
  Caption = 'Relat'#243'rio de Venda'
  ClientHeight = 649
  ClientWidth = 820
  ExplicitWidth = 836
  ExplicitHeight = 688
  PixelsPerInch = 96
  TextHeight = 13
  object Report_Venda_Detalhe_Ord_Data_Hora: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    Borders.Sides = sdAll
    DataSource = dsVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PreviewOptions.ShowModal = True
    Title = 'Relat'#243'rio de Vendas'
    object RLBand1: TRLBand
      Left = 39
      Top = 39
      Width = 716
      Height = 19
      BandType = btHeader
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 0
        Top = 0
        Width = 82
        Height = 16
        Align = faLeftTop
        Caption = 'Posto Fortes'
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 338
        Top = 0
        Width = 40
        Height = 16
        Align = faCenterTop
        Info = itTitle
        Text = ''
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 588
        Top = 0
        Width = 128
        Height = 16
        Align = faRightTop
        Info = itPageNumber
        Text = 'P'#225'g.:'
        Transparent = False
      end
    end
    object RLBand4: TRLBand
      Left = 39
      Top = 241
      Width = 716
      Height = 16
      BandType = btFooter
      object RLSystemInfo3: TRLSystemInfo
        Left = 646
        Top = 0
        Width = 70
        Height = 16
        Align = faRightTop
        Info = itHour
        Text = 'Hora:'
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 576
        Top = 0
        Width = 70
        Height = 16
        Align = faRightTop
        Text = 'Data:'
      end
    end
    object RLGroup1: TRLGroup
      Left = 39
      Top = 81
      Width = 716
      Height = 123
      DataFields = 'DATA'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 716
        Height = 25
        object RLDBText1: TRLDBText
          Left = 249
          Top = 3
          Width = 87
          Height = 16
          DataField = 'NRO_BOMBA'
          DataSource = dsVendas
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 339
          Top = 3
          Width = 92
          Height = 16
          DataField = 'NRO_TANQUE'
          DataSource = dsVendas
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 3
          Top = 3
          Width = 38
          Height = 16
          DataField = 'DATA'
          DataSource = dsVendas
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 458
          Top = 3
          Width = 39
          Height = 16
          DataField = 'QTDE'
          DataSource = dsVendas
          DisplayMask = '#,###,##0.00'
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 539
          Top = 4
          Width = 74
          Height = 16
          DataField = 'VR_VENDA'
          DataSource = dsVendas
          DisplayMask = '#,###,##0.00'
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 646
          Top = 3
          Width = 69
          Height = 16
          DataField = 'VR_TOTAL'
          DataSource = dsVendas
          DisplayMask = '#,###,##0.00'
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 113
          Top = 4
          Width = 92
          Height = 16
          DataField = 'DS_PRODUTO'
          DataSource = dsVendas
          Text = ''
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 25
        Width = 716
        Height = 21
        BandType = btColumnFooter
        Borders.Sides = sdAll
        Color = clWhite
        ParentColor = False
        Transparent = False
        object RLDBResult4: TRLDBResult
          Left = 163
          Top = 2
          Width = 78
          Height = 16
          DataField = 'DATA'
          DataSource = dsVendas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riFirst
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLLabel10: TRLLabel
          Left = 3
          Top = 2
          Width = 154
          Height = 16
          Caption = 'Total da Venda do Dia: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBResult5: TRLDBResult
          Left = 646
          Top = 2
          Width = 113
          Height = 16
          Color = clWhite
          DataField = 'VR_TOTAL'
          DataSource = dsVendas
          DisplayMask = '#,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentColor = False
          ParentFont = False
          Text = ''
          Transparent = False
        end
      end
    end
    object RLBand2: TRLBand
      Left = 39
      Top = 58
      Width = 716
      Height = 23
      BandType = btHeader
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      object RLLabel2: TRLLabel
        Left = 339
        Top = 0
        Width = 82
        Height = 20
        Align = faTopOnly
        Caption = 'Nro. Tanque'
      end
      object RLLabel3: TRLLabel
        Left = 3
        Top = 0
        Width = 33
        Height = 20
        Align = faTopOnly
        Caption = 'Data'
      end
      object RLLabel4: TRLLabel
        Left = 648
        Top = 0
        Width = 58
        Height = 20
        Align = faTopOnly
        Caption = 'Vr. Total'
      end
      object RLLabel5: TRLLabel
        Left = 539
        Top = 0
        Width = 67
        Height = 20
        Align = faTopOnly
        Caption = 'Vr. Venda'
      end
      object RLLabel6: TRLLabel
        Left = 249
        Top = 0
        Width = 79
        Height = 20
        Align = faTopOnly
        Caption = 'Nro. Bomba'
      end
      object RLLabel7: TRLLabel
        Left = 113
        Top = 0
        Width = 54
        Height = 20
        Align = faTopOnly
        Caption = 'Produto'
      end
      object RLLabel8: TRLLabel
        Left = 458
        Top = 0
        Width = 34
        Height = 20
        Align = faTopOnly
        Caption = 'Qtde'
      end
    end
    object RLBand7: TRLBand
      Left = 39
      Top = 204
      Width = 716
      Height = 16
      BandType = btColumnFooter
    end
    object RLBand5: TRLBand
      Left = 39
      Top = 220
      Width = 716
      Height = 21
      BandType = btSummary
      Borders.Sides = sdAll
      Color = clWhite
      ParentColor = False
      Transparent = False
      object RLDBResult1: TRLDBResult
        Left = 458
        Top = 3
        Width = 80
        Height = 16
        DataField = 'QTDE'
        DataSource = dsVendas
        DisplayMask = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLDBResult2: TRLDBResult
        Left = 539
        Top = 3
        Width = 114
        Height = 16
        DataField = 'VR_VENDA'
        DataSource = dsVendas
        DisplayMask = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLDBResult3: TRLDBResult
        Left = 646
        Top = 3
        Width = 113
        Height = 16
        Color = clWhite
        DataField = 'VR_TOTAL'
        DataSource = dsVendas
        DisplayMask = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentColor = False
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLLabel9: TRLLabel
        Left = 3
        Top = 3
        Width = 79
        Height = 16
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
  end
  object dsVendas: TDataSource
    DataSet = VendaDAO.memLista
    Left = 616
    Top = 448
  end
end
