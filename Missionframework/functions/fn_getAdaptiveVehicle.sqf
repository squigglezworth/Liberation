/*
    File: fn_getAdaptiveVehicle.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2019-11-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Provides a vehicle classname depending on the combat readiness.

    Parameter(s):
        NONE

    Returns:
        Vehicle classname [STRING]
*/

if (combat_readiness < 40) then {
    selectRandom opfor_vehicles_low_intensity
} else {
    selectRandom opfor_vehicles
};
