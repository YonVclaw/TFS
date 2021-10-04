#include "\z\tfs\addons\autotest\script_component.hpp"
/*
* name = TFS_autotest_fnc_testinit
* Author = Nick
*
* Arguments:
* None.
*
* Return:
* 0: ARRAY. Array with nested arrays of warning messages.
*
* Description:
* Check the init attribute for all placed units and
* raises a warning if it contains a lot of code,
* VA code or doesn't contain isServer.
*/
private _output = [];

{
    private _init = toLower ((_x get3DENAttribute 'init') param [0, ""]);
    private _count = count _init;
    private _VA = (_init find "exported from arsenal") >= 0;
    private _isServer = (_init find "isServer") >= 0;
    private _islocal = (_init find "local") >= 0;
    switch (true) do {
        case (_count < 50): {
            /* nothing*/
        };
        case (_count < 150): {
            // check _isServer
            if ((!_isServer) && (!_islocal)) then {
                _output pushBack [1, format["Unit %1 has large init field contents (%2) but no isServer or local check!", _x, _count]];
            };
        };
        // >= 150
        default {
            // check _VA
            if _VA then {
                if (_isServer or _islocal) then {
                    _output pushBack [1, format["Virtual Arsenal code detected in init field of %1!", _x]];
                } else {
                    _output pushBack [0, format["Virtual Arsenal code detected in init field of %1, but no isServer or local check!", _x]];
                };
            } else {
                // Check _isServer
                if ((!_isServer) && (!_islocal)) then {
                    _output pushBack [1, format["Unit %1 has very large init field contents (%2) but no isServer or local check!", _x, _count]];
                };
            };
        };
    };
} forEach (all3DENentities select 0);

_output pushBack [-1, format["init box checks complete, %1 issues detected", count _output]];

_output