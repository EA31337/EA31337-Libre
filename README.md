<!--[![](https://img.shields.io/github/release/EA31337/EA31337-Libre.svg?logo=github)](https://github.com/EA31337/EA31337-Libre/releases)-->
[![](https://img.shields.io/badge/news-Telegram-0088CC.svg?logo=telegram)](https://t.me/EA31337_News)
[![](https://img.shields.io/badge/chat-Telegram-0088CC.svg?logo=telegram)](https://t.me/EA31337)
[![](https://img.shields.io/github/license/EA31337/EA31337.svg)](https://tldrlegal.com/license/gnu-general-public-license-v3-(gpl-3))

# Introduction

EA31337 Libre is free and open-source Forex multi-strategy trading robot written in MQL language.

# Build status

| Type            | Status      |
| --------------: |:-----------:|
| Travis CI build | [![Build Status](https://api.travis-ci.org/EA31337/EA31337-Libre.svg?branch=master)](https://travis-ci.org/EA31337/EA31337-Libre) |
| AppVeyor build  | [![Build status](https://ci.appveyor.com/api/projects/status/xy6iuhtnfst97twd?svg=true)](https://ci.appveyor.com/project/kenorb/ea31337-libre) |

# About the project

This EA (Expert Advisor) provides simple implementation of [EA31337 framework](https://github.com/EA31337/EA31337-classes) and [EA31337 strategies](https://github.com/EA31337/EA31337-strategies).

The source code is compatible with MQL4 and MQL5 and can run on MetaTrader 4 and 5.

## Usage

You can freely use this project for education or research purposes. However, **this project is not suitable for the real trading**.

For more complex implementation of the same framework, follow alternative [EA31337](https://github.com/EA31337/EA31337) project.

## Strategies

The robot comes with over 30 strategies coordinated and controlled by the central algorithm (framework engine). Each strategy can analyse market conditions on multiple timeframes at the same time.

You are free to write your own custom strategies.

# Testing

## Backtesting

Please be aware that backtesting is a very complex process and due to several MetaTrader 4 platform limitations, it cannot reliabily simulate the outcome.

The backtesting has been documented at [Backtesting using MT4](https://github.com/EA31337/EA3133-Support/wiki/Backtesting-using-MT4) wiki page.

Few notes to be aware when backtesting:

- Please use M30 or M15 timeframe to have access to multiple timeframes at the same time, as sometimes not all strategies would be activated (check the logs for details). This is due to platform limitations/bugs.
- Be aware that using [Birt's CSV2FXT.mq4](https://github.com/EA31337/Birt-CSV2FXT) script to generate FXT files is [outdated](https://eareview.net/tick-data/faq-troubleshooting) method and [buggy](https://github.com/EA31337/Birt-CSV2FXT/issues/3).
- There is no such thing as 99% modelling quality. It's a fake [hardcoded number](https://github.com/EA31337/MT-Formats/blob/master/fxt-405-refined.mqh#L53) when your FXT files are read-only and it's often used by scammers as a selling point.
- It's better to not set FXT/HST files as read-only, otherwise platform has no ability to validate and correct the data. When you force platform to use corrupted data, you get non-reliable results.
- When using generated FXT/HST files, run tests in off-line mode in order to not overlap your broker data onto your existing data, otherwise you get data errors, then you'd need to start from scratch.

# Support

If you having any problems or questions, please [raise a support ticket](https://github.com/EA31337/EA3133-Support/issues/new) or join our [Telegram](https://t.me/EA31337) group.

# Terms of Use

By using EA31337 Libre, you understand and agree that we (company and author) are not be liable or responsible for any loss or damage due to any reason. Although every attempt has been made to assure accuracy, we do not give any express or implied warranty as to its accuracy. We do not accept any liability for error or omission.

You acknowledge that you are familiar with these risks and that you are solely responsible for the outcomes of your decisions. We accept no liability whatsoever for any direct or consequential loss arising from the use of this product. You understand and agree that past results are not necessarily indicative of future performance.

Use of EA31337 Libre trading robot serves as your acknowledgement and representation that you have read and understand these TERMS OF USE and that you agree to be bound by such Terms of Use ("License Agreement").

## License

The project is released under [GNU GPLv3 licence](https://www.gnu.org/licenses/quick-guide-gplv3.html), so that means the software is copyrighted, however you have the freedom to use, change or share the software for any purpose as long as the modified version stays free. See: [GNU FAQ](https://www.gnu.org/licenses/gpl-faq.html).

You should have received a copy of the GNU General Public License along with this program (check the [LICENSE](https://github.com/EA31337/EA31337/blob/master/LICENSE) file).  If not, see <http://www.gnu.org/licenses/>.

## Copyright information

Copyright © 2016-2020 – 31337 Investments Ltd - All Rights Reserved

Author & Publisher: kenorb at 31337 Investments Ltd.

## Disclaimer and Risk Warnings

Trading any financial market involves risk. All forms of trading carry a high level of risk so you should only speculate with money you can afford to lose. You can lose more than your initial deposit and stake. Please ensure your chosen method matches your investment objectives, familiarize yourself with the risks involved and if necessary seek independent advice.

NFA and CTFC Required Disclaimers: Trading in the Foreign Exchange market as well as in Futures Market and Options or in the Stock Market is a challenging opportunity where above average returns are available for educated and experienced investors who are willing to take above average risk. However, before deciding to participate in Foreign Exchange (FX) trading or in Trading Futures, Options or stocks, you should carefully consider your investment objectives, level of experience and risk appetite. Do not invest money you cannot afford to lose.

CFTC RULE 4.41 - HYPOTHETICAL OR SIMULATED PERFORMANCE RESULTS HAVE CERTAIN LIMITATIONS. UNLIKE AN ACTUAL PERFORMANCE RECORD, SIMULATED RESULTS DO NOT REPRESENT ACTUAL TRADING. ALSO, SINCE THE TRADES HAVE NOT BEEN EXECUTED, THE RESULTS MAY HAVE UNDER-OR-OVER COMPENSATED FOR THE IMPACT, IF ANY, OF CERTAIN MARKET FACTORS, SUCH AS LACK OF LIQUIDITY. SIMULATED TRADING PROGRAMS IN GENERAL ARE ALSO SUBJECT TO THE FACT THAT THEY ARE DESIGNED WITH THE BENEFIT OF HINDSIGHT. NO REPRESENTATION IS BEING MADE THAN ANY ACCOUNT WILL OR IS LIKELY TO ACHIEVE PROFIT OR LOSSES SIMILAR TO THOSE SHOWN.