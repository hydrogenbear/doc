Introduce Value to The Chain
================================
Poption is a general purpose derivative designed for blockchain. It is fully based on smart contracts. No centralized part or para chain is needed. It requires one price oracle and one underlying asset to work. Please notice that only one but not two underlying asset is required to work. This makes it possible to manage the risk from the asset outside the chain and this will create value in the chain.

In this cold crypto winter, let's consider the future of the ecosystem. The ecosystem needs to create more value to grow up. Algorithm stable coin can not create value from void. How about others? Someone says NTF, someone says metaverse. Yes, they have potential, but I believe that finance is still the most potential area because of its high demand for trust that can be provided by blockchains at a low cost.

The value we are going to bring to the ecosystem is the value of derivatives. Deveritives provides tools to manage the risk and speculate with high capital efficiency. For example, we can hedge against the fluctuation of foreign exchange rates via foreign exchange options, or speculate an off-chain stock efficiently.

Participants in the market
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
We can view the derivative market as an information processor. It collects and processes information and provides insurance based on these information. Since it is simply an information processor, it is suitable to be hosted in a cyberspace like blockchain. Speculators are the collectors. Market makers are the processor. Hedgers and arbitragers are the consumers.

* **Speculators** Speculators creates valuable information. They collect information from all over the world and make a prediction based on their information. They submit their predictions by trading. They can get reward when they give right prediction to the market and make the price more accurate. They shall be punishend when they give poor prediction.

* **Liquidity providers** They provide liquidity to the market and lubricate the system. They earn profit from transaction fees. They will also hold positions and take the risks of poor pricing. To reduce their risks, the automatic market maker shall be able to provide a good basic prediction to the market. In the future, some strong liquidity providers may customerize their own automatic market maker.

* **hedgers** They are the consumer of the valuable information. They will buy derivatives to cover their risks elsewhere and pay value to the whole system.

* **arbitragers** They are also the consumer of valuable information. If the market gives good predictions, the arbitrager will carry the useful information to the off-chain market and bring the value back. However, the system will also lose value if the predictions are poor.

In legacy finance, the premium of an option is calculated based on the expectation of the payoff, which is :math:`\int _0 ^\infty p(x) f(x) dx` , where :math:`f(x)` is the payoff of the option and :math:`p(x)` is the probability density function of the price at the expired date. This is exactly the same way a prediction market works. In a prediction market, a ticket is priced as the probability of its event. When a market participant holds some tickets whose payoff is :math:`f(i)` where :math:`i` represents the event whose probability is :math:`p(i)`, then the cost of these tickets should be :math:`\sum_i p(i) f(i)`. With some math trikes, it is possible to convert a prediction market to a derivative market on the chain. Acturally, we have already created one, and we call it poption. However only some smart contracts are not enough to achieve our goal. We need an ecosystem, we need liquidity providers, speculators, arbitragers, and hedgers to make an efficient market and bring values to the crypto eco.

Prediction Market as Derivative Market
-----------------------------------------------------
Suppose we have created a prediction market that predicts the prices of some assets in the future and speculators are using this market to make money. Usually, a prediction market is a zero-sum game, however, a worked prediction market can give accurate predictions of the events. And a hedger who wants to buy some insurance to shift the risk of the price change can use the prediction to price the risk. Now the speculators play the role of actuary and the prediction market becomes a derivative market that makes value. And this is a non-zero-sum game now.  We can also create value from the opposite flow. While speculators are speculating derivatives on-chain, arbitrageurs can take advantage of the spreads between on-chain and off-chain to arbitrage. This arbitrage will carry the transaction from speculators on-chain to the off-chain market, thus enhancing the market accessibility.

