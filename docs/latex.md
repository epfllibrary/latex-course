# Principle
Insert your latex between the latex block :

```
{% latex %}

{% endlatex %}
```

you can specified  options inside the latex

{% latex filename=01-file fold_src=false %}

# List of options
| options   | action   | value   | comments   |
| --- | --- | --- | --- |
|filename|the filename used|string without space and without .tex|if not provided a generic (but unique) name will be used|
|source|used another tex file source has source the text will be inserted at the end of the source file|filename (with .tex)||
|fold_comp|put an hide/show button to the compilation|true or false|false by default|
|src_comp|put an hide/show button to the source and compilation|true or false|false by default|
|optimize|auto cut the generated image by adding emptypage into the tex and to trim the picture (remove white)|true or false|true by default|
|disp_src|display the source|true or false|true by default|
|disp_comp|display the compilation (image)|true or false|true by default|
|disp_bibp|display the bib|true or false|true by default|

|down_tex|display the tex download link|true or false|true by default, if false the tex is not generated either|
|down_pdf|display the pdf download link|true or false|true by default, if false the pdf is not generated either|
|down_bib|display the bib download link|true or false|true by default, if false the bib is not generated either|

|trim|trim the picture (remove white)|true or false|false by default (turn true with optimize)|
|emptypage|add emptypage into the tex used with the picture (not in the download tex)|true or false|false by default (turn true with optimize)|

# Citation

It's possible to generate a bibtex file and the compilation attached to it.

For that in the latex block you have to add

```
<bib>
<\bib>
```
and insert the contents of your bib file between the tags. The ```.bib```file will be automatically added and compiled.
**Be careful : ** You need to have the same file name in the ```\bibliography{}``` that you use with the ```filename=```variable.


For example :
```
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
