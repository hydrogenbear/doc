.. _il_math:

无常损失计算方法
====================

计算 Uniswap v2 的无常损失
------------------------------------------
假设一个投资人在资产价格为 :math:`p_0` 的时候进入流动性池，在资产价格为 :math:`p_1` 的时候离开流动性池，他进入流动性池的资产为 :math:`a_0` 和 :math:`c_0` ，离开时的资产为 :math:`a_1` 和 :math:`c_1` ，那么我们有方程组如下：

.. math::
    \begin{cases} a_0 c_0 &= a_1 c_1 \\
    \dfrac{c_0} {a_0} &= p_0 \\
    \dfrac{c_1} {a_1} &= p_1  \end{cases}

将所有资产用 :math:`c_0` 表示，解得：

.. math::
   a_0 &=& \dfrac{c_0}{p_0} \\
   c_1 &=& c_0 \sqrt{\dfrac{p_1}{p_0}} \\
   a_1 &=& c_0 \sqrt{\dfrac{1}{p_0 p_1}} \\

无常损失是资产未入池和资产入池后的价值差也就是：

.. math::
   c_0 + a_0 p_1 - (c_1 + a_1 p_1) &= c_0 + c_0 \dfrac{p_1}{p_0} - c_0 \sqrt{\dfrac{p_1}{p_0}} - c_0 \sqrt{\dfrac{p_1}{p_0}} \\
                                     &= c_0 (1 - \sqrt{\dfrac{p_1}{p_0}})^2

我们只要使poption的收益等于 :math:`f(x) =  c_0 (1 - \sqrt{\dfrac{x}{p_0}})^2` 那么我们就可以对冲Uniswap池中的流动性损失了。如果不想手动计算损失的话：
使用 :ref:`il_calculator` 来计算结果：


.. _uniswap_v3:

计算 Uniswap v3 的无常损失
-----------------------------------
对于Uniswap V3， 我们需要解的方程组如下：

设进入流动性池的初始资产为 :math:`c_{in}` 和 :math:`a_{in}` ，离开时的资产为 :math:`c_{out}` 和 :math:`a_{out}` ，进入时价格为 :math:`p_0` ，离开时价格为 :math:`p_1` ，价格下限为 :math:`p_l` 价格上限为 :math:`p_h` 。那么我们有：

.. math::
    \begin{cases}
    c_{in} &=& c_0 - c_l \\
    a_{in} &=& a_0 - a_h \\
    c_{out} &=& c_1 - c_l \\
    a_{out} &=& a_1 - a_h \\
    a_0 c_0 &=& a_1 c_1 \\
    a_0 c_0 &=& a_l c_l \\
    a_0 c_0 &=& a_h c_h\\
    \dfrac{c_0} {a_0} &=& p_0 \\
    \dfrac{c_l} {a_l} &=& p_l \\
    \dfrac{c_h} {a_h} &=& p_h \\
    \dfrac{c_1} {a_1} &=& \begin{cases} p_l  & p_1 < p_l \\
                                    p_1 & p_l \leq p_1 < p_h \\
                                   p_h & p_1 \geq p_h \end{cases}
    \end{cases}

需要计算的无常损失为 :math:`c_{in} + a_{in} p_1 - (c_{out} + a_{out} p_1) = c_0 - c_l + (a_0 - a_h) p_1 - (c_1 - c_l - (a_1 - a_h) p_1)` （以c计价）。

该计算过程较为复杂，可以使用 :ref:`il_calculator` 来计算结果：
