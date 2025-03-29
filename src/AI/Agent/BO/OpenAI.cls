Class AI.Agent.BO.OpenAI Extends Ens.BusinessOperation
{

/// Configure API call address
Property URL As %String;

/// Configure the APIKey for calling the address
Property APIKey As %String;

/// Configure the model name for calling
Property Model As %String;

Parameter SETTINGS = "URL:Basic,APIKey:Basic,Model:Basic";

/// Description
Method Call(API, APIKey, Model, Messages) As %String [ Language = python ]
{
from openai import OpenAI

client = OpenAI(api_key=APIKey, base_url=API)

response = client.chat.completions.create(
    model=Model,
    messages=eval(Messages),
    max_tokens=1024,
    temperature=0.7,
    stream=False
)

return response.choices[0].message.content
}

/// Description
Method Send(pInput As AI.Agent.MSG.Request, Output pOutput As AI.Agent.MSG.Response) As %Status
{
    Set sc = $$$OK
    Set pOutput = ##class(AI.Agent.MSG.Response).%New()
    // do something
    Set message = pInput.MessagesMap.GetAt(1)
    
    Set response = ""

    Set response = ..Call(..URL,..APIKey,..Model,message)

    d pOutput.MessagesMap.Insert(response) 

    Return sc
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="AI.Agent.MSG.Request"> 
		<Method>Send</Method>
	</MapItem>

	
</MapItems>
}

}
