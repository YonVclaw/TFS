/*
Arguments:
0: items only misc items <ARRAY of strinG>
1: tooltip <strinG> (Optional)
2: picture path <strinG> (Optional)
3: override a spezific button (0-9) <NUMBER> (Optional)

Return Value:
successful: number of the slot;
error: -1 <NUMBER>

Example:

call TFS_fnc_arsenal;

Public: Yes
*/

[
    ["ACRE_PRC117F", "ACRE_PRC152", "ACRE_PRC148", "TFAR_anprc152", "TFAR_anprc154", "ItemGPS", "alive_Tablet", "TFAR_rf7800str", "TFAR_anprc148jem", "Itemandroid", "ACE_microDAGR", "ACE_DAGR", "ItemcTabHCam", "ItemMicroDAGR", "ItemcTab", "ACE_ATragMX", "ACE_DAGR", "ACE_HuntIR_monitor", "ACE_Kestrel4500", "ACE_microDAGR", "tfw_rf3080Item", "tfw_blade", "tfw_whip", "tfw_dd"],
    "Tech",
    "\a3\ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"
] call ace_arsenal_fnc_addRightPanelButton;

[
    ["kat_stethoscope", "Empty_bloodIV_500", "Empty_bloodIV_250", "kat_crossPanel", "kat_aatKit", "kat_accuvac", "TFS_mopp", "kat_larynx", "kat_Painkiller", "kat_guedel", "ACE_adenosine", "kat_X_AED", "kat_AED", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_packingBandage", "ACE_quikclot", "kat_crossPanel", "kat_bloodIV_O", "kat_bloodIV_A", "kat_bloodIV_AB", "kat_bloodIV_B", "kat_bloodIV_A_250", "kat_bloodIV_O_250", "kat_bloodIV_AB_250", "kat_bloodIV_B_250", "kat_bloodIV_O_500", "kat_bloodIV_A_500", "kat_bloodIV_AB_500", "kat_bloodIV_B_500", "ACE_bodyBag", "TFS_FirstAid", "kat_chestSeal", "TFS_MedicArea", "ACE_epinephrine", "TFS_MedicKit", "ACE_morphine", "kat_Pulseoximeter", "ACE_plasmaIV", "ACE_plasmaIV_250", "ACE_plasmaIV_500", "ACE_personalAidKit", "ACE_salineIV", "ACE_salineIV_250", "ACE_salineIV_500", "TFS_Stethoscope", "ACE_surgicalKit", "ACE_tourniquet", "ACE_splint"],
    "Medical",
    "\z\ace\addons\medical_gui\data\categories\medication.paa"
] call ace_arsenal_fnc_addRightPanelButton;

[
    ["ACE_SpraypaintBlack", "ACE_SpraypaintBlue", "ACE_Spraypaintgreen", "ACE_SpraypaintRed"],
    "Paint",
    "\z\ace\addons\arsenal\data\iconCustom.paa"
] call ace_arsenal_fnc_addRightPanelButton;

[
    ["USP_BAT_PVS31", "USP_BOLTCUTTER", "USP_CARABinER", "USP_ROAM2", "USP_CROWBAR", "USP_CRYE_KNEEPAD", "USP_FAST_COVER", "USP_FAST_COVER_CBR", "USP_FAST_COVER_MC", "USP_FAST_COVER_RGR", "USP_EARMUFF_GRN", "USP_EARMUFF_tan", "USP_faceSHIELD", "USP_faceSHIELD_GRN", "USP_WRISTWATCH", "USP_GOGGLE_COVER", "USP_GOGGLE_COVER_FG", "USP_GOGGLE_COVER_MC", "USP_GUNSIGHT", "USP_GUNSIGHT_MC", "USP_GUNSIGHT_tan", "USP_countERWEIGHT_CBR", "USP_countERWEIGHT_MC", "USP_countERWEIGHT_RGR", "USP_ACC_GPNVG18", "USP_ACC_PVS14", "USP_ACC_PVS15", "USP_ACC_PVS31", "USP_MOHOC", "USP_CHARGE", "USP_MS2000", "USP_MECHANIX", "USP_MECHANIX_BLK2", "USP_MECHANIX_CBR2", "USP_MECHANIX_GRN", "USP_MECHANIX_GRY", "USP_MECHANIX_MC", "USP_NIGHTCAP_CBR", "USP_NIGHTCAP_MC", "USP_NIGHTCAP_MCA", "USP_NIGHTCAP_MCD", "USP_NIGHTCAP_MCT", "USP_NIGHTCAP_RGR", "USP_OVERLorD", "USP_OVERLorD_GRN", "USP_OVERLorD_MC", "USP_OVERLorD_MIX", "USP_OVERLorD_tan", "USP_toMAHAWK", "USP_ZIPTIE", "USP_SEALstrIKE", "USP_OVERLorD_CBR", "USP_NIGHTCAP_MCB", "USP_MOHOC_GRN", "USP_ACC_GPNVG18_tan", "USP_countERWEIGHT", "USP_ACC_NSEAS", "USP_faceSHIELD_tan", "USP_GOGGLE_COVER_tan", "USP_MECHANIX_CBR", "USP_NIGHTCAP", "USP_EARMUFF"],
    "USP",
    "z\tfs\addons\Equipment\data\usp_icon.paa"
] call ace_arsenal_fnc_addRightPanelButton;