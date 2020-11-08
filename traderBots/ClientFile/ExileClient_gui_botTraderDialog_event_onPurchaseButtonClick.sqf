/**
 * ExileClient_gui_botTraderDialog_event_onPurchaseButtonClick
 *
 * ejik read/add files for trader bots
 */
 
private["_vehicleClass", "_salesPrice", "_quality", "_requiredRespect","_lider"];
_vehicleClass = uiNameSpace getVariable ["RscExileBotTraderDialogVehicleClass", ""];
_itsBotArray = uiNameSpace getVariable ["RscExileBotArray", []];
_botArray = player getVariable ["PlayerBotList", []];
_groupComand = player getVariable ["PlayerGroupCommand", 0];
_salesPrice = _itsBotArray select 1;
_quality = _itsBotArray select 2;
_requiredRespect = getNumber(missionConfigFile >> "CfgTrading" >> "requiredRespect" >> format["Level%1",_quality]);
_countBotInPlayer = getNumber(missionConfigFile >> "CfgBotTraderSettings" >> "countBotInPlayer");
_countBotInClan = getNumber(missionConfigFile >> "CfgBotTraderSettings" >> "countBotInClan");
_lider = leader (group player);
_end = 1;
_playerUID = getPlayerUID player;
_allUnitsGroup = [];
{
    if(isPlayer _x)then{
	    if(_x != player)then{
	        _allUnitsGroup pushBack _x;
	    };
	};
}forEach units (group player);
_myBot = [];
{
	_playerBotUid = _x getVariable ["playerBotUid",""];
	_playerBot = _x getVariable ["playerBot",""];
	if(_playerBotUid isEqualTo _playerUID)then{
	    if(count _allUnitsGroup == 0)then{
		    if(alive _x)then{
				if!((group player) isEqualTo (group _x))then{
					_myBot pushBack _x;
				};
			};
		};
	};
} forEach allUnits;
closeDialog 0;
if (_salesPrice > (player getVariable ["ExileMoney", 0])) exitWith {
	["ErrorTitleAndText", ["ПОКУПКА ПРЕРВАНА", "Не хватает денег"]] call ExileClient_gui_toaster_addTemplateToast;
};
if (_requiredRespect > ExileClientPlayerScore) exitWith {
	["ErrorTitleAndText", ["ПОКУПКА ПРЕРВАНА", "Уровень респекта не позволяет купить данного бота."]] call ExileClient_gui_toaster_addTemplateToast;
};
if(count _allUnitsGroup > 0)then{
	if!(count _botArray < _countBotInClan) exitWith {
	    _end = 0;
		["ErrorTitleAndText", ["ПОКУПКА ПРЕРВАНА", format["У клана не может быть больше %1 ботов",_countBotInClan]]] call ExileClient_gui_toaster_addTemplateToast;
	};
}else{
	if!(count _botArray < _countBotInPlayer) exitWith {
	    _end = 0;
		["ErrorTitleAndText", ["ПОКУПКА ПРЕРВАНА", format["У игрока не может быть больше %1 ботов",_countBotInPlayer]]] call ExileClient_gui_toaster_addTemplateToast;
	};
	
	if(count _myBot > 0)exitWith{
		_end = 0;
		["ErrorTitleAndText", ["ПОКУПКА ПРЕРВАНА", "У вас есть боты. Возможно вы умерли и не знаете как активировать оставшихся ботов. Для того, чтоб их активировать нажмите кнопку команды."]] call ExileClient_gui_toaster_addTemplateToast;
	};
};
if(_lider != player)exitWith{
    ["ErrorTitleAndText", ["ПОКУПКА ПРЕРВАНА", "Вы состоите в клане. Покупать ботов может только лидер группы."]] call ExileClient_gui_toaster_addTemplateToast;
};
if(_end == 1)then{
    ["createBotsTrader", [player,_itsBotArray,_vehicleClass,_botArray]] call ExileClient_system_network_send;
};