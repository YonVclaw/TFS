/*
*	ARMA EXTENDED ENVIRONMENT
*	\tfs_common\functions\addons\fn_getAddonunits.sqf
*	by Ojemineh
*
*	get addon units
*
*	Arguments:
*	0: classname - <strinG>
*
*	Return:
*	<ARRAY>
*
*	Example:
*	["TFS_core"] call tfs_fnc_getAddonunits;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_classname"];

_classname = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

private _return = [];

if (isClass (configFile >> "CfgPatches" >> _classname)) then {
    _return = getArray (configFile >> "CfgPatches" >> _classname >> "units");
};

_return;