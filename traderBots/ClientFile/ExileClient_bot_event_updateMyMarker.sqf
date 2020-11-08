/**
 * ExileClient_bot_event_updateMyMarker
 *
 * ejik read/add files for trader bots
 */
 
private["_intersectingObjectArray", "_position","_botArray"];
_red = profileNamespace getVariable ["ExilePartyESPRed", 0.7];
_green = profileNamespace getVariable ["ExilePartyESPGreen", 0.93];
_blue = profileNamespace getVariable ["ExilePartyESPBlue", 0];
_alpha = profileNamespace getVariable ["ExilePartyESPAlpha", 0.75];
_markeralpha = profileNamespace getVariable ["ExilePartyMarkerAlpha", 0.75];
if ((getNumber (missionConfigFile >> "CfgExileParty" >> "allow3DMarkers")) isEqualTo 1) then 
{
    _botArray = player getVariable ["PlayerBotList", []];
	if !(_botArray isEqualTo []) then 
	{	
		_botPoint = player getVariable ["PlayerBotPoint", objNull];
		_intersectingObjectArray = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0, 0, 0], AGLToASL positionCameraToWorld [0, 0, 1600], vehicle player, objNull, true, 1, "VIEW", "FIRE"];
		if !(_intersectingObjectArray isEqualTo []) then 
		{
			_position = (_intersectingObjectArray select 0) select 0;
			if!(_botPoint isEqualTo objNull)then{
				_botPoint setPos [(_position select 0),(_position select 1),0];
				{
				    _botActive = _x getVariable ["botActive",0];
					if(_botActive == 1)then{
				        _x call ExileClient_gui_botComandDialog_show;
					};
				}forEach _botArray;
			}else{
				_virtual = "Sign_Arrow_Green_F" createVehicleLocal [(_position select 0),(_position select 1),0];
				_virtual SetVehicleVarname "botpoint";
				_virtual setPos [(_position select 0),(_position select 1),0];
				botpoint = _virtual;
				player setVariable ["PlayerBotPoint", botpoint];
				{
				    _botActive = _x getVariable ["botActive",0];
					if(_botActive == 1)then{
				        _x call ExileClient_gui_botComandDialog_show;
					};
				}forEach _botArray;
			};
		}
		else 
		{
			deleteVehicle _botPoint;
			player setVariable ["PlayerBotPoint", objNull];
		};
	}else{
	    ["loadBotsPlayer", [player]] call ExileClient_system_network_send;
	};
};