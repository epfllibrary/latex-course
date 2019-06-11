---
title: "Document Organization"
teaching: 0
exercises: 0
questions:
- "How is organized a Latex document ?"
- "What are the minimal commands needed to compile ?"
objectives:
- "Understand what are commands, environments and packages"
- "Compile a simple Latex file"

keypoints:
- "A Latex document is composed of commands (they start with /), environments (starts with /begin{envname} and stop with /end{envname})"
- "Packages are tools to add mew functionalities to Latex "
---

# Let's start

Here is the contents of the ``02-minimal.tex`` file. It contains the minimal commands required to compile a Latex document. We will see a little further what does all of this.



{% latex fold_src=true filename=02-minimal %}
\documentclass[a4paper]{article}

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage[english]{babel}


\begin{document}

  Hello World

  je suis a l'epicure

\end{document}
{% endlatex %}

{% latex  filename=02-test source=02-minimal.tex %}

  \textbf{Hello World 2}

{% endlatex %}


> ## Try by our self
> Try this code
> > ## Solution
> > blabla
> > blabla
> {: .solution}
{: .challenge}

{% include links.md %}
