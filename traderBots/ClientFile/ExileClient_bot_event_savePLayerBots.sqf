/**
 * ExileClient_bot_event_savePLayerBots
 *
 * ejik read/add files for trader bots
 */
private["_botArray"];
_botArray = player getVariable ["PlayerBotList", []];
if!(_botArray isEqualTo [])then{
    diag_log format["DEBUG NETWORK %1",_botArray];
    ["updateBotsPlayer", [player]] call ExileClient_system_network_send;
};