/**
 * ExileClient_bot_event_network_createBotsRequest
 *
 * ejik read/add files for trader bots
 */
private["_playerNetID","_player"];
_playerNetID = _this select 0;
_player = objectFromNetId _playerNetID;
_botArray = _player getVariable ["PlayerBotList", []];
_playerUID = getPlayerUID _player;
_money = _this select 2;
_bot = _this select 3;
_botId = _this select 4;
_groupUnit = group (_botArray select 0);
_group = group player;
_bot setVariable ["botId",_botId, true];
_bot setVariable ["botActive",0, true];
_bot setVariable ["dontMove",0, true];
_bot setVariable ["dontShoot",0, true];
_bot setVariable ["playerBot",_player, true];
_bot setVariable ["playerBotUid",_playerUID, true];
_bot addEventHandler ["InventoryOpened", { _this call ExileClient_object_player_event_onInventoryOpened}];
if(_botArray isEqualTo [])then{
	_bot setVariable ["botActive",1, true];
};
_botArray pushBack _bot;
_player setVariable ["PlayerBotList", _botArray];
["SuccessTitleAndText", ["ПОКУПКА БОТА", "Бот успешно приобретен"]] call ExileClient_gui_toaster_addTemplateToast;