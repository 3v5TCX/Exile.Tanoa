/**
 * ExileClient_bot_event_targetFire
 *
 * ejik read/add files for trader bots
 */
private["_autoFire","_commandType","_botArray","_botPoint","_bot","_targetObject","_objectAll"];
_botArray = player getVariable ["PlayerBotList", []];
_autoFire = player getVariable ["PlayerBotAutoFire", 0];
_group = group player;
if(_autoFire == 1)then{
    if(count _botArray > 0)then{
		{
		    _itsTarget = assignedTarget _x;
		    if(_itsTarget isEqualTo objNull)then{
				_object = nearestObjects [_x, ["CAManBase","Men","Car","Tank","Air","Turret","LandVehicle","Ship","Armoured"], 400];
				_object = [_object] call ExileClient_bot_event_targets;
				_target = [_object, _x] call BIS_fnc_nearestPosition;
				if!(_target isEqualType [])then{
					if!(_target isEqualTo objNull)then{
						_groupTarget = group _target;
						if!(_group isEqualTo _groupTarget)then{
						    _x doWatch objNull;
							_x doTarget _target;
							if(vehicle _x != _x)then{
								if(count (currentWeapon (vehicle _x)) > 0)then{
									(vehicle _x) doSuppressiveFire _target;
								};
							}else{
								_x doFire _target;
							};
						};
					};
				};
			}else{
			    if!(alive _itsTarget)then{
				    _x doWatch objNull;
					_object = nearestObjects [_x, ["CAManBase","Men","Car","Tank","Air","Turret","LandVehicle","Ship","Armoured"], 400];
					_object = [_object] call ExileClient_bot_event_targets;
					_target = [_object, _x] call BIS_fnc_nearestPosition;
					if!(_target isEqualType [])then{
						if!(_target isEqualTo objNull)then{
							_groupTarget = group _target;
							if!(_group isEqualTo _groupTarget)then{
							    _x doWatch objNull;
								_x doTarget _target;
								if(vehicle _x != _x)then{
									if(count (currentWeapon (vehicle _x)) > 0)then{
										(vehicle _x) doSuppressiveFire _target;
									};
								}else{
									_x doFire _target;
								};
							};
						};
					};
				}else{
				    _object = nearestObjects [_x, ["CAManBase","Men","Car","Tank","Air","Turret"], 400];
					_object = [_object] call ExileClient_bot_event_targets;
					_target = [_object, _x] call BIS_fnc_nearestPosition;
					if((_itsTarget distance _x) > (_target distance _x))then{
						if!(_target isEqualType [])then{
							if!(_target isEqualTo objNull)then{
							    _groupTarget = group _target;
								if!(_group isEqualTo _groupTarget)then{
								    _x doWatch objNull;
									_x doTarget _target;
									if(vehicle _x != _x)then{
										if(count (currentWeapon (vehicle _x)) > 0)then{
											(vehicle _x) doSuppressiveFire _target;
										};
									}else{
										_x doFire _target;
									};
								};
							};
						};
					};
				};
			};
		}forEach _botArray;
	};
}else{
    if(count _botArray > 0)then{
		{
		    _itsTarget = assignedTarget _x;
		    if!(_itsTarget isEqualTo objNull)then{
			    if!(alive _itsTarget)then{
				    _x doWatch objNull;
				};
			};
		}forEach _botArray;
	};
};