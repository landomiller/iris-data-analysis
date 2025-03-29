Class AI.Agent.BO.Embedding Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

/// Retrieve and parse messages
Method GetMessage(pInput As AI.Agent.MSG.Request, Output pOutput As AI.Agent.MSG.Response) As %Status
{
    Set sc = $$$OK
    Set pOutput = ##class(AI.Agent.MSG.Response).%New()
    Set statement = ##class(%SQL.Statement).%New(1)
    // do something
    Set request = pInput.MessagesMap.GetAt(1)
	#Dim json As %DynamicObject =##class(%DynamicObject).%FromJSON(request)
    Set userObj =json.%Get(1)
    // 
    Set message = $PIECE($PIECE(userObj.content,"{",*),"}",1)
    Set vector =..Embedding(message)
 
    Set sql = " insert into  AI_Agent_MSG.MessageVector (Message, MessagesVector) values (?,TO_VECTOR(?,double))"
    Set qStatus = statement.%Prepare(sql)
    set tResult = statement.%Execute(message,vector)

    d pOutput.MessagesMap.Insert(vector) 

    Return sc
}

/// Text vectorization
Method Embedding(Content) [ Language = python ]
{

from transformers import AutoTokenizer, AutoModel
import torch
import torch.nn.functional as F

#Mean Pooling - Take attention mask into account for correct averaging
def mean_pooling(model_output, attention_mask):
    token_embeddings = model_output[0] #First element of model_output contains all token embeddings
    input_mask_expanded = attention_mask.unsqueeze(-1).expand(token_embeddings.size()).float()
    return torch.sum(token_embeddings * input_mask_expanded, 1) / torch.clamp(input_mask_expanded.sum(1), min=1e-9)

sentences = [Content]
# Load model from local
tokenizer = AutoTokenizer.from_pretrained('/home/irisowner/dev/MiniLM')
model = AutoModel.from_pretrained('/home/irisowner/dev/MiniLM')

encoded_input = tokenizer(sentences, padding=True, truncation=True, return_tensors='pt')

with torch.no_grad():
    model_output = model(**encoded_input)

sentence_embeddings = mean_pooling(model_output, encoded_input['attention_mask'])
sentence_embeddings = F.normalize(sentence_embeddings, p=2, dim=1)

return str(sentence_embeddings[0].tolist())
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="AI.Agent.MSG.Request"> 
		<Method>GetMessage</Method>
	</MapItem>
</MapItems>
}

}
