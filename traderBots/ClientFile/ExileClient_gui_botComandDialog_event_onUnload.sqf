/**
 * ExileClient_gui_botComandDialog_event_onUnload
 *
 * ejik read/add files for trader bots
 */

disableSerialization;
_botPoint = player getVariable ["PlayerBotPoint", objNull];
//deleteVehicle _botPoint;
//player setVariable ["PlayerBotPoint", objNull];
closeDialog 0;
true call ExileClient_gui_hud_toggle;