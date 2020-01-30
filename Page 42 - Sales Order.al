pageextension 60100 pageextension16034409 extends "Sales Order"
{
    layout
    {

    }

    actions
    {
        addafter(Comment)
        {
            action(Custominformation)
            {
                ApplicationArea = All;
                Caption = 'Custom Information';
                Image = DataEntry;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    CustomInformation: Page "Custom Information";
                begin
                    CustomInformation.RunModal();
                end;
            }
        }
    }
}

