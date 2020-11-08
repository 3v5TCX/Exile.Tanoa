/**
 * ExileClient_gui_botCommandDialog_event_onBotListBoxSelectionChanged
 *
 * ejik read/add files for trader bots
 */
 
private["_listBox", "_index", "_commandType","_botArray","_botPoint","_bot"];
disableSerialization;
_listBox = _this select 0;
_index = _this select 1;
_bot = objNull;
_commandType = _listBox lbData _index;
closeDialog 0;
_botArray = player getVariable ["PlayerBotList", []];
_botPoint = player getVariable ["PlayerBotPoint", objNull];
_group = group player;
if !(_botArray isEqualTo []) then 
{
    {
		_botActive = _x getVariable ["botActive",0];
		if(_botActive == 1)then{
			_bot = _x;
		};
	}forEach _botArray;
	switch (_commandType) do 
	{
		case "1":
		{
			_bot doMove (position _botPoint);
			["SuccessTitleAndText", ["ПЕРЕМЕЩЕНИЕ БОТА", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "2":
		{
			{
				_x doMove (position _botPoint);
			}forEach _botArray;
			["SuccessTitleAndText", ["ПЕРЕМЕЩЕНИЕ ГРУППЫ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "3":
		{
	        _bot doFollow player;
			["SuccessTitleAndText", ["ВЕРНУТСЯ В СТРОЙ БОТУ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "4":
		{
	        {
				_x doFollow player;
			}forEach _botArray;
			["SuccessTitleAndText", ["ВЕРНУТСЯ В СТРОЙ ГРУППЕ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "5":
		{
		    _botMove = _bot getVariable ["dontMove",0];
			if(_botMove == 0)then{
			    _bot setVariable ["dontMove",1];
			    _bot disableAI "PATH";
				["SuccessTitleAndText", ["НЕ ДВИГАТСЯ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
			}else{
			    _bot setVariable ["dontMove",0];
			    _bot enableAI "PATH";
				["SuccessTitleAndText", ["РАЗРЕШИТЬ ДВИГАТСЯ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
			};
		};
		case "6":
		{
			_botShoot = _bot getVariable ["dontShoot",0];
			if(_botShoot == 0)then{
			    _bot setVariable ["dontShoot",1];
			    _bot disableAI "TARGET";
				["SuccessTitleAndText", ["НЕ СТРЕЛЯТЬ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
			}else{
			    _bot setVariable ["dontShoot",0];
			    _bot enableAI "TARGET";
				["SuccessTitleAndText", ["РАЗРЕШИТЬ СРЕЛЯТЬ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
			};
		};
		case "7":
		{
		    _useHeal = getArray(missionConfigFile >> "CfgCommandBots" >> "useHeal");
			_item = uniformItems _bot;
		    _item2 = vestItems _bot;
		    _item3 = backpackItems _bot;
			_list = '';
		    {
			  _className = _x select 0;
			  _healProc = _x select 1;
			  if(_className in _item)then{
				if(_list == '')then{
					_list = _className;
					_demplayer = damage _bot;
					if(_demplayer > 0)then{
					  _bot playMove "AinvPknlMstpSlayWrflDnon_medic";
					  _newDem = 0;
					  if(_demplayer > _healProc)then{
						   _newDem = _demplayer - _healProc;
					  };
					  _bot setDammage _newDem;
					  _bot removeItem _className;
					};
				};
			  };
			  
			  if(_className in _item2)then{
				if(_list == '')then{
					_list = _className;
					_demplayer = damage _bot;
					if(_demplayer > 0)then{
					  _bot playMove "AinvPknlMstpSlayWrflDnon_medic";
					  _newDem = 0;
					  if(_demplayer > _healProc)then{
						   _newDem = _demplayer - _healProc;
					  };
					  _bot setDammage _newDem;
					  _bot removeItem _className;
					};
				};
			  };
			  
			  if(_className in _item3)then{
				if(_list == '')then{
					_list = _className;
					_demplayer = damage _bot;
					if(_demplayer > 0)then{
					  _bot playMove "AinvPknlMstpSlayWrflDnon_medic";
					  _newDem = 0;
					  if(_demplayer > _healProc)then{
						   _newDem = _demplayer - _healProc;
					  };
					  _bot setDammage _newDem;
					  _bot removeItem _className;
					};
				};
			  };
		    }forEach _useHeal;
            ["SuccessTitleAndText", ["ЛЕЧИТЬ БОТА", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;			
		};
		case "8":
		{
		    _useHeal = getArray(missionConfigFile >> "CfgCommandBots" >> "useHeal");
			{
				_item = uniformItems _x;
				_item2 = vestItems _x;
				_item3 = backpackItems _x;
				_itsBot = _x;
				_list = '';
				{
				  _className = _x select 0;
				  _healProc = _x select 1;
				  if(_className in _item)then{
					if(_list == '')then{
						_list = _className;
						_demplayer = damage _itsBot;
						if(_demplayer > 0)then{
						  _itsBot playMove "AinvPknlMstpSlayWrflDnon_medic";
						  _newDem = 0;
						  if(_demplayer > _healProc)then{
							   _newDem = _demplayer - _healProc;
						  };
						  _itsBot setDammage _newDem;
						  _itsBot removeItem _className;
						};
					};
				  };
				  
				  if(_className in _item2)then{
					if(_list == '')then{
						_list = _className;
						_demplayer = damage _itsBot;
						if(_demplayer > 0)then{
						  _itsBot playMove "AinvPknlMstpSlayWrflDnon_medic";
						  _newDem = 0;
						  if(_demplayer > _healProc)then{
							   _newDem = _demplayer - _healProc;
						  };
						  _itsBot setDammage _newDem;
						  _itsBot removeItem _className;
						};
					};
				  };
				  
				  if(_className in _item3)then{
					if(_list == '')then{
						_list = _className;
						_demplayer = damage _itsBot;
						if(_demplayer > 0)then{
						  _itsBot playMove "AinvPknlMstpSlayWrflDnon_medic";
						  _newDem = 0;
						  if(_demplayer > _healProc)then{
							   _newDem = _demplayer - _healProc;
						  };
						  _itsBot setDammage _newDem;
						  _itsBot removeItem _className;
						};
					};
				  };
				}forEach _useHeal;	
			}forEach _botArray;
			["SuccessTitleAndText", ["ЛЕЧИТЬ ВСЮ ГРУППУ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "9":
		{
	        if(vehicle _bot == _bot)then{
			    if(vehicle player != player)then{
				    _distance = player distance _bot;
					if (_distance > 10) exitWith {
						["ErrorTitleAndText", ["Бот сильно далеко", "Бот не может быть помещен в траспорт из за того, что он далеко находится."]] call ExileClient_gui_toaster_addTemplateToast;
					};
					["SuccessTitleAndText", ["СЕСТЬ ЗА ВОДИТЕЛЯ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
					_bot moveInDriver (vehicle player);
				}else{  
                    _object = nearestObjects [_botPoint, ["Car","Tank","Air","Turret","LandVehicle","Ship","Armoured"], 7];
					if(count _object == 1)then{
					    _vehicle = _object select 0;
						_distance = _vehicle distance _bot;
						
						if (_distance > 10) exitWith {
							["ErrorTitleAndText", ["Бот сильно далеко", "Бот не может быть помещен в траспорт из за того, что он далеко находится."]] call ExileClient_gui_toaster_addTemplateToast;
						};
						["SuccessTitleAndText", ["СЕСТЬ ЗА ВОДИТЕЛЯ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
						_bot moveInDriver _vehicle;
					};
				};
			}else{
			    ["SuccessTitleAndText", ["СЕСТЬ ЗА ВОДИТЕЛЯ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
				_bot moveInDriver _vehicle;
			};
		};
		case "10":
		{
	        if(vehicle _bot == _bot)then{
			    if(vehicle player != player)then{
				    _distance = player distance _bot;
					if (_distance > 10) exitWith {
						["ErrorTitleAndText", ["Бот сильно далеко", "Бот не может быть помещен в траспорт из за того, что он далеко находится."]] call ExileClient_gui_toaster_addTemplateToast;
					};
					["SuccessTitleAndText", ["СЕСТЬ ЗА СТРЕЛКА", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
					_bot moveInGunner (vehicle player);
				}else{  
                    _object = nearestObjects [_botPoint, ["Car","Tank","Air","Turret","LandVehicle","Ship","Armoured"], 7];
					if(count _object == 1)then{
					    _vehicle = _object select 0;
						_distance = _vehicle distance _bot;
						if (_distance > 10) exitWith {
							["ErrorTitleAndText", ["Бот сильно далеко", "Бот не может быть помещен в траспорт из за того, что он далеко находится."]] call ExileClient_gui_toaster_addTemplateToast;
						};
						["SuccessTitleAndText", ["СЕСТЬ ЗА СТРЕЛКА", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
						_bot moveInGunner _vehicle;
					};
				};
			}else{
			    ["SuccessTitleAndText", ["СЕСТЬ ЗА СТРЕЛКА", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
				_bot moveInGunner _vehicle;
			};
		};
		case "11":
		{
	        if(vehicle _bot == _bot)then{
			    if(vehicle player != player)then{
				    _distance = player distance _bot;
					if (_distance > 10) exitWith {
						["ErrorTitleAndText", ["Бот сильно далеко", "Бот не может быть помещен в траспорт из за того, что он далеко находится."]] call ExileClient_gui_toaster_addTemplateToast;
					};
	                ["SuccessTitleAndText", ["СЕСТЬ В ТЕХНИКУ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
					_bot moveInCargo (vehicle player);
				}else{  
                    _object = nearestObjects [_botPoint, ["Car","Tank","Air","Turret","LandVehicle","Ship","Armoured"], 5];
					if(count _object == 1)then{
					    _vehicle = _object select 0;
						_distance = _vehicle distance _bot;
						if (_distance > 10) exitWith {
							["ErrorTitleAndText", ["Бот сильно далеко", "Бот не может быть помещен в траспорт из за того, что он далеко находится."]] call ExileClient_gui_toaster_addTemplateToast;
						};
						["SuccessTitleAndText", ["СЕСТЬ В ТЕХНИКУ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
						_bot moveInCargo _vehicle;
					};
				};
			}else{
			    ["SuccessTitleAndText", ["СЕСТЬ В ТЕХНИКУ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
				_bot moveInCargo _vehicle;
			};
		};
		case "12":
		{
		    {
				if(vehicle _x == _x)then{
					if(vehicle player != player)then{
						_distance = player distance _x;
						if (_distance > 7) exitWith {
							["ErrorTitleAndText", ["Бот сильно далеко", "Бот не может быть помещен в траспорт из за того, что он далеко находится."]] call ExileClient_gui_toaster_addTemplateToast;
						};
						//_x action ["GetInCargo", vehicle player];
						_x moveInCargo (vehicle player);
					}else{  
						_object = nearestObjects [_botPoint, ["Car","Tank","Air","Turret","LandVehicle","Ship","Armoured"], 7];
						if(count _object == 1)then{
							_vehicle = _object select 0;
							_distance = _vehicle distance _x;
							if (_distance > 7) exitWith {
								["ErrorTitleAndText", ["Бот сильно далеко", "Бот не может быть помещен в траспорт из за того, что он далеко находится."]] call ExileClient_gui_toaster_addTemplateToast;
							};
							//_x action ["GetInCargo", _vehicle];
							_x moveInAny _vehicle;
						};
					};
				};
			}forEach _botArray;
			["SuccessTitleAndText", ["СЕСТЬ В МАШИНУ ГРУППЕ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "13":
		{
		    if(vehicle _bot != _bot)then{
			    _bot setVariable ["dontMove",0];
			    _bot enableAI "PATH";
	            moveOut _bot;
				["SuccessTitleAndText", ["ВЫЙТИ БОТУ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
			};
		};
		case "14":
		{
		    {
			    if(vehicle _x != _x)then{
				    _x setVariable ["dontMove",0];
			        _x enableAI "PATH";
					moveOut _x;
				};
			}forEach _botArray;
			["SuccessTitleAndText", ["ВЫЙТЕ ГРУППЕ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};		
		case "16":
		{
		    _object = nearestObjects [_botPoint, ["CAManBase","Men","Car","Tank","Air","Turret","LandVehicle","Ship","Armoured"], 50];
			_object = [_object] call ExileClient_bot_event_targets;
			_target = [_object, _botPoint] call BIS_fnc_nearestPosition;
		    if!(_target isEqualTo objNull)then{
				_groupTarget = group _target;
				if!(_target isEqualType [])then{
					if!(_group isEqualTo _groupTarget)then{
					    _bot doWatch objNull;
						_bot doTarget _target;
						if(vehicle _bot != _bot)then{
							if(count (currentWeapon (vehicle _bot)) > 0)then{
								(vehicle _bot) doSuppressiveFire _target;
							};
						}else{
							_bot doFire _target;
						};
						["SuccessTitleAndText", ["СТРЕЛЯТЬ БОТУ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
					};
				};
			};
		};
		case "17":
		{
		    _object = nearestObjects [_botPoint, ["CAManBase","Man","Car","Tank","Air","LandVehicle","Ship","Armoured"], 50];
			_object = [_object] call ExileClient_bot_event_targets;
			_target = [_object, _botPoint] call BIS_fnc_nearestPosition;
		    if(count _object > 0)then{
			    {
					_groupTarget = group _target;
					if!(_target isEqualType [])then{
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
				}forEach _botArray;
				["SuccessTitleAndText", ["СТРЕЛЯТЬ ГРУППЕ БОТОВ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
			};
		};
		case "18":
		{
			_bot doWatch objNull;
			["SuccessTitleAndText", ["НЕ СТРЕЛЯТЬ БОТУ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "19":
		{
		    {
				_unit = _x;
				_unit doWatch objNull;
			}forEach _botArray;
			["SuccessTitleAndText", ["НЕ СТРЕЛЯТЬ ГРУППЕ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "20":
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
		case "21":
		{
		    if(vehicle _bot != _bot)then{
			    _driver = assignedDriver (vehicle _bot); 
				if(_driver == _bot)then{
				    _bot setVariable ["dontMove",1];
			        _bot disableAI "PATH";
				    _bot doMove (position (vehicle _bot));
				    (vehicle _bot) land "LAND";
					["SuccessTitleAndText", ["ПОСАДИТЬ ВЕРТОЛЕТ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
				}else{
				    ["ErrorTitleAndText", ["ОШИБКА ПОСАДКИ", "Бот не является водителем транспортного средства."]] call ExileClient_gui_toaster_addTemplateToast;
				};
			};
		};
		case "22":
		{
		    if(vehicle _bot == _bot)then{
				_bot setUnitPos "DOWN";
				["SuccessTitleAndText", ["ЛЕЧЬ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
			};
		};
		case "23":
		{
		    {
			    _unit = _x;
				if(vehicle _unit == _unit)then{
					_unit setUnitPos "DOWN";
				};
			}forEach _botArray;
			["SuccessTitleAndText", ["ЛЕЧЬ ГРУППЕ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "24":
		{
		    if(vehicle _bot == _bot)then{
				_bot setUnitPos "MIDDLE";
				["SuccessTitleAndText", ["СЕСТЬ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
			};
		};
		case "25":
		{
		    {
			    _unit = _x;
				if(vehicle _unit == _unit)then{
					_unit setUnitPos "MIDDLE";
				};
			}forEach _botArray;
			["SuccessTitleAndText", ["СЕСТЬ ГРУППЕ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "26":
		{
		    if(vehicle _bot == _bot)then{
				_bot setUnitPos "UP";
				["SuccessTitleAndText", ["ВСТАТЬ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
			};
		};
		case "27":
		{
		    {
			    _unit = _x;
				if(vehicle _unit == _unit)then{
					_unit setUnitPos "UP";
				};
			}forEach _botArray;
			["SuccessTitleAndText", ["ВСТАТЬ ГРУППЕ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "28":
		{
			_bot switchCamera "EXTERNAL";
			["SuccessTitleAndText", ["ОТ ЛИЦА БОТА", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "29":
		{
			player switchCamera "EXTERNAL";
			["SuccessTitleAndText", ["ВИД ОТ ИГРОКА", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "30":
		{
			player remoteControl _bot;
			_bot switchCamera "EXTERNAL";
			["SuccessTitleAndText", ["БОТ", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case "31":
		{
		    _remoteObj = UAVControl _bot;
		    if!(_remoteObj isEqualTo objNull)then{
				objNull remoteControl _bot;
				player switchCamera "EXTERNAL";
				["refrashBotsTrader", [_bot]] call ExileClient_system_network_send;
				["SuccessTitleAndText", ["ИГРОК", "Приказ успешно назначен"]] call ExileClient_gui_toaster_addTemplateToast;
			};
		};
	};
	//deleteVehicle _botPoint;
	//player setVariable ["PlayerBotPoint", objNull];
};