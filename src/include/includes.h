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

// Defines.
#include "define.h"

// Includes EA framework.
#include "classes/Account.mqh"
#include "classes/Chart.mqh"
#include "classes/EA.mqh"
#include "classes/Log.mqh"
#include "classes/Order.mqh"
#include "classes/Pattern.mqh"
#include "classes/Report.mqh"
#include "classes/Strategy.mqh"
#include "classes/SummaryReport.mqh"
#include "classes/Trade.mqh"

// Includes indicator classes.
#include "classes/Indicators/Indi_AC.mqh"
#include "classes/Indicators/Indi_AD.mqh"
#include "classes/Indicators/Indi_ADX.mqh"
#include "classes/Indicators/Indi_ADXW.mqh"
#include "classes/Indicators/Indi_AMA.mqh"
#include "classes/Indicators/Indi_AO.mqh"
#include "classes/Indicators/Indi_ASI.mqh"
#include "classes/Indicators/Indi_ATR.mqh"
#include "classes/Indicators/Indi_Alligator.mqh"
#include "classes/Indicators/Indi_BWMFI.mqh"
#include "classes/Indicators/Indi_Bands.mqh"
#include "classes/Indicators/Indi_BearsPower.mqh"
#include "classes/Indicators/Indi_BullsPower.mqh"
#include "classes/Indicators/Indi_CCI.mqh"
#include "classes/Indicators/Indi_CHO.mqh"
#include "classes/Indicators/Indi_DEMA.mqh"
#include "classes/Indicators/Indi_DeMarker.mqh"
#include "classes/Indicators/Indi_Envelopes.mqh"
#include "classes/Indicators/Indi_Force.mqh"
#include "classes/Indicators/Indi_Fractals.mqh"
#include "classes/Indicators/Indi_Gator.mqh"
#include "classes/Indicators/Indi_HeikenAshi.mqh"
#include "classes/Indicators/Indi_Ichimoku.mqh"
#include "classes/Indicators/Indi_MA.mqh"
#include "classes/Indicators/Indi_MACD.mqh"
#include "classes/Indicators/Indi_MFI.mqh"
#include "classes/Indicators/Indi_Momentum.mqh"
#include "classes/Indicators/Indi_OBV.mqh"
#include "classes/Indicators/Indi_OsMA.mqh"
#include "classes/Indicators/Indi_Pattern.mqh"
#include "classes/Indicators/Indi_Pivot.mqh"
#include "classes/Indicators/Indi_Price.mqh"
#include "classes/Indicators/Indi_RSI.mqh"
#include "classes/Indicators/Indi_RVI.mqh"
#include "classes/Indicators/Indi_SAR.mqh"
#include "classes/Indicators/Indi_StdDev.mqh"
#include "classes/Indicators/Indi_Stochastic.mqh"
#include "classes/Indicators/Indi_WPR.mqh"
#include "classes/Indicators/Indi_ZigZag.mqh"

// Enums.
#include "enum.h"
#include "strategies/enum.h"

// Main user inputs.
#include "inputs.h"

// Strategy includes.
INPUT string __Strategy_Parameters__ = "-- Strategy parameters --";  // >>> STRATEGIES <<<
#include "strategies/strategies.h"
