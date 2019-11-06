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
> If you want to use the terminal the command is ```pdflatex your_file.txt``` it will genrate a PDF file with the same name than your .tex file.
{: .callout}


{% latex filename=02-minimal-helloworld %}
\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage[english]{babel}
\usepackage{graphicx}

\begin{document}

  Hello World

\end{document}
{% endlatex %}

When we compile only "Hello World" appears, the others things are inputs for the compiler : they give instructions or add new capabilities, they are not displayed after compilation.

Environments define a "block" all the text inside this block will be transformed according to what the block do.

An environment always start with ```\begin{}``` and stop with ```\end{}``` inside the ```{}``` is specified the name of the environment.

> ## The document environment
> The ``02-minimal.tex`` contains the environment ```document``` this environment is obligatory : what is inside is the contents of the document. Outside the document block we will find commands that will change the functionalities or how the document is printed (for example package or global commands)
>
> All the others environments are optional and you use them when you need f
{: .callout}

For example the environment ```itemize``` creates bullet point and a bullet point is created every time the ```\item```command is called :
{% latex filename=02-environment-example %}
\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage{lmodern}
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




Before the ```document```environment there is several commands :
~~~
\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage{lmodern}
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
> * ```\usepackage{lmodern}``` specify that we are using the ```lmodern``` fonts packages.
> * ```\usepackage[english]{babel}``` loads the package ```babel``` that takes care of the specific typography for the language (here ```english``` you can change the option if you are typing in another language for example ```french``` or ```german```).
> * ```\usepackage{graphicx}``` loads the package that allow to include external image to the document.
>
>
> A list of packages can be found on the [CTAN webpage](https://www.ctan.org/) you can find package based on their name or topics.
{: .callout}


## ```\documentclass```
The ```documentclass``` command has to be on the top of the document it defines how the document will look like :
By default latex support different type of documents such as :
* ```letter``` : for letter (mail)
* ```article``` : for publication (journal)
* ```report``` : for middle size publication like master thesis
* ```book``` : for huge publication
Changing the style of document change the way the document looks like and also some features might be disabled (for example you cannot defined chapters within article)

As we shaw, the options in the documentclass can defined the paper size, it's also possible to define a global font size for the entire document, or if the document is double sided.
for example :
```\documentclass[a4paper,12pt,twoside]{report}``` will generate a report with font size of 12pt on A4 paper double sided.




**TODO** Faire quelques exercices
> ## Try by our self
> Try this code
> > ## Solution
> > blabla
> > blabla
> {: .solution}
{: .challenge}

{% include links.md %}
