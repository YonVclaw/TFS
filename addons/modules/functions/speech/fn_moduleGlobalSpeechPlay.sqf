/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\modules\functions\speech\fn_moduleGlobalSpeechPlay.sqf
*	by Ojemineh
*
*	module function
*
*	Arguments:
*	0: logic	- <OBJECT>
*	1: caller	- <OBJECT>
*
*	Return:
*	nothing
*
*	Example:
*	[] call TFS_fnc_moduleGlobalSpeechPlay;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_logic", "_caller", "_target"];

_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_caller = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_target = [_this, 2, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _logic) exitwith {};
if ((_logic getVariable ["enabled", 0]) isEqualto 0) exitwith {};

if (isNull _caller) exitwith {};
if (isNull _target) exitwith {};

// -------------------------------------------------------------------------------------------------

private _source = _logic getVariable ["source", ""];
private _sound = _logic getVariable ["sound", ""];
private _distance = _logic getVariable ["distance", 30];
private _maxdistance = _logic getVariable ["maxdistance", -1];
private _duration = _logic getVariable ["duration", -1];
private _onlyOnce = _logic getVariable ["onlyOnce", false];
private _reaction = _logic getVariable ["reaction", 0];
private _animation = _logic getVariable ["animation", ""];
private _codeStart = _logic getVariable ["codeStart", ""];
private _codeEnd = _logic getVariable ["codeEnd", ""];

// -------------------------------------------------------------------------------------------------

_codeStart = [_codeStart] call CBA_fnc_trim;
_codeEnd = [_codeEnd] call CBA_fnc_trim;

// -------------------------------------------------------------------------------------------------

[_logic, _caller, _target, _source, _sound, _distance, _maxdistance, _duration, _onlyOnce, _reaction, _animation, _codeStart, _codeEnd] spawn {
    params ["_logic", "_caller", "_target", "_source", "_sound", "_distance", "_maxdistance", "_duration", "_onlyOnce", "_reaction", "_animation", "_codeStart", "_codeEnd"];
    
    if (_onlyOnce) then {
        _target setVariable ["tfs_playedonce", true, true];
    };
    
    [_target, _target, true] call ACE_common_fnc_claim;
    
    private _isAnimEnabled = _target checkAifeature "ANIM";
    private _ismoveEnabled = _target checkAifeature "move";
    private _isPathenabled = _target checkAifeature "PATH";
    private _unitPosition = getPosASL _target;
    private _unitdirection = getDir _target;
    
    [_target, [_caller, 4]] remoteExecCall ["reveal", 0];
    [_caller, [_target, 4]] remoteExecCall ["reveal", 0];
    
    if (_reaction > 0) then {
        switch (_reaction) do {
            case 1: {
                _target disableAI "PATH";
                _target doWatch _caller;
            };
            case 2: {
                // _target disableAI "move";
                // _target setDir (_target getDir _caller);
                _target disableAI "PATH";
                _target doWatch (ASLtoAGL (eyePos _caller));
            };
            case 3: {
                if (_animation != "") then {
                    _target disableAI "ANIM";
                    _target disableAI "move";
                    [_target, _animation] remoteExecCall ["switchMove", 0];
                };
            };
            default {};
        };
    };
    
    [_target, _sound, _distance, _maxdistance, _duration, 1, true] call TFS_fnc_speak3d;
    
    if (_codeStart != "") then {
        [_logic, _caller, _target, _codeStart] spawn {
            params ["_logic", "_caller", "_target", "_codeStart"];
            private _codeparams = "params ['_logic', '_caller', '_target'];
            ";
            private _func = compile (_codeparams + _codeStart);
            [_logic, _caller, _target] call _func;
        };
    };
    
    sleep 0.2;
    
    waitUntil {
        if (!(_target getVariable ["tfs_speak3d", false])) exitwith {
            true
        };
        false
    };
    
    if (_reaction > 0) then {
        switch (_reaction) do {
            case 1: {
                _target doWatch objNull;
                if (_isPathenabled) then {
                    _target enableAI "PATH";
                } else {
                    _target disableAI "PATH";
                };
            };
            case 2: {
                // _target setDir _unitdirection;
                // if (_ismoveEnabled) then {
                    _target enableAI "move";
                } else {
                    _target disableAI "move";
                };
                _target doWatch objNull;
                if (_isPathenabled) then {
                    _target enableAI "PATH";
                } else {
                    _target disableAI "PATH";
                };
            };
            case 3: {
                if (_animation != "") then {
                    [_target, ""] remoteExecCall ["switchMove", 0];
                    _target setPosASL _unitPosition;
                    _target setDir _unitdirection;
                    if (_ismoveEnabled) then {
                        _target enableAI "move";
                    } else {
                        _target disableAI "move";
                    };
                    if (_isAnimEnabled) then {
                        _target enableAI "ANIM";
                    } else {
                        _target disableAI "ANIM";
                    };
                };
            };
            default {};
        };
        
        if (_codeEnd != "") then {
            [_logic, _caller, _target, _codeEnd] spawn {
                params ["_logic", "_caller", "_target", "_codeEnd"];
                private _codeparams = "params ['_logic', '_caller', '_target'];
                ";
                private _func = compile (_codeparams + _codeEnd);
                [_logic, _caller, _target] call _func;
            };
        };
        
        [objNull, _target, false] call ACE_common_fnc_claim;
    };