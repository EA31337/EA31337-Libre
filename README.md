# EA31337 Libre

[![Release][gh-release-image]][gh-release-link]
[![License][license-image]][license-link]
[![Status][gha-image-check-master]][gha-link-check-master]
[![Status][gha-image-compile-master]][gha-link-compile-master]
[![Status][gha-image-lint-master]][gha-link-lint-master]
[![Channel][tg-channel-image]][tg-channel-link]
[![Edit][gitpod-image]][gitpod-link]

## Introduction

EA31337 Libre is free and open-source Forex multi-strategy trading robot written in MQL.

## About the project

The project aims to deliver simple implementation of
[EA31337 framework][gh-ea31337-classes] and [EA31337 strategies][gh-ea31337-strats].

The source code is compatible with MQL4 and MQL5 and can run on MetaTrader 4 and 5.

### Usage

You can freely use this project for education or research purposes.
However, **this project is not suitable for the real trading**
without relevant knowledge.

For more complex implementation of the same framework,
please follow alternative [EA31337][gh-ea31337] project.

### Strategies

The robot comes with over 35 strategies coordinated and controlled by the central algorithm.
Each strategy analyses market on multiple timeframes at the same time.
The market analysis is based on over 30 major technical indicators in real-time.

You are free to write your own custom strategies.

## Testing

### Backtesting

Please be aware that backtesting is a very complex process
and due to several MetaTrader 4 platform limitations, it cannot reliabily simulate the outcome.

The backtesting has been documented at [Backtesting using MT4][gh-wiki-backtest] wiki page.

Few notes to be aware when backtesting:

- Please use M1 timeframe to have access to multiple timeframes at the same time,
  as sometimes not all strategies would be activated (check the logs for details).
  This is due to platform limitations/bugs.
- Be aware that using
  [Birt's CSV2FXT.mq4](https://github.com/EA31337/Birt-CSV2FXT) script
  to generate FXT files is
  [outdated](https://eareview.net/tick-data/faq-troubleshooting) method
  and [buggy](https://github.com/EA31337/Birt-CSV2FXT/issues/3).
- There is no such thing as 99% modelling quality.
  It's a fake
  [hardcoded number](https://github.com/EA31337/MT-Formats/blob/master/fxt-405-refined.mqh#L53)
  when your FXT files are read-only and it's
  often used by scammers as a selling point.
- It's better to not set FXT/HST files as read-only,
  otherwise platform has no ability to validate and correct the data.
  When you force platform to use corrupted data, you get non-reliable results.
- When using generated FXT/HST files, run tests in off-line mode
  in order to not overlap your broker data onto your existing data,
  otherwise you get data errors, then you'd need to start from scratch.

## Support

- For help, open a [new discussion][gh-discuss] to ask questions.
- For bugs/features, raise a [new issue at GitHub][gh-issues].
- Join our [Telegram channel][tg-channel-link] for news and discussion group for help.

## Legal

### License

The project is released under [GNU GPLv3 licence](https://www.gnu.org/licenses/quick-guide-gplv3.html),
so that means the software is copyrighted, however you have the freedom to use, change or share the software
for any purpose as long as the modified version stays free. See: [GNU FAQ](https://www.gnu.org/licenses/gpl-faq.html).

You should have received a copy of the GNU General Public License along with this program
(check the [LICENSE](https://github.com/EA31337/EA31337/blob/master/LICENSE) file).
If not, please read <http://www.gnu.org/licenses/>.
For simplified version, please read <https://tldrlegal.com/license/gnu-general-public-license-v3-(gpl-3)>.

## Terms of Use

By using EA31337 Libre, you understand and agree that we (company and author)
are not be liable or responsible for any loss or damage due to any reason.
Although every attempt has been made to assure accuracy,
we do not give any express or implied warranty as to its accuracy.
We do not accept any liability for error or omission.

You acknowledge that you are familiar with these risks
and that you are solely responsible for the outcomes of your decisions.
We accept no liability whatsoever for any direct or consequential loss arising from the use of this product.
You understand and agree that past results are not necessarily indicative of future performance.

Use of EA31337 Libre trading robot serves as your acknowledgement and representation that you have read and understand
these TERMS OF USE and that you agree to be bound by such Terms of Use ("License Agreement").

### Copyright information

Copyright © 2016-2021 - EA31337 Ltd - All Rights Reserved

Author & Publisher: kenorb at EA31337 Ltd.

### Disclaimer and Risk Warnings

Trading any financial market involves risk.
All forms of trading carry a high level of risk so you should only speculate with money you can afford to lose.
You can lose more than your initial deposit and stake.
Please ensure your chosen method matches your investment objectives,
familiarize yourself with the risks involved and if necessary seek independent advice.

NFA and CTFC Required Disclaimers:
Trading in the Foreign Exchange market as well as in Futures Market and Options or in the Stock Market
is a challenging opportunity where above average returns are available for educated and experienced investors
who are willing to take above average risk.
However, before deciding to participate in Foreign Exchange (FX) trading or in Trading Futures, Options or stocks,
you should carefully consider your investment objectives, level of experience and risk appetite.
**Do not invest money you cannot afford to lose**.

CFTC RULE 4.41 - HYPOTHETICAL OR SIMULATED PERFORMANCE RESULTS HAVE CERTAIN LIMITATIONS.
UNLIKE AN ACTUAL PERFORMANCE RECORD, SIMULATED RESULTS DO NOT REPRESENT ACTUAL TRADING.
ALSO, SINCE THE TRADES HAVE NOT BEEN EXECUTED, THE RESULTS MAY HAVE UNDER-OR-OVER COMPENSATED FOR THE IMPACT,
IF ANY, OF CERTAIN MARKET FACTORS, SUCH AS LACK OF LIQUIDITY. SIMULATED TRADING PROGRAMS IN GENERAL
ARE ALSO SUBJECT TO THE FACT THAT THEY ARE DESIGNED WITH THE BENEFIT OF HINDSIGHT.
NO REPRESENTATION IS BEING MADE THAN ANY ACCOUNT WILL OR IS LIKELY TO ACHIEVE PROFIT OR LOSSES SIMILAR TO THOSE SHOWN.

<!-- Named links -->

[gh-release-image]: https://img.shields.io/github/release/EA31337/EA31337-Libre.svg?logo=github
[gh-release-link]: https://github.com/EA31337/EA31337-Libre/releases

[docker-build-image]: https://images.microbadger.com/badges/image/ea31337/mql-tester-action-action.svg
[docker-build-link]: https://microbadger.com/images/ea31337/mql-tester-action-action

[tg-channel-image]: https://img.shields.io/badge/Telegram-join-0088CC.svg?logo=telegram
[tg-channel-link]: https://t.me/EA31337

[gha-link-check-master]: https://github.com/EA31337/EA31337-Libre/actions?query=workflow%3ACheck+branch%3Amaster
[gha-image-check-master]: https://github.com/EA31337/EA31337-Libre/workflows/Check/badge.svg?branch=master
[gha-link-compile-master]: https://github.com/EA31337/EA31337-Libre/actions?query=workflow%3ACompile+branch%3Amaster
[gha-image-compile-master]: https://github.com/EA31337/EA31337-Libre/workflows/Compile/badge.svg?branch=master
[gha-link-lint-master]: https://github.com/EA31337/EA31337-Libre/actions?query=workflow%3ALint+branch%3Amaster
[gha-image-lint-master]: https://github.com/EA31337/EA31337-Libre/workflows/Lint/badge.svg?branch=master

[gitpod-image]: https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod
[gitpod-link]: https://gitpod.io/#https://github.com/EA31337/EA31337-Libre

[gh-discuss]: https://github.com/EA31337/EA31337-Libre/discussions
[gh-issues]: https://github.com/EA31337/EA31337-Libre/issues

[license-image]: https://img.shields.io/github/license/EA31337/EA31337-Libre.svg
[license-link]: https://tldrlegal.com/license/gnu-general-public-license-v3-(gpl-3)

[gh-ea31337-classes]: https://github.com/EA31337/EA31337-classes
[gh-ea31337-strats]: https://github.com/EA31337/EA31337-strategies
[gh-ea31337]: https://github.com/EA31337/EA31337
[gh-wiki-backtest]: https://github.com/EA31337/EA3133-Support/wiki/Backtesting-using-MT4
