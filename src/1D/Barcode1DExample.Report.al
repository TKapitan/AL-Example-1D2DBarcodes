/// <summary>
/// Report TKA 1D Barcode Example (ID 50000).
/// </summary>
report 50000 "TKA Barcode 1D Example"
{
    Caption = 'Barcode 1D Example';
    UsageCategory = Administration;
    RDLCLayout = 'src/1D/Barcode1DExample.Report.rdl';
    ApplicationArea = All;

    dataset
    {
        dataitem("Item Reference"; "Item Reference")
        {
            DataItemTableView = where("Reference Type" = const("Bar Code"));

            column(Item_No_; "Item No.") { }
            column(BarCodeCodabar; BarCodeCodabar) { }
            column(BarCodeCode128; BarCodeCode128) { }
            column(BarCodeCode39; BarCodeCode39) { }
            column(BarCodeCode93; BarCodeCode93) { }
            column(BarCodeEAN13; BarCodeEAN13) { }
            column(BarCodeEAN8; BarCodeEAN8) { }
            column(BarCodeInterleaved2of5; BarCodeInterleaved2of5) { }
            column(BarCodeMSI; BarCodeMSI) { }
            column(BarCodePostnet; BarCodePostnet) { }
            column(BarCodeUPCA; BarCodeUPCA) { }
            column(BarCodeUPCE; BarCodeUPCE) { }

            trigger OnAfterGetRecord()
            var
                BarcodeSymbology: Enum "Barcode Symbology";
                BarcodeFontProvider: Interface "Barcode Font Provider";
            begin
                // Codabar
                BarcodeSymbology := Enum::"Barcode Symbology"::Codabar;
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarCodeCodabar := BarcodeFontProvider.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology);

                // Code 128
                BarcodeSymbology := Enum::"Barcode Symbology"::Code128;
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarCodeCode128 := BarcodeFontProvider.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology);

                // Code 39
                BarcodeSymbology := Enum::"Barcode Symbology"::Code39;
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarCodeCode39 := BarcodeFontProvider.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology);

                // Code 93
                BarcodeSymbology := Enum::"Barcode Symbology"::Code93;
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarCodeCode93 := BarcodeFontProvider.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology);

                // EAN 13
                BarcodeSymbology := Enum::"Barcode Symbology"::"EAN-13";
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarCodeEAN13 := BarcodeFontProvider.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology);

                // EAN 8
                BarcodeSymbology := Enum::"Barcode Symbology"::"EAN-8";
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarCodeEAN8 := BarcodeFontProvider.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology);

                // Interleaved 2 of 5
                BarcodeSymbology := Enum::"Barcode Symbology"::Interleaved2of5;
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarCodeInterleaved2of5 := BarcodeFontProvider.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology);

                // MSI
                BarcodeSymbology := Enum::"Barcode Symbology"::MSI;
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarCodeMSI := BarcodeFontProvider.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology);

                // Postnet
                BarcodeSymbology := Enum::"Barcode Symbology"::Postnet;
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarCodePostnet := BarcodeFontProvider.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology);

                // UPC-A
                BarcodeSymbology := Enum::"Barcode Symbology"::"UPC-A";
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarCodeUPCA := BarcodeFontProvider.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology);

                // UPC-E
                BarcodeSymbology := Enum::"Barcode Symbology"::"UPC-E";
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarCodeUPCE := BarcodeFontProvider.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology);
            end;
        }
    }

    var
        BarCodeCodabar, BarCodeCode128, BarCodeCode39, BarCodeCode93, BarCodeEAN13, BarCodeEAN8, BarCodeInterleaved2of5, BarCodeMSI, BarCodePostnet, BarCodeUPCA, BarCodeUPCE : Text;
}
