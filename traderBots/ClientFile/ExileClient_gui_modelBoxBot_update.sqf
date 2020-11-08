/**
 * ExileClient_gui_modelBoxBot_update
 *
 * ejik read/add files for trader bots
 */
 
private["_vehicleClassName", "_modelBoundingDimensions", "_modelBoundingRadius"];
_vehicleClassName = _this;
_itsBotArray = uiNameSpace getVariable ["RscExileBotArray", []];
_dialog = uiNameSpace getVariable ["RscExilebotTraderDialog", displayNull];
_className = _itsBotArray select 3;
_botUniform = _itsBotArray select 6;
_botVest = _itsBotArray select 7;
_botBackpack = _itsBotArray select 8;
_botKaska = _itsBotArray select 9;
_botWeapon = _itsBotArray select 10;
_botWeponSecondary = _itsBotArray select 11;
_itemms = _itsBotArray select 12;
_rifleOptics = _itsBotArray select 13;
_mizzle = _itsBotArray select 14;
if !(isNull ExileClientModelBoxVehicle) then
{
	deleteVehicle ExileClientModelBoxVehicle;
};
ExileClientModelBoxVehicle = _vehicleClassName createVehicleLocal ExileClientModelBoxPosition;
ExileClientModelBoxVehicle setPosATL ExileClientModelBoxPosition;
ExileClientModelBoxVehicle setDir 0;
ExileClientModelBoxVehicle enableSimulation false;
_itemListControl = _dialog displayCtrl 4005;
lbClear _itemListControl;
if(count (_botUniform) > 0)then{
	ExileClientModelBoxVehicle forceAddUniform _botUniform;
	_configName = _botUniform call ExileClient_util_gear_getConfigNameByClassName;
	_indexEntryIndex = _itemListControl lbAdd getText(configFile >> _configName >> _botUniform >> "displayName");
    _icon = getText(configFile >> _configName >> _botUniform >> "picture");
	_itemListControl lbSetData [_indexEntryIndex, _className];
    _itemListControl lbSetPicture [_indexEntryIndex, _icon];
};
if(count (_botBackpack) > 0)then{
	ExileClientModelBoxVehicle addBackpack _botBackpack;
	_configName = _botBackpack call ExileClient_util_gear_getConfigNameByClassName;
	_indexEntryIndex = _itemListControl lbAdd getText(configFile >> _configName >> _botBackpack >> "displayName");
    _icon = getText(configFile >> _configName >> _botBackpack >> "picture");
	_itemListControl lbSetData [_indexEntryIndex, _className];
    _itemListControl lbSetPicture [_indexEntryIndex, _icon];
};
if(count (_botVest) > 0)then{
	ExileClientModelBoxVehicle addVest _botVest;
	_configName = _botVest call ExileClient_util_gear_getConfigNameByClassName;
	_indexEntryIndex = _itemListControl lbAdd getText(configFile >> _configName >> _botVest >> "displayName");
    _icon = getText(configFile >> _configName >> _botVest >> "picture");
	_itemListControl lbSetData [_indexEntryIndex, _className];
    _itemListControl lbSetPicture [_indexEntryIndex, _icon];
};
if(count (_botKaska) > 0)then{
	ExileClientModelBoxVehicle addHeadgear _botKaska;
	_configName = _botKaska call ExileClient_util_gear_getConfigNameByClassName;
	_indexEntryIndex = _itemListControl lbAdd getText(configFile >> _configName >> _botKaska >> "displayName");
    _icon = getText(configFile >> _configName >> _botKaska >> "picture");
	_itemListControl lbSetData [_indexEntryIndex, _className];
    _itemListControl lbSetPicture [_indexEntryIndex, _icon];
};
if(count(_botWeapon) > 0)then{
	ExileClientModelBoxVehicle addWeapon (_botWeapon select 0);
	_configName = (_botWeapon select 0) call ExileClient_util_gear_getConfigNameByClassName;
	_indexEntryIndex = _itemListControl lbAdd getText(configFile >> _configName >> (_botWeapon select 0) >> "displayName");
    _icon = getText(configFile >> _configName >> (_botWeapon select 0) >> "picture");
	_itemListControl lbSetData [_indexEntryIndex, _className];
    _itemListControl lbSetPicture [_indexEntryIndex, _icon];
	if(count (_rifleOptics) > 0)then{
		ExileClientModelBoxVehicle addWeaponItem [(_botWeapon select 0),_rifleOptics];
		_configName = _rifleOptics call ExileClient_util_gear_getConfigNameByClassName;
		_indexEntryIndex = _itemListControl lbAdd getText(configFile >> _configName >> _rifleOptics >> "displayName");
		_icon = getText(configFile >> _configName >> _rifleOptics >> "picture");
		_itemListControl lbSetData [_indexEntryIndex, _className];
		_itemListControl lbSetPicture [_indexEntryIndex, _icon];
	};
	if(count (_mizzle) > 0)then{
		ExileClientModelBoxVehicle addWeaponItem [(_botWeapon select 0),_mizzle];
		_configName = _mizzle call ExileClient_util_gear_getConfigNameByClassName;
		_indexEntryIndex = _itemListControl lbAdd getText(configFile >> _configName >> _mizzle >> "displayName");
		_icon = getText(configFile >> _configName >> _mizzle >> "picture");
		_itemListControl lbSetData [_indexEntryIndex, _className];
		_itemListControl lbSetPicture [_indexEntryIndex, _icon];
	};
};
if((count _botWeponSecondary) > 0)then{
    ExileClientModelBoxVehicle addWeapon (_botWeponSecondary select 0);
	_configName = (_botWeponSecondary select 0) call ExileClient_util_gear_getConfigNameByClassName;
	_indexEntryIndex = _itemListControl lbAdd getText(configFile >> _configName >> (_botWeponSecondary select 0) >> "displayName");
    _icon = getText(configFile >> _configName >> (_botWeponSecondary select 0) >> "picture");
	_itemListControl lbSetData [_indexEntryIndex, _className];
    _itemListControl lbSetPicture [_indexEntryIndex, _icon];
};
if((count _itemms) > 0)then{
    {
        ExileClientModelBoxVehicle addItem _x;
		_configName = _x call ExileClient_util_gear_getConfigNameByClassName;
		_indexEntryIndex = _itemListControl lbAdd getText(configFile >> _configName >> _x >> "displayName");
		_icon = getText(configFile >> _configName >> _x >> "picture");
		_itemListControl lbSetData [_indexEntryIndex, _className];
		_itemListControl lbSetPicture [_indexEntryIndex, _icon];
    }forEach _itemms;
};

_modelBoundingDimensions = ExileClientModelBoxVehicle call BIS_fnc_boundingBoxDimensions;
_modelBoundingRadius = ExileClientModelBoxVehicle call BIS_fnc_boundingCircle;
if ((_vehicleClassName isEqualTo "Exile_Bike_OldBike") || (_vehicleClassName isEqualTo "Exile_Bike_MountainBike")) then
{
	_modelBoundingDimensions set [2, 1];
};
ExileClientModelBoxCameraFocusPosition = 
[
	ExileClientModelBoxPosition select 0, 
	ExileClientModelBoxPosition select 1, 
	(ExileClientModelBoxPosition select 2) + ((_modelBoundingDimensions select 2) * 0.5)
];
ExileClientModelBoxCameraFocusObject setPosATL ExileClientModelBoxCameraFocusPosition;
ExileClientModelBoxCameraPosition = 
[
	(ExileClientModelBoxCameraFocusPosition select 0) - _modelBoundingRadius, 
	ExileClientModelBoxCameraFocusPosition select 1, 
	(ExileClientModelBoxPosition select 2) + (_modelBoundingDimensions select 2) 
];
ExileClientModelBoxCamera camPrepareTarget ExileClientModelBoxCameraFocusObject;
ExileClientModelBoxCamera setPosATL ExileClientModelBoxCameraPosition;
ExileClientModelBoxCamera camCommitPrepared 0;
