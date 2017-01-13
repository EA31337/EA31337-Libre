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
//| EA defines.
//+------------------------------------------------------------------+
#define __input__

//+------------------------------------------------------------------+
//| EA includes.
//+------------------------------------------------------------------+
#include <EA31337-classes\Account.mqh>
#include <EA31337-classes\Chart.mqh>
#include <EA31337-classes\Check.mqh>
#include <EA31337-classes\Log.mqh>
#include <EA31337-classes\Order.mqh>
#include <EA31337-classes\Strategies.mqh>
#include <EA31337-classes\Report.mqh>
#include <EA31337-classes\SummaryReport.mqh>
#include <EA31337-classes\Trade.mqh>

//+------------------------------------------------------------------+
//| Inputs.
//+------------------------------------------------------------------+
input ulong TimeframeFilter = 0; // Timeframes filter (0 - auto)
input double MinPipChangeToTrade = 0.4; // Min pip change to trade (0 = every tick)
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
bool session_initiated = false;
datetime init_bar_time;
uint init_spread;

//+------------------------------------------------------------------+
//| Class variables.
//+------------------------------------------------------------------+
// User account.
Account *account;
// Current chart.
Chart *chart;
// For logging purposes.
Log *logger;
// Market.
Market *market;
// Strategy manager.
Strategies *strategies;
// For generating the summary report.
SummaryReport *summary_report;
// For trading.
Trade *trade;

/**
 * Initialization function of the expert.
 */
int OnInit() {
  PrintFormat("%s v%s (%s) initializing...", ea_name, ea_version, ea_link);
  session_initiated = true;
  session_initiated &= InitClasses();
  session_initiated &= InitVariables();
  session_initiated &= InitStrategies();
  /*
  string output = InitInfo(TRUE);
  Strings::PrintText(output);
  Comment(output);
  ReportAdd(InitInfo());
  */
  chart.ChartRedraw();
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
          _Symbol, summary_report.init_deposit, account.AccountCurrency(), DateTime::TimeToStr(init_bar_time, TIME_DATE), DateTime::TimeToStr(TimeCurrent(), TIME_DATE), init_spread, _Period);
      string data = summary_report.GetReport();
      // data += Arrays::ArrToString(logger.GetLogs(), "\n", "Report log:\n");
      Report::WriteReport(filename, data, VerboseLevel >= V_INFO); // Todo: Add: Errors::GetUninitReasonText(reason)
      Print(__FUNCTION__ + ": Saved report as: " + filename);
    }
  }
  DeinitVars();
}

/**
 * "Tick" event handler function (EA only).
 *
 * Invoked when a new tick for a symbol is received, to the chart of which the Expert Advisor is attached.
 */
void OnTick() {
  if (!session_initiated) return;

  // Check the last price tick change.
  double last_ask = market.GetLastAsk();
  double last_bid = market.GetLastBid();
  double tick_change = fmax(Convert::GetValueDiffInPips(market.GetAsk(), last_ask, True), Convert::GetValueDiffInPips(market.GetBid(), last_bid, True));

  if (tick_change >= MinPipChangeToTrade) {
    MqlTradeRequest deal;
    MqlTradeResult result;
    if (strategies.Signal(deal)) {
      trade.NewOrder(deal, result);
    }
  }
}

#ifdef __MQL5__
/**
 * "Trade" event handler function (MQL5 only).
 *
 * Invoked when a trade operation is completed on a trade server.
 */
void OnTrade() {
}

/**
 * "OnTradeTransaction" event handler function (MQL5 only).
 *
 * Invoked when performing some definite actions on a trade account, its state changes.
 */
void  OnTradeTransaction(
   const MqlTradeTransaction&    trans,        // Trade transaction structure.
   const MqlTradeRequest&        request,      // Request structure.
   const MqlTradeResult&         result        // Result structure.
   ) {
}
#endif

/**
 * "Timer" event handler function.
 *
 * Invoked periodically generated by the EA that has activated the timer by the EventSetTimer function.
 * Usually, this function is called by OnInit.
 */
void OnTimer() {
}

/**
 * "TesterInit" event handler function.
 *
 * The start of optimization in the strategy tester before the first optimization pass.
 */
void TesterInit() {
}

/**
 * "OnTester" event handler function.
 *
 * Invoked after a history testing of an Expert Advisor on the chosen interval is over.
 * It is called right before the call of OnDeinit().
 */
double OnTester() {
  return 1.0;
}

/**
 * "OnTesterPass" event handler function.
 *
 * Invoked when a frame is received during Expert Advisor optimization in the strategy tester.
 */
void OnTesterPass() {
}

/**
 * "OnTesterDeinit" event handler function.
 *
 * Invoked after the end of Expert Advisor optimization in the strategy tester.
 */
void OnTesterDeinit() {
}

/**
 * "OnBookEvent" event handler function.
 *
 * Invoked on Depth of Market changes.
 * To pre-subscribe use the MarketBookAdd() function.
 * In order to unsubscribe for a particular symbol, call MarketBookRelease().
 */
void OnBookEvent(const string& symbol) {
}

/**
 * "OnBookEvent" event handler function.
 *
 * Invoked by the client terminal when a user is working with a chart.
 */
void OnChartEvent(
  const int id,         // Event ID.
  const long& lparam,   // Parameter of type long event.
  const double& dparam, // Parameter of type double event.
  const string& sparam  // Parameter of type string events.
  ) {
}

/**
 * Init classes.
 */
bool InitClasses() {
  account = new Account();
  chart = new Chart();
  market = new Market(_Symbol);
  if (WriteSummaryReport) {
    summary_report = new SummaryReport(account.AccountBalance());
  }
  trade = new Trade(market, account, logger);
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
  bool _initiated = true;
  init_bar_time = market.iTime(_Symbol, 0, 0);
  init_spread = market.GetSpreadInPts();
  return _initiated;
}

/**
 * Deinitialize global class variables.
 */
void DeinitVars() {
  delete account;
  delete chart;
  delete logger;
  delete market;
  delete strategies;
  delete summary_report;
  delete trade;
}
