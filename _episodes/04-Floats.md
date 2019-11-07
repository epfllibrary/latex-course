---
title: "Floats"
teaching: 0
exercises: 0
questions:
- "How to add images, figures ?"
- "How to make tabular ?"
objectives:
- "Add Figure and Table"
- "Create tabular"
keypoints:
- "Figure uses the environment ```figure```and table the environment ```table```"
- "Legend are defined with ```\\caption{}``` inside the float environment."
- "```\\includegraphics{}``` is used to add external graphic file."
- "by adding ```[(h)(H)(p)(b)(t)]```to the float environment, you can choose how LaTex put the float in the document."
---

## Floats
LateX manages two kind of floats, the figures and the tables, they are called floats because they can be inserted anywhere in the documents and referenced in the text (like Figure 1).

Figure and Table are managed the same way, they just have their distinct numbering.

Figure use the environment ```figure``` and Tables the environment ```table```.

A legend can be defined with the ```\caption{}```command inside the float environment.

> ## HOWTO include external pictures
> To include external picture file you need to use the ```\includegraphics{}``` command. The parameter contains the path to the picture (where is stored the file).
> The optional parameter can specify the figure size for example ```with=5cm``` will fix the width of the picture and adjust the height accordingly.
{: .callout}


  {% latex filename=04-figure-01 minimal=true %}

  \begin{figure}
  \includegraphics[width=5cm]{fig/phd051608s}
  \caption{Where you sit in class/seminar. And what it says about you (from : http://phdcomics.com/comics/archive.php?comicid=1017)}
  \end{figure}

  {% endlatex %}

> ## Change the position of floats
> By default if you don't specified anything LaTex will move the float where it thinks it will be the best. You can specify where you want to have the float by adding option in the environment.
>
> For example ```\begin{figure}[ht]``` means that you want the figure to where you define it (with ```h``` : here) and a the top of the page (with ```t```:top).
>
> The possible commands  are :
> * ```b``` : bottom of the page
> * ```t``` : top of the page
> * ```h``` : here
> * ```H``` : forced here
> * ```p``` : create a page of floats
>
> By default (if you don't put any indication) LaTex uses ```[tbp]```
{: .callout}

## Tables


{% include links.md %}
