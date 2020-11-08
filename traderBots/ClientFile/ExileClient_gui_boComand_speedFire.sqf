/**
 * ExileClient_gui_boComand_speedFire
 *
 * ejik read/add files for trader bots
 */
 
private["_commandType","_botArray","_botPoint","_bot","_position"];
disableSerialization;
_commandType = _this select 0;
_bot = objNull;
closeDialog 0;
_position = [];
_botArray = player getVariable ["PlayerBotList", []];
_intersectingObjectArray = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0, 0, 0], AGLToASL positionCameraToWorld [0, 0, 1600], vehicle player, objNull, true, 1, "VIEW", "FIRE"];
if !(_intersectingObjectArray isEqualTo []) then {
    _position = (_intersectingObjectArray select 0) select 0;
	_position = [(_position select 0),(_position select 1),0];
};
_group = group player;
if !(_botArray isEqualTo []) then 
{
	switch (_commandType) do 
	{
		case "1":
		{
		    _object = nearestObjects [_position, ["CAManBase","Men","Car","Tank","Air","Turret","LandVehicle","Ship","Armoured"], 50];
			_object = [_object] call ExileClient_bot_event_targets;
			_target = [_object, _position] call BIS_fnc_nearestPosition;
			if!(_target isEqualType [])then{
				if(count _object > 0)then{
					{
						_unit = _x;
						_groupTarget = group _target;
						if!(_group isEqualTo _groupTarget)then{
						    _unit doWatch objNull;
							_unit doTarget _target;
							if(vehicle _unit != _unit)then{
								if(count (currentWeapon (vehicle _unit)) > 0)then{
									(vehicle _unit) doSuppressiveFire _target;
								};
							}else{
								_unit doFire _target;
							};
						};
					}forEach _botArray;
				};
			};
			["SuccessTitleAndText", ["АТАКОВАТЬ ВРАГА", "Приказ успешно принят"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "2":
		{
		    _autoFire = player getVariable ["PlayerBotAutoFire", 0];
			if(_autoFire == 0)then{
		        player setVariable ["PlayerBotAutoFire", 1];
				["SuccessTitleAndText", ["АВТО ОГОНЬ", "Успешно включен"]] call ExileClient_gui_toaster_addTemplateToast;
			}else{
			    player setVariable ["PlayerBotAutoFire", 0];
				["SuccessTitleAndText", ["АВТО ОГОНЬ", "Успешно выключен"]] call ExileClient_gui_toaster_addTemplateToast;
			};
		};
	};
};