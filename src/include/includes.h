//+------------------------------------------------------------------+
//|                 EA31337 - multi-strategy advanced trading robot. |
//|                       Copyright 2016-2021, 31337 Investments Ltd |
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

// Includes EA framework.
#include "EA31337-classes/Account.mqh"
#include "EA31337-classes/Chart.mqh"
#include "EA31337-classes/EA.mqh"
#include "EA31337-classes/Log.mqh"
#include "EA31337-classes/Order.mqh"
#include "EA31337-classes/Report.mqh"
#include "EA31337-classes/Strategy.mqh"
#include "EA31337-classes/SummaryReport.mqh"
#include "EA31337-classes/Trade.mqh"

// Includes indicator classes.
#include "EA31337-classes/Indicators/Indi_AC.mqh"
#include "EA31337-classes/Indicators/Indi_AD.mqh"
#include "EA31337-classes/Indicators/Indi_ADX.mqh"
#include "EA31337-classes/Indicators/Indi_AO.mqh"
#include "EA31337-classes/Indicators/Indi_ATR.mqh"
#include "EA31337-classes/Indicators/Indi_Alligator.mqh"
#include "EA31337-classes/Indicators/Indi_BWMFI.mqh"
#include "EA31337-classes/Indicators/Indi_Bands.mqh"
#include "EA31337-classes/Indicators/Indi_BearsPower.mqh"
#include "EA31337-classes/Indicators/Indi_BullsPower.mqh"
#include "EA31337-classes/Indicators/Indi_CCI.mqh"
#include "EA31337-classes/Indicators/Indi_DeMarker.mqh"
#include "EA31337-classes/Indicators/Indi_Envelopes.mqh"
#include "EA31337-classes/Indicators/Indi_Force.mqh"
#include "EA31337-classes/Indicators/Indi_Fractals.mqh"
#include "EA31337-classes/Indicators/Indi_Gator.mqh"
#include "EA31337-classes/Indicators/Indi_HeikenAshi.mqh"
#include "EA31337-classes/Indicators/Indi_Ichimoku.mqh"
#include "EA31337-classes/Indicators/Indi_MA.mqh"
#include "EA31337-classes/Indicators/Indi_MACD.mqh"
#include "EA31337-classes/Indicators/Indi_MFI.mqh"
#include "EA31337-classes/Indicators/Indi_Momentum.mqh"
#include "EA31337-classes/Indicators/Indi_OBV.mqh"
#include "EA31337-classes/Indicators/Indi_OsMA.mqh"
#include "EA31337-classes/Indicators/Indi_Price.mqh"
#include "EA31337-classes/Indicators/Indi_RSI.mqh"
#include "EA31337-classes/Indicators/Indi_RVI.mqh"
#include "EA31337-classes/Indicators/Indi_SAR.mqh"
#include "EA31337-classes/Indicators/Indi_StdDev.mqh"
#include "EA31337-classes/Indicators/Indi_Stochastic.mqh"
#include "EA31337-classes/Indicators/Indi_WPR.mqh"
#include "EA31337-classes/Indicators/Indi_ZigZag.mqh"

// Strategy includes.
INPUT string __Strategy_Parameters__ = "-- Strategy parameters --";  // >>> STRATEGIES <<<
#include "EA31337-strategies/strategies.h"
