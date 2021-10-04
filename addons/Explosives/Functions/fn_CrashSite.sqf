/*
Function: TFS_fnc_CrashSite

Description:
Simulates an aircraft being shot down. players are knocked unconscious and awake near the crash
location, basically like Lost.

Arguments:
_stage - Used to execute a specific part of this function. <strinG>
_vehicle - Variable name of aircraft to be 'crashed'. <OBJECT>
_crashsite - Location of crash site. <OBJECT or ARRAY>
_players - Returns players in _vehicle. <ARRAY>

Examples:
(begin example)
["", [CrashPlane, getPos crashSite]] call TFS_fnc_crashSite;
["", [MyPlane, [1234, 4321, 0]]] call TFS_fnc_crashSite;
(end)

Authors: MitchJC & Mokka
*/

if (!isServer) exitwith {};

params [["_stage", "init"], ["_args", []]];

_args params ["_vehicle", "_crashSite", ["_players", []]];

switch (_stage) do {
    case "init": {
        _players = [];
        
        {
            if (objectParent _x == _vehicle) then {
                _players pushBackUnique _x;
            };
        } forEach allplayers;
        
        fnc_blurEffects = {
            "dynamicBlur" ppEffectEnable true;
            "dynamicBlur" ppEffectAdjust [8];
            "dynamicBlur" ppEffectCommit 0;
            "dynamicBlur" ppEffectAdjust [0.0];
            "dynamicBlur" ppEffectCommit 20;
        };
        
        fnc_Black_in = {
            1 cuttext ["", "BLACK in", 10];
        };
        
        fnc_Black_Out = {
            1 cuttext ["", "BLACK OUT", 5];
        };
        
        publicVariable "fnc_Black_Out";
        publicVariable "fnc_Black_in";
        publicVariable "fnc_blurEffects";
        
        {
            "Aircraft_alarm" remoteExec ["playSound", _x];
        } forEach _players;
        
        [
            {
                ["fadeOut", _this] call TFS_fnc_crashSite;
            }, [_vehicle, _crashSite, _players], 2
        ] call CBA_fnc_waitandexecute;
    };
    
    case "fadeOut": {
        if (isEngineOn _vehicle) then {
            [_vehicle, false] remoteExec ["engineOn", _vehicle];
        };
        
        {
            remoteExecCall ["fnc_Black_Out", _x];
            [true] remoteExec ["disableUserinput", _x];
        } forEach _players;
        
        [
            {
                ["fadeSound", _this] call TFS_fnc_crashSite;
            }, _args, 9
        ] call CBA_fnc_waitandexecute;
    };
    
    case "fadeSound": {
        {
            [2, 0] remoteExec ["fadeSound", _x];
            moveOut _x;
        } forEach _players;
        
        [
            {
                ["teleport", _this] call TFS_fnc_crashSite;
            }, _args, 2
        ] call CBA_fnc_waitandexecute;
    };
    
    case "teleport": {
        {
            // https://community.bistudio.com/wiki/vectorAdd
            _randomPos = _crashSite vectorAdd [random 300, random 300, 0];
            
            // preliminary shit, test if people lose their stuff or no
            _x action ["Eject", _vehicle];
            // _x setvelocity [0, 0, 0];
            [false] remoteExec ["allowdamage", _x];
            _x setPos _randomPos;
        } forEach _players;
        
        [
            {
                ["woundandEnable", _this] call TFS_fnc_crashSite;
            }, _args, 1
        ] call CBA_fnc_waitandexecute;
    };
    
    case "woundandEnable": {
        _bodyParts = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
        _injurytypes = ["bullet", "vehiclecrash"];
        
        {
            [true] remoteExec ["allowdamage", _x];
            [false] remoteExec ["disableUserinput", _x];
            [_x, "AidlPpneMstpSnonWnonDnon_AI"] remoteExec ["switchMove", _x];
            [_x] remoteExecCall ["ACE_medical_treatment_fnc_fullHeallocal", _x];
            
            for "_i" from 0 to (1+ random 4) do {
                [_x, 0.2, selectRandom _bodyParts, selectRandom _injurytypes] remoteExecCall ["ace_medical_fnc_adddamagetoUnit", 0];
            };
        } forEach _players;
        
        [
            {
                ["effects", _this] call TFS_fnc_crashSite;
            }, _args, 3
        ] call CBA_fnc_waitandexecute;
    };
    
    case "effects": {
        skiptime 2;
        
        {
            remoteExec ["fnc_blurEffects", _x];
            remoteExecCall ["fnc_Black_in", _x];
            [10, 1] remoteExec ["fadeSound", _x];
        } forEach _players;
        
        [
            {
                ["finish", _this] call TFS_fnc_crashSite;
            }, _args, 1
        ] call CBA_fnc_waitandexecute;
    };
    
    case "finish": {
        deletevehicle _vehicle;
    };
    
    default {
        ["init", _args] call TFS_fnc_crashSite;
    };
};