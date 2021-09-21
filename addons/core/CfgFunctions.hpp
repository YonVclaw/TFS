class CfgFunctions {
	
	class TFSRHS_core {
		
		tag = "tfsrhs_core";
		
		class core {
			file = "z\tfsrhs\addons\core\functions";
			class initialize {};
			class initSettings {};
		};
		
	};
	
	class TFSRHS_Functions {
		
		tag = "tfsrhs";
		
		class Addons {
			file = "z\tfsrhs\addons\core\functions\addons";
			class getAddonAuthor {};
			class getAddonAuthors {};
			class getAddonName {};
			class getAddonRequiredAddons {};
			class getAddonRequiredVersion {};
			class getAddonUnits {};
			class getAddonURL {};
			class getAddonVersion {};
			class getAddonVersionArray {};
			class getAddonVersionString {};
			class getAddonWeapons {};
			class isAddon {};
		};
		
		class core {
			file = "z\tfsrhs\addons\core\functions\common";
			class addItem {};
			class attachToRel {};
			class createLitter {};
			class createLitterServer {};
			class getUnitInsignia {};
			class isAdmin {};
			class isCurator {};
			class isInBuilding {};
			class screenshot {};
			class setUnitInsignia {};
		};
		
		class Diagnostic {
			file = "z\tfsrhs\addons\core\functions\diagnostics";
			class diagLog {};
			class diagLogGlobal {};
			class diagLogServer {};
			class isDebug {};
			class log {};
			class logGlobal {};
			class logServer {};
		};
				
		class Settings {
			file = "z\tfsrhs\addons\core\functions\settings";
			class getKeybindString {};
			class needRestart {};
			class needRestartLocal {};
		};
		
		class Sounds {
			file = "z\tfsrhs\addons\core\functions\sounds";
			class decibelToGain {};
			class gainToDecibel {};
			class getSoundDistance {};
			class getSoundDuration {};
			class getSoundFile {};
			class getSoundPitch {};
			class getSoundVolume {};
			class isSpeaking {};
			class loop3dSound {};
			class loop3dSoundLocal {};
			class play3dSound {};
			class play3dSoundLocal {};
			class playSound {};
			class playSoundLocal {};
			class playSound3d {};
			class say3d {};
			class say3dLocal {};
			class speak3d {};
			class speak3dLocal {};
			class stop3dSound {};
			class stop3dSoundLocal {};
		};
		
		class Videos {
			file = "z\tfsrhs\addons\core\functions\videos";
			class playVideo {};
			class playVideoOnce {};
			class videoKeyDown {};
		};
		
	};
	
};
