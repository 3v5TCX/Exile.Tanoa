/**
 * ExileServer_object_vehicle_event_onGetIn
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicleObject","_unit","_locked"];
_vehicleObject = _this select 0;
_unit = _this select 2;
if (getNumber(missionConfigFile >> "CfgSimulation" >> "enableDynamicSimulation") isEqualTo 1) then 
{
	if !(dynamicSimulationEnabled _vehicleObject) then 
	{
		_vehicleObject enableDynamicSimulation true;
	};
}
else
{
	if !(simulationEnabled _vehicleObject) then 
	{
		_vehicleObject enableSimulationGlobal true;
	};
};
_locked = locked _vehicleObject;
diag_log format["DEBUG LOKED %1",_locked];
if!(isPlayer _unit)then{
    if(_locked > 1)then{
	    moveOut _unit;
	};
};
true