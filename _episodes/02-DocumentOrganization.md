---
title: "Document Organization"
teaching: 0
exercises: 0
questions:
- "How is organized a Latex document ?"
- "What are the minimal commands needed to compile?"
objectives:
- "Understand what are commands, environments and packages"
- "Compile a simple Latex file"

keypoints:
- "A Latex document is composed of commands (they start with \ ), environments (starts with \begin{envname} and stop with \end{envname})"
- "Packages are tools to add new functionalities to Latex "
---

Here is the contents of the ``02-minimal.tex`` file. It contains the minimal commands required to compile a Latex document. We will see a little further what does all of this.

{% latex filename=02-minimal-helloworld %}
\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage[english]{babel}


\begin{document}

  Hello World

\end{document}
{% endlatex %}

When we compile it only "Hello World" appears the others things are inputs for the compiler they give instructions or add new capabilities, they are not displayed after compilation.


Environments define a "block" all the text inside this block will be transformed according to what the block do.

An environment always start with ```\begin{}``` and stop with ```\end{}``` inside the {} is specified the name of the environment.

The ``02-minimal.tex`` contains the environment ```document``` this environment is obligatory : what is inside is the contents of the document. Outside the document block we will find commands that will change the functionalities or how the document is printed (for example package or global commands)

All the others environments are optional and you use them when you need, for example the environment ``itemize```creates bullet point :

{% latex filename=02-environment-example %}
\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage[english]{babel}

\begin{document}
  This text is before  

  \begin{itemize}
    \item One entry in the list
    \item Another entry in the list
  \end{itemize}

  This text is after \textbf{this is bold}

\end{document}

{% endlatex %}

> ## Inputs and options
> We usually have to provide inputs for commands or environment, you need to put them into the ```{}``` sometimes the inputs can take options they are written between ```[]``` before the ```{}```.
{: .challenge}

```\textbf{this is bold}``` is a command, it's usally used for a short and localize modification, for example ```\textbf{}`` will change the text font inside {} and display it in bold.


Before the ```document```environment there is several commands :
~~~
\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage[english]{babel}
~~~
{: .language-latex}

```\documentclass[a4paper]{article}``` is a command that describe the template used for the document (here ```article```) the option ```a4paper``` specified the size of the paper used

```\usepackage[]{}``` is a command that loads a plugins for example ```\usepackage[utf8]{inputenc}``` loads the ``ìnputenc```package with the ```utf8```option (this is is for character encoding)

```\usepackage{lmodern}``` specified that we want to use the ```lmodern``` fonts packages

```\usepackage[english]{babel}``` loads the package ```babel``` that take care of the specific typography for the language (here ```english``` you can change the option if you are typing in another language for example ```french``` or ```german```)






> ## Try by our self
> Try this code
> > ## Solution
> > blabla
> > blabla
> {: .solution}
{: .challenge}

{% include links.md %}
