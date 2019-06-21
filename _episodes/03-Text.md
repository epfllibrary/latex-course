---
title: "Text"
teaching: 0
exercises: 0
questions:
- "How can I write text in my LaTeX document ?"
objectives:
- "Change fonts and their size"
- "Justify paragraphs"
- "Work with ligns, paragraphes and pages"
- "Include lists and tables"
---

## Fonts
We know how to write simple plain text.
Let's see how we can change the fonts used in LaTeX
 

{% latex filename=03-font-01 %}

\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage[english]{babel}

\begin{document}

	Plain text

	\textit{Italic text}

	\textbf{Bold text}

\end{document}

{% endlatex %}

With the commands \textit{...} and \textbf{...}, you can modify parts of the text.
There is another way to do the same thing, with the commands {\itshape ...} and {\bfseries ...}.



{% latex filename=03-font-02 %}

\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage[english]{babel}

\begin{document}

        Plain text

        \textit{Italic text}

        \textbf{Bold text}

\end{document}

{% endlatex %}


## Paragraphs

## Page

## List

## Notes

## Codes

---

keypoints:
- 
---
{% include links.md %}
