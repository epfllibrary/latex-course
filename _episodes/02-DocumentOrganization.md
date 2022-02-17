---
title: "Document Organization"
teaching: 15
exercises: 5
questions:
- "How is a LaTeX document organized?"
- "What are the minimal commands needed to compile?"
objectives:
- "Understand what are commands, environments and packages"
- "Compile a simple LaTeX file"

keypoints:
- "A LaTeX document is composed of commands (they start with \\ ), environments (starts with \\begin{envname} and stop with \\end{envname})"
- "Packages are tools to add new functionalities to LaTeX, a list of packages can be found on the [CTAN webpage](https://www.ctan.org/) and we use the \\usepackage command to load them"
---

Below, you will get to know the minimal commands required to compile a LaTeX document. We will see a little further what each command does.

> ## Compilation
> If you use an editor that integrates LaTeX software, you can usually call the compilation options inside the software.
>
>In texmaker, you can compile by clicking by selecting PdfLatex option and then click on the **Run** button or use the **Tools** menu
>
> If you want to use the terminal, the command is ```pdflatex your_file.txt``` it will genrate a PDF file with the same name as your .tex file.
{: .callout}


{% latex filename=02-minimal-helloworld %}
\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}
\usepackage{graphicx}

\begin{document}

  Hello World

\end{document}
{% endlatex %}

When we compile, only "Hello World" appears. The others things typed in the document are inputs for the compiler : they give instructions or add new capabilities, they are not displayed after compilation.

Environments define a "block": all the text inside this block will be transformed according to what the environment does.

An environment always start with ```\begin{}``` and stop with ```\end{}```. Inside the ```{}``` is specified the name of the environment.

> ## The document environment
> The ``02-minimal-helloworld.tex`` contains the environment ```document```. This environment is obligatory : what is inside is the contents of the document. Outside the document block, we find commands that change the caracteristics of the document and how it is printed (for example package or global commands)
>
> All the others environments are optional and you use them when you need.
{: .callout}

For example, the environment ```itemize``` creates bullet points. So, a bullet point is created everytime the ```\item```command is called :
{% latex filename=02-environment-example %}
\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}
\usepackage{graphicx}

\begin{document}
  This text is before  

  \begin{itemize}
    \item One entry in the list
    \item Another entry in the list
  \end{itemize}

  This text is after \textbf{this is bold}

\end{document}

{% endlatex %}

> ## Commands
> A command always start with ```\``` and then the name of the command (like ```\item``` means we are using the command named ```item```.)
>
> For exemple in ```02-environment-example``` the ```\textbf{this is bold}``` is also a command.
> A command is usually used for a short and localized modification, for example ```\textbf{}``` will change the text font inside the ```{}``` and will display it in bold.
{: .callout}

> ## Inputs and options
> We usually have to provide inputs for commands or environment, the command are written between ```{}``` sometimes you can specified options, they are written between ```[]``` before the ```{}```.
{: .callout}




Before the ```document```environment there are several commands :
~~~
\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}
\usepackage{graphicx}

~~~
{: .language-latex}

* ```\documentclass[a4paper]{article}``` is a command that describe the template used for the document (here ```article```) the option ```a4paper``` specify the size of the paper used : A4.

> ## Packages
> ```\usepackage[]{}``` is a command that loads a plugin. A plugin add new functionalities into a latex there is a multitude of plugins for latex, for example to display pictures, make tables, draw chemical formula, make sudoku grid ...  
>
>
> * For example ```\usepackage[utf8]{inputenc}``` loads the ```ìnputenc``` package with the ```utf8```option (this is is for character encoding)
> * ```\usepackage[T1]{fontenc}``` specify that we are using the ```T1``` fonts packages.
> * ```\usepackage[english]{babel}``` loads the package ```babel``` that takes care of the specific typography for the language (here ```english``` you can change the option if you are typing in another language for example ```french``` or ```german```).
> * ```\usepackage{graphicx}``` loads the package that allow to include external image to the document.
>
>
> A list of packages can be found on the [CTAN webpage](https://www.ctan.org/) you can find package based on their name or topics.
{: .callout}

> ## \documentclass
> The ```documentclass``` command has to be on the top of the document it defines how the document will look like :
> By default LaTeX support different type of documents such as :
> * ```letter``` : for letter (mail)
> * ```article``` : for publication (journal)
> * ```report``` : for middle size publication like master thesis
> * ```book``` : for huge publications, including your PhD thesis
{: .callout}

Changing the style of document change the way the document looks like and also some features might be disabled (for example you cannot defined chapters within article)

As we saw, the options in the documentclass can defined the paper size, it's also possible to define a global font size for the entire document, or if the document is double sided.
for example :
```\documentclass[a4paper,12pt,twoside]{report}``` will generate a report with font size of 12pt on A4 paper double sided.

Some journals and universities provide templates for LaTeX documents.
 Templates will include the expected documentclass, font size, packages, etc. in order to create a specific layout.
 For EPFL, there is an unofficial [PhD thesis template](https://github.com/glederrey/EPFL_Thesis_Template) maintained by the PhD association Polydoc.
EPFL IC faculty also has a [template for LaTeX documents](https://github.com/HexHive/thesis_template) maintained by Mathias Payer.
{: .callout}

> ## Structure of the document
> To define the hierarchical structure of the document LaTeX provides special commands that defines chapter, section, etc. :
> * ```\part{}```
> * ```\chapter{}```
> * ```\section{}```
> * ```\subsection{}```
> * ```\subsubsection{}```
> * ```\paragraph{}```
>
>
> Please note that the availability of these commands depends on the document class we have selected. For example, Part and Chapter are only available for the document class "Book".
{: .callout}

> ## Title, author, date
> You can add important metadata as title, author and date in the preamble of your document:
> * ```\title{Title of my document}```
> * ```\author{Myself}```
> * ```\date{February 2022}```
>
> In the document environment you can have these metadata displayed at any point using the command ```\maketitle```.
{: .callout}

## Exercices

> ## Using Environments
>
> To insert quote LaTeX provides the ```quote```environment.
>
> In order to use it I need to write :
>
> 1. ~~~
>    \begin{quote}
>     Veni vidi vici (Jules Caesar)
>    \end
>    ~~~
>    {: .language-latex}
>
> 2. ~~~
>    \begin[quote]
>     Veni vidi vici (Jules Caesar)
>    \end[quote]
>    ~~~
>    {: .language-latex}
>
> 3. ~~~
>    \begin{quote}
>     Veni vidi vici (Jules Caesar)
>    \end{quote}
>    ~~~
>    {: .language-latex}
>
> 4. ~~~
>    \begin{quotes}
>     Veni vidi vici (Jules Caesar)
>    \end{quotes}
>    ~~~
>    {: .language-latex}
>
> > ## Solution
> >
> > 1. You need to specify what is ending
> > 2. The name of the environment is a mandatory parameter, it's written inside brackets ```{}```
> > 3. Is correct: the quote will appear correctly
> > 4. The name of the environment is ```quote```not ```quotes```
> {: .solution}
{: .challenge}

> ## Using Commands
>
> I would like to have the word **cat** in italic and the word **dog** in bold.
> the italic command (as we will see later) is ```textit```
>
> In order to do that I need to write :
>
> 1. ~~~
>    My \textbf{cat} is cuter than my \textit{dog}.
>    ~~~
>    
>
> 2. ~~~
>    \begin[quote]
>     My \textit{cat} is cuter than my \textbf{dog}.
>    \end[quote]
>    ~~~
>    
>
> 3. ~~~
>    \begin{quote}
>     My \textit(cat) is cuter than my \textbf{dog}.
>    \end{quote}
>    ~~~
>    
> 4. ~~~
>    \begin{quote}
>     My /textit{cat} is cuter than my \textbf{dog}.
>    \end{quote}
>    ~~~
>    
> > ## Solution
> >
> > 1. Cat will be bold and dog in italic
> > 2. Is correct : Cat will be italic and dog in bold
> > 3. mandatory parameters are written inside brackets ```{}```
> > 4. A command always starts with backslash ```\```
> {: .solution}
{: .challenge}

> ## Using packages
>
> I would like to use the package ```listings``` to write a bit code in Python.
>
> The package uses the ```lstlisting```environment
>
> the used language for the code is defined in an option ```language=Python```
>
> Please try to include the package, call the environment and specify the option
>
> The code I want to include is :
>    ~~~
> # Calculate the average
> round1 = int(raw_input("Enter score for round 1: "))
> round2 = int(raw_input("Enter score for round 2: "))
> round3 = int(raw_input("Enter score for round 3: "))   
> # Calculate the average
> average = (round1 + round2 + round3) / 3
> # Print out the test score
> print "the average score is: ", average
>    ~~~
> > ## Solution
> > ~~~
> > \documentclass[a4paper]{article}
> > \usepackage[utf8]{inputenc}
> > \usepackage[T1]{fontenc}
> > \usepackage[english]{babel}
> > \usepackage{graphicx}
> > \usepackage{listings}
> > \begin{document}
> > \begin{lstlisting}[language=Python]
> > # Get three test score
> > round1 = int(raw_input("Enter score for round 1: "))
> > round2 = int(raw_input("Enter score for round 2: "))
> > round3 = int(raw_input("Enter score for round 3: "))
> > # Calculate the average
> > average = (round1 + round2 + round3) / 3
> > # Print out the test score
> > print "the average score is: ", average
> > \end{lstlisting}
> > \end{document}
> > ~~~
> >{: .language-latex}
> {: .solution}
{: .challenge}

{% include links.md %}
