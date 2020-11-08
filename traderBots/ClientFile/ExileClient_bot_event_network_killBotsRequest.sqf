/**
 * ExileClient_bot_event_network_killBotsRequest
 *
 * ejik read/add files for trader bots
 */
private["_playerNetID","_player"];
_playerNetID = _this select 0;
_player = objectFromNetId _playerNetID;
_unit = _this select 1;
_botArray = _player getVariable ["PlayerBotList", []];
_firstBot = objNull;
_nextBot = 0;
_newListBot = [];
if (alive _player) then 
{
	if !(_botArray isEqualTo []) then 
	{
	    {
		    if(_unit == _x)then{
			    _player switchCamera "EXTERNAL";
			    objNull remoteControl _unit;
			};
			if!(alive _x)then{
				_botActive = _x getVariable ["botActive",0];
				if(_botActive == 1)then{
					_nextBot = 1;
				};
				//_botArray deleteAt _forEachIndex;
			}else{
			    if(_forEachIndex == 0)then{
			        _firstBot = _x;
			    };
				if(_nextBot == 1)then{
					_nextBot = 0;
					_x setVariable ["botActive",1];
				};
				_newListBot pushBack _x;
			};
		}forEach _botArray;
		
		if!(_firstBot isEqualTo objNull)then{
			if(_nextBot == 1)then{
				_nextBot = 0;
				_firstBot setVariable ["botActive",1];
			};
		};
		if(_newListBot isEqualTo [])then{
		    _player setVariable ["PlayerBotComander", objNull];
		};
        _player setVariable ["PlayerBotList", _newListBot];
	};
};