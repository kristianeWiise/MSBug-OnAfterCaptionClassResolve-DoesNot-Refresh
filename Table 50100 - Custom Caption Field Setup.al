table 60100 "Custom Caption Field Setup"
{
    Caption = 'Custom Caption Field Setup';

    fields
    {
        field(1; "Table No."; Integer)
        {
            Caption = 'Table No.';
            DataClassification = SystemMetadata;
            TableRelation = AllObj."Object ID" Where("Object Type" = Const(Table),
                                                      "Object ID" = Filter(36));

            trigger OnLookup()
            var
                AllObj: Record AllObj;
                StandardTables: Page "All Objects";
            begin
                AllObj.Reset();
                AllObj.SetRange("Object Type", AllObj."Object Type"::Table);
                AllObj.SetFilter("Object ID", '%1', 36);
                StandardTables.SetTableView(AllObj);
                StandardTables.LookupMode(true);
                if StandardTables.RunModal() = Action::LookupOK then begin
                    StandardTables.GetRecord(AllObj);
                    "Table No." := AllObj."Object Id";
                end;

            end;

            trigger OnValidate()
            begin
                CalcFields("Table Caption");
            end;
        }
        field(2; "Field No."; Integer)
        {
            Caption = 'Field No.';
            DataClassification = SystemMetadata;
            TableRelation = IF ("Table No." = filter(36))
            Field."No." Where(TableNo = Field("Table No."), "No." = Filter(60100));

            trigger OnLookup()
            var
                "Field": Record "Field";
                TableFieldList: Page "Fields Lookup";
            begin
                Field.SetRange(TableNo, "Table No.");
                Field.SetFilter("No.", '60100');
                TableFieldList.SetTableView(Field);
                TableFieldList.LookupMode(true);
                if TableFieldList.RunModal() = Action::LookupOK then begin
                    TableFieldList.GetRecord(Field);
                    "Field No." := Field."No.";
                end;
                CalcFields("Field Name");
            end;

            trigger OnValidate()
            begin
                CalcFields("Field Name");
            end;
        }
        field(3; "Language ID"; Integer)
        {
            Caption = 'Language ID';
            DataClassification = CustomerContent;
            TableRelation = "Windows Language"."Language ID";

            trigger OnValidate()
            begin
                CalcFields("Language Name");
            end;
        }
        field(4; "Application Caption"; Text[80])
        {
            Caption = 'Caption';
            DataClassification = CustomerContent;
        }
        field(5; "Table Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" Where("Object Type" = Const(Table),
                                                                           "Object ID" = Field("Table No.")));
            Caption = 'Table Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Field Name"; Text[250])
        {
            CalcFormula = Lookup (Field."Field Caption" Where(TableNo = Field("Table No."),
                                                              "No." = Field("Field No.")));
            Caption = 'Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Language Name"; Text[250])
        {
            CalcFormula = Lookup ("Windows Language".Name Where("Language ID" = Field("Language ID")));
            Caption = 'Language Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Table No.", "Field No.", "Language ID")
        {
        }
    }

    fieldgroups
    {
        //fieldgroup(Dropdown;"")
    }

    procedure GetCaption(TableNo: Integer; FieldNo: Integer): Text[250]
    var
        UDFCaption: Record "Custom Caption Field Setup";
        "Field": Record "Field";
    begin
        if UDFCaption.Get(TableNo, FieldNo, GLOBALLanguage()) then
            exit(UDFCaption."Application Caption");
        if UDFCaption.Get(TableNo, FieldNo, 1033) then
            exit(UDFCaption."Application Caption");
        if Field.Get(TableNo, FieldNo) then
            exit(Field.FieldName);
    end;
}

