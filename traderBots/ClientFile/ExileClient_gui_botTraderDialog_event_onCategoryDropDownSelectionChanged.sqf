/**
 * ExileClient_gui_botTraderDialog_event_onCategoryDropDownSelectionChanged
 *
 * ejik read/add files for trader bots
 */
 
private["_comboBox", "_index", "_categoryClass"];
disableSerialization;
_comboBox = _this select 0;
_index = _this select 1;
_categoryClass = _comboBox lbData _index;
[_categoryClass] call ExileClient_gui_botTraderDialog_updateVehicleListBox;
true