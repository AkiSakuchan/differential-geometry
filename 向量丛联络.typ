#import "typst-book-style/book-style.typ": *
#import "@preview/theorion:0.3.3": *
#import "@preview/commute:0.3.0": node, arr, commutative-diagram
#import cosmos.rainbow: *
#show: show-theorion

= 向量丛联络
== 协变导数
设 $M$ 是 $n$-维实光滑流形，$pi : E->M$ 是其上的 $n$-阶向量丛。用 $scr(D)^r (E)$ 表示 $M$ 上的 $E$-值 $r$-形式层，也就是
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

== 平行移动，和乐群
一个截面 $xi$ 称为*平行的*指的是 $D xi = 0$。如果 $c = c(t), 0 <= t <= 1$ 是 $M$ 上的曲线，
那么 $E$ 上的曲线 $tilde(c):[0,1] -> E$ 如果满足
- $tilde(c)$ 是 $c$ 的提升，也就是 $pi compose tilde(c) = c$；
- 平行，也就是 $D tilde(c) = 0$；注意通过 @向量丛截面的协变导数 可以把协变导数定义在曲线上
我们称 $tilde(c)$ 是 $c$ 的*水平提升*。

根据 @向量丛截面的协变导数，如果在局部 $tilde(c) = sum tilde(c)^i s_i$，那么它应该满足微分方程组：
$
  (d tilde(c)^i) /(d t) + sum_(j=1)^n omega_j^i (c'(t)) tilde(c)^j = 0
$<向量丛水平提升应该满足的ODES>

根据常微分方程理论，上式的解唯一，并且可以沿着 $c$ 唯一扩展，只是可能需要进行坐标变换。
也就是说对于任意向量 $v in E_c(0)$，存在唯一的水平提升 $tilde(c)$ 使得 $tilde(c)(0) = v$，
这些向量 $tilde(c)(t) in E_c(t)$ 称为 $v$ 沿着 $c$ 的*平行移动*。

这样我们得到了一个线性映射 $tilde(c):E_c(0) -> E_c(1)$，根据 $tilde(c)$ 的唯一性，逆着
$c$ 做平行移动还可以得到 $tilde(c)$ 的逆映射，因此 $tilde(c)$ 是同构。如果 $c$ 是闭合曲线，也就是
$c(0)=c(1)=x$ 收尾相同，那么 $tilde(c)$ 是 $E_x$ 的自同构，全体这样得到的 $E_x$ 的自同构的集合构成一个群，称为联络
$D$ 在参考点 $x$ 处的*和乐群(holonomy group)*。