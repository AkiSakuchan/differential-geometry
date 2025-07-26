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
  $P$ 上的一个*联络* $Gamma$ 是一个函数 $u mapsto Q_u$，这里 $Q_u$ 是 $T_u P$ 的子空间，称为*水平子空间*，这个函数要满足：
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
显然 $omega(X) = 0$ 当且仅当 $X$ 是水平的。这样 $omega$ 就是 $P$ 上的 $frak(g)$-值 $1$-形式，我们称为联络 $Gamma$ 的*联络形式*。

#proposition[
  联络形式 $omega$ 满足下列条件：
  + $omega(A^*) = A$
  + 对任意 $a in G$ 有 $R_a^* omega = "Ad"(a^(-1)) omega$

  反过来，如果 $P$ 上的一个 $frak(g)$-值 $1$-形式满足上述两个条件，那么存在唯一一个联络 $Gamma$ 使得它的联络形式就是 $omega$。
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

$pi: P -> M$ 诱导一个线性映射 $pi_* : T_u P -> T_p M$，这里 $p = pi(u)$。如果给出一个联络，那么 $pi_*$ 限制在 $Q_u$ 上是一个到
$T_p M$ 的同构：可以验证 $pi_*(G_u) = {0}$，于是 $pi_*|Q_u$ 是到 $T_p M$ 的满射，再考虑到 $dim Q_u = dim P - dim G_u = dim P - dim G = dim M$，
因此 $pi_*|Q_u$ 是同构。如此一来对 $M$ 上的任意向量场 $X$，都有唯一一个 $P$ 上的水平向量场 $X^*$ 使得 $pi_*(X^*) = X$，
这个 $X^*$ 称为 $X$ 的*水平提升*，或者简称为提升。

#proposition[
  对任意 $M$ 上的向量场 $X$，存在唯一水平提升 $X^*$。这个 $X^*$ 对任意 $a in G$ 都在 $R_a$ 下保持不变。
  反过来每个 $P$ 上的水平向量场 $X^*$ 如果被 $G$ 保持不变，那么它是 $M$ 上某个向量场 $X$ 的水平提升。
]<向量场水平提升的特征>

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

  反过来，如果有一组 ${omega_alpha}$ 满足上述条件。我们要构造一个联络形式 $omega$：对任意 $X in T_u P$，通过
  $psi_alpha : pi^(-1)(U_alpha) ->^tilde U_alpha times G$ 对应唯一一个 $(Y,Z) in T_p M plus.circle T_a G$。
  因此
  #nonum-equation[
    $omega(X) = omega(psi_(alpha*)^(-1)(Y,Z)) = omega(psi_(alpha*)^(-1)(Y,0)) + omega(psi_(alpha*)^(-1)(0,Z))$
  ]
  由于 $psi_alpha$ 是右 $G$-映射，因此 $psi_alpha^(-1) = R_a compose psi_alpha^(-1) compose R_(a^(-1))$，
  而 $(psi_alpha^(-1) compose R_(a^(-1)))_*(Y,0) = sigma_(alpha*)(Y)$，因此
  #nonum-equation[
    $omega(psi_(alpha*)^(-1)(Y,0)) = omega(R_(a*) sigma_(alpha*)(Y)) = "Ad"(a^(-1)) omega_alpha (Y) = "Ad"(a^(-1)) omega_alpha (pi_* X)$
  ]
  设 $A in frak(g)$ 使得 $A_a = Z$。那么 $Z$ 在 $a in G$ 处的积分曲线是 $a e^(t A)$，于是 $psi_(alpha*)^(-1)(0,Z)$ 是
  $psi_alpha^(-1)(p, a e^(t A)) = u e^(t A)$ 在 $t=0$ 处的导数，也就是 $A^*_u$，这样 
  #nonum-equation[
    $omega(psi_(alpha*)^(-1)(0,Z)) = A = theta(Z) = theta(phi_(alpha*)(X))$
  ]
  这里 $phi_alpha = "pr"_2 compose psi_alpha$。因此 $omega$ 如果在 $U_alpha$ 上满足 $omega_alpha = sigma_alpha^* omega$，那么在
  $U_alpha$ 上 $omega$ 必然有形式
  #nonum-equation[
    $omega = "Ad"(phi_alpha^(-1)) pi^* omega_alpha + phi_alpha^* theta$
  ]
  这样就证明了联络形式的唯一性。至于存在性，只需要验证上式是良定义即可，为此设 $u in pi^(-1)(U_alpha inter U_beta)$。于是有
  #nonum-equation[
    $& quad "Ad"(phi_alpha (u)^(-1)) pi^* omega_alpha (X) + phi_alpha^* theta(X) \
    &= "Ad"(phi_alpha (u)^(-1))lr(( "Ad"(psi_(alpha beta)(p)) omega_beta (pi_* X) + theta_(beta alpha)(pi_* X) ), size: #150%) + theta(phi_(alpha*) X) \
    &= "Ad"(phi_beta (u)^(-1)) pi^* omega_beta (X) + "Ad"(phi_alpha (u)^(-1)) theta_(beta alpha)(pi_* X) + theta(phi_(alpha*) X) $
  ]
  现在像前面一样，对 $phi_beta = (psi_(beta alpha) compose pi) dot phi_alpha$ 和李群乘法使用 Leibniz 法则就有
  #nonum-equation[
    $phi_(beta*)(X) = (R_(phi_alpha (u)))_* (psi_(beta alpha))_* pi_* X + (L_(psi_(beta alpha)(p)))_* (phi_alpha)_* X  $
  ]
  考虑到 $theta$ 左不变，因此
  #nonum-equation($theta((L_(psi_(beta alpha)(p)))_* (phi_alpha)_* X) = theta(phi_(alpha *) X)$)
  注意在 @李代数到基本向量场的同态和性质 的证明里面我们用到了性质 $"Ad"_a = (R_(a^(-1)))_*$，因此如果把
  $(psi_(beta alpha))_* pi_* X$ 视为某个 $A in frak(g)$ 在 $psi_(beta alpha)(p)$ 处的切向量的话，就有
  #nonum-equation[
    $& quad theta((R_(phi_alpha (u)))_* (psi_(beta alpha))_* pi_* X) 
    = theta_(phi_beta(u))("Ad"(phi_alpha (u)^(-1)) A) \
    &= "Ad"(phi_alpha (u)^(-1)) A
    = "Ad"(phi_alpha (u)^(-1)) theta((psi_(beta alpha))_* pi_* X) \
    &= "Ad"(phi_alpha (u)^(-1)) theta_(beta alpha)(pi_* X)$
  ]
  于是
  #nonum-equation[
    $"Ad"(phi_alpha (u)^(-1)) pi^* omega_alpha (X) + phi_alpha^* theta(X) 
    &= "Ad"(phi_beta (u)^(-1)) pi^* omega_beta (X) + theta(phi_(beta*)(X)) \ 
    &= "Ad"(phi_beta (u)^(-1)) pi^* omega_beta (X) + phi_beta^* theta(X)$
  ]
  这样就证明了良定义。
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

== 协变导数，曲率形式和结构方程
设 $G$ 是李群，$pi : P -> M$ 是 $G$-主丛，$rho : G -> "GL"(V)$ 是 $G$ 在有限维向量空间 $V$ 上的表示。
于是 $P$ 上的一个 $(rho,V)$-型*伪张量形式(pseudotensorial form)*，或者 $G$-*等变(equivariant)*形式指的是一个
$V$-值 $r$-形式 $phi$，且满足对任意 $a in G$ 都有
#nonum-equation($R_a^* phi = rho(a^(-1)) phi$)
也就是说这个 $phi$ 和 $G$ 在 $V$ 上的作用可以交换。一个这样的形式，如果是水平的，也就是说当 $X_1,dots, X_r in T_u P$ 中任意一个是垂直切向量时
就有 $phi(X_1, dots, X_r) = 0$，那么 $phi$ 就称为*张量形式*，它组成的层记为 $scr(D)^r (rho,P)$
张量形式在每个点上是 $and.big^r Q_u$ 的对偶空间的元素。


#proposition[
  $E = P times_rho V$ 是 $P$ 的联系向量丛，$phi$ 是 $V$-值张量 $r$-形式，那么下列定义是良定义：对任意 $X_1, dots, X_r in T_x M$
  #nonum-equation($phi^flat_x (X_1, dots, X_r) = u(phi(X_1^*, dots, X_r^*))$)
  这里 $pi(u) = x$，$X_i^* in T_u P$ 使得 $pi_* X_i^* = X_i$；这里还把 $u$ 看成从 $V$ 到纤维 $E_x$ 的线性映射（参见 @主丛元素视为从标准纤维到任意纤维的同构）。
  $tilde(phi)$ 是 $M$ 上一个 $E$-值 $r$ 形式，$phi mapsto phi^flat$ 是从 $P$ 上的 $V$-值张量形式到 $M$ 上的 $E$-值微分形式的线性同构。

  反过来，如果给定一个 $M$ 上的 $E$-值 $r$-形式 $phi$，那么下列定义的微分形式是 $V$-值 $r$-张量形式：对任意 $X^*_1, dots, X^*_r in T_u P$
  #nonum-equation[
    $
    phi^sharp (X^*_1, dots, X^*_r) = u^(-1)(phi_x (pi_* X^*_1, dots, pi_* X^*_r))
    $
    ]
  并且是上述 $phi mapsto phi^flat$ 的逆映射。
]<主丛张量形式与联系丛形式同构>
#proof[
  首先 $phi^flat$ 是良定义: 满足 $pi_* X^*'_i = pi_* X^*_i$ 的 $X^*'_i in T_u P$ 必然有 $pi_*(X^*'_i - X^*_i) = 0$，
  也就是说 $X^*'_i - X^*_i$ 是垂直的，这样由于 $phi$ 是水平的，因此同一个 $u in P$，$phi^flat_x$ 的定义与 $X^*_i$ 的选择无关。
  当 $u$ 变为 $u a$ 时，由于 $pi compose R_a = pi$，因此 $pi_*(R_(a*) X^*_i) = X_i$，并且 $R_(a*)X^*_i in T_(u a) P$，然后容易看到
  #nonum-equation[
    $(u a) phi(R_(a*)X^*_1, dots, R_(a*)X^*_r) = u(phi(X_1^*, dots, X_r^*))$
  ]
  上面已经证明了和 $X^*_i$ 的选择无关，于是 $phi^flat$ 是良定义。

  反过来，如果有任何一个 $X^*_i$ 是垂直的，那么显然 $pi_* X^*_i = 0$，上面定义的 $phi_x (X^*_1, dots, X^*_r) = 0$。
  若有 $a in G$，那么设 $X_i = pi_* X^*_i$，于是不难看到
  #nonum-equation[
    $
      R_a^* phi^sharp (X^*_1, dots, X^*_r) = phi^sharp (R_(a*) X^*_1, dots, R_(a*) X^*_r) 
      = (u a)^(-1)(phi_x (X_1, dots, X_r))
    $
    ]
  注意 $u: xi mapsto [u, xi]$，现在 $[u,xi] = phi_x (X_1, dots, X_r)$ 是不变的，但是 $u$ 变成了 $u a$，因此 $xi$ 必然变成 $a^(-1) xi$，所以上式最后等于
  $rho(a^(-1)) u^(-1)(phi_x (X_1, dots, X_r))$。

  最后它们互为逆映射，以及是线性映射很容易验证。
]

#corollary[
  满足 $f(u a) = rho(a^(-1)) f(u)$ 的映射 $f:P -> V$ 和 $E$ 的截面一一对应。 
]

当 $rho$ 是平凡表示时，$E = P times_rho V tilde.equiv P times V$，此时 $E$-值微分形式就是 $M$ 上的 $V$-值微分形式
#corollary[
  $P$ 上的$V$-值水平微分形式 $phi$ 如果满足 $R_a^* phi = phi,a in G$，那么存在唯一一个 $M$ 上的 $V$-值微分形式 $phi_M$ 使得 $phi = pi^* phi_M$。
  特别地，当 $V = RR$ 时的特殊情况就是说 $P$ 上 $G$-等变水平形式与 $M$ 上的微分形式一一对应。
]


#proposition[
  设 $Gamma$ 是 $P$ 上的联络，$Q_u$ 是 $T_u P$ 的水平子空间，$h:T_u P -> Q_u$ 是水平投射。
  如果 $phi$ 是 $V$-值伪张量 $r$-形式，那么
  + 通过 $(phi h)(X_1, dots, X_r) = phi(h X_1, dots, h X_r), X_i in T_u P$ 定义的 $phi h$ 是张量形式；
  + $d phi$ 是伪张量 $(r+1)$-形式；
  + $D phi = (d phi)h$ 是张量 $(r+1)$-形式
]
#proof[
  不难验证对任意 $a in G$ 有 $R_(a*) compose h = h compose R_(a*)$ 进而有
  #nonum-equation[
    $R_a^* (phi h)(X_1, dots, X_r) &= phi(h R_(a*) X_1, dots, h R_(a*) X_r) \ 
    &= phi(R_(a*) h X_1, dots, R_(a*) h X_r) \
    &= rho(a^(-1)) (phi h)(X_1, dots, X_r) $
  ]
  因此 $(phi h)$ 是伪张量形式，而它显然是水平的。命题 2 来自于 $R_a^* compose d = d compose R_a^*$。命题 3 是前两个的推论。
]

#definition(title: "协变导数，曲率形式")[
  $D phi$ 称为 $phi$ 的*协变导数*，$D$ 称为*协变求导算子*。

  如果 $rho = "ad":G -> "GL"(frak(g))$ 是 $G$ 的伴随表示，则 $("ad",frak(g))$-型记为 $"ad" G$ 型。
  联络形式 $omega$ 是 $"ad" G$ 型的伪张量形式（@联络等价于联络形式），于是 $D omega$ 是 $"ad" G$ 型的 $2$-张量形式，称为 $omega$ 的*曲率形式*，
  用 $Omega$ 表示。
]

#proposition[
  假设有 $P$ 上的 $G$-等变水平形式 $omega$，又有 $V$-值张量形式 $eta$，那么 $omega and eta$ 是 $V$-值张量形式，并且
  #nonum-equation($D(omega and eta) = D omega and eta + (-1)^(deg omega) omega and D eta$)
]
#proof[
  对任意 $a in G$ 和 $X_1, dots, X_(r+l) in T_u P$，这里 $r = deg omega, l = deg eta$，有
  #nonum-equation[
    $
      R_a^*&(omega and eta)(X_1, dots, X_(r+l)) = (omega and eta)(R_(a*) X_1, dots, R_(a*) X_(r+l)) \
      &= 1 /(r! dot l!) sum_(sigma in frak(S)_(r+l)) "sgn"(sigma) omega(R_(a*)X_sigma(1), dots, R_(a*)X_sigma(r)) eta(R_(a*)X_sigma(r+1), dots, R_(a*)X_sigma(r+l)) \
      &= 1 /(r! dot l!) sum_(sigma in frak(S)_(r+l)) "sgn"(sigma) omega(X_sigma(1), dots, X_sigma(r)) rho(a^(-1))( eta(X_sigma(r+1), dots, X_sigma(r+l)) ) \
      &= rho(a^(-1)) ( 1 /(r! dot l!) sum_(sigma in frak(S)_(r+l)) "sgn"(sigma) omega(X_sigma(1), dots, X_sigma(r)) eta(X_sigma(r+1), dots, X_sigma(r+l)) ) \
      &= rho(a^(-1)) ( (omega and eta)(X_1 , dots, X_(r+l)) )
    $
  ]
  因此 $omega and eta$ 是 $G$-等变的，它显然也是水平的，所以 $omega and eta$ 是 $V$-值张量形式。

  根据 @向量值微分形式乘积的外微分 可知
  #nonum-equation[
    $
      D(omega and eta) &= (d(omega and eta))h \
      &= (d omega and eta + (-1)^(deg omega) omega and d eta)h \
      &= D omega and eta + (-1)^(deg omega) omega and D eta
    $
  ]
  最后一步直接来自向量值微分形式乘法的定义以及 $omega h = omega, eta h = eta$ 也就是它们都是水平的。
]

根据 @主丛张量形式与联系丛形式同构 中的同构，对任意 $M$ 上的 $E$-值微分形式 $eta$，协变导数
#nonum-equation[
  $
    D: scr(D)^r (rho,V) --> scr(D)^(r+1) (rho,V)
  $
]
可以通过 $eta mapsto (D eta^sharp)^flat$ 诱导一个算子
#nonum-equation[
  $
    D: scr(D)^r (E) --> scr(D)^(r+1)(E)
  $
]
关于这个算子有
#proposition[
  $D:scr(D)^r (E) -> scr(D)^(r+1)(E)$ 是 $E$ 上的协变导数。
]