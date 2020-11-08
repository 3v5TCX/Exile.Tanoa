/**
 * ExileClient_bot_event_targets
 *
 * ejik read/add files for trader bots
 */
 
private["_commandType","_botInNotShoot","_botPoint","_bot","_position","_clanId","_group"];
_object = _this select 0;
_clanId = player getVariable ["ExileClanID", 0];
_group = group player;
_arrTarget = [];
{
    _groupTarget = group _x;
    _delete = 0;
    if(_group isEqualTo _groupTarget)then{
		_delete = 1;
	};
	
	if(_x isKindOf "Tank")then{
	    if(count units _x > 0)then{
		    _allUn = units _x;
			_unitFirst = _allUn select 0;
			if(_group isEqualTo _groupTarget)then{
				_delete = 1;
			};
			
			if(_group isEqualTo (group _unitFirst))then{
			    if(_delete == 0)then{
					_delete = 1;
				};
			};
			
			if!(alive _unitFirst)then{
				if(_delete == 0)then{
					_delete = 1;
				};
			};
		}else{
		    if(_delete == 0)then{
				_delete = 1;
			};
		};
	};
	
	if(_x isKindOf "Car")then{
	    if(count units _x > 0)then{
		    _allUn = units _x;
			_unitFirst = _allUn select 0;
			if(_group isEqualTo _groupTarget)then{
				_delete = 1;
			};
			
			if(_group isEqualTo (group _unitFirst))then{
			    if(_delete == 0)then{
					_delete = 1;
				};
			};
			
			if!(alive _unitFirst)then{
				if(_delete == 0)then{
					_delete = 1;
				};
			};
		}else{
		    if(_delete == 0)then{
				_delete = 1;
			};
		};
	};
	
	if(_x isKindOf "Turret")then{
	    if(count units _x > 0)then{
		    _allUn = units _x;
			_unitFirst = _allUn select 0;
			if(_group isEqualTo _groupTarget)then{
				_delete = 1;
			};
			
			if(_group isEqualTo (group _unitFirst))then{
			    if(_delete == 0)then{
					_delete = 1;
				};
			};
			
			if!(alive _unitFirst)then{
				if(_delete == 0)then{
					_delete = 1;
				};
			};
		}else{
		    if(_delete == 0)then{
				_delete = 1;
			};
		};
	};
	
	if(_x isKindOf "Air")then{
	    if(count units _x > 0)then{
		    _allUn = units _x;
			_unitFirst = _allUn select 0;
			if(_group isEqualTo _groupTarget)then{
				_delete = 1;
			};
			
			if(_group isEqualTo (group _unitFirst))then{
			    if(_delete == 0)then{
					_delete = 1;
				};
			};
			
			if!(alive _unitFirst)then{
				if(_delete == 0)then{
					_delete = 1;
				};
			};
		}else{
		    if(_delete == 0)then{
				_delete = 1;
			};
		};
	};
	
	if!(alive _x)then{
	    if(_delete == 0)then{
			_delete = 1;
		};
	};
	
	if(_delete == 0)then{
	    _arrTarget pushBack _x;
	};
}forEach _object;
_arrTarget