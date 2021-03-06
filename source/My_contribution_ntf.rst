Poption Contributor NFT (Draft)
===================================

Poption Creator NFT is a decentralized system designed to organize the DAO and VC in poption. The idea is if we use the NFT market properly, we may reorganize the resources and risks in VC and DAO to make the community runs better. It is a kind of NFT token that DAO members can mint based on their contribution. The NFTs can be minted into poption stock tokens in IXO (ICO/IDO/IEO/...) in the future. The NFTs will be tagged based on what kind of contribution it is. NFTs with the same tags represent the same value in IXO. Investors can buy the NFTs from the contributors or other investors from the market. The more valuable the NFT is, the more poption stock can be minted from it. The value of the NFT will be determined by both its price in the market and some other rules.

Rules
-----------------------------
Before IXO:
1. When the contributor finishes some task, he can get a proof from the validator and bring the signature of the validator to the NTF contract to mint the NFT. The contributor is both the creator and the owner of the token.
2. The NFT is tagged with the creation time, the contribution type and other information. Once minted the tags of the token wouldn't change.
3. The creator can be tagged with ``is human``, ``is bot``, ``Twitter verified`` and so on by some validation process.
4. The owner shall give a price to his NFT. Investors can buy the NFT with the price. The price shall be denominated by stable coin.
5. When the owner and the creator of the NFT are different, the owner shall lock 1/20 of the price he gives in the contract. (Here, the discount of the locked cash acts like property tax to build a reasonable market.)

In IXO:

不管啦，用中文先写一点吧，虽然前一篇文章用英文写的很不错。但是这一篇现在写到这里写不下去了。整个IXO分三个部分。我现在以当前poption相关的资产入股30%，然后流动性提供者占有15%的股权，交易参与者占有15%的股权。剩下的10%-20% 给PCNFT，当PCNFT运行的公平且顺利的话可以将占比提升到20%，如果未能实现其功能的话则将它的占比下降到15%，其股份和功能将从其他投资人处寻求实现，如果出现非常糟糕的情况，这可以将其权重进一步下降到10%，毕竟这是一个从未有人尝试的较为风险的方案。10% 锁定在DAO中用于向贡献者分发红利，这部分股权有分红和投票但无法交易。剩下 10% 的未分配股权用于建设DAO和给予其他服务。

流动性贡献按照提供流动性的资金*锁定时间来计算，在提供流动性过程中产生损失的用户有同比与损失的补偿修正。比如在提供流动性过程中损失了 5%，那么它最后的的贡献会在原基础上 * 1.05来计算。
对于每一周流动性提供者会按其在当周总流动性贡献比例中给予 8/52 % 的股权。对于所有流动性提供者按其在一年的总流动性贡献中给予 7/52 % 的股权。

交易贡献按照交易量来计算。同样分两部分，8%的股权均匀摊平到一整年中，按每一周的贡献占比计算，剩下7% 按照整体占比计算。

这样做的目的是更好的激励早期参与者并保证流动性供应较为平稳。

PPNFT是一个新的用来取代空投的机制。我们计划让市场自己去为用户的参与行为定价。并同时拉近风投和社区的距离。基本概念是用户在参与poption相关活动的时候他们会像参与GameFi游戏一样从自己的行为中获得NFT。这些NFT在IXO的时候可以被兑换成poption的股份。NFT是可以被交易的，因此投资者可以通过购买这些NFT来在未来获得股份，这也同时有利于市场的成长。我们会在合约中设置与报价相关的锁定资产来规范整个市场。最后股份的发放会按照NFT的市场价值在降噪和再分配后按比例发放给NFT所有者。PPNFT的铸造者被称为社区贡献者， 他们会分享 10% DAO 贡献者红利，无论他们是否出售自己的 NFT。这一红利会在 4 年内持续发放。因此约有 20-30% 是与PPNFT相关联的。

最后是投票机制，我想参考双层决策，决策投票由参考两院制，长期院采用VE架构(House of VE)，众院则面向所有股权持有人(House of All)。PPNFT的铸造者默认为长期院成员，并按照他们占有的锁定仓投票。提案需要同时得到两院通过才能实施。

然后讲一下PPNFT：



PPNFT是poption用来代替空投的项目，我的想法是，反正我的股权会被锁定非常长的时间，为什么不建设一个更稳定健康的市场。PPNFT主要由两部分组成，它的第一个部分是一个自带交易机制的ERC1155 ，在这个合约中我们会引入持有成本机制，从而获得更有效的市场。它的另一个部分是一个兑换机制，可以通过PPNFT兑换poption股票。

我们首先讨论PPNTF的铸造和交易

当一个贡献者完成一定的任务的时，他可以铸造一个该任务类型的NTF。NTF中会有任务，铸造时间，铸造者等属性。在铸造者手中NTF是没有持有成本的，但铸造者需要给该 NTF 定价，我们以美元计价。当一个投资人可以在合约中直接购买这个NFT，他需要向合约支付多于 110% 的价格的稳定币，其中100%的稳定币会直接再被转入铸造者的账户用于支付，而剩下稳定币会被锁定在合约中作为持有成本，该NFT的新报价则为锁仓仓位的十倍。NFT持有人可以在任意时刻调整锁仓仓位，该NFT的报价则会同仓位一起变化。当另一个投资人按报价购买该NFT时，旧持有人的锁仓会和新投资人付款同时转到旧持有人的账户中。

这一设计可以极大的提升市场价格的真实性，现在很多opensea中的报价都是靠左手倒右手抬起来的， wash trading，这样非常的不好，通过增加NFT的持有成本可以比较方便的构建一个更透明的市场。这个市场不利于FOMO对于泡沫市场来说并不友好，但是对于如今熊市来说，会是一个更能显现价值的市场。此外在这个市场中，几乎所有的NFT都会出现在市场上并处于可交易的状态，只有少数被创造者标了超高价格的NFT事实上是不在市场内的，普通持有这也可以通过标很高的价格来将NFT移出市场，但这会带来很高的持有成本。这样做会保证市场流动性，扩大原来非常小的NFT市场。

PPNFT背后的价值
如果一个东西只有持有成本而没有价值，那么这个东西一定是不值钱的。PPNFT背后的价值是Poption的承诺的股份。我们按照以下原则去设计兑换机制。在同一时间段（如一周）有同一标签的NFT能够兑换相同的股份。NFT兑换股份的价值和带有所有相同tag的NFT的市场价格挂钩。在NFT市场中价格越高的NFT种类，在兑换股份的过程中占比也越高。如果一种NFT太容易被生产，其兑换价值就越容易稀释，那么会导致价格下跌。而如果一种NFT因为较难生产而保持稀有，其兑换价值就越不容易被稀释从而维持价格或上涨。这会使系统达到平衡，最后NFT的价格会同时体现其内在价值和生产成本。
在兑换计算过程中我们依旧使用周年双兑换机制去平衡早期参与和参与总量之间的收益。

使用PPNFT的目的和好处
PPNFT的设计希望达成之前空投，投资，和社区建设的目的。
在当前区块链社区中，在空投前空投规则往往保密，因为非常害怕被人以很强的目的薅羊毛。但其实这并不特别好，因为缺乏了明确的激励后愿意参与的人也会变少。另外一些有信息渠道的群体能够偷跑，丧失了透明性和公平性。但如果我们可以很好的平衡薅羊毛的人的话我们就可以提前暴露空头规则并更直接的吸引别人，那会是更好的。在PPNFT方案中，我们借鉴GameFi的想法，空投行为不直接和股权挂钩，而和另一级令牌挂钩。在早期仅给出空头行为和最终股权的弱绑定关系，将明确的强绑定关系延后，一方面更好的去激励参与者，一方面也更好的维持公平性。

先说一下，我们希望看到一个价格有效的市场，而不是价格虚高的市场，因此我们引入持有成本去挤压市场价格的水分。因为市场价格对于项目方来说也是非常重要的信息，我们当然希望NFT价格高。因为越高的价格代表投资人对本项目越看好，并且能吸引越多的人来参与项目。但是我们也会希望能得到一个更真实的反应价值信息的价格。因为我们需要这些信息来为用户行为定价并最终反映到股份的兑换当中去。所以我们加入持有成本。

对于NFT的铸造者来说，NFT对他可能有纪念意义，并且我们希望更多的鼓励铸造者，因此持有成本被取消了。（我不知道这对不对，因为在普通的商业模式中，当商品被制造出来的时候，制造者也是要付出持有成本的。但是在币圈中，绝大多数东西都是没有持有成本的。）
当结算NFT变为股权的时候，我们需要在铸造者无成本持有的NFT上加入一定的成本，不然这对与投资这不公平。加入的方式可以是锁定，可以首先计算一个公允价，然后要求加入超过这个数值的现金锁定一定的时长。不参与锁定的NFT依旧存在，但是被排除出兑换股权的行列中。

我有些担心过于复杂的兑换规则会劝退一些人，但是我又觉得和复杂规则相比，看似简单规则下不透明或者错误设计导致的高风险更可怕。我会去解释每一条规则并且希望大家可以共同参与。

我觉的很多人会被错觉迷惑，有些很复杂的东西掩藏在很简单的东西后面。我希望前面后面都能变得简单。

NFT会通过公允算法来获得兑换价值，比如市场上有同类型的NFT 100 个，他们在市场中的平均价格是 100 USD 那么它们的公允价格就是100。PPNFT是一个多标签系统，我们在计算公允价格时也会考虑标签上的价值传递。在复杂情况下，我们会考虑使用标签的shapley值为标签定价。这可以视为一种在高维空间中求平均的方法。我们在这里不再展开。

把钱锁在合同里总是很浪费的，我们可能考虑将锁在合同里的钱用于AAVE或者curve这样较稳定的投资。但是在当前阶段，并不打算这样做，希望整个系统更简单稳定一些。

PPNFT的智能合约和一些配套代码希望在这个月可以完成。代表股权的币暂时不太打算铸，因为股权较为复杂，最后肯定需要留onlyowner后门，与其这样搞个实际上并没有保证的，不如暂时不发。希望依靠更公开透明的新闻发布和路线图来弥补这一点。合约可以放在较晚的时候再写。

我最主要的任务是让大家能够
