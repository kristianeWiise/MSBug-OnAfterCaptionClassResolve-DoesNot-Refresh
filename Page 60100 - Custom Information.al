page 60100 "Custom Information"
{
    Caption = 'Custom Information';
    PageType = Card;
    SourceTable = "Sales Header";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            field("Custom Field 1"; "Custom Field 1")
            {
                ApplicationArea = All;
                CaptionClass = StrSubstNo('Custom,%1,%2,%3', 36, 60100);
            }
        }
    }

}