---
title: "Text"
teaching: ?
exercises: ?
questions:
- "How can I write plain text in my LaTeX document ?"
objectives:
- "Use fonts"
- "Present paragraphs"
- "Work with ligns, paragraphes and pages"
- "Include lists and tables"

keypoints:
- "Fonts"
---
FIXME

{% latex filename=03-test %}

\documentclass[a4paper]{article}

%\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage[english]{babel}

\begin{document}

	Hello World 
	Début de l'exemple en LaTeX

\end{document}

{% endlatex %}
----



{% include links.md %}

