/*
Function: TFS_fnc_spawnexplosives

Description:
Utility function for spawning explosions and secondaries on objects,
positions or objectives.

Arguments:
_delay - The delay in seconds until the explosives go off <SCALAR>
_pos - The position of the objective about to blow up <position 3D>
_sub - Array containing the following information: [Amount of Secondaries, Delay after Main explosion, radius around _pos] <ARRAY>
_method - The type of destruction we want, that is the type of exlosive <strinG, defaults to: "Bo_mk82">

Return Values:
None

Examples:
nothing to see here

Author:
Martin (original: YAinA_F_..._fnc_destroy), ported and adjusted by Mokka
*/

if !(isServer) exitwith {};

[
    {
        params [
            "_delay",
            "_pos",
            ["_sub", [0, 10, 5]],
            ["_method", "Bo_mk82"]
        ];
        
        createvehicle [_method, _pos, [], 0, "CAN_COLLIDE"];
        
        private _csleep = _sub select 1;
        private _nsleep = (_sub select 1) * 2;
        
        if ((_sub select 0) > 0) then {
            for "_x" from 2 to ((_sub select 0)+1) do {
                private _m = _x % 2;
                private _s = 0;
                if (_m isEqualto 1) then {
                    _s = 0.25 + (random 0.75);
                };
                [
                    {
                        "SmallSecondary" createvehicle _this
                    },
                    [
                        _pos, floor(_x / 2) * (_sub select 2),
                        random 360
                    ] call BIS_fnc_relPos,
                    _csleep + _s
                ] call CBA_fnc_waitandexecute;
                
                if (_m isEqualto 1) then {
                    _nsleep = _nsleep / 2;
                    _csleep = _csleep + (_nsleep / 2);
                };
            };
        };
    }, _this, _this select 0
] call CBA_fnc_waitandexecute;