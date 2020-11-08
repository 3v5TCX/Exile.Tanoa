/**
 * ExileClient_gui_botTraderDialog_updateVehicle
 *
 * ejik read/add files for trader bots
 */
 
private["_vehicleClass", "_dialog", "_traderObject", "_vehicleConfig", "_salesPrice", "_pin", "_quality", "_requiredRespect", "_purchaseButton", "_armor", "_fuelCapacity", "_maximumLoad", "_maximumSpeed", "_stats", "_controlID","_bot","_className"];
disableSerialization;
_vehicleClass = _this;
_dialog = uiNameSpace getVariable ["RscExilebotTraderDialog", displayNull];
_traderObject = uiNameSpace getVariable ["ExileCurrentTrader", objNull];
_bot = [];
_categoryClasses = getArray(missionConfigFile >> "CfgTradersBots" >> ExileClientCurrentTrader >> "categories");
{
	_categoryClass = _x;
	_categoryVehicleClassNames = getArray(missionConfigFile >> "CfgTraderBotCategories" >> _categoryClass >> "items");
	{
	    if((_x select 0) == _vehicleClass)then{
		    _bot = _x;
		}
	}
	forEach _categoryVehicleClassNames;
}forEach _categoryClasses;

_className = _bot select 3;
_salesPrice = _bot select 1;
uiNameSpace setVariable ["RscExileBotArray", _bot];
_className call ExileClient_gui_modelBoxBot_update;
uiNameSpace setVariable ["RscExileBotTraderDialogVehicleClass", _className];