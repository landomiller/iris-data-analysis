Class AI.Agent.MSG.Response Extends Ens.Response
{

Parameter XMLNAME = "RESPONSE";

Property MessagesMap As list Of %String(MAXLEN = "", XMLNAME = "MessagesMap", XMLPROJECTION = "element");

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>MessagesMap</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
