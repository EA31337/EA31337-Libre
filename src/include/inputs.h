//+------------------------------------------------------------------+
//|                              EA31337 Libre - Forex trading robot |
//|                                 Copyright 2016-2021, EA31337 Ltd |
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

input static string __Strategy_Active__ = "-- Active strategy --";  // >>> ACTIVE STRATEGY <<<
input ENUM_STRATEGY EA_Strategy = (ENUM_STRATEGY)STRAT_MFI;         // Strategy
input static string __Strategy_Timeframes__ = "-- [M1=1,M5=2,M15=4,M30=8,H1=16,H8=32...] --";  // >>> TIMEFRAMES <<<
input unsigned int EA_Strategy_Active_Tf = 12;                                                 // Timeframes

extern string __EA_Risk_Params__ = "-- EA's risk management --";  // >>> EA's RISK <<<
input float EA_Risk_MarginMax = 5.0f;                             // Max margin to risk (in %)

input string __Logging_Parameters__ = "-- Settings for logging & messages --";  // >>> LOGS & MESSAGES <<<
input bool PrintLogOnChart = true;                                              // Display info on chart
input ENUM_LOG_LEVEL VerboseLevel = V_INFO;                                     // Level of log verbosity
// input bool WriteSummaryReport = true;                                           // Write summary report on finish

input string __Other_Parameters__ = "-- Other parameters --";  // >>> OTHER PARAMETERS <<<
input bool EA_DisplayDetailsOnChart = true;                    // Display EA details on chart
input uint EA_MagicNumber = 31337;                             // Starting EA magic number

input string __EA_Parameters__ =
    "-- End of input parameters for " + ea_name + " v" + ea_version + " --";  // >>> EA31337 <<<
