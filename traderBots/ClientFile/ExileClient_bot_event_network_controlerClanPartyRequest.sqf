/**
 * ExileServer_bot_event_network_controlerClanPartyRequest
 *
 * ejik read/add files for trader bots
 */
private["_playerNetID","_player","_botArray"];
_playerNetID = _this select 0;
_player = objectFromNetId _playerNetID;
_botArray = _this select 1;
_botPoint = _player getVariable ["PlayerBotPoint", objNull];
(group _player) selectLeader _player;
_playerUID = getPlayerUID player;
if(_botArray isEqualTo [])then{
    if!(_botPoint isEqualTo objNull)then{
	    deleteVehicle _botPoint;
		_player setVariable ["PlayerBotPoint", objNull];
	};
}else{
    {
		_x setVariable ["botActive",0, true];
		_x setVariable ["dontMove",0, true];
		_x setVariable ["dontShoot",0, true];
		_x setVariable ["playerBot",_player, true];
		_x setVariable ["playerBotUid",_playerUID, true];
		_x addEventHandler ["InventoryOpened", { _this call ExileClient_object_player_event_onInventoryOpened}];
	    if(_forEachIndex == 0)then{
           _x setVariable ["botActive",1, true];
		};
		_x setVariable ["PlayerBot", _player];
	}forEach _botArray;
};
_player setVariable ["PlayerBotList", _botArray];