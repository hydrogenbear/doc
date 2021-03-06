.. _trade_tool:

报价和交易
==========

我们在这里讨论poption的报价和交易机制，并介绍交易小工具中提供的相应功能。

交易执行过程
------------------
在poption中我们的自动做市商可以接受收益曲线和收益曲线的交换，当我们没有足够用于交换收益时我们总是可以使用结算货币去铸造一些收益。当我们有一些收益后我们可以用一部份收益去交换其他的收益。

以 :ref:`杠杆交易中的例子<leverage_example>` 来说，我们使用了 30 左右的 USDC 去购买一个能实现以 4 倍杠杆交易 Matic 的 poption。实际上我们首先将这 30 USDC 铸造成了收益恒为 30 的 poption ，再用其中一部分收益和自动做市商交换。换回的收益加上之前未交易出去的收益加起来变成了我们目标希望获得的收益。整个过程就好像我们用了 30 USDC 去购买了这样一个 poption。以下是一张示意图，在交易的时候我们可以在 APP 界面的中上方看到它。

.. figure:: ../images/naked_short.png
    :align: center

    红色是当前收益，绿色是交易后的收益，两种颜色不重叠的部分就是需要从做市商处交换的 poption 。
    由于我们不持有 poption，在交易前我们需要先使用结算货币铸造所需的 poption（深红色线）。这个交易最终表现为支付结算货币买入沽空的 poption。

在这个交易方法中，用户不用去交换自己已经有的收益，这会提高资金效率并降低交易的综合费率。

成本和费率计算
----------------
由于实质被交易的是两个不同的收益曲线，真正用于交易的过程较为复杂且不便于描述。为了便于使用，我们引入了等价成本的概念。等价成本是铸造并交易后获得poption所需要的最少的结算货币。当用户使用时，他会觉得自己使用了这些结算货币去换得这些poption，尽管一部分poption其实是直接铸造获得的。这一成本概念也与市面上
其他的金融产品一致，这也能方便用户在不同的金融产品间比较。

在引入等价成本之后我们再引入等价费率，等价费率是收费情况下当前等价成本较无费用情况下的等价成本上升的成本的比率，用数学公式表示就是：

.. math::
    \gamma=\dfrac{cost}{cost_{without\: fee}} - 1

基于同样的方法，我们也可以引入等价滑点损失，等价滑点损失是当前等价成本较无滑点损失的情况下的等价成本上升的成本的比率，用数学公式表示就是：

.. math::
    \theta=\dfrac{cost}{cost_{without\: slippage}} - 1

额外费用
-------------
在poption中为了节省gas费用，前端 App 会负责生成一个以最小的代价获得最大回报的刚好能够被做市商接收的交易，链上自动做市商在接收到交易请求后会去计算这个交易是否足够好从而能被接受，如果不能被接受则需要拒绝这个交易。然而这种配合需要App上获取的信息和链上完全一致才能完美实现。而事实上这很难做到，比如在同一个块中，既有现货市场交易改变了现货，又有poption交易，poption交易定价依赖现货价格。前端App很难了解正在出块的链上信息。因此App向 poption 自动做市商合约提交的交易就有可能因为支付不足而被拒绝。此外计算过程中的舍入误差的微小差异也可能导致链下计算合法的交易在链上变得不合法。解决办法是我们可以向自动做市商支付一小笔额外费用来
保证即便出现些许波动依然交易依然能被自动做市商接受。

前端界面
------------
最后我们来看一下App中的界面。在App的右下角是交易小工具的界面。
交易小工具的第一行可以设置额外费用，默认设置是 0.001% 。
第二行是以结算货币计价的等价成本。
第三行是以预言机中另一种资产计价的等价成本，（当结算货币和预言机无关时，这行不会显示，比如结算货币为实验币的情况。)
第四行是滑点损失。
第五行则是费用和费率。

.. image:: ../images/trade_0.png
    :align: center
