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
  + 对任意 $a in G$ 有 $R_a^* omega = "Ad"(a^(-1)) omega$

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
设 $theta$ 是 $G$ 上的 Maurer-Cartan 形式。在每个非空 $U_alpha inter U_beta$ 上定义 $frak(g)$-值 $1$-形式
#nonum-equation($theta_(alpha beta) = psi_(alpha beta)^* theta$)
对每个 $alpha$，定义 $U_alpha$ 上的 $frak(g)$-值 $1$-形式
#nonum-equation($omega_alpha = sigma_alpha^* omega$)
现在可以把联络形式 $omega$ 用一组 $U_alpha$ 上的形式来表示：

#proposition[
  这组形式 ${theta_(alpha beta)}$ 和 ${omega_alpha}$ 满足对任意 $alpha,beta$ 在非空 $U_alpha inter U_beta$ 上有
  #nonum-equation($omega_beta = "Ad"(psi_(alpha beta)^(-1)) omega_alpha + theta_(alpha beta)$)
  反过来如果一组 $frak(g)$-值 $1$-形式 ${omega_alpha}$ 分别定义在 $U_alpha$ 上，并且满足上述条件，那么存在唯一一个联络形式
  $omega$ 使得 $omega_alpha = sigma_alpha^* omega$。
]
#proof[
  根据上面的定义，$sigma_beta (x) = sigma_alpha (x) psi_(alpha beta)(x)$，这里 $psi_(alpha beta)$ 是从
  $U_beta$ 到 $U_alpha$ 的转移函数。设 $u = sigma_beta (x),u'=sigma_alpha (x), a = psi_(alpha beta)(x)$。
  对映射 $m:P times G -> P$ 使用 @Leibniz法则[Leibniz 法则] 可得，这个映射在 $(u',a) in P times G$ 处为：
  #nonum-equation($m_*(X,Y) = R_(a*)(X) + L_(u' *)(Y), quad X in T_u' P, Y in T_a G$)
  这里 $L_u':G->P$ 是 $g mapsto u'g$。 对于 $X in T_x M$ 时 $sigma_(alpha*)(X) in T_u' P, psi_(alpha beta *)(X) in T_a G$ 就有
  #nonum-equation[
    $sigma_(beta *)(X) = R_(a*)(sigma_(alpha*)(X)) + L_(u'*)(psi_(alpha beta *)(X))$
  ]
  把 $omega$ 应用在上式，并使用 @联络等价于联络形式 得到：
  #nonum-equation[
    $omega_beta (X) &= omega(R_(a*)(sigma_(alpha*)(X))) + omega(L_(u'*)(psi_(alpha beta *)(X))) \
    &= (R_a^* omega)(sigma_(alpha*)(X)) + omega(L_(u'*)(psi_(alpha beta *)(X))) \
    &= "Ad"(psi_(alpha beta)^(-1)) omega_alpha (X) + omega(L_(u'*)(psi_(alpha beta *)(X)))$
  ]

  对于最后一项，我们注意到对任意 $A in frak(g)$，它在任意点 $a in G$ 处的积分曲线是 $a e^(t A)$，于是
  $L_u'(a e^(t A)) = u'a e^(t A)$ 在 $t=0$ 处的导数正是 $A^*_(u'a)$。因此对于 $A = psi_(alpha beta *)(X)$ 有
  #nonum-equation($omega(L_(u'*)(psi_(alpha beta *)(X))) = omega(A^*_(u'a)) = A = theta(A) = 
  theta(psi_(alpha beta *)(X)) = theta_(alpha beta)(X)$)
  这样我们就证明了 $omega_beta = "Ad"(psi_(alpha beta)^(-1)) omega_alpha + theta_(alpha beta)$。

  反过来，如果有一组 ${omega_alpha}$ 满足上述条件。
]

#corollary[
  当 $G$ 是 $"GL"(KK)$ 的李子群时，这里 $KK = RR$ 或者 $CC$，也就是说 $G$ 是矩阵李群时，联络形式的局部表现之间的关系可以写成：
  #nonum-equation($omega_beta = psi_(alpha beta)^(-1) dot omega_alpha dot psi_(alpha beta) + psi_(alpha beta)^(-1) dot d psi_(alpha beta)$)
]

#lemma(title: "Leibniz 法则")[
  设 $f$ 是从积流形 $M times N$ 到另一个流形 $V$ 的映射，那么 $f_* : T_((p,q))(M times N) -> T_f(p,q) V$ 可以表示为：
  如果 $Z in T_((p,q))(M times N)$ 对应到 $(X,Y) in T_p M times T_q N$，那么 $f_*(Z) = f_(1*)(X) + f_(2*)(Y)$，
  这里 $f_1:M->V$ 是 $x mapsto f(x,q)$，而 $f_2:N -> V$ 是 $y mapsto f(p,y)$。
]<Leibniz法则>
#proof[
  只用考虑 $M,N,V$ 都是欧式空间的情况。这个命题可直接通过 Jacobi 矩阵来验证。
]