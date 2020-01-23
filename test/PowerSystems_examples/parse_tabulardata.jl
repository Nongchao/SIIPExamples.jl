using Pkg
Pkg.status()

using SIIPExamples
using PowerSystems
using TimeSeries
using Dates
using Logging
const PSY = PowerSystems
const IS = PSY.InfrastructureSystems;

PSY.download(PSY.TestData; branch = "master", force=true)
base_dir = dirname(dirname(pathof(PowerSystems)));

logger = IS.configure_logging(console_level = Logging.Error)

RTS_GMLC_DIR = joinpath(base_dir,"data/RTS_GMLC");
rawsys = PSY.PowerSystemTableData(RTS_GMLC_DIR,100.0, joinpath(RTS_GMLC_DIR,"user_descriptors.yaml"))

sys = System(rawsys; forecast_resolution = Dates.Hour(1));
sys

flush(logger)

# This file was generated using Literate.jl, https://github.com/fredrikekre/Literate.jl
