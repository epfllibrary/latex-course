---
title: "References"
teaching: 10
exercises: 5
questions:
- "How do I manage cross reference inside a document ?"
- "How do I make a table of contents"
objectives:
- "Cite my Figure, Table, Equations or even Chapters for example inside my document"
- "Create a table of contents"
keypoints:
- "```\\part{}```,```\\chapter{}```, ```\\section{}```,```\\subsection{}```,```\\subsubsection{}```,```\\paragraph{}``` are used to specify the hierarchical structure of the document"
- "the ```\\label{key}``` command add a tag"
- "the ```\\ref{key}``` command will place the correct number of the label ```key``` during compilation"
- "the ```\\pageref{key}``` command will put the page of the label ```key``` during compilation"
- "the ```\\tableofcontents``` command will be replace by the table of contents of the document"

---

References in latex are internal citation in your document, they allow you to refer to another part of the document easily, for example you might want to write _"as I explained in the Figure : xxx"_ and replace the _xxx_ by the correct value.

In order to do that you need to put a tag to the element you want to refer it can be anything like a float, an equation, a chapter etc... the command to specify a tag is ```\label{}``` and the parameter is the name of the tag. The parameter can be anything you like (it's usually a good practice to have a naming convention).

The command to get the position of the label is ```\ref{}```and the parameter is the name of the tag defined in the label described before.  You can put the command anywhere in the document. The command ```\pageref{}``` will display the number of the page in which is the label.



> ## Table of contents
> To define the hierarchical structure of the document Latex provides special commands that defined chapter, section, etc :
> * ```\part{}```
> * ```\chapter{}```
> *  ```\section{}```,
> * ```\subsection{}```
> * ```\subsubsection{}```
> * ```\paragraph{}```
>
> You can generate the table of contents of your document automatically during the compilation by using the ```\tableofcontents``` command.
>
> Other tables can be generated like ```\listoffigures``` or ```\listoftables```they will generate the list of figure or tables (float).
{: .callout}


{% latex filename=05-reference minimal=true %}

\tableofcontents

\newpage

We will analyze the result using the carpentry method in Section \ref{sec:analysis}, then will present the results in the Section \ref{sec:results}.

\section{Analysis}\label{sec:analysis}

All the the analysis has been done using Python and Latex and are resume in the Figure \ref{fig:analysis}

\begin{figure}
\includegraphics[width=5cm]{fig/phd050611s}
\caption{A beautiful figure that explain everything (from : http://phdcomics.com/comics/archive.php?comicid=1431)}
\label{fig:analysis}
\end{figure}

\section{Results}\label{sec:results}

Bla bla bla

\section{Conclusion}\label{sec:conclusion}

As described in the Section \ref{sec:analysis} and \ref{sec:results} respectively on page \pageref{sec:analysis} and \pageref{sec:results} we can conclude that reference is a great tool.

{% endlatex %}

{% include links.md %}
