/// Using prompts to make AI answer the results we need
Class AI.Agent.Prompt.Message Extends %RegisteredObject
{

/// Get SQL prompt words
ClassMethod Analysis(message) As %String
{
    Set messages =[]
    Set sys = {
                "role": "system",
                "content": "You are an SQL expert in the healthcare industry."
              }
    Set user = {
                "role": "user",
                "content": ""
                }

    Set content ="As an SQL expert, please generate appropriate SQL statements based on the following requirements："
                _"demand：{"_message_"}"
                _"Please only return SQL statements without any further explanation. If creating a table, please include appropriate field types and necessary constraints."
    d messages.%Push(sys)    
    Set user.content = content
    d messages.%Push(user)    

    Return messages.%ToJSON()
}

}
