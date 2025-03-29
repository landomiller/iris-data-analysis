Class AI.Agent.DB.UserInfo Extends %Persistent
{

Property USERID As %String;

Property Name As %String;

Property Sex As %String;

Property Phone As %String;

Property Email As %String;

Storage Default
{
<Data name="UserInfoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>USERID</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
<Value name="4">
<Value>Sex</Value>
</Value>
<Value name="5">
<Value>Phone</Value>
</Value>
<Value name="6">
<Value>Email</Value>
</Value>
</Data>
<DataLocation>^AI.Agent.DB.UserInfoD</DataLocation>
<DefaultData>UserInfoDefaultData</DefaultData>
<ExtentSize>10</ExtentSize>
<IdLocation>^AI.Agent.DB.UserInfoD</IdLocation>
<IndexLocation>^AI.Agent.DB.UserInfoI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Email">
<AverageFieldSize>22.2</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>11.5</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="Phone">
<AverageFieldSize>14</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="Sex">
<AverageFieldSize>7</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="USERID">
<AverageFieldSize>10</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^AI.Agent.DB.UserInfoS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
