Class AI.Agent.BS.DemoBS Extends (%CSP.REST, Ens.BusinessService)
{

Parameter SETTINGS = "TargetConfigNames:Basic:selector?multiSelect=0&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

Property TargetConfigNames As Ens.DataType.ConfigName;

XData UrlMap
{
<Routes>
    <Route Url="/models/:modelname" Method="POST" Call="Search"/>
  </Routes>
}

ClassMethod Search(Method As %String) As %Status
{
#;	kill ^Log
	Do %response.SetHeader("Content-Type", "application/json;charset=UTF-8")
	Set out = ##class(AI.Agent.MSG.Response).%New()
	Set prompt = ##class(AI.Agent.Prompt.Message).%New()
	Try{
		Set content=""
		Set:$L(%request.Content)'=0 content=$zcvt(%request.Content.Read(),"I","UTF8")
		// Example: Using different methods to call different prompt words
		if Method = "Analysis" Set content =prompt.Analysis(content)
		
		Set ^Log($ZDT($NOW(),3,,6))="Calling the Search interface :"_content

		do ##class(Ens.Director).CreateBusinessService($CLASSNAME($THIS), .service)		
		Set Request = ##class(AI.Agent.MSG.Request).%New()
		Set Request.Method = Method
		d Request.MessagesMap.Insert(content)		
		Set tSC = service.OnProcessInput(Request,.out)
	   	set message=out.MessagesMap.GetAt(1)
	   	
	}Catch(e){
		Set ^Log($ZDT($NOW(),3,,6))="ERROR :"_e.DisplayString()
		Set message="{""code"":500,""data"":"""",""success"":0,""msg"":""Server Internal Error""}"
	}
    w $zcvt(message,"O","UTF8")
    Quit $$$OK
}

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
	Set ^Log($ZDT($NOW(),3,,6))=" OnProcessInput "

	#; Set Request = ##class(AI.Agent.MSG.Request).%New()
	#; d Request.MessagesMap.Insert(pInput)
	Quit ..SendRequestSync(..TargetConfigNames, pInput, .pOutput)
}

}
