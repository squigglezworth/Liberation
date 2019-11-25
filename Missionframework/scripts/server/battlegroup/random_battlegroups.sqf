private ["_sleeptime"];

uiSleep (900 / GRLIB_csat_aggressivity);
while {GRLIB_csat_aggressivity > 0.9 && GRLIB_endgame == 0} do {

    _sleeptime =  (2100 + (random 2100)) / (([] call KPLIB_fnc_getOpforFactor) * GRLIB_csat_aggressivity);

    if (combat_readiness >= 80) then {_sleeptime = _sleeptime * 0.75};
    if (combat_readiness >= 90) then {_sleeptime = _sleeptime * 0.75};
    if (combat_readiness >= 95) then {_sleeptime = _sleeptime * 0.75};

    uiSleep _sleeptime;

    if (!isNil "GRLIB_last_battlegroup_time") then {
        waitUntil {
            uiSleep 5;
            diag_tickTime > (GRLIB_last_battlegroup_time + (2100 / GRLIB_csat_aggressivity))
        };
    };

    if (
        (count (allPlayers - entities "HeadlessClient_F") >= (10 / GRLIB_csat_aggressivity)) &&
        ([] call F_opforCap < GRLIB_battlegroup_cap) &&
        (combat_readiness >= 70) &&
        (diag_fps > 15.0)
    )  then {
        [] spawn spawn_battlegroup;
    };
};
