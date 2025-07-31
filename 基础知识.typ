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
#nonum-equation($omega(X_1, dots, X_r) = 1/r! det((omega_i (X_j))_(1<= i,j <= r))$)

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
$scr(D)^r (V) = V times.circle scr(D)^r$，更具体说每个这样的形式 $omega$，在 $p in M$ 处是从 $T_p M times dots times T_p M$ 到 $V$ 的交错 $r$ 元线性映射。
如果 $V$ 有一组基 $e_1,dots, e_n$，那么每个 $omega$ 可以唯一写作 $sum_(i=1)^r omega^i e_i$，这里 $omega^i$ 就是通常的实值 $r$-形式。

设 $V,W,Z$ 是有限维向量空间，$mu: V times W -> Z$ 是双线性映射，那么对于 $omega in scr(D)^r (V), eta in scr(D)^l (W)$，我们定义
#nonum-equation[
  $
    (omega and eta)(X_1, dots, X_(r+l)) = \
    1/(r! dot l!) sum_(sigma in frak(S)_(r+l)) ("sgn" sigma)mu(omega(X_sigma(1), dots, X_sigma(r)), eta(X_sigma(r+1), dots, X_sigma(r+l)))
  $
]
这里 $frak(S)$ 表示对称群，此定义推广了契积 $and$ 的定义。

#proposition[
  设 $v_i$ 是 $V$ 中的一组向量，$w_j$ 是 $W$ 中的一组向量。又设 $omega = sum_i omega^i v_i in scr(D)^r (V)$ 和 $eta = sum_j eta^j w_j in scr(D)^l (W)$，
  这里 $omega^i$ 和 $eta^j$ 是流形 $M$ 上的 $RR$-值微分形式，那么
  #nonum-equation[
    $
      omega and eta = sum_(i,j) (omega^i and eta^j) mu(v_i, w_j) in scr(D)^(r+l)(Z)
    $
  ]
]<向量值微分形式乘积的具体表示>
#proof[
  参见 @tu2017differential[Prop.21.1] 以及 @kobayashi1963foundations[p.35, interiro product]，实际上就是按照定义验证即可。
]

#corollary[
  #nonum-equation($d(omega and eta) = (d omega) and eta + (-1)^deg(omega) omega and d eta$)
]<向量值微分形式乘积的外微分>

有两种特殊情况值得注意。首先是 $V,W$ 都是矩阵，其中 $V$ 是 $m times p$ 矩阵的空间，$W$ 是 $p times n$ 矩阵的空间，此时
$Z$ 选择 $m times n$ 矩阵的空间，$mu$ 就是矩阵乘法。那么 $omega$ 和 $eta$ 就是由微分形式构成的矩阵，而
$omega and eta$ 是普通矩阵乘法，但是每一项之间的乘法则是契积 $and$。

第二种情况是 $V=W=frak(g)$，这里 $frak(g)$ 是一个李代数，而 $mu : frak(g) times frak(g) -> frak(g)$ 是李括号，容易看到
#nonum-equation($(omega and eta)(X,Y) = [omega(X), eta(Y)] - [omega(Y), eta(X)]$)

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

== 张量场

#proposition[
  如果 $omega$ 是 $r$-形式，那么有
  #nonum-equation[
    $
    (d omega)(X_0, dots, X_r) = 1/(r+1) sum_(i=0)^r (-1)^i X_i (omega(X_0, dots, cancel(X_i), dots, X_r)) \
    + 1/(r+1) sum_(0 <= i < j <= r) (-1)^(i+j) omega([X_i, X_j], X_0, dots, cancel(X_i), dots, cancel(X_j), dots, X_r)
    $
  ]
  这里 $cancel(X)$ 表示这一项没有。当 $r=1,2$ 时上述公式有两个特别有用的形式：如果 $omega$ 是 $1$-形式，那么
  #nonum-equation[
    $
      (d omega)(X,Y) = (X(omega(Y)) - Y(omega(X)) - omega([X,Y]))/2
    $
  ]
  如果 $omega$ 是 $2$-形式，那么
  #nonum-equation[
    $
      (d omega)(X,Y,Z) = 1/3 { X(omega(Y,Z)) + Y(omega(Z,X)) + Z(omega(X,Y)) \
       - omega([X,Y],Z) - omega([Y,Z],X) - omega([Z,X],Y) }
    $
  ]
]<微分形式求导作用在向量场上用李括号表示>

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
  一个左不变 $frak(g)$-值 $1$-形式 $theta$ 如果满足对任意 $A in frak(g)$ 都有 $theta(A) = A$，那么就称为 *Maurer-Cartan 形式*。
]
这个定义是良定义的，实际上因为 $A in frak(g)$ 本身也是左不变的，所以
$theta_a (A_a) = theta_a ((L_a)_* A_1) = (L_a^* theta)_1 (A_1) = theta_1 (A_1)= A$。
同时它也是唯一的，因为对每个 $X in T_a G$，都有唯一一个 $A in frak(g)$ 使得 $A_a = X$，于是 $theta_a (X) = A$。

如果考虑到 $T_1 G$ 和 $frak(g)$ 同构，那么对任意 $X in T_a G$，可以定义 $theta_a (X) = (L_(a^(-1)))_* X$，这样有：

#proposition[
  设 $M$ 是光滑流形，$f : M -> "GL"(n,RR)$ 是光滑映射，$theta$ 是 $"GL"(n,RR)$ 的 Maurer-Cartan 形式。
  那么 $f^* theta = f^(-1) d f$，这里 $phi^(-1)$ 表示值的逆矩阵。

  特别地，对于矩阵李群 $G$，也就是 $G$ 是一般线性群的李子群时，$G$ 的 Maurer-Cartan 可以表示为 $theta_g = g^(-1) d g$。
]
#proof[
  对任意 $X in T_p M$，有
  #nonum-equation[
    $f^* theta(X) &= theta(f_* X) = (L_(f(p)^(-1)))_* f_* X 
    = L_(f(p)^(-1)) d( f(gamma(t)) )/(d t) stretch(|, size: #230%)_(t = 0) = f(p)^(-1) d f(X)$
  ]
  这里 $gamma(t)$ 是 $X$ 的积分曲线，另外注意到在一般线性群当中，$(L_a)_* = L_a$。
]

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

设 $G$ 是拓扑群，$M$ 是拓扑空间，$pi: P -> M$ 是 $G$-主丛，$F$ 是拓扑空间并且 $G$ 右作用在 $F$ 上。在 $P times F$ 上定义一个 $G$-作用：
#nonum-equation($a dot (u,xi) mapsto.long (u a, a^(-1) xi)$)
在这个作用下，$P times F$ 的商记为 $E=P times_G F$，如果 $F$ 是向量空间而 $G$ 在 $F$ 上有表示 $rho$，那么也记为 $P times_rho F$。
标准投射 $P times F -> P$ 和 $G$ 作用相容，因此诱导映射 $pi_E : E -> M$。而在 $U subset M$ 上的局部平凡化
$pi^(-1)(U) tilde.equiv U times G$ 也将产生映射
#nonum-equation[
  $pi_E^(-1)(U) = pi^(-1)(U) times_G F tilde.equiv (U times G) times_G F$
]
而后者与 $U times F$ 同胚：$[(x,a),xi] mapsto (u,a xi)$。
因此 $E$ 是一个纤维丛，标准纤维是 $F$，结构群是 $G$，变换函数与 $P$ 的变换函数相同，这个纤维丛称为 $P$ 的*联系丛*。

#proposition[
  对于 $u in P$，通过 $xi mapsto [u,xi]$ 把 $u$ 视为从 $F$ 到 $E$ 的映射。那么 $u$ 实际上是从 $F$ 到 $E_x = pi_E^(-1)(x)$ 的双射，
  这里 $x = pi(u)$，并且对任意 $a in G$ 有
  #nonum-equation($(u a)(xi) = u(a xi)$)
]<主丛元素视为从标准纤维到任意纤维的同构>

设 $G$ 是拓扑群，$H$ 是子群，$q:Q -> M$ 是 $H$-主丛。那么 $G$ 通过群乘法可以视为一个左 $H$-空间，这样就有纤维丛 $p: Q times_H G -> M$。
注意 $Q times_H G$ 也可以视为右 $G$-空间，于是如果有 $G$-主丛 $pi: P -> M$ 和 $M$ 上的右 $G$-同胚 $rho: Q times_H G -> P$，那么
$Q times_H G$ 是 $M$ 上的 $G$-主丛，这实质上告诉我们 $P$ 的结构群没有那么大，只有 $H$，此时我们说 $(q,rho)$ 是 $pi$ 的*约化(reduction)*，
$Q$ 是 $P$ 的*约化丛(reduced bundle)*。

不难验证
#nonum-equation[
  $
    Q &--> Q times_H G \
    u &mapsto.long [u,1]
  $
]
是单射，因此结合 $rho$ 我们就得到从 $Q$ 到 $P$ 的单射，通过这个单射可以把 $Q$ 视为 $P$ 的子集，
于是我们有了一个 $P$ 的子集 $Q$，并且 $Q -> M$ 是 $H$-主丛。
反过来，如果有 $P$ 的子集 $Q$ 是 $M$ 上的 $H$-主丛，那么
#nonum-equation[
  $
    Q times_H G &--> P \
    [u,g] &mapsto.long u dot g
  $
]
是 $G$-同胚，因此 $Q $ 是 $P$ 的约化丛。这样我们看到，$P$ 的约化丛的另一个等价定义便是 $P$ 的子集 $Q$ 使得 $Q -> M$ 是 $H$-主丛。

#note-box[
  考虑到 $"GL"(RR,n)$-主丛实质上是 $n$-维实向量丛，因此对任意一般线性群的李子群 $G$，以它为结构群的主丛
  $Q$ 实质上是某个 $M$ 上的向量丛的标架丛的约化丛。因此此后讨论 $G$-丛时，这里 $G$ 是矩阵李群，可以指 $G$-主丛或者向量丛的标架丛的约化丛，
  此时可以视为某种向量丛。
]


#proposition[
  $G$-主丛 $pi: P -> M$ 能约化到子群 $H$-主丛 $q: Q -> M$ 上当且仅当存在 $P$ 的局部平凡化 ${(U_alpha,phi_alpha)}$
  使得其上的转换函数 $psi_(beta alpha)$ 的值都在 $H$ 当中。
]<约化群的充要条件>
#proof[
  假设 $G$ 能约化到 $H$ 上，$q: Q -> M$ 是约化丛。那么 $Q$ 可以视为 $P$ 的子空间，设 $pi' = pi|Q$。
  设有 $Q$ 的局部平凡化 ${(U_alpha,phi'_alpha)}$，那么每个 $H$-同胚
  #nonum-equation[
    $phi'_alpha : pi'^(-1)(U_alpha) -->^tilde U_alpha times H$
  ]
  我们希望扩展到 $pi^(-1)(U_alpha)$ 上成为 $G$-同胚 $phi_alpha$。于是对任意 $v in pi^(-1)(U_alpha)$，必然可以表示为 $v = u a$，这里
  $u in pi'^(-1)(U_alpha)$，于是 $phi_alpha (v) = phi'_alpha (u) a$，所以 $phi_alpha$ 只能如此定义。
  它是良定义的：若有 $v = u_1 a_1 = u_2 a_2$，那么 $u_1 = u_2 a_2 a_1^(-1)$；
  又由于 $u_1,u_2$ 在同一个 $Q$ 的纤维里，于是肯定有 $a in H$ 使得 $u_1 = u_2 a$，进而考虑到 $G$ 自由作用在 $P$ 上，于是 $a_2 a_1^(-1) = a in H$，
  这样 $phi'_alpha (u_1) = phi'_alpha (u_2 a_2 a_1^(-1))$ 就可以得到 $phi'_alpha (u_1) a_1 = phi'_alpha (u_2) a_2$。
  
  假设 $phi'_alpha (u_1) a_1 = phi'_alpha (u_2) a_2$，那么由于 $phi'_alpha$ 的值的第二项在 $H$ 当中，于是 $a_2 a_1^(-1) in H$，
  然后就容易得到 $u_1 = u_2 a_2 a_1^(-1)$ 进而 $phi'_alpha$ 是单射。
  对任意 $(x,a) in U_alpha times G$，肯定有 $u in pi'^(-1)(U_alpha)$ 使得 $phi'_alpha (u) = (x,1)$，于是 $phi_alpha (u a) = (x,a)$，
  即 $phi_alpha$ 是满射。最后不难验证 $phi_alpha$ 是同胚，以及值在 $H$ 当中。

  现在假设有 $M$ 上的开覆盖 ${U_alpha}$ 和其上的转换函数 $psi_(beta alpha)$，并且值在 $H$ 当中。那么利用子群的泛性质可以得到
  $psi_(beta alpha)$ 还是从 $U_beta inter U_alpha$ 到 $H$ 的连续函数。
  这样从 ${psi_(beta alpha)}$ 可以构造 $M$ 上的 $H$-主丛 $pi': Q -> M$。我们再按照下列方法构造从 $Q$ 到 $P$ 的 $G$-单射：
  ${pi'^(-1)(U_alpha)},{pi^(-1)(U_alpha)}$ 各自是 $Q$ 和 $P$ 的开覆盖，于是下列映射是 $G$-单射，并且能合成从 $Q$ 到 $P$ 的映射：
  #nonum-equation[
    $
      pi'^(-1)(U_alpha) -->^tilde U_alpha times H arrow.hook U_alpha times G -->^tilde pi^(-1)(U_alpha)
    $
  ]
  不难验证上述映射在 $pi'^(-1)(U_alpha inter U_beta)$ 上相同，因为它们差的是同一个 $psi_(beta alpha)(u)$ 的乘积。
  这样一来就可以把 $Q$ 视为 $P$ 的子丛，于是 $Q$ 就是 $P$ 的约化。
]

#note-box[
  上述定理和证明可以直接改为流形和李群的情况，因为李子群具有类似地泛性质，而微分同胚的验证是完全一样的。
]