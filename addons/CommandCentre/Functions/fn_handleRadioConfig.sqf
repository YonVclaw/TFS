private _radio = uiNamespace getVariable "TFS_CC_currentradioObject";

// read out values
private _ch1freq = ctrltext 1400;
private _ch2freq = ctrltext 1401;
private _vol = parseNumber (ctrltext 1402);

// update radio
[_radio, 1, _ch1freq] remoteExec ["TFAR_fnc_setChannelFrequency", 2];
[_radio, 2, _ch2freq] remoteExec ["TFAR_fnc_setChannelFrequency", 2];
[_radio, _vol - 1] remoteExec ["TFAR_fnc_setLrVolume", 2];

closedialog 1;