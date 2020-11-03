waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};
uiSleep 1;
execVM "custom\scripts\fn_payBase.sqf";
execVM "pre_proc.sqf";
execVM "MarXet\MarXet_Init.sqf";
_position = worldSize/2;
_center = [_position,_position,0];
_lockers = nearestObjects [_center, ["Exile_Locker"], worldSize];

{
	_x addAction ["<t color='#FF0000'>Rewards</t>", {[] call ExileClient_gui_rewardsDialog_show;},"",-4,true ,true ,"","true",3];
} forEach _lockers;

//Watermark
_pic = ""; //Путь к картинке
[
    '<img align=''left'' size=''1.0'' shadow=''1'' image='+(str(_pic))+' />',
    safeZoneX+0.027,
    safeZoneY+safeZoneH-0.1,
    99999,
    0,
    0,
    3090
] spawn bis_fnc_dynamicText;

if(getNumber(missionConfigFile >> "CfgTaskForceRadio" >> "enable") isEqualTo 1) then
{
	tfWarn = 0;
	[] spawn AtlasClient_system_check_TeamSpeak;
};

if (!hasInterface || isServer) exitWith {};