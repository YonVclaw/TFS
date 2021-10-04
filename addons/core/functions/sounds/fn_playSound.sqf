/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\sounds\fn_playSound.sqf
*	by Ojemineh
*
*	play sound for all players
*
*	Arguments:
*	0: soundClass - <strinG>
*	1: isSpeech - <BOOLEAN>
*
*	Return:
*	nothing
*
*	Example:
*	["Earthquake_01"] call TFS_fnc_playSound;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_soundClass", "_isSpeech"];

_soundClass	= [_this, 0, "", [""]] call BIS_fnc_param;
_isSpeech	= [_this, 1, true, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_soundClass isEqualto "") exitwith {};

// -------------------------------------------------------------------------------------------------

[_soundClass, _isSpeech] remoteExecCall ["TFS_fnc_playSoundlocal", 0, false];