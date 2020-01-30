page 60101 "Custom Caption Field Setup"
{
    Caption = 'Custom Caption Field Setup';
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Custom Caption Field Setup";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Table No."; "Table No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Table Number and choose the relevant page you wish to include a field';
                }
                field("Table Caption"; "Table Caption")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Table caption';
                }
                field("Field No."; "Field No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies field Number to select the relevant fields on that page';
                }
                field("Field Name"; "Field Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Field Name';
                }
                field("Language ID"; "Language ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Language ID of the custom fields, i.e. Language ID 3081 "English (Australia)" thus the field is mandatory';
                }
                field("Language Name"; "Language Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies selected Language for the fields';
                }
                field("Application Caption"; "Application Caption")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Application Caption';
                }
            }
        }
    }

}

