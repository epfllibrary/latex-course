---
title: "Text"
teaching: 20
exercises: 0
questions:
- "How can I write text in my LaTeX document ?"
objectives:
- "Change fonts and their size"
- "Justify paragraphs"
- "Work with paragraph, pages and structure your document"
- "Include lists and tables"
keypoints:
- "Font size can be changed using  ```\\tiny```, ```\\small```, ```\\normalsize```, ```\\large```, ```\\Large```, ```\\LARGE```, ```\\huge```, ```\\Huge```"
- "To have your text in italic : ```\\textit``` or in bold :  ```\\textbf``` "
- "Ordered lists use the ```enumerate``` environment non-ordered the ```itemize```. Item list are defined with ```\\item```"
- "New page is added with ```\\newpage```"
---

## Fonts
We know how to write simple plain text.
Let's see how we can change the fonts used in LaTeX.

{% latex filename=03-font-01 %}

\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}

\begin{document}

	Plain text

	\textit{Italic text}

	\textbf{Bold text}

\end{document}

{% endlatex %}

With the commands ```\textit{...}``` and ```\textbf{...}```, you can modify parts of the text.
Keep in mind that such modifications are useful to emphasize your point but should be used consistently and parsimoniously.

The relative size of the font can be changed with the following commands : (from the smallest to the biggest, the actual font size is relative to the size specified in the ```documentclass```
)
* ```\tiny```
* ```\small```
* ```\normalsize```
* ```\large```
* ```\Large```
* ```\LARGE```
* ```\huge```
* ```\Huge```

Their usage is a little different than regular commands. Indeed, they are like switches and changes the fontsize until the end of the current group.


{% latex filename=03-font-02 %}

\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}

\begin{document}

        \tiny

				tiny

				tiny

        \small

				small

				small

				still small

        \normalsize

				normal

				back to normal

        \large

				large

        \LARGE

				LARGE

        \Huge

				Huge

\end{document}

{% endlatex %}


In this example the font size is changed when the command is used and will stay until another size is specified, if you want to change the font size only for a few number of words, you can group the command using:  ```{\Large only some text is large}```.

It's also possible to specify the font size for a specific object like environment by just switching the size the size at the beginning of the environment like:
~~~
\begin{itemize}
  \Large
  \item Alpha
  \item Beta
  \item Gamma
\end{itemize}
~~~
{: .language-latex}


## Paragraphs
You may have realized that LaTeX doesn't jump to a new line when you press enter in your source file. This is because, you need to jump at least two lines in the source file for LaTex to jump one in the compiled document (it will ignore the extra lines you add). You can also jump line by using the ```\\``` at this end of the line.

By default, LaTeX justifies the paragraph. It is possible to change that inside an  environment: ```flushright``` ```center``` or ```flushleft```.

{% latex filename=03-para-01 minimal=true %}

\begin{flushright}
This text will be right-aligned
\end{flushright}

\begin{center}
This text will be centered
\end{center}

\begin{flushleft}
This text will be left-aligned
\end{flushleft}

This line
and this line will be attached

This line

and this line will be separated

This line \newline
And this line will be separated

{% endlatex %}

## Page

To create a new page, insert ```\newpage```. If you have a double sided document, the command ```\cleardoublepage```will make sure that the new page will be an odd page.

## List
LaTeX manages two kinds of lists: lists that are numbered or lists that are not.
The numbered list uses the environment ```enumerate```and the non-ordered list uses the environment ```itemize```
For both environments a new element of the list is defined with the ```\item``` command.


{% latex filename=03-list-01 minimal=true %}

\begin{enumerate}
	\item the first entry in the list
	\item the second entry of the list
\end{enumerate}

{% endlatex %}

With non-ordered list the option in the command ```\item``` specified the type of bullet.

{% latex filename=03-list-02 minimal=true %}

\begin{itemize}
	\item One entry in the list
	\item[-] Another entry in the list with a -
\end{itemize}

{% endlatex %}

## Footnotes

Footnotes can be added with the command ```\footnote{}``` with the content of your note inside the {}. Put the command in your text, where you want the number of the footnote to appear (without space)
 and LaTeX will automatically put the note at the bottom of the page with automatic numbering.

{% latex filename=03-footnotes-01 minimal=true fold_comp=true %}

I'm always correct and I always say the truth\footnote{Even when I'm lying}

{% endlatex %}

## Code

If you want to write code inside your document, you can use the ```verbatim```environment.

{% latex filename=03-code-01 minimal=true %}
Here is my code that does a lot of beautiful work

\begin{verbatim}
if i<0 then
	j = j + 1
else
	j = j - 1
endif
\end{verbatim}

and then the data analysis was done by [...].

{% endlatex %}

## Exercises

> ## Align paragraph
>
> I would like to right-aligned  my text .
>
> In order to do that I need to write :
>
> 1. ~~~
>    \begin{flushright}
>      This text will be right-aligned
>    \end{flushright}
>    ~~~
>    {: .language-latex}
>    
> 2. ~~~
>    \begin{alignright}
>      This text will be right-aligned
>    \end{alignright}
>    ~~~
>    {: .language-latex}
>
> 3. ~~~
>    \flushright{This text will be right-aligned}
>    ~~~
>    {: .language-latex}
>    
>>    
> > ## Solution
> > 1. Is correct : The text will be right-aligned
> > 2. The name of the environment is ```flushright```
> > 3. In order to align I need to use an environment not a command
> {: .solution}
{: .challenge}

> ## New page
>
> I would like to write a book, with normal font size of 14pt and two-sided.
> Put some text and add a page that starts on a odd side and put again some text on this page.
>
>
> Please try to write the corresponding source file.
>
> > ## Solution
> > ~~~
> > \documentclass[a4paper,14pt,twoside]{book}
> > \usepackage[utf8]{inputenc}
> > \usepackage[T1]{fontenc}
> > \usepackage[english]{babel}
> > \usepackage{graphicx}
> > \begin{document}
> > This is my example text. I like latex
> > \cleardoublepage
> > This is another chapter of my Latex life
> > \end{document}
> > ~~~
> >{: .language-latex}
> {: .solution}
{: .challenge}

{% include links.md %}
