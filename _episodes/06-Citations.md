---
title: "Citations"
teaching: 0
exercises: 0
questions:
- "Key question (FIXME)"
objectives:
- "First learning objective. (FIXME)"
keypoints:
- "First key point. Brief Answer to questions. (FIXME)"
---
FIXME
{% latex filename=06-citation-test fold_comp=true %}
<bib>
@ARTICLE{ARTICLE:1,
    AUTHOR="John Doe",
    TITLE="Title",
    JOURNAL="Journal",
    YEAR="2017",
}
</bib>
\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage[english]{babel}


\begin{document}

  Hello World

  This paper\cite{ARTICLE:1} is really good



  \bibliographystyle{plain}
\bibliography{06-citation-test}


\end{document}

{% endlatex %}
{% include links.md %}
