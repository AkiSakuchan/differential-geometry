#import "typst-book-style/book-style.typ": *
#import "@preview/theorion:0.3.3": *
#import "@preview/commute:0.3.0": node, arr, commutative-diagram
#import cosmos.rainbow: *
#show: show-theorion

#show: rest => book(title: [微分几何], authors: "Aki Sakuchan", bib-file: "../references.bib" ,rest)

#include "基础知识.typ"

#include "向量丛联络.typ"

#include "联络.typ"