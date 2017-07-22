enableSaving [FALSE,FALSE];

//ADD THIS TO YOUR MISSION'S INIT FILE
waitUntil {time > 0};

execVM "statSave\saveFuncs.sqf";
waitUntil {!isNil "saveFuncsLoaded"};

if(isServer) then
{
	_serverHasID = profileNameSpace getVariable ["ss_ServerID",nil];
	if(isNil "_serverHasID") then
	{
		_serverID = str(round((random(100000)) + random 10000));
		profileNameSpace setVariable ["SS_ServerID",_serverID];
	};
	serverID = profileNameSpace getVariable "ss_ServerID";
	publicVariable "serverID";
};

waitUntil {!isNil "serverID"};


if(!isDedicated) then
{
	execVM "statSave\loadAccount.sqf";
	execVM "statSave\saveLoop.sqf";
};
//========================================================================