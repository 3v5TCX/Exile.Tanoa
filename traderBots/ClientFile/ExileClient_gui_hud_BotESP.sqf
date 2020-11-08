/**
 * ExileClient_gui_hud_BotESP
 *
 * ejik read/add files for trader bots
 */
 
private["_red", "_green", "_blue", "_alpha", "_markeralpha", "_pixelScale", "_iconTextSize", "_nameTextSize", "_distance", "_textAlpha", "_iconAlpha", "_position", "_iconLabel", "_markerPosition", "_markerScreenPosition", "_distanceToCenterOfScreen", "_adjustedMarkerAlpha", "_markerAlpha","_icon","_botArray","_health"];
_botArray = player getVariable ["PlayerBotList", []];
_botPoint = player getVariable ["PlayerBotPoint", objNull];
if (alive player) then 
{
	if !(_botArray isEqualTo []) then 
	{	
		_red = profileNamespace getVariable ["ExilePartyESPRed", 0.7];
		_green = profileNamespace getVariable ["ExilePartyESPGreen", 0.93];
		_blue = profileNamespace getVariable ["ExilePartyESPBlue", 0];
		_alpha = profileNamespace getVariable ["ExilePartyESPAlpha", 0.75];
		_markeralpha = profileNamespace getVariable ["ExilePartyMarkerAlpha", 0.75];
		_pixelScale = safeZoneH / (getResolution select 1); 
		_iconTextSize = 18 * pixelH;
		_nameTextSize = 24 * pixelH;
		{
				if (alive _x) then 
				{
					if !(_x isEqualTo player) then 
					{
						_distance = cameraOn distance _x;
						_textAlpha = linearConversion [20, 23, _distance, _alpha, _markeralpha, true];
						_position = _x modelToWorldVisual (_x selectionPosition "head");
						_health = floor((1 - damage _x) * 100);
						_iconLabel = format ["%1(%2%) - %3m", name _x, _health, floor _distance];
						_active = _x getVariable ["botActive",0];
						if(_active == 1)then{
						    _icon = "\exile_assets\texture\hud\hud_icon_marker_ca.paa";
						}else{
						    _icon = "";
						};
						
						if (_textAlpha > 0) then 
						{
							drawIcon3D 
							[
								_icon,
								[_red, _green, _blue, _textAlpha],
								[_position select 0, _position select 1, (_position select 2) + 0.75],
								1, 
								1, 
								0,
								_iconLabel,
								false,
								_nameTextSize, 
								"PuristaMedium",
								"center"
							];
						};
					};
				};
		}forEach _botArray;
		
		if!(_botPoint isEqualTo objNull)then{
		    _distance = cameraOn distance _botPoint;
			_textAlpha = linearConversion [20, 23, _distance, _alpha, _markeralpha, true];
			_position = _botPoint modelToWorldVisual (_botPoint selectionPosition "camo");
			_iconLabel = format ["МЕТКА КОМАНДЫ - %1m", floor _distance];
			_icon = "\exile_assets\texture\hud\hud_icon_marker_ca.paa";
			_nameTextSize = 24 * pixelH;
		    if (_textAlpha > 0) then 
			{
					drawIcon3D 
					[
						_icon,
						[_red, _green, _blue, _textAlpha],
						[_position select 0, _position select 1, (_position select 2) + 0.75],
						1, 
						1, 
						0,
						_iconLabel,
						false,
						_nameTextSize, 
						"PuristaMedium",
						"center"
					];
			};
		};
	};
};