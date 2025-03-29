Class AI.Agent.BO.ExecuteSQL Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

/// Description
Method Execute(pInput As AI.Agent.MSG.Request, Output pOutput As AI.Agent.MSG.Response) As %Status
{
    Set sc = $$$OK
    Set pOutput = ##class(AI.Agent.MSG.Response).%New()
    // do something
    Set sql = $REPLACE(pInput.MessagesMap.GetAt(1),"`","")
    Set sql = $REPLACE(sql,"sql","")
    $$$LOGINFO(sql)
    Set tResult = ##class(%SQL.Statement).%ExecDirect(,sql)
    Set arr =[]
    s tMetadata = tResult.%GetMetadata()
    Set tCols = ""
    For i=1:1:tMetadata.columnCount {
        Set tCols = tCols_$ListBuild(tMetadata.columns.GetAt(i).colName)
    }
    $$$LOGINFO(tCols)
	While tResult.%Next(){
      Set object ={}
      FOR i=1:1:$LISTLENGTH(tCols) {
        SET column = $LIST(tCols, i)
        Set Value = tResult.%Get(column)
      $$$LOGINFO("VALUE:"_column_"  "_Value)
        Do object.%Set(column,Value)
      }
      $$$LOGINFO("object:"_object.%ToJSON())
      Do arr.%Push(object)

	}
    Set result =arr.%ToJSON()
      $$$LOGINFO("arr:"_result)
    d pOutput.MessagesMap.Insert(result) 

    Return sc
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="AI.Agent.MSG.Request"> 
		<Method>Execute</Method>
	</MapItem>
</MapItems>
}

}
