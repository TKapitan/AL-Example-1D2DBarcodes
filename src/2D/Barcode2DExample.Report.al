/// <summary>
/// Report TKA 2D Barcode Example (ID 50001).
/// </summary>
report 50001 "TKA Barcode 2D Example"
{
    Caption = 'Barcode 2D Example';
    UsageCategory = Administration;
    RDLCLayout = 'src/2D/Barcode2DExample.Report.rdl';
    ApplicationArea = All;

    dataset
    {
        dataitem("Item Reference"; "Item Reference")
        {
            DataItemTableView = where("Reference Type" = const("Bar Code"));

            column(Item_No_; "Item No.") { }
            column(BarCodeAztec; BarCodeAztec) { }
            column(BarCodeDataMatrix; BarCodeDataMatrix) { }
            column(BarCodeMaxiCode; BarCodeMaxiCode) { }
            column(BarCodePDF417; BarCodePDF417) { }
            column(BarCodeQRCOde; BarCodeQRCOde) { }

            trigger OnAfterGetRecord()
            var
                BarcodeSymbology2D: Enum "Barcode Symbology 2D";
                BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
            begin
                // Aztec
                BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::Aztec;
                BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                BarCodeAztec := BarcodeFontProvider2D.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology2D);

                // Data Matrix
                BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::"Data Matrix";
                BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                BarCodeDataMatrix := BarcodeFontProvider2D.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology2D);

                // Maxi Code
                BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::"Maxi Code";
                BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                BarCodeMaxiCode := BarcodeFontProvider2D.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology2D);

                // PDF 417
                BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::PDF417;
                BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                BarCodePDF417 := BarcodeFontProvider2D.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology2D);

                // QR Code
                BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::"QR-Code";
                BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                BarCodeQRCOde := BarcodeFontProvider2D.EncodeFont("Item Reference"."Reference No.", BarcodeSymbology2D);

            end;
        }
    }

    var
        BarCodeAztec, BarCodeDataMatrix, BarCodeMaxiCode, BarCodePDF417, BarCodeQRCOde : Text;
}
