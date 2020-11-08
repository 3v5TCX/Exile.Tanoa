/**
 * ExileClient_gui_botTraderDialog_event_onBotListBoxSelectionChanged
 *
 * ejik read/add files for trader bots
 */
 
private["_listBox", "_index", "_vehicleClass"];
disableSerialization;
_listBox = _this select 0;
_index = _this select 1;
_vehicleClass = _listBox lbData _index;
_vehicleClass call ExileClient_gui_botTraderDialog_updateVehicle;
true