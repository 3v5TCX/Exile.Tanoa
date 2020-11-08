/**
 * ExileClient_bot_event_updateBotESP
 *
 * ejik read/add files for trader bots
 */
 
private["_firstBot","_botArray","_nextBot"];
_botArray = player getVariable ["PlayerBotList", []];
_firstBot = objNull;
_nextBot = 0;
if (alive player) then 
{
	if !(_botArray isEqualTo []) then 
	{
	    {
		    _botActive = _x getVariable ["botActive",0];
		    if(_forEachIndex == 0)then{
			    _firstBot = _x;
			};
			
			if(_nextBot == 1)then{
			    _nextBot = 0;
				_x setVariable ["botActive",1];
			};
			
			if(_botActive == 1)then{
			    _nextBot = 1;
				_x setVariable ["botActive",0];
			};
		}forEach _botArray;
		
		if(_nextBot == 1)then{
		    _nextBot = 0;
			_firstBot setVariable ["botActive",1];
		};
	};
};