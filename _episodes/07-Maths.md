---
title: "Maths"
teaching: 10
exercises: 10
questions:
- "How to write equations with LaTeX"
objectives:
- "Discover the math environment"
- "Write equations"
keypoints:
- "You can write equation within the text using the ```$$``` or within a separate space using the ```equation```environment"

---

As the rest of LaTeX, mathematics have their own environments, mostly two kinds of environments that allow you to make the distinction between textual and mathematical content.
The way to write mathematical equations is a little bit different than text and will be described below.

## Maths environments

Inline formulas insert mathematical symbols right into a sentence, in this case, Latex uses dollar signs (```$some equation$```) are used to delimit mathematical content.

If an expression needs particular attention, as when displaying important steps or results, mathematical symbols can appear on their own line using the ```equation```environment, with this environment equations are numbered automatically, and can be referenced.


{% latex filename=07-maths-01 minimal=true %}

for any integer $i$ the real number $x_i^2$

\begin{equation}
    y=f(x)
\end{equation}

{% endlatex %}

Both environment use the same way to write maths.

## How to write math

A wealth of mathematical symbols and formatting commands are available in LaTeX. Some can readily be used with plain LaTeX, others are defined in specialized packages.

{% latex filename=07-maths-02 minimal=true %}

Greek letters: $\alpha,  \beta, \gamma, \Gamma$

Fractions and integrals: $\int_{-\infty}^{+\infty} e^{ -\frac{x^2}{2}} dx$

Set and logic symbols: $\forall, \exists, \in$

Arrows: $\mapsto, \rightarrow$

{% endlatex %}

You can use [Wikibook Latex Math](https://en.wikibooks.org/wiki/LaTeX/Mathematics) to see all the possibilities.

**TODO**
* Text ?
* Exercices ?

{% include links.md %}
