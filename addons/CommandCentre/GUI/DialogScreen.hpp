class ScreenConfigDialog {

	idd = 21822;

    class controlsBackground {
        class Backdrop: TFSRHS_CC_RscText
        {
        	idc = 1001;
        	x = 8 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 24 * GUI_GRID_CENTER_W;
        	h = 13 * GUI_GRID_CENTER_H;
        	colorBackground[] = {0.2,0.2,0.2,1};
        };
    };
    class controls {
        class TitleText: TFSRHS_CC_RscText
        {
        	idc = 1000;
            style = "ST_TITLE_BAR";
        	text = "Configure Screen";
        	x = 8 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 4 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 24 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        	colorBackground[] = {0.2,0.4,0.2,1};
        };
        class CamText: TFSRHS_CC_RscText
        {
        	idc = 1002;
        	text = "View Helmet Camera";
        	x = 9 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 6 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 10 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class DroneText: TFSRHS_CC_RscText
        {
        	idc = 1003;
        	text = "View Drone Camera";
        	x = 9 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 10 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class SatText: TFSRHS_CC_RscText
        {
        	idc = 1004;
        	text = "View Satellite Imagery";
        	x = 9 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 14 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 10 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class ButtonCancel: TFSRHS_CC_RscButton
        {
			idc = 1101;
        	x = 27 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 18.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 5 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
			text = "Cancel";
        };
        class CamSelectText: TFSRHS_CC_RscText
        {
        	idc = 1006;
        	text = "Target:";
        	x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 8 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 4 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class DroneSelectText: TFSRHS_CC_RscText
        {
        	idc = 1007;
        	text = "Drone:";
        	x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 12 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 4 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class SatSelectText: TFSRHS_CC_RscText
        {
        	idc = 1008;
        	text = "Center on:";
        	x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 16 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 4 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class CamSelectCombo: TFSRHS_CC_RscCombo
        {
        	idc = 2100;
        	x = 15 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 8 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 11 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class DroneSelectCombo: TFSRHS_CC_RscCombo
        {
        	idc = 2101;
        	x = 15 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 12 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 11 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class SatSelectCombo: TFSRHS_CC_RscCombo
        {
        	idc = 2102;
        	x = 15 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 16 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 11 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class CamViewButton: TFSRHS_CC_RscButton
        {
        	idc = 2400;
        	text = "View";
        	x = 27.9 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 8 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 3.1 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class DroneViewPltButton: TFSRHS_CC_RscButton
        {
        	idc = 2401;
        	text = "PLT";
        	x = 27.9 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 12 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 1.5 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class DroneViewGnrButton: TFSRHS_CC_RscButton
        {
        	idc = 2403;
        	text = "GNR";
        	x = 29.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 12 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 1.5 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class SatViewButton: TFSRHS_CC_RscButton
        {
        	idc = 2402;
        	text = "View";
        	x = 27.9 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 16 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 3.1 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
    };
};
