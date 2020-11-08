/**
 * ExileClient_gui_botTraderDialog_updateVehicleListBox
 *
 * ejik read/add files for trader bots
 */
 
private["_dialog", "_categoryClasses", "_itemListControl", "_categoryClass", "_categoryVehicleClassNames", "_className", "_salesPrice", "_indexEntryIndex", "_playerMoney", "_quality", "_requiredRespect", "_qualityColor", "_popTabColor", "_missingPopTabs", "_missingRespect"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExilebotTraderDialog", displayNull];
_categoryClasses = _this;
if (_categoryClasses select 0 == "") then
{
	_categoryClasses = getArray(missionConfigFile >> "CfgTradersBots" >> ExileClientCurrentTrader >> "categories");
};
_itemListControl = _dialog displayCtrl 4001;
lbClear _itemListControl;
{
	_categoryClass = _x;
	_categoryVehicleClassNames = getArray(missionConfigFile >> "CfgTraderBotCategories" >> _categoryClass >> "items");
	{
		_className = _x select 3;
		_nameBot = _x select 0;
		_salesPrice = _x select 1;
		_indexEntryIndex = _itemListControl lbAdd getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_playerMoney = player getVariable ["ExileMoney", 0];
		_quality = _x select 2;
		_requiredRespect = getNumber(missionConfigFile >> "CfgTrading" >> "requiredRespect" >> format["Level%1",_quality]);
		_qualityColor = [1, 1, 1, 1];
		_popTabColor = [1, 1, 1, 1];
		switch (_quality) do
		{
			case 2: 	 { _qualityColor = [0.62, 0.87 ,0.23, 1]; };
			case 3:		 { _qualityColor = [0, 0.78, 0.92, 1]; };
			case 4:		 { _qualityColor = [0.62, 0.27, 0.58, 1]; };
			case 5:		 { _qualityColor = [1, 0.7, 0.09, 1]; };
			case 6:		 { _qualityColor = [0.93, 0, 0.48, 1]; };
		};
		if (_salesPrice > _playerMoney) then
		{
			_popTabColor = [0.91, 0, 0, 0.6];
			_missingPopTabs = _salesPrice - _playerMoney;
			_itemListControl lbSetTooltip [_indexEntryIndex, format["Missing %1 Pop Tabs", _missingPopTabs call ExileClient_util_string_exponentToString]];
		};
		if (_requiredRespect > ExileClientPlayerScore) then
		{
			_qualityColor set [3, 0.3];
			_popTabColor set [3, 0.3];
			_missingRespect = _requiredRespect - ExileClientPlayerScore;
			_itemListControl lbSetTooltip [_indexEntryIndex, format["Missing %1 Respect", _missingRespect]];
		};
		if ((_salesPrice > _playerMoney) && (_requiredRespect > ExileClientPlayerScore)) then
		{
			_itemListControl lbSetTooltip [_indexEntryIndex, format["Missing %1 Pop Tabs & %2 Respect", _missingPopTabs call ExileClient_util_string_exponentToString, _missingRespect]];
		};
		_itemListControl lbSetData [_indexEntryIndex, _nameBot];
    	_itemListControl lbSetTextRight [_indexEntryIndex, _salesPrice call ExileClient_util_string_exponentToString];
    	_itemListControl lbSetPictureRight [_indexEntryIndex, "exile_assets\texture\ui\poptab_trader_ca.paa"];
		_itemListControl lbSetColor [_indexEntryIndex, _qualityColor];
		_itemListControl lbSetColorRight [_indexEntryIndex, _popTabColor];
		_itemListControl lbSetPictureRightColor [_indexEntryIndex, _popTabColor];
		_itemListControl lbSetValue [_indexEntryIndex, _quality * 100000 + _salesPrice];
	}
	forEach _categoryVehicleClassNames;
}
forEach _categoryClasses;
lbSortByValue _itemListControl;
true
