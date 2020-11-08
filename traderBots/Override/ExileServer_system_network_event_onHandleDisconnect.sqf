/**
 * ExileServer_system_network_event_onHandleDisconnect
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_unit", "_id", "_pos", "_newUnitDeaths", "_constructionObject", "_animal", "_sessionID"];
_unit = _this select 0;
_id = _this select 1;
_uid = _this select 2;
_name = _this select 3;
_pos = getPos _unit;
_newUnitDeaths = _unit getVariable ["ExileDeaths", 0];
if !(_uid in ["", "__SERVER__", "__HEADLESS__"]) then
{
	_constructionObject = _unit getVariable ["ExileConstructionObject", objNull];
	if !(isNull _constructionObject) then 
	{
		deleteVehicle _constructionObject;
	};
	if (_unit getVariable ["IsPlayingRussianRoulette", false]) then 
	{
		_unit call ExileServer_system_russianRoulette_event_onPlayerDisconnected;
		_unit setVariable ["ExileIsDead", false];
	};
	_animal = missionNamespace getVariable [format ["ExileAnimal%1", _uid], objNull];
	if !(isNull _animal) then
	{
		deleteVehicle _animal;
		missionNamespace setVariable [format ["ExileAnimal%1", _uid], nil];
	};
	format["endAccountSession:%1", _uid] call ExileServer_system_database_query_fireAndForget;
	_sessionID = _unit getVariable ["ExileSessionID", ""];
	_sessionIDUNIT = _sessionID;
	_sessionID call ExileServer_system_session_end;
	_unit setVariable ["ExileSessionID", nil];
	if !(_unit getVariable ["ExileIsDead", false]) then
	{
		if (_unit getVariable ["ExileIsHandcuffed", false]) then 
		{
			_unit setDamage 999;
			format["insertPlayerHistory:%1:%2:%3:%4:%5", _uid, _name, _pos select 0, _pos select 1, _pos select 2] call ExileServer_system_database_query_fireAndForget;
			format["deletePlayer:%1", _unit getVariable ["ExileDatabaseId", -1]] call ExileServer_system_database_query_fireAndForget;
			_unit setVariable ["ExileIsDead", true];
			_unit setVariable ["ExileName", _name, true]; 
			_unit call ExileServer_object_flies_spawn;
			_newUnitDeaths = _newUnitDeaths + 1;
			_unit setVariable ["ExileDeaths", _newUnitDeaths];
			format["addAccountDeath:%1", _uid] call ExileServer_system_database_query_fireAndForget;
			_unit call ExileServer_object_player_sendStatsUpdate;
			["systemChatRequest", [format["HANDCUFF LOGOUT: %1 has been killed.", name _unit]]] call ExileServer_system_network_send_broadcast;
		}
		else 
		{
			_unit call ExileServer_object_player_database_update;
            _botArray = _unit getVariable ["PlayerBotList", []];
			_botsData = format["loadBots:%1", _unit getVariable ["ExileOwnerUID", "SomethingWentWrong"]] call ExileServer_system_database_query_selectFull;
			[_botsData, _unit, _sessionIDUNIT] call ExileServer_bot_trader_database_update;	
            
			_refrash = 0;
		    _leader = objNull;
			diag_log format["DEBUG BOTARRAY %1",_botArray];
			{
				if(_refrash == 0)then{
					if(isPlayer _x)then{
						if(alive _x)then{
							_leader = _x;
							diag_log format["DEBUG LEDAER %1",_leader];
							if(_unit != _leader)then{
								_refrash = 1;
							};
						};
					};
				};
			}forEach units (group _unit);
			
			if!(_leader isEqualTo objNull)then{
				if(_unit != _leader)then{
					{
						_x setVariable ["playerBot", _leader];
					}forEach _botArray;
					_leader setVariable ["PlayerBotList", _botArray];
					(group _leader) selectLeader _leader;
				    [group _leader, _leader] remoteExec ["selectLeader", groupOwner group _leader];
					diag_log format["DEBUG LEDAER IS %1",_leader];
					_sessionIDLeader = _leader getVariable ["ExileSessionID", 0];
					[_sessionIDLeader,"controlerClanPartyRequest", [(netId _leader),_botArray]] call ExileServer_system_network_send_to;
				};	
            }else{
			    if!(_botArray isEqualTo [])then{
					{
						deleteVehicle _x;
					}forEach _botArray;
				};
			};				
			deleteVehicle _unit;
			_unit = objNull;
		};
	};
};
if !(isNull _unit) then 
{
	[_unit] joinSilent (createGroup independent);
};
false