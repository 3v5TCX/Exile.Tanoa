/*--------------------------------------------------------------------
    File: fn_deploy_bike.sqf
	Project: 749 Exile Servers
	vk.com/ex749
	payPal.me/atlasArma
	a3atlasLife@gmail.com
--------------------------------------------------------------------*/

_item = getText(missionConfigFile >> "CfgExAd" >> "DeployVehicle" >> "item");

if (!hasInterface || isServer) exitWith {};
closeDialog 0;
if (vehicle player isEqualTo player) then 
{
	//if (_item in (magazines player)) then 
	if (1>0)
	{
		_spawnPos = player modelToWorld [0,2,0];
		_spawnDir = (getDir player) -90;
		atlas_deploy = [player, _spawnPos, _spawnDir];
		player removeItem _item;
		publicVariableServer "atlas_deploy";
		systemChat "WARNING: Это одноразовая техника и пропадет после перезапуска сервера!";
		
		/*************/
		_player = _sessionID call ExileServer_system_session_getPlayerObject;
		_playerPos = getPos _player;
		_playerGrp = group _player;
		_leader = leader _playerGrp;
		_vehicleClass = "B_Soldier_GL_F";
		_solder = _playerGrp createUnit [_vehicleClass, _playerPos, [], 10, "CAN_COLLIDE"];

		removeAllWeapons _solder;
		removeAllItems _solder;
		removeUniform _solder;
		removeVest _solder;
		removeBackpack _solder;
		_solder setUnitRank "COLONEL"; // _botRang; 

		_solder setUnitAbility 1; //_botSkill;
		_solder setSkill 1; //_skill;

		_solder setVariable ["botId", _botID];
		_sessionIDLeader = _leader getVariable ["ExileSessionID", 0];
		//[_sessionIDLeader,"createBotsRequest", [(netId _leader),_botArray,_moneyOut,_solder,_botID]] call ExileServer_system_network_send_to;		

		/*************/

	} else {
		["ErrorTitleOnly",[format["Вам нужен: %1 что бы сделать байк!",_item]]] call ExileClient_gui_toaster_addTemplateToast;
	};
} else {
	["ErrorTitleOnly",["Вы не можете это сделать находясь за рулем!"]] call ExileClient_gui_toaster_addTemplateToast;
};