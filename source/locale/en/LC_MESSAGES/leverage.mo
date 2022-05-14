��          �               �  '   �  L  �  6   2    i  *  �  �  �  �   :	  �  
  �   �     �     �  �  �  �  i     ;     B  �  I  9   )  �  c     �  '        +    G  3   V     �     �  y  �  !   '  2  I  /   |  �   �  1  j    �   �   �%  �  �&  �   v(  
   )  
  )  �  *  t  �+     2.     :.     B.  3   C0  �  w0     :2     L2     k2  �  �2  0   \7     �7  
   �7   一个熊市价差策略的收益曲线 假设当前 MATIC 兑 USDC 的比例是 1.2:1，我们看涨 MATIC，我们希望在 poption 中以 4 倍杠杆做多 MATIC。我们在 `poption App页面 <https://www.poption.exchange/app/>`_ 中选择 WMATIC/USDC-USDC的poption并点击。（阅读 :ref:`poption_contract` 了解更多poption代码的信息。） 如图所示： 合成后的收益曲线，等价与一个看涨期权 在 Poption 市场中任何人都无法买入或卖出一份有清算风险的衍生品。Poption 在排除了清算风险的同时最大地保留了衍生品的高资金效率。我们认为相较于传统保证金交易。Poption 是更安全，更有吸引力的金融衍生品。 在 poption 前端界面中我们有一系列的小工具用于快速生成各种需求下的 poption。右边第一个小工具是期权工具。它能计算各种行权价下的期权的收益并生成一个近似的 poption，我们在这个工具中也集成了近似保证金交易的功能。 在传统金融市场中，利用资金优势或者信息优势，通过控制市场中的流动性恶意轧压对手的情况比比皆是。在过去的一年中，就有 GME 事件，原油宝事件，伦敦镍事件发生。可见清算风险即便是专业人士也很难防范，并且这些事件严重破坏了金融市场的安全和稳定。这是我们在设计 poption 之初就想避免的。我们不希望我们市场中的交易者因为清算的压力而被迫去做自己并不愿做的交易。我们希望每一笔交易都来自市场的真实需求和对标的物价值的认真评估。此外这也帮助我们将自动做市商设计得更简单。由于有限的算力，在链上评估清算风险会非常困难，如果存在这样的风险自动做市商在一些情况下会给出错误的报价，从而造成流动性池中的资金损失。这也是我们不愿看到的。 在工具中我们选择 ‘call’表示我们希望做多，然后点击 ‘X4’ 表示四倍杠杆。在 share 栏输入 100 表示购买 100 个 MATIC 份额的 poption。然后点击 Approximate。如下图所示： 在左侧的收益图表中绿线是我们所要购买的 poption 收益曲线，红线是我们需要支付的成本。当价格为 0.9 的时候 Poption 的收益是 0，当价格是 1.5 的时候它的收益是 60 USDC。Matic 价格上涨了 0.6 而 Poption 的收益上升了 60，说明它的确和 100 个 Matic 在这个区间上有相同的盈亏。当我们使用 4 倍杠杆的时候，我们的清仓线在 0.9，这也和收益曲线是一致的。如下图所示： 当投资人想要做空资产价格的时候，他也可以使用一个相反的策略，也就是熊市价差策略，收益曲线如下。 总结 我们从最简单的保证金交易开始理解 poption 中的杠杆交易。在保证金交易中我们从券商借入一笔资金，使用这笔资金加上自己的资金购入一些资产。然后随着资产价格的变动我们会获得更高的收益或者承受更高的亏损。 我们可以选择支付底层资产或同样的poption 收益去完成这次交易，App会优先使用投资者账户中的poption，如果poption不足，投资者则需要支付相应的底层资产。在这个例子中，账户内并没有poption， 所以这次交易全部使用USDC支付，这显示在最下方的To Mint信息中。在这里To Mint的价值等于等价成本。请参考 :ref:`trade_tool` 了解更多相关信息。 我们看到这个收益曲线中有负的一部分，这是因为当资产价格下跌后我们持有的资产的价值就会低于借入的资金价值。这个时候我们就没法还清全部的借款了，券商可不希望这样，他要确保自己能收到还款。因此此时我们就会收到追缴保证金通知或者更进一步的，被清仓。但其实我们并不希望欠券商钱或者被强制交易不是么？那么我们应该把这部分风险转移出去。我们可以通过购买 `看跌期权来 <https://www.cmegroup.com/cn-s/education/learn-about-trading/courses/introduction-to-options/explaining-put-options-short-and-long.html>`_ 做到这一点。看跌期权的收益曲线长这样。 操作 方法 最后我们看一下报价，在右下方的 TRADE 工具中，这样一个 poption 的报价是 30.9 USDC，这略多于 1.2 / 4 \* 100 = 30 USDC，这一部分来自对冲清算风险所付出的价值，一部分是因为 poption 市场本身估值和现货市场不完全一致，还有一部份是交易费用和滑点损失。但总体来说这是一个带有四倍杠杆的衍生品。 最后我们在 TRADE 工具中点击 SWAP 我们就可以购买这个 Poption 了。 最终的收益曲线，等价与一个牛市价差策略 本文将介绍如何利用 poption 进行杠杆交易。使用 poption 进行杠杆交易比保证金更加的安全。对于了解期权交易的读者来说在 poption 中使用牛熊价差策略就是最基本的杠杆交易方法。对于不熟悉的读者来说本文将头开始介绍。我们可以从中了解如何使用 poption 完成杠杆交易，并对风险转移产生一定的概念。 杠杆交易 现在我们看一个具体的例子。 看跌期权的收益曲线 看，现在收益曲线中没有负数的部分了，不管价格怎么变，我们都不会欠券商钱，因为我们不会欠券商钱，券商也不能给我们清仓，强迫我们交易。可以看到通过一个看空期权，我们把风险转移到了期权卖家手中。此外由于这样的看跌期权是一个 `价外期权 <https://www.cmegroup.com/cn-s/education/learn-about-trading/courses/introduction-to-options/calculating-options-moneyness-and-intrinsic-value.html>`_ ，它会很便宜。由此得出，这里我们牺牲了一点点的资金效率的情况下利用衍生品使交易变得更安全。在 poption 中我们可以直接购买一个对应收益的 poption 来满足相同的金融需求。但和传统期权有一点不一样的地方，在 poption 中做市商和投资者的位置是完全对称的，做市商保护自己不被清算的需求和普通投资者是一样的，资产价格的持续上涨会导致裸空的期权卖家承受被挤兑的风险，为了回避这部分风险，做市商不会向投资者卖出这部分期权。最后可以被交易的 poption 的收益曲线长这个样子。这相当于传统期权中的一个 `牛市价差策略 <https://www.cmegroup.com/cn-s/education/courses/option-strategies/bull-spread.html>`_ 。 组合后我们的资产的收益曲线长这样。 融资交易的收益曲线 讨论 Project-Id-Version: poption 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2022-05-14 08:25+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.1
 Payoff of a bear spread strategy. Assuming that the current MATIC/USDC ratio is 1.2:1, we are bullish on MATIC and we want to go long MATIC with 4X leverage in poption. Click 'WMATIC/USDC-USDC' card in the poption `app page <https://www.poption.exchange/app/>`_ to the swap page of the poption. (Read :ref:`poption_contract` to learn more.) payoff of the portfolio, equal to a call option Poption keeps the high capital efficiency of derivatives while eliminating liquidation risk. We believe that poption is a safer and more attractive financial derivative than margin trading. In the page, there are a series of widgets for generating poptions for various needs. The first widget on the right is the Option tool. It can calculate payoff of options at various strike prices and generate an approximate poption. The approximate margin trading function is also integrated in this tool. In the legacy financial markets, there are many cases of malicious squeeze through control of liquidity in the market by taking advantage of capital or information. In the past two years, there have been GameStop Short Squeeze, Negative WTI Crude Futures Prices Event and LME Nickel Squeeze. These events show that liquidation risks are difficult to prevent even for professionals. These events also seriously undermine the safety and stability of financial markets. This is what we want to avoid when we design poption. We do not want traders in our markets to be forced to make trades they unwilling to because of the pressure of liquidation. We hope every trade reflects market demand or the value of the underlying asset but not squeeze. Such a design also helps us to make the implementation of automated market makers simpler. Due to the limited calculation resources, it can be very difficult to assess liquidation risk on chain, which leads auto market makers giving wrong quotes and liquidity pool suffering losses. It is necessary to prevent this at the beginning of the design. In poption, any payoff with a negative part or without an up bound will not be supported. This makes all the poption fully collateralized all the time and no one will face liquidation at any moment. In the widget, we pick 'call' because we want to go long, then click 'X4' to indicate quadruple leverage. Entering 100 in the share field means to buy 100 MATIC shares. Then click the Approximate button. As shown below: There is a payoff chart on the left. The green line in the chart is the payoff of the poption we will buy and the red line is the cost we will pay. Poption yields 0 when the Matic price is 0.9 and 60 USDC when the price is 1.5. The price of Matic rises by 0.6 and the return of poption rises by 60. This indicates that it does have the same profit and loss as 100 Matics in this range. When we use 4 times leverage, we lose all value when the price is at 0.9, which is also consistent with the payoff. When an investor wants to short an asset price, he can also use an opposite strategy, the bear spread strategy, with the following payoff. Conclusion We start with margin trading to construct a leveraged trade in poption. In margin trading we borrow some money from a brokerage and use that money, together with our own, to buy some assets. Then as the price of the asset moves we take higher gains or higher losses. We can choose to pay either the underlying asset or the same amount of the poption payoff to make the transaction, the app will use the poption of the investor first, if there is not enough poption, the investor shall use the underlying asset. In this example, there is no poption in the account, so the transaction is paid via USDC, which is shown in 'To Mint' at the bottom. Please Read :ref:`trade_tool` to learn more. We see a negative portion of this payoff curve because when the asset price drops, the value of the asset will be less than the value of the money borrowed. At that point we will not be able to pay back all the loans, which the brokerage doesn't want, so we will get a margin call or, even worse, a liquidation. However we don't want to owe money to the broker or be forced to trade, do we? How about shifting that risk. We can do this by purchasing a `put option <https://www.cmegroup.com/education/courses/introduction-to-options/explaining-put-options-short-and-long.html>`_ . The payoff of such a put option looks like this. Example Methods Then, let's a look at the quote. In the trade widget on the bottom right, the quote for such a poption is 30.9 USDC. This is slightly higher than 1.2 / 4 * 100 = 30 USDC, because of the value paid for hedging the liquidation risk, the difference value evaluation between poption market and the spot market, and the transaction costs and slippage losses. Overall it is clear that such a poption is a derivative with four times leverage.Finally we can click the swap button in the trade widget to buy this poption. The final payoff, equals to a bull spread strategy. This article describes how to trade with leverage using poption. Leveraged trading with poption is much safer than trading on margin. For those who are familiar with options trading, using a bull/bear spread strategy is the leveraged trading method in poption. For those who are not familiar with it, this article will start from the beginning. We will learn how to use poption to trade with leverage and gain a better understanding of risk transfer. Leveraged trading Now let's look at an example.  payoff of a put option Now that there is no more negative part of payoff curve, no matter what the price changes, we will not owe the brokerage money. Because we won't owe the brokerage money, the brokerage should not liquidate our position and force us to trade. We can see that by having a put option, we shift the risk to the option seller. Also since such a put option is an `out-of-the-money option <https://www.cmegroup.com/education/courses/introduction-to-options/calculating-options-moneyness-and-intrinsic-value.html>`_ , it will be very cheap. It follows that here we use derivatives to make the trade safer with a small extra cost. In a poption, the market maker's need to protect itself from liquidation is the same as that of any other investors. A very high increase in the price of the asset will lead to the risk of a short squeeze on the naked option writer. To avoid this risk, the market maker will not sell this part of the option to the investor. The yield curve of the final tradable poption looks like this. This is the equivalent of a `bullish spread strategy <https://www.cmegroup.com/education/courses/option-strategies/bull-spread.html>`_ in options. we can directly purchase a poption with the such a payoff to meet the financial need. The payoff of our portfolio now looks like this. payoff of buying on margin Discussion 