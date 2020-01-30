codeunit 60100 "CaptionClass Subscriber"
{

    [EventSubscriber(ObjectType::Codeunit, 42, 'OnAfterCaptionClassResolve', '', false, false)]
    local procedure OnAfterCaptionClassTranslate(Language: Integer; CaptionExpression: Text; var Caption: Text[1024])
    var
        CustomCaptionFldSetup: Record "Custom Caption Field Setup";
        FieldNo: Integer;
        TableNo: Integer;
        Comma: Integer;
        FieldCaption: Text;
        CapExprList: List of [Text];
    begin
        If STRPOS(CaptionExpression, 'Custom') <> 0 then begin
            CapExprList := CaptionExpression.Split(',');
            IF CustomCaptionFldSetup.Get(CapExprList.Get(2), CapExprList.Get((3)), Language) then begin
                FieldCaption := CustomCaptionFldSetup."Application Caption";
                Message('Custom Caption Found : \Caption : %1\Table : %2\ Field : %3', FieldCaption, CapExprList.Get(2), CapExprList.Get(3));
                Caption := FORMAT(FieldCaption);
            end;
        end;
    end;
}