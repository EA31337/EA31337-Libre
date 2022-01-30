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
#include "classes/Indicators/Bitwise/indicators.h"
#include "classes/Indicators/Price/indicators.h"
#include "classes/Indicators/Special/indicators.h"
#include "classes/Indicators/indicators.h"

// Enums.
#include "enum.h"
#include "strategies/enum.h"

// Main user inputs.
#include "inputs.h"

// Strategy includes.
INPUT string __Strategy_Parameters__ = "-- Strategy parameters --";  // >>> STRATEGIES <<<
#include "strategies/strategies.h"
