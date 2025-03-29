Class AI.Agent.MSG.Request Extends Ens.Request
{

Parameter XMLNAME = "REQUEST";

Property Method As %String;

Property MessagesMap As list Of %String(MAXLEN = "", XMLNAME = "MessagesMap", XMLPROJECTION = "element");

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Method</Value>
</Value>
<Value name="2">
<Value>MessagesMap</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
