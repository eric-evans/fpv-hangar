-------------------------------------------------------------------------------
-- TBS Agent Lite 0.96
-- release date: 2022-02
-- written by JimB40 for TBS
-------------------------------------------------------------------------------
local toolName = "TNS|TBS Agent Lite|TNE"
local SP = '/SCRIPTS/TOOLS/TBSAGENTLITE/'
return {run=(loadScript(SP..'loader','Tx')('SA',SP)).run}
