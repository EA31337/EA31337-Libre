//+------------------------------------------------------------------+
//|                              EA31337 Libre - Forex trading robot |
//|                                 Copyright 2016-2022, EA31337 Ltd |
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
input string __EA_Params__ =
    ">> " + ea_name + " v" + ea_version + " build " + (string)(int)__DATETIME__ + " <<";  // >>> EA31337 Libre <<<
#ifdef __MQL4__
input static string __EA_Strategy__ = "-- Trading strategy --";  // >>> TRADING STRATEGY <<<
#else
input group "Trading strategy"
#endif
input ENUM_STRATEGY EA_Strategy = STRAT_ALLIGATOR;  // Strategy
input unsigned int EA_Strategy_Active_Tf =
    M30B + H1B + H2B + H3B + H4B + H6B + H8B;  // Timeframes (M1=1,M2=2,M5=16,M15=256,M30=1024,H1=2048,H2,H3,H4,H6,H8)

#ifdef __MQL4__
extern string __EA_Risk_Params__ = "-- Risk management --";  // >>> RISK <<<
#else
input group "Risk management"
#endif
input float EA_Risk_MarginMax = 1.0f;  // Max margin to risk (in %)

#ifdef __MQL4__
input string __Logging_Params__ = "-- Logging & messaging --";  // >>> LOGS & MESSAGES <<<
#else
input group "Logging & messaging"
#endif
input bool EA_DisplayDetailsOnChart = true;  // Display EA details on chart
input ENUM_LOG_LEVEL VerboseLevel = V_INFO;  // Level of log verbosity
// input bool WriteSummaryReport = true;                                           // Write summary report on finish

#ifdef __MQL4__
input string __Trade_Params__ = "-- Trade parameters --";  // >>> TRADE <<<
#else
input group "Trade parameters"
#endif
input uint EA_MagicNumber = 31337;  // Starting EA magic number
