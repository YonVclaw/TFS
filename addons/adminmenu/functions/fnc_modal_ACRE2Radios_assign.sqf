#include "\z\tfs\addons\adminmenu\script_component.hpp"

// Thanks to Snippers

params [["_radios", []], ["_network", -1]];

private _presetName = format ["TFS_preset%1", _network];
private _oldPresetName = ["ACRE_PRC343"] call acre_api_fnc_getPreset;

if (_network > -1 && !(_presetName isEqualto _oldPresetName)) then {
    {
        _x params ["_radiolist"];
        {
            [_x, _presetName] call acre_api_fnc_setPreset;
        } forEach _radiolist;
    } forEach EGVAR(acre, radioCoresettings);
};

{
    if (player canAdd _radio) then {
        player addItem _radio;
        systemChat format ["[TFS] Added radio: %1", _radio];
    } else {
        if (getContainermaxload uniform player > 0) then {
            (uniformContainer player) additemCargoGlobal [_radio, 1];
            systemChat format ["[TFS] Added radio (exceeds inventory capacity): %1", _radio];
        } else {
            systemChat format ["[TFS] Couldn't add radio: %1", _radio];
        };
        
        // todo: give addAction?
    };
} forEach _radios;

if (_network > -1 && !(_presetName isEqualto _oldPresetName)) then {
    [{
        [] call acre_api_fnc_isinitialized
    }, {
        params ["_unit", "_oldPresetName"];
        
        if (_unit != player) exitwith {};
        
        {
            _x params ["_radiolist"];
            {
                [_x, _oldPresetName] call acre_api_fnc_setPreset;
            } forEach _radiolist;
        } forEach EGVAR(acre, radioCoresettings);
    }, [player, _oldPresetName]] call CBA_fnc_waitUntilandexecute;
};