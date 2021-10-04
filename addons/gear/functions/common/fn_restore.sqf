/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\gear\functions\common\fn_restore.sqf
*	by Ojemineh
*
*	restores unit loadout
*
*	Arguments:
*	0: unit	- <OBJECT>
*
*	Return:
*	nothing
*
*	Example:
*	[player] call TFS_gear_fnc_restore;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {};

// -------------------------------------------------------------------------------------------------

if (not local _unit) exitwith {
    [_unit] remoteExecCall ["TFS_gear_fnc_restore", _unit];
};

// -------------------------------------------------------------------------------------------------

private _array = _unit getVariable ["TFS_gear_storage", []];
if (_array isEqualto []) exitwith {};

private _loadout = (_array select 0);
_unit setUnitLoadout [_loadout, false];

private _insignia = (_array select 1);
if (_insignia != "") then {
    [_unit, ""] call BIS_fnc_setUnitinsignia;
    [_unit, _insignia] call BIS_fnc_setUnitinsignia;
};

_unit setVariable ["TFS_gear_storage", nil, true];