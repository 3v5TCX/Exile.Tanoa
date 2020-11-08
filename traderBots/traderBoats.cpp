/*
   Конфигурации для торговца ботами.
*/
class CfgTradersBots
{
	class Exile_Trader_Bots
	{
		name = "BOTS";
		showWeaponFilter = 0;
		categories[] = 
		{
			"gunBots",
			"rifleBots"
		};
	};
};

class CfgNetworkMessages
{
	class createBotsTrader
	{
		module = "bot_trader";
		parameters[] = {"OBJECT","ARRAY","STRING","ARRAY"};
	};
	class createBotsRequest
	{
		module = "bot_event";
		parameters[] = {"STRING","ARRAY","SCALAR","OBJECT","SCALAR"};
	};
	class createBotsAllRequest
	{
		module = "bot_event";
		parameters[] = {"STRING","ARRAY"};
	};
	class killBotsRequest
	{
		module = "bot_event";
		parameters[] = {"STRING","OBJECT"};
	};
	class controlerClanPartyRequest
	{
		module = "bot_event";
		parameters[] = {"STRING","ARRAY"};
	};
	class loadBotsPlayer
	{
		module = "bot_trader";
		parameters[] = {"OBJECT"};
	};
	class updateBotsPlayer
	{
		module = "bot_trader";
		parameters[] = {"OBJECT"};
	};
	class onOffGroup
	{
		module = "bot_trader";
		parameters[] = {"SCALAR"};
	};
	class refrashBotsTrader
	{
		module = "bot_trader";
		parameters[] = {"OBJECT"};
	};
	class refrashBotsTraderRequest
	{
		module = "bot_event";
		parameters[] = {"STRING","ARRAY"};
	};
};

class CfgBotTraderSettings
{
	countBotInPlayer = 3; // Количество ботов, которое может купить игрок.
	countBotInClan = 5; // Количество ботов на клан.
	minrespectKilledBoat = 50; // Минимальный респект за убийство бота чужим игроком.
	maxrespectKilledBoat = 100; // Максимальный респект за убийство бота чужим игроком.
};

class CfgCommandBots
{
	commandBot[] = {
		{"Перейти на стрелку","1"},
		{"Перейти на стрелку всем","2"},
		{"Присоеденится к группе","3"},
		{"Присоеденится к группе всем","4"},
		{"Стрелять","16"},
		{"Стрелять всем","17"},
		{"Отменить стрельбу","18"},
		{"Отменить стрельбу всем","19"},
		{"Авто стрельба","20"},
		{"Полечить","7"},
		{"Полечить всех","8"},
		{"Лечь","22"},
		{"Лечь группе","23"},
		{"Сесть","24"},
		{"Сесть группе","25"},
		{"Встать","26"},
		{"Встать группе","27"},
		{"Не двигатся","5"},
		{"Не стрелять","6"},
	};
	
	commandBotVehicle[] = {
		{"Сесть в машину на место водителя","9"},
		{"Сесть в машину на место стрелка","10"},
		{"Сесть в машину","11"},
		{"Сесть всем в машину","12"},
		{"Выйти из траспорта","13"},
		{"Выйти из траспорта всем","14"},
		{"Посадить вертолет","21"}
	};
	
	commandBotLoot[] = {
		{"От лица бота","28"},
		{"От лица игрока","29"},
		{"Управление ботом","30"},
		{"Управление собой","31"}
	};
	
	useHeal[] = {
		{"Exile_Item_InstaDoc",1},
		{"Exile_Item_Bandage",0.5},
		{"Exile_Item_Vishpirin",1},
		{"FirstAidKit",0.5}
	};
};

class CfgTraderBotCategories
{
	class gunBots
	{
		name = "Bots with mashinegun";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = {
			{	
                "Bots1", // Название для списка
                1000, // Цена бота
                1, // Уровень респекта				
				"i_survivor_F", // Класс бота		
				1, // Сложность бота. от 0 до 1. Где 1 это самый сложный
				"COLONEL", // Звание бота. Список сложностей "CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"
				"U_O_GhillieSuit", // Униформа бота класс
				"V_PlateCarrier1_rgr", // Бронижелет бота класс
				"B_Carryall_ocamo", // Рюкзак бота класс
				"H_PilotHelmetFighter_I", // Каска бота класс
				{"srifle_DMR_03_F","20Rnd_762x51_Mag",7}, // Оружие бота. 1 - класс оружия, 2 - класс патронов, 3 - количество обойм
				{"CUP_launch_RPG18","CUP_RPG18_M",1}, // Второстепеное оружие
				{"Exile_Item_InstaDoc","Exile_Item_EnergyDrink","DemoCharge_Remote_Mag"}, // Итем для бота
				"optic_SOS", // Оптика применяемая для данного оружия
				"muzzle_snds_B", // Глушитель применяемый для этого оружия
				1, // Сложность бота. от 0 до 1. Где 1 это самый сложный
			},
			{			
			    "Bots2", // Название для списка
				2000, // Цена бота	
				1, // Уровень респекта
				"i_survivor_F", // Класс бота		
				1, // Сложность бота. от 0 до 1. Где 1 это самый сложный
				"COLONEL", // Звание бота. Список сложностей "CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"
				"U_O_Wetsuit", // Униформа бота класс
				"V_PlateCarrierL_CTRG", // Бронижелет бота класс
				"B_Carryall_ocamo", // Рюкзак бота класс
				"H_PilotHelmetHeli_I", // Каска бота класс
				{"LMG_Zafir_F","150Rnd_762x54_Box",3}, // Оружие бота. 1 - класс оружия, 2 - класс патронов, 3 - количество обойм
				{"CUP_launch_RPG18","CUP_RPG18_M",1}, // Второстепеное оружие
				{"Exile_Item_InstaDoc","Exile_Item_ChocolateMilk"}, // Итем для бота
				"", // Оптика применяемая для данного оружия
				"", // Глушитель применяемый для этого оружия
				1, // Сложность бота. от 0 до 1. Где 1 это самый сложный
			}
		};
	};
	
	class rifleBots
	{
		name = "Bots with sniper rifle";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = {
			{
                "Bots3", // Название для списка	
                1000, // Цена бота
                1, // Уровень респекта				
				"i_survivor_F", // Класс бота		
				1, // Сложность бота. от 0 до 1. Где 1 это самый сложный
				"COLONEL", // Звание бота. Список сложностей "CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"
				"U_O_CombatUniform_oucamo", // Униформа бота класс
				"V_PlateCarrierIA1_dgtl", // Бронижелет бота класс
				"B_Carryall_ocamo", // Рюкзак бота класс
				"H_CrewHelmetHeli_I", // Каска бота класс
				{"MMG_01_hex_F","150Rnd_93x64_Mag",3}, // Оружие бота. 1 - класс оружия, 2 - класс патронов, 3 - количество обойм
				{"CUP_launch_RPG18","CUP_RPG18_M",1}, // Второстепеное оружие
				{"Exile_Item_InstaDoc","Exile_Item_EnergyDrink","Exile_Item_EMRE"}, // Итем для бота
				"optic_DMS", // Оптика применяемая для данного оружия
				"muzzle_snds_93mmg", // Глушитель применяемый для этого оружия
				1, // Сложность бота. от 0 до 1. Где 1 это самый сложный
			},
			{			
				"Bots4", // Класс бота	
                2000, // Цена бота		
                1, // Уровень респекта
                "i_survivor_F", // Класс бота				
				1, // Сложность бота. от 0 до 1. Где 1 это самый сложный
				"COLONEL", // Звание бота. Список сложностей "CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"
				"U_O_PilotCoveralls", // Униформа бота класс
				"V_PlateCarrierGL_blk", // Бронижелет бота класс
				"B_Carryall_ocamo", // Рюкзак бота класс
				"H_HelmetO_ocamo", // Каска бота класс
				{"srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag",7}, // Оружие бота. 1 - класс оружия, 2 - класс патронов, 3 - количество обойм
				{"CUP_launch_RPG18","CUP_RPG18_M",1}, // Второстепеное оружие
				{"Exile_Item_DuctTape"}, // Итем для бота
				"optic_DMS", // Оптика применяемая для данного оружия
				"muzzle_snds_93mmg", // Глушитель применяемый для этого оружия
				1, // Сложность бота. от 0 до 1. Где 1 это самый сложный
			}
		};
	};
};

class CfgVehicles {
	class Man;
	class CAManBase : Man {
		class ViewPilot;	// External class reference
		
		class HitPoints {
			class HitHead;	// External class reference
			class HitBody;	// External class reference
			class HitHands;	// External class reference
			class HitLegs;	// External class reference
		};
	};
	
	class SoldierWB : CAManBase {
		side = TGuerrila;
		modelSides[] = {2};
		faction = IND_F;
	};
	
	class B_Soldier_base_F : SoldierWB {
		side = TGuerrila;
		modelSides[] = {2};
		faction = IND_F;
	};
	
	class Exile_Trader_Abstract : B_Soldier_base_F {
		scope = public;
		author = "Exile Mod Team";
		displayName = "Exile Trader Base";
		side = TGuerrila;
		modelSides[] = {2};
		faction = IND_F;
		vehicleClass = "Men";
		weapons[] = {};
		respawnWeapons[] = {};
		magazines[] = {};
		respawnMagazines[] = {};
		items[] = {};
		respawnItems[] = {};
		linkedItems[] = {};
		respawnLinkedItems[] = {};
		backpack = "";
		canCarryBackPack = 1;
		nakedUniform = "U_BasicBody";
		model = "\a3\characters_F\common\coveralls";
		uniformClass = "";
		
		class EventHandlers {
			init = "";
		};
		
		class UserActions {
			class trade {
				displayName = "<img image='\a3\ui_f\data\IGUI\Cfg\Actions\reammo_ca.paa' size='1' shadow='false' />Trade";
				position = "ohniste";
				radius = 3;
				priority = 6;
				onlyForPlayer = 1;
				condition = "true";
				statement = "this call ExileClient_gui_traderDialog_show";
			};
		};
		
		actionBegin1 = "trade";
		actionEnd1 = "trade";
	};
	
    class Exile_Trader_Bots : Exile_Trader_Abstract {
		displayName = "Exile Bots Trader";
		uniformClass = "";
		linkedItems[] = {};
		
		class UserActions {
			class trade {
				displayName = "<img image='\a3\ui_f\data\IGUI\Cfg\Actions\reammo_ca.paa' size='1' shadow='false' />Purchase Bot";
				position = "ohniste";
				radius = 3;
				priority = 6;
				onlyForPlayer = 1;
				condition = "true";
				statement = "this call ExileClient_gui_botTraderDialog_show";
			};
		};
	};
};

class Attributes;

class RscExileItemListBox : RscListBox {
	sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	sizeEx2 = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	rowHeight = "2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	canDrag = 0;
	itemSpacing = 0.001;
	period = 1.2;
	shadow = false;
	maxHistoryDelay = 1;
	fade = 0;
	deletable = 0;
	type = 5;
	style = 16;
	font = "RobotoMedium";
	colorBackground[] = {0, 0, 0, 0.3};
	colorDisabled[] = {1, 1, 1, 0.25};
	colorPicture[] = {1, 1, 1, 1};
	colorPictureDisabled[] = {1, 1, 1, 0.25};
	colorPictureRight[] = {1, 1, 1, 1};
	colorPictureRightDisabled[] = {1, 1, 1, 0.25};
	colorPictureSelected[] = {1, 1, 1, 1};
	colorScrollbar[] = {1, 0, 0, 0};
	soundSelect[] = {"",0.1,1};
	colorSelect[] = {0, 0, 0, 1};
	colorSelect2[] = {0, 0, 0, 1};
	colorSelect2Right[] = {0, 0, 0, 1};
	colorSelectBackground2[] = {1, 1, 1, 0.5};
	colorSelectBackground[] = {0.95, 0.95, 0.95, 1};
	colorSelectRight[] = {0, 0, 0, 1};
	colorShadow[] = {0, 0, 0, 0.5};
	colorText[] = {1, 1, 1, 1};
	colorTextRight[] = {1, 1, 1, 1};
	disabledCtrlColor[] = {1, 1, 1, 0.5};
	itemBackground[] = {1, 1, 1, 0.1};
	tooltipColorBox[] = {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.65};
	tooltipColorText[] = {1, 1, 1, 1};
	class ListScrollBar : ScrollBar //ListScrollBar is class name required for Arma 3
	{
	    color[] = {1,1,1,0.6};
	    colorActive[] = {1,1,1,1};
	    colorDisabled[] = {1,1,1,0.3};
	    thumb = "#(argb,8,8,3)color(1,1,1,1)";
	    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	    border = "#(argb,8,8,3)color(1,1,1,1)";
	    shadow = 0;
	};
};

class RscExileBotCombo: RscCombo
{
	type = 4;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,1};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "select change";
	style = "0x10 + 0x200";
	colorDisabled[] = {0,0,0,1};
	colorSelect[] = {0,0,0,1};
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
	class ComboScrollBar
	{
		color[] = {1,1,1,1};
	};
	wholeHeight = 0.45;
	maxHistoryDelay = 1;
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
};

class RscExileBotText: RscText
{
	type = 0;
	style = 0;
	colorBackground[] ={0,0,0,0};
	font = "RobotoCondensed";
	colorText[] = {1,1,1,1};
	SizeEx = 0.05;
	text = "";
};

class RscExileBotStructuredText: RscStructuredText
{
	SizeEx = "(((((safezoneW / safezoneH) min 1) / 1.2) / 25) * 1)";
	type = 13;
	style = 0;
	colorText[] ={1,1,1,1};
	text = "";
	size = 0.05;
	class Attributes
	{
		font = "RobotoCondensed";
		color = "#ffffff";
		colorLink = "#D09B43";
		align = "center";
		shadow = 1;
	};
};

class RscButtonMenuOK : RscButton
{
	access=0;
	idc=-1;
	type=1;
	style=2;
	text="";
	action="";
	colorText[]={1,1,1,0.9};
	colorDisabled[]={0.6,0.1,0.3,0};
	colorActive[]={0.91,0,0,1};
	colorBackground[]={0.91,0,0,1};
	colorBackgroundDisabled[]={0,0.0,0};
	colorBackgroundActive[]={1,1,1,0.7};
	colorFocused[]={0.6,0.1,0.3,1};
	colorShadow[]={0.023529,0,0.0313725,1};
	colorBorder[]={0.023529,0,0.0313725,1};
	soundEnter[]={"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
	soundPush[]={"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
	soundClick[]={"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
	soundEscape[]={"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
	shadow=0;
	font="PuristaMedium";
	sizeEx=0.05;
	offsetX=0.003;
	offsetY=0.003;
	offsetPressedX=0.002;
	offsetPressedY=0.002;
	borderSize=0;
	class Attributes
	{
		font = "RobotoCondensed";
		color = "#ffffff";
		colorLink = "#D09B43";
		align = "center";
		shadow = 1;
	};
};

class RscButtonMenuCancel : RscButton
{
	access=0;
	idc=-1;
	type=1;
	style=2;
	text="";
	action="";
	colorText[]={1,1,1,0.9};
	colorDisabled[]={0.6,0.1,0.3,0};
	colorBackground[]={0, 0, 0,1};
	colorBackgroundDisabled[]={0,0.0,0};
	colorBackgroundActive[]={1,1,1,0.7};
	colorFocused[]={0.58,0.05,0,0.7};
	colorShadow[]={0.023529,0,0.0313725,1};
	colorBorder[]={0.023529,0,0.0313725,1};
	soundEnter[]={"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
	soundPush[]={"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
	soundClick[]={"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
	soundEscape[]={"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
	shadow=0;
	font="PuristaMedium";
	sizeEx=0.05;
	offsetX=0.003;
	offsetY=0.003;
	offsetPressedX=0.002;
	offsetPressedY=0.002;
	borderSize=0;
	class Attributes
	{
		font = "RobotoCondensed";
		color = "#ffffff";
		colorLink = "#D09B43";
		align = "center";
		shadow = 1;
	};
};

class RscExilebotTraderDialog {
	idd = 24028;
	onLoad = "uiNamespace setVariable ['RscExilebotTraderDialog', _this select 0]";
	onUnload = "call ExileClient_gui_botTraderDialog_event_onUnload; uiNamespace setVariable ['RscExilebotTraderDialog', displayNull]";
	
	class controlsBackground {
		class DialogBackground : RscExileBotText {
			idc = 1000;
			x = "0.5 * safezoneW / 40 + safezoneX";
			y = "0.5 * safezoneH / 25 + safezoneY";
			w = "8 * safezoneW / 40";
			h = "9.5 * safezoneH / 25";
			colorBackground[] = {0.2, 0.2, 0.2, 0.7};
		};
		
		class DialogTitle : RscExileBotStructuredText {
			idc = 1001;
			text = "BOTS LISTS";
			x = "1 * safezoneW / 40 + safezoneX";
			y = "0.7 * safezoneH / 25 + safezoneY";
			w = "7 * safezoneW / 40";
			h = "1 * safezoneH / 25";
			sizeEx = "1 * safezoneH / 25";
		};
		
		class okBackground : RscExileBotText {
			idc = 1002;
			x = "0.5 * safezoneW / 40 + safezoneX";
			y = "19.5 * safezoneH / 25 + safezoneY";
			w = "8 * safezoneW / 40";
			h = "2.1 * safezoneH / 25";
			colorBackground[] = {0.2, 0.2, 0.2, 0.7};
		};
		
		class DialogWeaponBackground : RscExileBotText {
			idc = 1003;
			x = "0.5 * safezoneW / 40 + safezoneX";
			y = "10.5 * safezoneH / 25 + safezoneY";
			w = "8 * safezoneW / 40";
			h = "7.85 * safezoneH / 25";
			colorBackground[] = {0.2, 0.2, 0.2, 0.7};
		};
		
		class DialogWeaponTitle : RscExileBotStructuredText {
			idc = 1004;
			text = "WEAPON/ITEM BOTS";
			x = "1 * safezoneW / 40 + safezoneX";
			y = "10.7 * safezoneH / 25 + safezoneY";
			w = "7 * safezoneW / 40";
			h = "1 * safezoneH / 25";
			sizeEx = "1 * safezoneH / 25";
		};
		
		class CancelBackground : RscExileBotText {
			idc = 1006;
			x = "0.5 * safezoneW / 40 + safezoneX";
			y = "22 * safezoneH / 25 + safezoneY";
			w = "8 * safezoneW / 40";
			h = "2.1 * safezoneH / 25";
			colorBackground[] = {0.2, 0.2, 0.2, 0.7};
		};
	};
	
	class controls {
		class CategoryDropDown : RscExileBotCombo {
			idc = 4000;
			text = "All";
			x = "1 * safezoneW / 40 + safezoneX";
			y = "1.8 * safezoneH / 25 + safezoneY";
			w = "7 * safezoneW / 40";
			h = "0.7 * safezoneH / 25";
			onLBSelChanged = "_this call ExileClient_gui_botTraderDialog_event_onCategoryDropDownSelectionChanged";
		};
		
		class VehiclesListBox : RscExileItemListBox {
			idc = 4001;
			x = "1 * safezoneW / 40 + safezoneX";
			y = "2.6 * safezoneH / 25 + safezoneY";
			w = "7 * safezoneW / 40";
			h = "7 * safezoneH / 25";
			onLBSelChanged = "_this call ExileClient_gui_botTraderDialog_event_onBotListBoxSelectionChanged";
		};
		
		class ButtonPurchase : RscButtonMenuOK {
			idc = 4002;
			text = "BUY BOT";
			x = "1 * safezoneW / 40 + safezoneX";
			y = "20 * safezoneH / 25 + safezoneY";
			w = "7 * safezoneW / 40";
			h = "1 * safezoneH / 25";
			action = "_this call ExileClient_gui_botTraderDialog_event_onPurchaseButtonClick";
			
			class Attributes : Attributes {
				font = "RobotoCondensed";
				color = "#000000";
				colorLink = "#df3131";
				align = "center";
				shadow = 1;
			};
		};
		
		class WeaponListBox : RscExileItemListBox {
			idc = 4005;
			x = "1 * safezoneW / 40 + safezoneX";
			y = "11.9 * safezoneH / 25 + safezoneY";
			w = "7 * safezoneW / 40";
			h = "6 * safezoneH / 25";
			onLBSelChanged = "";
		};
		
		class CancelButton : RscButtonMenuCancel {
			idc = 4006;
			text = "CANCEL";
			x = "1 * safezoneW / 40 + safezoneX";
			y = "22.5 * safezoneH / 25 + safezoneY";
			w = "7 * safezoneW / 40";
			h = "1 * safezoneH / 25";
			action = "closeDialog 0";
			
			class Attributes
			{
				font = "RobotoCondensed";
				color = "#000000";
				colorLink = "#df3131";
				align = "center";
				shadow = 1;
			};
		};
	};
};

class RscExilebotComandDialog {
	idd = 24029;
	onLoad = "uiNamespace setVariable ['RscExilebotComandDialog', _this select 0]";
	onUnload = "call ExileClient_gui_botComandDialog_event_onUnload; uiNamespace setVariable ['RscExilebotComandDialog', displayNull]";
	
	class controlsBackground {
		class DialogBackground : RscExileBotText {
			idc = 1000;
			x = "0.5 * safezoneW / 40 + safezoneX";
			y = "0.5 * safezoneH / 25 + safezoneY";
			w = "8 * safezoneW / 40";
			h = "9.5 * safezoneH / 25";
			colorBackground[] = {0.2, 0.2, 0.2, 0};
		};
		class DialogTitle : RscExileBotStructuredText {
			idc = 1001;
			text = "ПЕРЕМЕЩЕНИЕ";
			x = "0.5 * safezoneW / 40 + safezoneX";
			y = "0.5 * safezoneH / 25 + safezoneY";
			w = "8 * safezoneW / 40";
			h = "0.7 * safezoneH / 25";
			sizeEx = "1 * safezoneH / 25";
			colorBackground[] = {0.9, 0, 0, 1};
		};
		class DialogTitleVehicle : RscExileBotStructuredText {
			idc = 1002;
			text = "ТРАНСПОРТ";
			x = "0.5 * safezoneW / 40 + safezoneX";
			y = "13 * safezoneH / 25 + safezoneY";
			w = "8 * safezoneW / 40";
			h = "0.7 * safezoneH / 25";
			sizeEx = "1 * safezoneH / 25";
			colorBackground[] = {0.9, 0, 0, 1};
		};
		class DialogTitleLoot : RscExileBotStructuredText {
			idc = 1003;
			text = "ЛУТ";
			x = "0.5 * safezoneW / 40 + safezoneX";
			y = "18.5 * safezoneH / 25 + safezoneY";
			w = "8 * safezoneW / 40";
			h = "0.7 * safezoneH / 25";
			sizeEx = "1 * safezoneH / 25";
			colorBackground[] = {0.9, 0, 0, 1};
		};
	};
	
	class controls {
		class CommandListBox : RscExileItemListBox {
			idc = 4000;
			x = "0.5 * safezoneW / 40 + safezoneX";
			y = "1.2 * safezoneH / 25 + safezoneY";
			w = "8 * safezoneW / 40";
			h = "11 * safezoneH / 25";
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
			colorSelectBackground[] = {0.251000, 0.035000, 0.035000, 1};
			colorSelectBackground2[] = {0.251000, 0.035000, 0.035000,1};
			rowHeight = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0, 0, 0, 1};
			onLBSelChanged = "_this call ExileClient_gui_botCommandDialog_event_onBotListBoxSelectionChanged";
		};
		
		class CommandListBoxVehicle : RscExileItemListBox {
			idc = 4001;
			x = "0.5 * safezoneW / 40 + safezoneX";
			y = "13.67 * safezoneH / 25 + safezoneY";
			w = "8 * safezoneW / 40";
			h = "4 * safezoneH / 25";
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
			colorSelectBackground[] = {0.251000, 0.035000, 0.035000, 1};
			colorSelectBackground2[] = {0.251000, 0.035000, 0.035000,1};
			rowHeight = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0, 0, 0, 1};
			onLBSelChanged = "_this call ExileClient_gui_botCommandDialog_event_onBotListBoxSelectionChanged";
		};
		
		class CommandListBoxLoot : RscExileItemListBox {
			idc = 4002;
			x = "0.5 * safezoneW / 40 + safezoneX";
			y = "19.2 * safezoneH / 25 + safezoneY";
			w = "8 * safezoneW / 40";
			h = "2.5 * safezoneH / 25";
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
			colorSelectBackground[] = {0.251000, 0.035000, 0.035000, 1};
			colorSelectBackground2[] = {0.251000, 0.035000, 0.035000,1};
			rowHeight = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0, 0, 0, 1};
			onLBSelChanged = "_this call ExileClient_gui_botCommandDialog_event_onBotListBoxSelectionChanged";
		};
	};
};