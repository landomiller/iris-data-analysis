Class AI.Agent.Util.Deployment Extends %RegisteredObject
{

/// Description
ClassMethod Start() As %Status
{
    Set sc = $$$OK
    // do something
    Set NameSpace = $NAMESPACE
    d ..TestData()
	zn "%sys"
    Set sc("AutheEnabled")=64,sc("MatchRoles")=":%All",sc("NameSpace")=NameSpace,sc("DispatchClass")="AI.Agent.BS.DemoBS"
	Set tSC=##Class(Security.Applications).Create("/Ai/Agent",.sc)
    zn NameSpace
    Return sc
}

/// Description
ClassMethod TestData() As %Status
{
    Set sc = $$$OK
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('john.doe@gmail.com', 'John Doe', '+1-555-0101', 'Male', 'USR_001'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('emily.wang@gmail.com', 'Emily Wang', '+1-212-555-0123', 'Female', 'USR_002'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('alex.smith@gmail.com', 'Alex Smith', '+1-415-555-0198', 'Male', 'USR_003'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('maria.garcia@gmail.com', 'Maria García', '+1-305-555-0176', 'Female', 'USR_004'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('james.wilson@gmail.com', 'James Wilson', '+1-650-555-0155', 'Male', 'USR_005'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('sophia.martinez@gmail.com', 'Sophia Martinez', '+1-718-555-0167', 'Female', 'USR_006'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('michael.brown@gmail.com', 'Michael Brown', '+1-312-555-0144', 'Male', 'USR_007'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('emma.jones@gmail.com', 'Emma Jones', '+1-404-555-0133', 'Female', 'USR_008'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('william.taylor@gmail.com', 'William Taylor', '+1-617-555-0182', 'Male', 'USR_009'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('olivia.anderson@gmail.com', 'Olivia Anderson', '+1-503-555-0129', 'Female', 'USR_010'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('ethan.thomas@gmail.com', 'Ethan Thomas', '+1-713-555-0191', 'Male', 'USR_011'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('ava.jackson@gmail.com', 'Ava Jackson', '+1-619-555-0145', 'Female', 'USR_012'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('noah.white@gmail.com', 'Noah White', '+1-602-555-0166', 'Male', 'USR_013'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('isabella.harris@gmail.com', 'Isabella Harris', '+1-702-555-0177', 'Female', 'USR_014'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('liam.martin@gmail.com', 'Liam Martin', '+1-408-555-0188', 'Male', 'USR_015'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('sophie.clark@gmail.com', 'Sophie Clark', '+1-503-555-0199', 'Female', 'USR_016'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('logan.rodriguez@gmail.com', 'Logan Rodriguez', '+1-213-555-0155', 'Male', 'USR_017'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('mia.lewis@gmail.com', 'Mia Lewis', '+1-415-555-0122', 'Female', 'USR_018'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('lucas.lee@gmail.com', 'Lucas Lee', '+1-206-555-0133', 'Male', 'USR_019'))
    &SQL(INSERT INTO AI_Agent_DB.UserInfo (Email, Name, Phone, Sex, USERID) VALUES ('charlotte.young@gmail.com', 'Charlotte Young', '+1-305-555-0144', 'Female', 'USR_020'))
    Return sc
}

}
