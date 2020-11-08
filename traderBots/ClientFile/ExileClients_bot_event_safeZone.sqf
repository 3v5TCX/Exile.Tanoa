/**
 * ExileClients_bot_event_safeZone
 *
 * ejik read/add files for trader bots
 */
 
private["_botArray"];
_botArray = player getVariable ["PlayerBotList", []];
_nowZone = 0;
if!(_botArray isEqualTo [])then{
	{
	    _unit = vehicle _x;
		_nowMarkerTrader = _x getVariable ["nowMarkerTrader", []];
		if(_nowMarkerTrader isEqualTo [])then{
		    {
			    if(_nowZone == 0)then{
					_positionTradeZone = _x select 0;
					_sizeTradeZone = _x select 1;
					_distance = _positionTradeZone distance _unit;
					if(_distance < _sizeTradeZone)then{
						_isGod = isDamageAllowed _unit;
						if(_isGod)then{
						    _nowZone = 1;
							_markerInfo = [_positionTradeZone,_sizeTradeZone];
							_unit setVariable ["nowMarkerTrader", _markerInfo];
							_unit allowDamage false;
						};
					};
				};
		    }forEach ExileTraderZoneMarkerPositionsAndSize;
		}else{
		    _positionTradeZone = _nowMarkerTrader select 0;
		    _sizeTradeZone = _nowMarkerTrader select 1;
			_distance = _positionTradeZone distance _unit;
			if(_distance > _sizeTradeZone)then{
			    _unit setVariable ["nowMarkerTrader",[]];
				_unit allowDamage true;
			};
		};
	}forEach _botArray;
};