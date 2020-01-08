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

// Class includes.
#include "EA31337-classes/Account.mqh"
#include "EA31337-classes/Chart.mqh"
#include "EA31337-classes/Collection.mqh"
#include "EA31337-classes/Log.mqh"
#include "EA31337-classes/Order.mqh"
#include "EA31337-classes/Report.mqh"
#include "EA31337-classes/Strategy.mqh"
#include "EA31337-classes/SummaryReport.mqh"
#include "EA31337-classes/Trade.mqh"

// Strategy includes.
INPUT string __Strategy_Parameters__ = "-- Strategy parameters --";  // >>> STRATEGIES <<<
#include "EA31337-strategies/strategies.h"