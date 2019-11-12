---
title: "References"
teaching: 10
exercises: 5
questions:
- "How do I manage cross referencing inside a document ?"
- "How do I make a table of contents?"
objectives:
- "Refer to my figures, tables, equations or even chapters from within my document"
- "Create a table of contents"
keypoints:
- "```\\part{}```,```\\chapter{}```, ```\\section{}```,```\\subsection{}```,```\\subsubsection{}```,```\\paragraph{}``` are used to specify the hierarchical structure of the document"
- "the ```\\label{key}``` command add a tag"
- "the ```\\ref{key}``` command will place the correct number of the label ```key``` during compilation"
- "the ```\\pageref{key}``` command will put the page of the label ```key``` during compilation"
- "the ```\\tableofcontents``` command will be replace by the table of contents of the document"

---

References in LaTeX are internal links within your document. They allow you to refer to another part of the document easily. For instance, you might want to write _"as I explained in the figure : xxx"_ and replace the _xxx_ by the correct value.

In order to do that, you need to insert a tag to the element you want to refer to. It can be anything like a float, an equation, a chapter, etc. The command to specify a tag is ```\label{}``` and the parameter is the name of the tag. The parameter can be anything you like (it's usually a good practice to have a naming convention).

The command to get the position of the label is ```\ref{}```and the parameter is the name of the tag defined in the label described before.  You can put the command anywhere in the document. The command ```\pageref{}``` will display the number of the page in which is the label.



> ## Table of contents
> To define the hierarchical structure of the document LaTeX provides special commands that defines chapter, section, etc. :
> * ```\part{}```
> * ```\chapter{}```
> * ```\section{}```
> * ```\subsection{}```
> * ```\subsubsection{}```
> * ```\paragraph{}```
>
> You can generate the table of contents of your document automatically during the compilation by using the ```\tableofcontents``` command.
>
> Other tables can be generated like ```\listoffigures``` or ```\listoftables```they will generate the list of figures or tables (float).
{: .callout}


{% latex filename=05-reference minimal=true %}

\tableofcontents

\newpage

Some introductory sentences, followed by the context of the work and information about the structure of the document. [...]
We will analyze the result using the Carpentry method in section \ref{sec:analysis}, then will present the results in section \ref{sec:results}.

\section{Analysis}\label{sec:analysis}

All the the analysis has been done using Python and LaTeX and are summarized in figure \ref{fig:analysis}

\begin{figure}
\includegraphics[width=5cm]{fig/phd050611s}
\caption{A beautiful figure that explain everything (from : http://phdcomics.com/comics/archive.php?comicid=1431)}
\label{fig:analysis}
\end{figure}

\section{Results}\label{sec:results}

Bla bla bla [...]

\section{Conclusion}\label{sec:conclusion}

As described in section \ref{sec:analysis} and \ref{sec:results} respectively on page \pageref{sec:analysis} and \pageref{sec:results}, we can conclude that reference in LaTeX is a great feature.

{% endlatex %}

## Exercises

> ## Add list of figures
> 
> At the end of my document, I would like to add a list of figures. Which command do I use ?
>
> 1. \listfigures{}
>
> 2. \begin{list}
>
> 3. \listoffigures
>
> > ## Solution
> > 1. Does not exist.
> > 2. Is the environment to create lists but does not automate the action.
> > 3. Is correct. Works the same way as ```\tableofcontents```.
> >
> {: .solution}
{: .challenge}

> ## Subsections, sections and chapters
>
> Your are writing a report. 
> In your first chapter "State of the art", you would like to include a section called "Methodology". In this section, there are two subsections, "Information sources" and "Selection criterias". How can you include this structure ?
>
> > ## Solution
> > ~~~
> > \chapter{State of the Art}
> > \section{Methodology}
> > \subsection{Information sources}
> > \subsection{Selection criteria}
> > ~~~
> > {: .language-latex}
> > Note : For ```\chapter{}``` to work, your document must be a book or a report.
> {: .solution}
{: .challenge}

{% include links.md %}
