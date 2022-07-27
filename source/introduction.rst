简介
=========

poption 的名字来源于 payoff option （收益曲线期权）和 pop option （大众期权）。如同它的名字所表示的那样，它是一种以收益曲线为基础的期权。一个金融产品是非常核心的属性就是它的收益曲线，收益曲线相似的金融产品可以满足相似的金融需求。poption 是一种在收益曲线上提供最大自由度，而在其他方面则做最大简化的金融衍生品。这使得它能够满足不同的金融需求却又足够简单从而能大众化。我们相信它在未来能成为链上主要的金融衍生品。

同其他金融衍生品先定义衍生品所代表的权益再推导其收益，投资人通过组合不同的产品来获得自己想要的收益曲线不同。在 poption 中投资者可以直接自定义收益曲线并从做市商那里获得相应收益曲线的 poption，并在 poption 到期时获得收益曲线规定的结算货币。

Poption 主要由两个部分组成：

* :ref:`poption 智能合约<poption_contract>`，它是一种 **ERC1155 协议** ，用于 管理 poption 的结余，结算和行权。
* :ref:`poption 自动做市商<auto_market_maker>`，它是一种 **常函数自动做市商** ，用于 poption 之间的交易。

下图是自定义 poption 曲线的几个例子，**绿线** 是poption自定义的收益曲线。

.. figure:: ../images/payoff_l_5.png
    :align: center

    :ref:`一个基于 Matic 价格采取牛市价差策略收益的 poption ，收益以 USDC 结算。<leverage>`

.. figure:: ../images/il_v2_payoff.png
    :align: center

    :ref:`一个提供对冲ETH-USDC 流动性池无常损失功能的 poption，收益以 USDC 结算<hedge_il>`

.. figure:: ../images/any_payoff_chart.png
    :align: center

    :ref:`一个为了好玩定义正弦函数为收益的 poption，收益以 USDC 结算<sin_payoff>`


了解更多信息
-----------------------------------------------------------------------
* :ref:`leverage`
* :ref:`hedge_il`
* :ref:`any_payoff`
* :ref:`poption_contract`
* :ref:`settle`
