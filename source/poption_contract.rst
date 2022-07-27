.. _poption_contract:

poption合约概述
================
在了解一些poption的应用场景之后我们可以回过头在来更进一步了解一下poption合约。

Brief Understanding with Example
----------------------------------
To get a Poption with some financial function. We usually take two steps.

1. Mint current asset to all possible returns in the future.
2. Swap some possible returns for other possible returns with the other.

.. figure:: ../images/ab_bet.png
    :align: center

    Alice and Bob bet with the Ether's price. (Poption only support continuous payoff function currently.)

.. figure:: ../images/ab_long.png
    :align: center

    Alice make a bull spread on Ether and Bob make a bear spread.

Poption的属性
------------------------
Potpion智能中有三个重要属性，底层资产、结算货币、到期时间。在poption在到期时，poption智能合约会从预言机中获取当前底层资产价格作为结算价格。在poption到期后，持有人可以行权，当他们行权时，智能合约会将结算价格代入持有者的收益曲线函数中，并将对应函数输出值的结算货币转入持有者账户中。

.. _payoff_tokens:

收益函数和收益令牌
------------------
Poption的收益函数代表着poption持有人在智能合约中所拥有的资产。它的输入是结算价格，它的输出是持有人在poption到期时应收到的标的资产数量。持有的收益函数越大，在到期时所能获得的资产越多。在 poption 中所有的收益函数都会被看作是 2 个梯形和 N-2 个三角形的组合。

比如通过一个单位的结算货币铸造的常数收益会被切分成如下形状：

.. image:: ../images/poption_token_split_unit.png
    :align: center

比如一个对冲无常损失的收益会被切分成如下形状：

.. image:: ../images/poption_token_split_il.png
    :align: center

这些三角形和梯形可以独立地代表不同的收益，以下是一系列单位高度的这些三角形和梯形的收益曲线：

.. image:: ../images/poption_token_unit.png
    :align: center

然后我们将这些独立的梯形和三角形视为令牌。我们的 poption 合约是一个 ERC1155 合约，它能将这些三角形和梯形的高以令牌的结余信息的形式储存在智能合约中。这样我们就可以将不同的收益函数转化成统一的便于定价和交易的令牌，我们把这些代表收益的令牌叫做收益令牌，一个Poption合约中会有N个不同的收益令牌，N是一个常数，当前大多数的 poption 合约的 N 为 16。收益和收益令牌结余  :math:`balance_i` 的关系以如下方式严格定义。在该定义下，在行权时，当结算价格为 :math:`slot_i` 的时候，持有人总能得到 :math:`balance_i` 的结算货币：

.. math::
    f(x) = \begin{cases} balance_0 & x < slot_0 \\
    balance_{i} & x = slot_{i} \\
    balance_{N-1} & x \geq slot_{N-1} \\
    \dfrac{slot_{i+1} - x}{slot_{i+1} - slot_{i}}  balance_{i} + \dfrac{x - slot_{i}}{slot_{i+1} - slot_{i}}  balance_{i+1} & slot_{i} \leq x < slot_{i+1}  \end{cases}

其中 :math:`slot_i` 是梯形和三角形顶点的x坐标（价格），它被储存在合约的 ``slots`` 变量中，且一旦初始化就无法被改变的。

我们可以在Etherscan中查看在poption中持有的收益令牌结余。如 `https://polygonscan.com/token/<poption_address>?a=<holder_address> <https://polygonscan.com/token/0xD6Dcb2eE2D996620c8CC948f5425C223792eDF9d?a=0xfdd6a9c9201c36b6f9c9533a8859818dde6c9a72#inventory>`_ 。

铸造/销毁
----------------
任何人都可以通过将结算货币锁定到 poption 合约中来铸造 poption。 从 1 个单位的结算货币中可以铸造出收益始终为 1 的 poption，也就是会铸造所有的收益令牌各 1 个。 持有人也可以销毁他恒定收益的 poption，以赎回相同数量的结算货币。在 poption app 中在 poption 的 Mint/Burn 标签页中可以找到相关的功能界面。如下图所示：

.. image:: ../images/mint_burn.png
    :align: center


移交
--------
收益令牌作为一种ERC1155是可以被移交的。在移交的功能的基础上我们可以构建自动做市商。

.. _exercise:

行权
--------
因为poption是按上述方式铸造和转移的。所以它是完全抵押的。行权收益的总和始终等于合约中锁定的代币总量。所有持有人都能在任何情况下获得其持有的 poption 收益。详细的理论可以参考我们的 `白皮书 <https://www.poption.exchange/whitepaper/Poption_Whitepaper.pdf>`_ ，具体的操作可以参考 :ref:`settle` 。

前端界面
--------
合约列表
~~~~~~~~~
.. image:: ../images/apps.png
    :align: center

属性栏
~~~~~~~~~~~~~~
绿框中的是结算货币，括号中的数字是App连接的钱包中的结算货币数量。虚线框中的是poption相关合约地址。

红框中的是底层资产，括号中的数字是预言机给出的底层资产当前。虚线框中的是预言机相关合约地址。

蓝框中的是到期日期，虚线框中的是到期时间和一些其他和合约相关的时间。

.. image:: ../images/swap_1.png
    :align: center

收益函数相关
~~~~~~~~~~~~~~
在Swap功能页面中上部分有一个balance图表，它代表了用户持有的收益曲线：

.. figure:: ../images/balance.png
    :alt: balance
    :align: center

在Swap功能页面最下方 Detail 栏中可以查看每个收益令牌的详细信息：

.. figure:: ../images/balance_1.png
    :alt: balance
    :align: center

Capital Efficiency Discussion
-------------------------------------
Unlike option, fully collateralized poption is capital efficient. Here is an example shows how this works.

Here is a diagram to show the example. The blue area shows the probability of the price of the underlying assert to be at the expiration time. The green area represents the payoff denominated in the underlying asset of one share of call option. The right side means higher price and the left side means lower price. Three vertical lines indicate the first slot of the poption, the current price and the last slot of the poption.

Think about the right area that represents settle price being higher than the last slot. This is very unlikely to happen. So the option write is very unlikely to pay the option holder the green area above the purple line. There are two ways the write can choose from. First one is to be fully collateralized (covered call). But it is capital inefficient. Second one is to be undercollateralized. It is capital efficient but the writer can be squeezed and liquidated. It is clear that these unlikely events introduce inefficiency or complicity to the system.

However poption whose payoff is the purple line, does not has this problems. It is both capital efficient and fully collateralized.
In poption, we highly focus on the events and financial need in the golden box. This makes poption to be an efficient and powerful tool.

.. image:: ../images/covered_call_vs_poption.png
    :align: center
