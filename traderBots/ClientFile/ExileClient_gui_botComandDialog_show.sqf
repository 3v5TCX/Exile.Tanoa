/**
 * ExileClient_gui_botComandDialog_show
 *
 * ejik read/add files for trader bots
 */
 
private["_traderObject", "_dialog", "_purchaseButton", "_traderCategories", "_categoryComboBox", "_allIndex", "_categoryClass", "_categoryConfig", "_categoryIndex"];
closeDialog 0;
disableSerialization;
_botActive = _this;
_botMove = _botActive getVariable ["dontMove",0];
_botShoot = _botActive getVariable ["dontShoot",0];
_autoFire = player getVariable ["PlayerBotAutoFire",0];
false call ExileClient_gui_hud_toggle;
createDialog "RscExilebotComandDialog";
_dialog = uiNameSpace getVariable ["RscExilebotComandDialog", displayNull];
_commandList = getArray(missionConfigFile >> "CfgCommandBots" >> "commandBot");
_commandListVehicle = getArray(missionConfigFile >> "CfgCommandBots" >> "commandBotVehicle");
_commandListLoot = getArray(missionConfigFile >> "CfgCommandBots" >> "commandBotLoot");
_itemListControl = _dialog displayCtrl 4000;
lbClear _itemListControl;
{
    _commandName = _x select 0;
	_commandType = _x select 1;
	_indexEntryIndex = _itemListControl lbAdd _commandName;
	_itemListControl lbSetData [_indexEntryIndex, _commandType];
	_itemListControl lbSetText [_indexEntryIndex, _commandName];
	_itemListControl lbSetColor [_indexEntryIndex, [1, 1, 1, 1]];
	if(_commandType == "5" && _botMove == 1)then{
	    _itemListControl lbSetText [_indexEntryIndex, "Двигатся"];
	    _itemListControl lbSetColor [_indexEntryIndex, [0.9, 0, 0, 1]];
	};
	if(_commandType == "6" && _botShoot == 1)then{
	    _itemListControl lbSetText [_indexEntryIndex, "Стрелять"];
	    _itemListControl lbSetColor [_indexEntryIndex, [0.9, 0, 0, 1]];
	};
	if(_commandType == "20" && _autoFire == 1)then{
	    _itemListControl lbSetText [_indexEntryIndex, "Отключить авто стрельбу"];
	    _itemListControl lbSetColor [_indexEntryIndex, [0.9, 0, 0, 1]];
	};
	if(_commandType == "2" || _commandType == "4" || _commandType == "8" || _commandType == "17" || _commandType == "19" || _commandType == "23" || _commandType == "25" || _commandType == "27")then{
	    _itemListControl lbSetColor [_indexEntryIndex, [0.62, 0.87 ,0.23, 1]];
	};
}forEach _commandList;

_itemListControlVehicle = _dialog displayCtrl 4001;
lbClear _itemListControlVehicle;
{
    _commandName = _x select 0;
	_commandType = _x select 1;
	_indexEntryIndex = _itemListControlVehicle lbAdd _commandName;
	_itemListControlVehicle lbSetData [_indexEntryIndex, _commandType];
	_itemListControlVehicle lbSetText [_indexEntryIndex, _commandName];
	_itemListControlVehicle lbSetColor [_indexEntryIndex, [1, 1, 1, 1]];
	if(_commandType == "12" || _commandType == "14")then{
	    _itemListControlVehicle lbSetColor [_indexEntryIndex, [0.62, 0.87 ,0.23, 1]];
	};
}forEach _commandListVehicle;

_itemListControlLoot = _dialog displayCtrl 4002;
lbClear _itemListControlLoot;
{
    _commandName = _x select 0;
	_commandType = _x select 1;
	_indexEntryIndex = _itemListControlLoot lbAdd _commandName;
	_itemListControlLoot lbSetData [_indexEntryIndex, _commandType];
	_itemListControlLoot lbSetText [_indexEntryIndex, _commandName];
	_itemListControlLoot lbSetColor [_indexEntryIndex, [1, 1, 1, 1]];
}forEach _commandListLoot;