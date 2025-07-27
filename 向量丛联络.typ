#import "book-style.typ": *
#import "@preview/theorion:0.3.3": *
#import "@preview/commute:0.3.0": node, arr, commutative-diagram
#import cosmos.rainbow: *
#show: show-theorion

= 向量丛联络
== 协变导数
设 $M$ 是 $n$-维实光滑流形，$E$ 是其上的 $n$-阶向量丛。用 $scr(D)^r (E)$ 表示 $M$ 上的 $E$-值 $r$-形式层，也就是
$E times.circle and.big^r T^* M$，这里 $T^*M$ 是切丛 $T M$ 的对偶丛，又用 $scr(D)^r$ 表示普通的 $p$-形式层。
那么 $E$ 上的*联络*，或者*协变导数*是层同态：
#nonum-equation[
  $
    D: scr(D)^r (E) --> scr(D)^(r+1) (E)
  $
]
且满足对于 $omega in scr(D)^r, eta in scr(D)^l (E)$ 满足 Leibniz 法则：
#nonum-equation[
  $
    D(omega and eta) = d omega and eta + (-1)^(deg omega) omega and D eta
  $
]

假设在开集 $U subset M$ 上有局部标架 $s = (s_1,dots, s_n)$，那么有
#nonum-equation[
  $
    D s_i = sum_(j=1)^n s_j omega_i^j,quad omega_i^j in Gamma(U, scr(D)^1)
  $ 
]
于是用矩阵来表示就成了
$
  D s = s dot omega
$<联络形式的矩阵>
这里 $omega$ 是由 $1$-形式组成的 $n$-阶方阵，称为 $D$ 的在 $U$ 上的联络形式

如果 $xi = sum xi^i s_i$ 是 $U$ 上的截面，那么从上面可以得到
$
  D xi &= sum_(i=1)^n (d xi^i dot s_i + xi^i sum_(j=1)^n s_j omega_i^j ) \
  &= sum_(i=1)^n d xi^i dot s_i + sum_(i=1)^n sum_(j=1)^n s_j omega_i^j xi^i \
  &= sum_(i=1)^n d xi^i dot s_i + sum_(i=1)^n sum_(j=1)^n s_i omega_j^i xi^j \
  &= d xi + omega dot xi
$<向量丛截面的协变导数>
这里最后面表示把 $xi$ 视为一个列向量，$d$ 就是对每个分量求外微分，$omega dot xi$ 表示矩阵乘法。

如果有向量 $X in T_x M$，则 $D_X xi := (D xi)(X) in E_x$ 称为 $xi$ 沿着 $X$ 的*方向导数*。
