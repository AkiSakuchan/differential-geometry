#import "book-style.typ": *
#import "@preview/theorion:0.3.3": *
#import "@preview/commute:0.3.0": node, arr, commutative-diagram
#import cosmos.rainbow: *
#show: show-theorion

= 基础知识

== 微分流形

=== 微分形式
设 $M$ 是光滑流形，则 $p in M$ 处的切空间 $T_p M$ 的对偶空间 $T_p^* M$ 中的元素称为在 $p$ 处的*余切向量*。
余切向量实际上是从 $T_p M$ 到 $RR$ 的线性函数。

设 $and.big T_p^* M$ 是 $T_p^* M$ 上的外代数，其中 $and.big^r T_p^* M$ 表示
$r$ 次元素，注意到 $and.big^r T_p^* M tilde.equiv (and.big^r T_p M)^*$，所以这些元素实质上是从
$T_p M times dots times T_p M$ 到 $RR$ 的交错线性函数。于是微分形式可以定义为：

#definition(title: "微分形式")[
  $M$ 上的一个 $r$-形式 $omega$ 满足对每个 $p in M$ 都有 $omega_p in and.big^r T_p^* M$。
  显然若还有 $s$-形式 $eta$，则它们的外积是 $(r+s)$-形式，定义为 $(omega and eta)_p = omega_p and eta_p$。
]

设 $f$ 是定义在 $p$ 附近的光滑函数，那么它的*全微分(total differential)*，记为 $d f$，是一个 $1$-形式，定义为
#nonum-equation[
  $T_p M &--> RR \
  X &mapsto.long  X f = angle.l (d f)_p , X angle.r$
]
如果 $p$ 附近有局部坐标系 $x^1, dots, x^m$，那么 $T_p M$ 具有基向量：
#nonum-equation[
  $(partial/(partial x^1))_p , dots, (partial/(partial x^m))_p$
]
于是在 $T_p^* M$ 中的对偶基就是坐标函数的全微分：$(d x^1)_p, dots, (d x^m)_p$；因此 $p$ 附近的 $1$-形式 $omega$ 可以唯一写作
#nonum-equation[
  $omega = sum_(i = 1)^m f_i d x^i$
]
这里 $f_i$ 是定义在 $p$ 附近的函数，称为 $omega$ 相对于 $x^i$ 的分量，如果采用 Einstein 求和约定的话，上式可以写作 $omega = f_i d x^i$。
如果每个 $f_i$ 都是可微函数，那么 $omega$ 就称为微分 $1$-形式。

上面的可以推广到 $r$-形式上。我们知道 $and.big^r T_p^* M$ 有一个基是 $d x^(i_1) and dots and d x^(i_r), i_1 < dots < i_r$，于是
$r$-形式 $omega$ 在 $p$ 附近可以唯一写作
#nonum-equation[
  $omega = sum_(1 <= i_1 < dots < i_r <= m) f_(i_1 dots i_r) d x^(i_1) and dots and d x^(i_r)$
]
当每个分量 $f_(i_1 dots i_r)$ 可微时，$omega$ 就称为微分 $r$-形式。从这里开始，$r$-形式总是指微分形式。

从定义可知 $r$-形式 $omega$ 在 $p$ 上是一个 $r$-元交错线性函数，而根据代数学知识，交错线性函数一定可以写作行列式#footnote[参见 @lane2023algebra[Ch.IX, Sec.4, Lemma 2] ]，
更具体地说，如果 $omega = omega_1 and dots and omega_r$，这里 $omega_i$ 是 $1$-形式，那么对于 $X_j in T_p M, j=1, dots,r$ 有
#nonum-equation($omega(X_1, dots, X_r) = det((omega_i (X_j))_(1<= i,j <= r))$)

我们用 $scr(D)^r (U)$ 表示开集 $U subset.eq M$ 上的全体 $r$-形式构成的向量空间，并约定 $scr(D)^0$ 就是 $U$ 上的光滑函数。再约定
#nonum-equation($scr(D)(U) = plus.big_(r=0)^m scr(D)^r (U)$)
这样每个 $scr(D)^r$ 是 $M$ 上的实向量空间层，也可以视为 $scr(O)_M$-模，这里 $scr(O)_M$ 表示 $M$ 上的光滑函数层：我们定义 $(f omega)_p = f(p) omega_p$。
这样 $scr(D)$ 形成一个 $M$ 上的 $scr(O)_M$-代数。于是*外微分算子(exterior differentiation)* $d$ 用如下方法定义：

+ $d$ 是从 $scr(D)$ 到其自身的层同态，作为 $RR$-线性映射，并且 $d(scr(D)^r) subset scr(D)^(r+1)$；
+ 对每个函数 $f in scr(D)^0$，$d f$ 是全微分；
+ 对于 $omega in scr(D)^r, eta in scr(D)^s$ 有 #nonum-equation($d(omega and eta) = d omega and eta + (-1)^r omega and d eta$)
+ $d^2 = 0$

因此如果在局部表示下 $omega = sum_(1 <= i_1 < dots < i_r <= m) f_(i_1 dots i_r) d x^(i_1) and dots and d x^(i_r)$，那么
$d omega = sum_(1 <= i_1 < dots < i_r <= m) d f_(i_1 dots i_r) and d x^(i_1) and dots and d x^(i_r)$。

微分形式也可以是向量值，设 $V$ 是实 $n$-维向量空间，我们也用 $V$ 来表示 $M$ 上的 $V$-值局部常数层，于是 $V$-值 $r$-形式的层就是张量积
$V times.circle scr(D)^r$，更具体说每个这样的形式 $omega$，在 $p in M$ 处是从 $T_p M times dots times T_p M$ 到 $V$ 的交错 $r$ 元线性映射。
如果 $V$ 有一组基 $e_1,dots, e_n$，那么每个 $omega$ 可以唯一写作 $sum_(i=1)^r omega^i e_i$，这里 $omega^i$ 就是通常的实值 $r$-形式。

=== 李括号的导数表示
#proposition[
  设 $phi$ 是 $M$ 上的光滑自同胚。如果向量场 $X$ 生成的单参数变换群为 $phi_t$，那么
  $phi_* X$ 生成的单参数变换群是 $phi compose phi_t compose phi^(-1)$。
]<向量场在同胚下的像所生成的群>
#proof[
  显然 $phi compose phi_t compose phi^(-1)$ 是单参数变换群。设 $p$ 是 $M$ 上任意点，$q = phi^(-1)(p)$。
  于是 $X_q in T_q M$ 的积分曲线是 $t mapsto phi_t(q)$。这样 $(phi_* X)_p in T_p M$ 的积分曲线就是
  $t mapsto phi compose phi_t compose phi^(-1)(p)$。
  因此 $phi_* X$ 生成的单参数变换群就是 $phi compose phi_t compose phi^(-1)$。
]

#corollary[
  向量场 $X$ 在 $phi$ 下保持不变，也就是 $phi_* X = X$，当且仅当 $phi compose phi_t = phi_t compose phi$
]<向量场在变换下不变的条件>

#proposition[
  设 $X,Y$ 是光滑流形 $M$ 上的向量场。如果 $X$ 生成的局部单参数群是 $phi_t$，那么
  #nonum-equation[
    $[X,Y] = lim_(t->0)(Y - (phi_t)_* Y)/t$
  ]
  更准确地说是
  #nonum-equation[
    $[X,Y]_p = lim_(t->0)(Y_p - ((phi_t)_* Y)_p)/t$
  ]
]<向量场李括号的导数表示>
#proof[
  设 $f$ 是 $M$ 上 $p$ 附近的一个光滑函数。现在 $t mapsto f(phi_t (p))$ 做 Taylor 展开得到
  #nonum-equation[
    $f(phi_t (p)) = f(p) + t dot (X_p f + (d^2 f(phi_t (p)))/(d t^2) stretch(|,size: #230%)_(t=0) dot t/2 + dots)
    = f(p) + t dot g_t (p)$
  ]
  也就是说我们有 $f compose phi_t = f + t dot g_t$，这里 $g_0 = X f$。于是设 $p(t) = phi_t^(-1)(p)$，
  也就是说 $p(t)$ 是 $-X$ 在 $p$ 点的积分曲线，于是
  #nonum-equation[
    $[X,Y]_p f &= X_p (Y f) - Y_p g_0 \ 
    &= lim_(t->0) (Y_p f - (Y f)_p(t))/t - lim_(t->0) (Y g_t)_p(t) \
    &= lim_(t->0) (Y_p f - (Y f)_p(t) - t dot (Y g_t)_p(t))/t \
    &= lim_(t->0) (Y_p f - Y_p(t)(f + t dot g_t))/t \
    &= lim_(t->0) (Y_p f - Y_p(t)( f compose phi_t))/t \
    &= lim_(t->0) (Y_p f - ((phi_t)_* Y)_p f)/t $
  ]
]

#corollary[
  沿用上面的记号，对任意 $s$ 有
  #nonum-equation[
    $(phi_s)_* [X,Y] = lim_(t->0) ((phi_s)_* Y - (phi_(s+t))_* Y)/t$
  ]
]
#proof[
  把 @向量场李括号的导数表示 应用在向量场 $(phi_s)_* Y$ 得到
  #nonum-equation[
    $[X, (phi_s)_* Y] &= lim_(t->0) ((phi_s)_* Y - (phi_t)_* compose (phi_s)_* Y)/t \ 
    &= lim_(t->0) ((phi_s)_* Y - (phi_(s+t))_* Y)/t$
  ]
  而 $(phi_s)_* X = X$，于是 $(phi_s)_* = [X, (phi_s)_* Y]$。
]

在证明中我们有结论
#nonum-equation[
    $(d((phi_t)_* Y))/(d t) stretch(|, size: #230%)_(t = s) = - (phi_s)_* [X,Y]$
  ]

#corollary[
  假设向量场 $X,Y$ 各自生成的单参数变换群是 $phi_t$ 和 $psi_s$。
  那么 $phi_t compose psi_s = psi_s compose phi_t$ 对任意 $s,t$ 都成立当且仅当 $[X,Y] = 0$。
]
#proof[
  必要性：根据 @向量场在变换下不变的条件，$Y$ 被每个 $phi_t$ 保持。于是根据 @向量场李括号的导数表示 就能得到 $[X,Y]=0$。

  充分性：从 $[X,Y] = 0$ 得到 $(d((phi_t)_* Y))/(d t) = 0$，因此 $(phi_t)_* Y$ 保持不变，于是 $psi_t$ 和 $phi_t$ 始终交换。
]

== 李群
=== 群作用
设 $G$ 是李群，$M$ 是光滑流形，$G$ 光滑右作用在 $M$ 上，记为 $R_a: x mapsto x a$。
我们说 $G$ 是*有效(effectively)*（或者*自由*)作用在 $M$ 上指的是对任意 $x in M$ （或者对某些 $x in M$）
$R_a x = x$ 推得出 $a = 1$。

我们知道对于 $A in frak(g)$，通过指数映射 $a_t = exp t A$ 我们得到从 $RR$ 到 $G$ 的同态 $t mapsto a_t$。
而这个 $a_t$ 显然可以在 $M$ 上诱导一个向量场，也就是以单参数变换群 $R_(a_t)$ 所诱导的向量场，这里 $R_a$ 表示 $x in M mapsto x a in M$。
这个向量场称为 $A$ 在 $M$ 上诱导的*基本向量场*，记为 $A^*$。

#proposition[
  映射 $sigma : frak(g) -> frak(X)(M), A mapsto A^*$ 是李代数同态。如果 $G$ 的作用是有效的，那么 $sigma$ 是单射。
  如果 $G$ 的作用是自由的，那么对每个非零 $A in frak(g)$，$sigma(A)$ 在 $M$ 上出处非零。
]<李代数到基本向量场的同态和性质>
#proof[
  对每个 $x in M$，用 $sigma_x$ 表示映射 $a in G mapsto x a in M$。于是有
  $ (sigma_x)_* A_1 = d(sigma_x compose a_t)/(d t) stretch(|,size: #230%)_(t=0) 
    = d(x dot a_t)/(d t) stretch(|,size: #230%)_(t=0) = (sigma A)_x $<从切向量到基本向量场>
  因此 $sigma$ 是线性映射。

  设 $A,B in frak(g)$ 以及 $A^* = sigma A, B^* = sigma B$。于是如果 $a_t = exp t A$，那么根据 @向量场李括号的导数表示 有
  #nonum-equation[
    $[A^*, B^*] = lim_(t->0) (B^* - R_(a_t) B^*)/t$
  ]
  注意到 $R_a_t compose sigma_(x a_t^(-1))(c) = x a_t^(-1) c a_t = sigma_x compose i_(a_t^(-1))$，这里 $i_y : x mapsto y x y^(-1)$。
  因此根据 @从切向量到基本向量场 可得
  #nonum-equation[
    $(R_(a_t) B^*)_x = (R_a_t)_*(B^*_(x a_t^(-1))) 
    = (R_a_t)_* compose (sigma_(x a_t^(-1)))_* B_1 = (sigma_x)_* compose (i_(a_t^(-1)))_* B_1 $
  ]
  根据 @varadarajan1974lie[Sec.2.13]，$(i_y)_* = "Ad"_y in "GL"(frak(g))$，而 $y mapsto "Ad"_y$ 是 $G$ 的伴随表示，因此
  #nonum-equation[
    $(R_(a_t) B^*)_x = (sigma_x)_* ("Ad"_(a_t^(-1)) B_1) $
  ]
  所以
  #nonum-equation[
    $ [A^*, B^*]_x &= lim_(t->0) (B^*_x - (R_(a_t) B^*)_x) / t \
    &= lim_(t->0) ((sigma_x)_* B_1 - (sigma_x)_* ("Ad"_(a_t^(-1)) B_1) ) / t \ 
    &= (sigma_x)_* ( lim_(t->0) (B_1 - "Ad"_(a_t^(-1)) B_1) / t ) $
  ]
  注意 $"Ad"_a = (R_(a^(-1)))_*$，因为 $a x a^(-1) = L_a R_(a^(-1)) x = R_(a^(-1)) L_a$，而当 $B in frak(g)$ 时，
  它是左不变的，也就是 $(L_a)_* A = A$，因此 $"Ad"_(a_t^(-1)) B = (i_(a_t^(-1)))_* B = (R_(a_t))_* B$；再考虑到
  $R_a_t$ 所诱导的向量场正是 $A$，所以根据 @向量场李括号的导数表示 和 @从切向量到基本向量场 就有
  #nonum-equation[
    $[A^*, B^*]_x = (sigma_x)_* ([A,B]_1) = (sigma [A,B])_x$
  ]
  于是 $sigma$ 保持李括号，这样 $sigma$ 就是从 $frak(g)$ 到 $frak(X)(M)$ 的李代数同态。

  如果 $sigma A = 0$，这意味着 $R_a_t$ 在 $M$ 上始终是单位映射。如果 $G$ 有效作用在 $M$ 上，那么就说明对任意 $t$ 有 $a_t = 1$，于是 $A=0$。
  如果 $sigma A$ 在某个 $x in M$ 处是零，这意味着 $R_a_t (x) = x$ 对任意 $t=0$ 成立。当 $G$ 自由作用在 $M$ 上，则 $a_t = 1$，于是 $A=0$。
]

=== Maurer-Cartan 形式
李群 $G$ 上的微分形式称为左不变的指的是对任意 $a in G$ 都有 $L_a^* omega = omega$。
#definition(title: "Maurer-Cartan 形式")[
  一个左不变 $frak(g)$-值 $1$-形式 $omega$ 如果满足对任意 $A in frak(g)$ 都有 $omega(A) = A$，那么就称为 *Maurer-Cartan 形式*。
]
这个定义是良定义的，实际上因为 $A in frak(g)$ 本身也是左不变的，所以
$omega_a (A_a) = omega_a ((L_a)_* A_1) = (L_a^* omega)_1 (A_1) = omega_1 (A_1)= A$。
同时它也是唯一的，因为对每个 $X in T_a G$，都有唯一一个 $A in frak(g)$ 使得 $A_a = X$，于是 $omega_a (X) = A$。

== 纤维丛
设 $G$ 是李群，$M$ 是光滑流形，$pi : P -> M$ 是 $G$-主丛。由于 $G$ 自由作用在 $P$ 上，于是根据 @李代数到基本向量场的同态和性质 可知，
对于非零 $A in frak(g)$，对应的基本向量场 $A^*$ 在 $M$ 上处处非零，映射 $A mapsto A^*_u$ 是从 $frak(g)$ 到过 $u in P$ 的纤维在 $u$ 处切空间的同构，
因为这个纤维实质是 $G$。

#proposition[
  设 $A^*$ 是对应于 $A in frak(g)$ 的基本向量场。对任意 $a in G$，$(R_a)_* A^*$ 是对应于 $"Ad"_(a^(-1))(A) in frak(g)$ 的基本向量场。
]<基本向量场右变换对应于李群伴随表示>
#proof[
  我们知道 $A^*$ 由单参数变换群 $R_a_t$ 诱导，这里 $a_t = exp t A$；而根据 @向量场在同胚下的像所生成的群 我们又知道
  $(R_a)_* A^*$ 所生成的单参数变换群是 $R_a R_a_t R_(a^(-1)) = R_(a^(-1) a_t a)$。

  最后根据 @varadarajan1974lie[式 2.13.7] 有
  #nonum-equation[
    $a^(-1) a_t a = a^(-1) e^(t A) a = exp("Ad"_(a^(-1)) (t A)) = exp(t "Ad"_(a^(-1))(A))$
  ]
  因此 $(R_a)_* A^*$ 是对应于 $"Ad"_(a^(-1))(A) in frak(g)$ 的基本向量场。
]

