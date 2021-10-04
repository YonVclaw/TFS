#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function checks if grass should be forced, enables it and schedules next check.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Public: No
*/

if (!GVAR(enabled)) exitwith {};

// if >25 then grass is disabled
if (getTerrainGrid > 25) then {
    setTerrainGrid 25
};

[FUNC(loop), [], 1] call CBA_fnc_waitandexecute;

nil