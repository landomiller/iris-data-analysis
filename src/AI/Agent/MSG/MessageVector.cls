Class AI.Agent.MSG.MessageVector Extends %Persistent
{

Property Message As %String(MAXLEN = "");

Property MessagesVector As %Library.Vector(DATATYPE = "double", LEN = 384);

Storage Default
{
<Data name="MessageVectorDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Message</Value>
</Value>
<Value name="3">
<Value>MessagesVector</Value>
</Value>
</Data>
<DataLocation>^AI.Agent.MSG.MessageVectorD</DataLocation>
<DefaultData>MessageVectorDefaultData</DefaultData>
<ExtentSize>2</ExtentSize>
<IdLocation>^AI.Agent.MSG.MessageVectorD</IdLocation>
<IndexLocation>^AI.Agent.MSG.MessageVectorI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Message">
<AverageFieldSize>81</AverageFieldSize>
<OutlierSelectivity>.999999:"What are the users whose gender Sex is Male in the `AI_Agent_DB.UserInfo` table"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="MessagesVector">
<AverageFieldSize>8516</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-20</BlockCount>
</SQLMap>
<StreamLocation>^AI.Agent.MSG.MessageVectorS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
