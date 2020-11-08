/**
 * ExileClient_bot_event_network_createAllBotsRequest
 *
 * ejik read/add files for trader bots
 */
private["_playerNetID","_player","_botArray"];
_playerNetID = _this select 0;
_player = objectFromNetId _playerNetID;
_botArray = _this select 1;
_playerUID = getPlayerUID _player;
_allBots = _player getVariable ["PlayerBotList", []];
{
    _bot = _x select 0;
    _botId = _x select 1;
	_bot setVariable ["botId",_botId, true];
	_bot setVariable ["botActive",0, true];
	_bot setVariable ["dontMove",0, true];
	_bot setVariable ["dontShoot",0, true];
	_bot setVariable ["playerBot",_player, true];
	_bot setVariable ["playerBotUid",_playerUID, true];
	_bot addEventHandler ["InventoryOpened", { _this call ExileClient_object_player_event_onInventoryOpened}];
	if(_allBots isEqualTo [])then{
		if(_forEachIndex == 0)then{
			_bot setVariable ["botActive",1, true];
		};
	};
	_allBots pushBack _bot;
}forEach _botArray;
_player setVariable ["PlayerBotList", _allBots];