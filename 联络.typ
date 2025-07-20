#import "book-style.typ": *
#import "@preview/theorion:0.3.3": *
#import "@preview/commute:0.3.0": node, arr, commutative-diagram
#import cosmos.rainbow: *
#show: show-theorion

= 主丛联络
== 定义以及其他形式
设 $M$ 是光滑流形，$G$ 是李群，$pi:P -> M$ 是 $M$ 上的 $G$-主丛。对任意 $u in P$，设 $T_u P$ 是 $P$ 的切空间。
那么容易得到 $pi(u)$ 上的纤维 $P_pi(u) := pi^(-1)(pi(u))$ 是 $P$ 的子流形，这个子流形在 $u$ 点处的切空间是 $T_u P$ 的子空间，
称为 $u$ 处的*垂直子空间*，记为 $G_u$。

#definition(title: "联络")[
  $P$ 上的一个*联络* $Omega$ 是一个函数 $u mapsto Q_u$，这里 $Q_u$ 是 $T_u P$ 的子空间，称为*水平子空间*，这个函数要满足：
  #enum(numbering: "(a)")[
    $T_u P = G_u plus.circle Q_u$
  ][
    $Q_(u a) = (R_a)_* Q_u$，这里 $a in G$，而 $R_a : P -> P$ 是映射 $u mapsto u a$
  ][
    $u mapsto Q_u$ 是光滑的，也就是对每个 $u$，在其附近存在一个局部光滑向量场 $X_1,dots,X_r$ 能张成 $Q_u$
  ]
  
  每个切向量 $X in T_u P$，可以写成 $X = Y + Z$，这里 $Y in G_u$，$Z in Q_u$ 分别称为 $X$ 的垂直分量和水平分量，记作 $v X$ 和 $h X$。
  如果 $X$ 只有垂直分量（或者水平分量），则称 $X$ 是垂直的（或者水平的）。
]

前面已经知道 $A mapsto A^*_u$ 是从 $frak(g)$ 到 $G_u$ 的同构。因此对每个 $X in T_u P$ 定义
$omega(X)$ 是这个唯一的 $A in frak(g)$ 使得 $A^*_u = v X$，也就是说把 $X$ 的垂直分量和 $frak(g)$ 里面的元素等同起来。
显然 $omega(X) = 0$ 当且仅当 $X$ 是水平的。这样 $omega$ 就是 $P$ 上的 $frak(g)$-值 $1$-形式，我们称为联络 $Omega$ 的*联络形式*。

#proposition[
  联络形式 $omega$ 满足下列条件：
  + $omega(A^*) = A$
  + 对任意 $a in G$ 有 $R_a^* omega = "Ad"_(a^(-1)) compose omega$

  反过来，如果 $P$ 上的一个 $frak(g)$-值 $1$-形式满足上述两个条件，那么存在唯一一个联络 $Omega$ 使得它的联络形式就是 $omega$。
]<联络等价于联络形式>
#proof[
  具体参见 @kobayashi1963foundations[Ch.2, Prop.1.1]。简单来说条件 1 直接来自于联络形式的定义，条件 2 通过分别考虑
  $X$ 是水平的和垂直的两种情况来讨论，当 $X$ 水平时，借助联络定义条件 (b) 得到两边都为零，而垂直时可直接验证。

  反过来，如果 $omega$ 满足两个条件，则定义
  #nonum-equation[
    $Q_u = {X in T_u P | omega(X) = 0}$
  ]
  然后一一验证 $u mapsto Q_u$ 符合联络定义，唯一性是显然的。在分解的时候，注意到 $X = X - omega(X)^*_u + omega(X)^*_u$，
  并可以验证前面的部分属于 $Q_u$，后面的部分当然属于 $G_u$；而 $Q_u inter G_u = {0}$ 直接从条件 1 得到。
]

现在设 ${U_alpha}$ 是 $M$ 上的一组开覆盖，并且 $P$ 在每个开集 $U_alpha$ 上有局部平凡化
$psi_alpha: pi^(-1)(U_alpha) ->^tilde U_alpha times G$，设对应的转移函数为 $psi_(alpha beta) : U_alpha inter U_beta -> G$。
对每个 $alpha$，$sigma_alpha$ 是 $U_alpha$ 上的截面 $sigma_alpha (x) = psi_alpha^(-1)(x,1)$，也就是恒一截面。