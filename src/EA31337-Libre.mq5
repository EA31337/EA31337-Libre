//+------------------------------------------------------------------+
//|                 EA31337 - multi-strategy advanced trading robot. |
//|                       Copyright 2016-2017, 31337 Investments Ltd |
//|                                       https://github.com/EA31337 |
//+------------------------------------------------------------------+

/*
    This file is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

//+------------------------------------------------------------------+
//| EA includes.
//+------------------------------------------------------------------+
#include <EA31337-classes\Account.mqh>
#include <EA31337-classes\Check.mqh>
#include <EA31337-classes\Log.mqh>
#include <EA31337-classes\Order.mqh>
#include <EA31337-classes\Strategies.mqh>
#include <EA31337-classes\Report.mqh>
#include <EA31337-classes\SummaryReport.mqh>

//+------------------------------------------------------------------+
//| Inputs.
//+------------------------------------------------------------------+
input ulong TimeframeFilter = 0; // Timeframes filter (0 - auto)
input string __Logging_Parameters__ = "-- Settings for logging & messages --"; // >>> LOGS & MESSAGES <<<
input ENUM_LOG_LEVEL VerboseLevel = V_INFO; // Level of log verbosity
input bool WriteSummaryReport = true; // Write summary report on finish
input string __Other_Parameters__ = "-- Other parameters --"; // >>> OTHER PARAMETERS <<<
input uint MagicNumber = 31337; // Starting EA magic number

//+------------------------------------------------------------------+
//| EA defines.
//+------------------------------------------------------------------+
#define ea_name    "EA31337 Libre"
#define ea_version "1.000"
#define ea_desc    "Multi-strategy advanced trading robot."
#define ea_link    "https://github.com/EA31337"
#define ea_author  "kenorb"
#define ea_copy    "Copyright 2016-2017, 31337 Investments Ltd"
#define ea_file    __FILE__
#define ea_date    __DATE__
#define ea_build   __MQLBUILD__

//+------------------------------------------------------------------+
//| EA properties.
//+------------------------------------------------------------------+
#property strict
#property version     ea_version
#property description ea_name
#property description ea_desc
#property link        ea_link
#property copyright   ea_copy
//#property icon        "..\\resources\\favicon.ico"

//+------------------------------------------------------------------+
//| EA variables.
//+------------------------------------------------------------------+
bool session_initiated = False;
datetime init_bar_time;
uint init_spread;

//+------------------------------------------------------------------+
//| Class variables.
//+------------------------------------------------------------------+
// User account.
Account *account;
// For logging purposes.
Log *logger;
// Market.
Market *market;
// Strategy manager.
Strategies *strategies;
// For generating the summary report.
SummaryReport *summary_report;

/**
 * Initialization function of the expert.
 */
int OnInit() {
  PrintFormat("%s v%s (%s) initializing...", ea_name, ea_version, ea_link);
  session_initiated &= InitClasses();
  session_initiated &= InitVariables();
  session_initiated &= InitStrategies();
  /*
  string output = InitInfo(TRUE);
  Strings::PrintText(output);
  Comment(output);
  ReportAdd(InitInfo());
  */
  WindowRedraw();
  return (session_initiated ? INIT_SUCCEEDED : INIT_FAILED);
}

/**
 * Deinitialization function of the expert.
 */
void OnDeinit(const int reason) {
  if (session_initiated) {

    string filename;
    if (WriteSummaryReport && !Terminal::IsOptimization()) {
      // @todo: if (reason == REASON_CHARTCHANGE)
      summary_report.CalculateSummary();
      filename = StringFormat(
          "%s-%.0f%s-%s-%s-%dspread-M%d-report.txt",
          _Symbol, summary_report.init_deposit, account.AccountCurrency(), TimeToStr(init_bar_time, TIME_DATE), TimeToStr(TimeCurrent(), TIME_DATE), init_spread, _Period);
      string data = summary_report.GetReport();
      // data += Arrays::ArrToString(logger.GetLogs(), "\n", "Report log:\n");
      Report::WriteReport(filename, data, VerboseLevel >= V_INFO); // Todo: Add: Errors::GetUninitReasonText(reason)
      Print(__FUNCTION__ + ": Saved report as: " + filename);
    }
  }
  DeinitVars();
}

/**
 * "Tick" event handler function.
 */
void OnTick() {
}

/**
 * "Trade" event handler function (MQL5).
 */
void OnTrade() {
}

/**
 * "Timer" event handler function (MQL5).
 */
void OnTimer() {
}

/**
 * Init classes.
 */
bool InitClasses() {
  account = new Account();
  market = new Market(_Symbol);
  if (WriteSummaryReport) {
    summary_report = new SummaryReport(account.AccountBalance());
  }
  return true;
}

/**
 * Init strategies.
 */
bool InitStrategies() {
  strategies = new Strategies(TimeframeFilter, MagicNumber);
  return true;
}

/**
 * Initialize startup variables.
 */
bool InitVariables() {
  bool _initiated = True;
  init_bar_time = iTime(_Symbol, 0, 0);
  init_spread = market.GetSpreadInPts();
  return _initiated;
}

/**
 * Deinitialize global class variables.
 */
void DeinitVars() {
  delete account;
  delete logger;
  delete market;
  delete strategies;
  delete summary_report;
}
