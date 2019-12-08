//+------------------------------------------------------------------+
//|                 EA31337 - multi-strategy advanced trading robot. |
//|                       Copyright 2016-2019, 31337 Investments Ltd |
//|                                       https://github.com/EA31337 |
//+------------------------------------------------------------------+

/*
 *  This file is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.

 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

//+------------------------------------------------------------------+
//| Inputs.
//+------------------------------------------------------------------+


//input string __Trade_Parameters__ = "-- Trade parameters --"; // >>> TRADE <<<
//input ulong TimeframeFilter = 0; // Timeframes filter (0 - auto)
//input double MinPipChangeToTrade = 0.4; // Min pip change to trade (0 = every tick)

input string __Logging_Parameters__ = "-- Settings for logging & messages --"; // >>> LOGS & MESSAGES <<<
input ENUM_LOG_LEVEL VerboseLevel = V_INFO; // Level of log verbosity
input bool WriteSummaryReport = true; // Write summary report on finish

input string __Other_Parameters__ = "-- Other parameters --"; // >>> OTHER PARAMETERS <<<
input uint MagicNumber = 31337; // Starting EA magic number

input string __EA_Parameters__ = "-- End of input parameters for " + ea_name + " v" + ea_version + " --"; // >>> EA31337 <<<