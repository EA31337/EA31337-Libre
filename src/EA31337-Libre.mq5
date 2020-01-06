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
//| EA defines.
//+------------------------------------------------------------------+
#define ea_name    "EA31337 Libre"
#define ea_version "1.000"
#define ea_desc    "Multi-strategy advanced trading robot"
#define ea_link    "https://github.com/EA31337/EA31337-Libre"
#define ea_author  "kenorb"
#define ea_copy    "Copyright 2016-2019, 31337 Investments Ltd"
#define ea_file    __FILE__
#define ea_date    __DATE__
#define ea_build   __MQLBUILD__

// Includes.
#include "include/includes.h"
#include "include/inputs.h"

//+------------------------------------------------------------------+
//| EA properties.
//+------------------------------------------------------------------+
#property strict
#property version     ea_version
#ifdef __MQL4__
#property description ea_name
#property description ea_desc
#endif
#property link        ea_link
#property copyright   ea_copy
//#property icon        "..\\resources\\favicon.ico"

//+------------------------------------------------------------------+
//| EA variables.
//+------------------------------------------------------------------+
bool session_initiated = false;
datetime init_bar_time;
uint init_spread;

// Class variables.
Account *account;
Chart *chart;
Collection *strats;
Log *logger;
Market *market;
SummaryReport *summary_report; // For summary report.
Terminal *terminal;
Trade *trade[FINAL_ENUM_TIMEFRAMES_INDEX];

/* EA event handler functions */

/**
 * Initialization function of the expert.
 */
int OnInit() {
  PrintFormat("%s v%s (%s) initializing...", ea_name, ea_version, ea_link);
  session_initiated = true;
  session_initiated &= InitClasses();
  session_initiated &= InitVariables();
  session_initiated &= InitStrategies();
  if (GetLastError() > 0) {
    PrintFormat("%s(): Error %d: %s", __FUNCTION__, __LINE__, Terminal::GetLastErrorText());
  }
  DisplayStartupInfo(true);
  Chart::WindowRedraw();
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
          _Symbol, summary_report.GetInitDeposit(), account.AccountCurrency(), DateTime::TimeToStr(init_bar_time, TIME_DATE), DateTime::TimeToStr(TimeCurrent(), TIME_DATE), init_spread, _Period);
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

  MqlTick _tick = market.GetTick();
  bool _tick_procesed = false;
  for (ENUM_TIMEFRAMES_INDEX tfi = 0; tfi < FINAL_ENUM_TIMEFRAMES_INDEX; tfi++) {
    if (Object::IsDynamic(trade[tfi]) && trade[tfi].Chart().IsValidTf()) {
      if (trade[tfi].Chart().IsNewBar()) {
        trade[tfi].Market().SetTick(_tick);
        ProcessBar(trade[tfi]);
        _tick_procesed = true;
      }
    }
  }
  if (_tick_procesed) {
    if (!terminal.IsOptimization()) {
      terminal.Logger().Flush(false);
    }
    if (PrintLogOnChart) {
      DisplayInfo();
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

/* Custom EA functions */

/**
 * Process a new bar.
 */
void ProcessBar(Trade *_trade) {
  if (_trade.TradeAllowed()) {
    ResetLastError();
    EA_Trade(_trade);
    // Print any errors.
    if (GetLastError() > 0) {
      PrintFormat("%s(): Error %d: %s", __FUNCTION__, __LINE__, Terminal::GetLastErrorText());
    }
    _trade.Logger().Flush();
  }
}

/**
 * Main function to trade.
 */
bool EA_Trade(Trade *_trade) {
  Strategy *strat;
  StgProcessResult sresult;
  int sid;
  bool order_placed = false;
  ENUM_ORDER_TYPE _cmd = EMPTY;
  ENUM_TIMEFRAMES _tf = _trade.Chart().GetTf();

  for (sid = 0; sid < strats.GetSize(); sid++) {
    strat = ((Strategy *) strats.GetByIndex(sid));
    if (strat.GetTf() == _tf && strat.IsEnabled() && !strat.IsSuspended()) {
      sresult = strat.ProcessBar();
      if (!terminal.IsOptimization()) {
        strat.Logger().Flush();
      }
    }
  }

  return order_placed;
}

/**
 * Display trading info.
 */
bool DisplayInfo(string sep = "\n") {
  ResetLastError();
  if (terminal.IsOptimization() || (terminal.IsTesting() && !terminal.IsVisualMode())) {
    // Ignore chart updates when optimizing or testing in non-visual mode.
    return false;
  }
  string _output = StringFormat("%s v%s by %s (%s)%s", ea_name, ea_version, ea_author, ea_link, sep);
  // ...
  Comment(_output);
  return Terminal::GetLastError() == ERR_NO_ERROR;
}

/**
 * Display startup info.
 */
bool DisplayStartupInfo(bool _startup = false, string sep = "\n") {
  ResetLastError();
  if (terminal.IsOptimization() || (terminal.IsTesting() && !terminal.IsVisualMode())) {
    // Ignore chart updates when optimizing or testing in non-visual mode.
    return false;
  }
  string _output = StringFormat("%s v%s by %s (%s)%s", ea_name, ea_version, ea_author, ea_link, sep);
  Trade *_trade = trade[Chart::TfToIndex(PERIOD_CURRENT)];
  _output += "TERMINAL: " + terminal.ToString() + sep;
  _output += "ACCOUNT: " + account.ToString() + sep;
  _output += "SYMBOL: " + ((SymbolInfo *)market).ToString() + sep;
  _output += "MARKET: " + market.ToString() + sep;
  _output += "TRADE: " + _trade.ToString() + sep;
  // Print details for each active chart.
  for (ENUM_TIMEFRAMES_INDEX _tfi = 0; _tfi < FINAL_ENUM_TIMEFRAMES_INDEX; _tfi++) {
    if (Object::IsValid(trade[_tfi]) && trade[_tfi].Chart().IsValidTf()) {
      _output += StringFormat("CHART: %s%s", trade[_tfi].Chart().ToString(), sep);
    }
  }
  // Print strategies info.
  int sid;
  Strategy *_strat;
  _output += "STRATEGIES:" + sep;
  for (sid = 0; sid < strats.GetSize(); sid++) {
    _strat = ((Strategy *) strats.GetByIndex(sid));
    _output += _strat.ToString();
  }
  if (_startup) {
    if (session_initiated && Terminal::IsTradeAllowed()) {
      if (_trade.TradeAllowed()) {
        _output += sep + "Trading is allowed, waiting for new bars...";
      } else {
        _output += sep + "Trading is allowed, but there is some issue...";
        _output += sep + _trade.Logger().GetLastMsg(V_ERROR);
      }
    } else if (terminal.IsRealtime()) {
      _output += sep + StringFormat("Error %d: Trading is not allowed for this symbol, please enable automated trading or check the settings!", __LINE__);
    }
    else {
      _output += sep + "Waiting for new bars...";
    }
  }
  Comment(_output);
  return Terminal::GetLastError() == ERR_NO_ERROR;
}

/**
 * Init classes.
 */
bool InitClasses() {

  // Initialize main classes.
  account = new Account();
  logger = new Log(VerboseLevel);
  market = new Market(_Symbol, logger);

  // Initialize the current chart.
  ENUM_TIMEFRAMES_INDEX _tfi = Chart::TfToIndex(PERIOD_CURRENT);
  TradeParams trade_params(account, new Chart(_tfi), logger);
  trade[_tfi] = new Trade(trade_params);

  // Verify that the current chart has been initialized correctly.
  if (Object::IsDynamic(trade[_tfi]) && trade[_tfi].Chart().IsValidTf()) {
    // Assign to the current chart.
    chart = trade[_tfi].Chart();
  }
  else {
    PrintFormat("%s(): Error: Cannot initialize the current timeframe (%s)!", __FUNCTION_LINE__, Chart::IndexToString(_tfi));
    return false;
  }

  // Initialize other classes.
  terminal = market.TerminalHandler();
  strats = new Collection();
  summary_report = new SummaryReport();

  return true;
}

/**
 * Init strategies.
 */
bool InitStrategies() {
  long _magic = MagicNumber;
  ResetLastError();

  if ((RSI_Active_Tf & M1B)  == M1B)  { strats.Add(Stg_RSI::Init(PERIOD_M1,  _magic++)); };
  if ((RSI_Active_Tf & M5B)  == M5B)  { strats.Add(Stg_RSI::Init(PERIOD_M5,  _magic++)); };
  if ((RSI_Active_Tf & M15B) == M15B) { strats.Add(Stg_RSI::Init(PERIOD_M15, _magic++)); }; // @fixme: error 4012?
  if ((RSI_Active_Tf & M30B) == M30B) { strats.Add(Stg_RSI::Init(PERIOD_M30, _magic++)); };
  if ((RSI_Active_Tf & H1B)  == H1B)  { strats.Add(Stg_RSI::Init(PERIOD_H1,  _magic++)); };
  if ((RSI_Active_Tf & H4B)  == H4B)  { strats.Add(Stg_RSI::Init(PERIOD_H4,  _magic++)); };

  return GetLastError() == 0 || GetLastError() == 4012; // @fixme: error 4012?
}

/**
 * Initialize startup variables.
 */
bool InitVariables() {
  bool _initiated = true;
  init_bar_time = chart.iTime(_Symbol, 0, 0);
  init_spread = market.GetSpreadInPts();
  return _initiated;
}

/**
 * Deinitialize global class variables.
 */
void DeinitVars() {
  Object::Delete(account);
  Object::Delete(logger);
  Object::Delete(summary_report);
  Object::Delete(terminal);
  Object::Delete(market);
  Object::Delete(strats);
  for (int tfi = 0; tfi < FINAL_ENUM_TIMEFRAMES_INDEX; tfi++) {
    Object::Delete(trade[tfi]);
  }
}
