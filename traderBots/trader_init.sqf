/*
   Файл запуска трейдера для покупки ботов
*/
ExileClientLoadedIn = false;
{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
    _isLocked = _x select 2;

    _fileContent = preprocessFileLineNumbers _file;

    if (_fileContent isEqualTo '') then
    {
        diag_log (format ['ERROR: Override of %1 in CfgExileCustomCode points to a non-existent file: %2. Defaulting to vanilla Exile code!', _function, _file]);
   
        _fileContent = preprocessFileLineNumbers (_x select 1);
    };

    _code = compileFinal _fileContent;                    

    missionNamespace setVariable [_function, _code];
}
forEach 
[
	['ExileClient_gui_botTraderDialog_event_onBotListBoxSelectionChanged', 'traderBots\ClientFile\ExileClient_gui_botTraderDialog_event_onBotListBoxSelectionChanged.sqf', false],
	['ExileClient_gui_botTraderDialog_event_onCategoryDropDownSelectionChanged', 'traderBots\ClientFile\ExileClient_gui_botTraderDialog_event_onCategoryDropDownSelectionChanged.sqf', false],
	['ExileClient_gui_botTraderDialog_event_onPurchaseButtonClick', 'traderBots\ClientFile\ExileClient_gui_botTraderDialog_event_onPurchaseButtonClick.sqf', false],
	['ExileClient_gui_botTraderDialog_event_onUnload', 'traderBots\ClientFile\ExileClient_gui_botTraderDialog_event_onUnload.sqf', false],
	['ExileClient_gui_botTraderDialog_updateVehicleListBox', 'traderBots\ClientFile\ExileClient_gui_botTraderDialog_updateVehicleListBox.sqf', false],
	['ExileClient_gui_botTraderDialog_show', 'traderBots\ClientFile\ExileClient_gui_botTraderDialog_show.sqf', false],
	['ExileClient_gui_modelBoxBot_update', 'traderBots\ClientFile\ExileClient_gui_modelBoxBot_update.sqf', false],
	['ExileClient_gui_botTraderDialog_updateVehicle', 'traderBots\ClientFile\ExileClient_gui_botTraderDialog_updateVehicle.sqf', false],
	['ExileClient_gui_hud_BotESP', 'traderBots\ClientFile\ExileClient_gui_hud_BotESP.sqf', false],
	['ExileClient_bot_event_updateBotESP', 'traderBots\ClientFile\ExileClient_bot_event_updateBotESP.sqf', false],
	['ExileClient_bot_event_updateMyMarker', 'traderBots\ClientFile\ExileClient_bot_event_updateMyMarker.sqf', false],
	['ExileClient_gui_botComandDialog_show', 'traderBots\ClientFile\ExileClient_gui_botComandDialog_show.sqf', false],
	['ExileClient_gui_botComandDialog_event_onUnload', 'traderBots\ClientFile\ExileClient_gui_botComandDialog_event_onUnload.sqf', false],
	['ExileClient_gui_botCommandDialog_event_onBotListBoxSelectionChanged', 'traderBots\ClientFile\ExileClient_gui_botCommandDialog_event_onBotListBoxSelectionChanged.sqf', false],
	['ExileClient_bot_event_network_killBotsRequest', 'traderBots\ClientFile\ExileClient_bot_event_network_killBotsRequest.sqf', false],
	['ExileClient_bot_event_network_createBotsAllRequest', 'traderBots\ClientFile\ExileClient_bot_event_network_createBotsAllRequest.sqf', false],
	['ExileClient_gui_boComand_speedFire', 'traderBots\ClientFile\ExileClient_gui_boComand_speedFire.sqf', false],
	['ExileClient_bot_event_targetFire', 'traderBots\ClientFile\ExileClient_bot_event_targetFire.sqf', false],
	['ExileClient_bot_event_savePLayerBots', 'traderBots\ClientFile\ExileClient_bot_event_savePLayerBots.sqf', false],
	['ExileClient_bot_event_targets', 'traderBots\ClientFile\ExileClient_bot_event_targets.sqf', false],
	['ExileClients_bot_event_safeZone', 'traderBots\ClientFile\ExileClients_bot_event_safeZone.sqf', false],
	['ExileClient_bot_event_network_refrashBotsTraderRequest', 'traderBots\ClientFile\ExileClient_bot_event_network_refrashBotsTraderRequest.sqf', false],
	['ExileClient_bot_event_network_controlerClanPartyRequest', 'traderBots\ClientFile\ExileClient_bot_event_network_controlerClanPartyRequest.sqf', false],
	['ExileClient_bot_event_network_createBotsRequest', 'traderBots\ClientFile\ExileClient_bot_event_network_createBotsRequest.sqf', false]
];

if (!hasInterface || isServer) exitWith {};
waitUntil {ExileClientLoadedIn};
_cashDesk = "Land_CashDesk_F" createVehicleLocal [0,0,0];
_cashDesk setDir 131.818;
_cashDesk setPosATL [14589.8, 16778.2, -0.0701294];

_traderAll = [
["C_man_1","Exile_Trader_Bots","GreekHead_A3_01",["InBaseMoves_table1"],[0.1, 0.5, 0.2],170,_cashDesk]
];

{
	_traderClassName = _x select 0;
	_traderType = [_x, 1, _traderClassName] call BIS_fnc_param; 
	_traderFace = _x select 2;
	_animations = _x select 3;
	_position = _x select 4;
	_direction = _x select 5;
	_attachToObject = [_x, 6, objNull] call BIS_fnc_param; 
	_trader = _traderClassName createVehicleLocal [0,0,0];
	_trader setVariable ["BIS_enableRandomization", false];
	_trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
	_trader setVariable ["ExileTraderType", _traderType];
	_trader setVariable ["ExileTraderParams",_x]; 
	_trader disableAI "ANIM";
	_trader disableAI "MOVE";
	_trader disableAI "FSM";
	_trader disableAI "AUTOTARGET";
	_trader disableAI "TARGET";
	_trader disableAI "CHECKVISIBLE";
	_trader allowDamage false; 
	_trader removeAllEventHandlers "HandleDamage";
	_trader setFace _traderFace;
	_trader addEventHandler ["Killed", {(_x select 0) getVariable ["ExileTraderParams",[]] call ExileClient_object_trader_create; deleteVehicle (_x select 0)}];
	if (isNull _attachToObject) then
	{
		_attachToObject = "Logic" createVehicleLocal [0, 0, 0];
		_attachToObject setPosATL _position;
		_position = [0, 0, 0];
	};
	_trader reveal _attachToObject;
	_attachToObject disableCollisionWith _trader;         
	_trader disableCollisionWith _attachToObject; 
	_trader attachTo [_attachToObject, _position];
	_trader setDir _direction;
	_trader switchMove (_animations select 0);
	_animationCount = count _animations;
	if (_animationCount > 1) then
	{
		_trader setVariable ["ExileAnimations", _animations];
		_trader addEventHandler	["AnimDone", {_x call ExileClient_object_trader_event_onAnimationDone}];
	};
	_trader addAction ["<t size='1' color='#FF0000'><img image='\a3\ui_f\data\IGUI\Cfg\Actions\reammo_ca.paa' size='1' shadow='false' />buy bot</t>", {(_this select 0) call ExileClient_gui_botTraderDialog_show}];
}forEach _traderAll;

["loadBotsPlayer", [player]] call ExileClient_system_network_send;
[10, ExileClient_bot_event_targetFire, [], true] call ExileClient_system_thread_addtask;