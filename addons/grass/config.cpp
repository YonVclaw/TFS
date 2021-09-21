#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "TFSRHS_common"
        };
        author = AUTHOR;
        VERSION_CONFIG;
    };
};


#include "CfgEventHandlers.hpp"
