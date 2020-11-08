/**
 * ExileClient_gui_vehicleTraderDialog_show
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_traderObject", "_dialog", "_purchaseButton", "_traderCategories", "_categoryComboBox", "_allIndex", "_categoryClass", "_categoryConfig", "_categoryIndex"];
disableSerialization;
_traderObject = _this;
ExileClientCurrentTrader = _this getVariable "ExileTraderType";
ExileClientPinCode = "";
false call ExileClient_gui_hud_toggle;
ExileClientMoonLight setLightBrightness 5;
createDialog "RscExilebotTraderDialog";
_dialog = uiNameSpace getVariable ["RscExilebotTraderDialog", displayNull];
_traderCategories = getArray(missionConfigFile >> "CfgTradersBots" >> ExileClientCurrentTrader >> "categories");
_categoryComboBox = _dialog displayCtrl 4000;
_allIndex = _categoryComboBox lbAdd "";
_categoryComboBox lbSetCurSel _allIndex;
{
	_categoryClass = _x;
	_categoryConfig = missionConfigFile >> "CfgTraderBotCategories" >> _categoryClass;
	_categoryIndex = _categoryComboBox lbAdd getText(_categoryConfig >> "name");
	_categoryComboBox lbSetData [_categoryIndex, _categoryClass];
	_categoryComboBox lbSetPicture [_categoryIndex, getText(_categoryConfig >> "icon")];
}
forEach _traderCategories;
[""] call ExileClient_gui_botTraderDialog_updateVehicleListBox;
call ExileClient_gui_modelBox_create;