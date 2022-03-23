# EA31337 Libre

[![Release][gh-release-image]][gh-release-link]
[![License][license-image]][license-link]
[![Status][gha-image-check-master]][gha-link-check-master]
[![Status][gha-image-compile-master]][gha-link-compile-master]
[![Channel][tg-channel-image]][tg-channel-link]
[![Twitter][twitter-image]][twitter-link]

## Introduction

EA31337 Libre is free and open-source multi-strategy Forex trading robot written in MQL.

## About the project

The project aims to deliver simple implementation of
[EA31337 framework][gh-ea31337-classes] and [EA31337 strategies][gh-ea31337-strats].

The source code is compatible with MQL4 and MQL5
and can run on MetaTrader 4 and 5.

### Usage

You can freely use this project for education or research purposes.
However, **this project is not suitable for the real trading**
without relevant knowledge.

For more advanced implementation,
please follow alternative [EA31337][gh-ea31337] project.

### Strategies

The trading robot comes with over 35 strategies to choose from.
Each strategy can analyse market on different timeframes independently.
The market analysis is based on popular technical indicators.

You are free to write your own custom strategies.

## Testing

### Backtesting

Please be aware that backtesting cannot reliabily simulate the future outcome.

It is recommended to use MetaTrader 5 for the backtesting and optimization.

For MetaTrader 4, the backtesting has been documented
at [Backtesting using MT4][gh-wiki-backtest] wiki page.

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

Copyright © 2016-2022 - EA31337 Ltd - All Rights Reserved

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

[twitter-image]: https://img.shields.io/badge/EA31337-Follow-1DA1F2.svg?logo=Twitter
[twitter-link]: https://twitter.com/EA31337

[gha-link-check-master]: https://github.com/EA31337/EA31337-Libre/actions?query=workflow%3ACheck+branch%3Amaster
[gha-image-check-master]: https://github.com/EA31337/EA31337-Libre/workflows/Check/badge.svg?branch=master
[gha-link-compile-master]: https://github.com/EA31337/EA31337-Libre/actions?query=workflow%3ACompile+branch%3Amaster
[gha-image-compile-master]: https://github.com/EA31337/EA31337-Libre/workflows/Compile/badge.svg?branch=master

[gh-discuss]: https://github.com/EA31337/EA31337-Libre/discussions
[gh-issues]: https://github.com/EA31337/EA31337-Libre/issues

[license-image]: https://img.shields.io/github/license/EA31337/EA31337-Libre.svg
[license-link]: https://tldrlegal.com/license/gnu-general-public-license-v3-(gpl-3)

[gh-ea31337-classes]: https://github.com/EA31337/EA31337-classes
[gh-ea31337-strats]: https://github.com/EA31337/EA31337-strategies
[gh-ea31337]: https://github.com/EA31337/EA31337
[gh-wiki-backtest]: https://github.com/EA31337/EA3133-Support/wiki/Backtesting-using-MT4
