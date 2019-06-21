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
|filename|the filename used|string without space|if not provided a generic (but unique) name will be used|
|source|used another tex file source has source the text will be insered at the end of the source file|filname (with .tex)||
|fold_comp|put an hide/show button to the compilation|true or false|false by default|
|src_comp|put an hide/show button to the source and compilation|true or false|false by default|
|optimize|auto cut the generated image by adding emptypage into the tex and to trim the picture (remove white)|true or false|true by default|
|disp_src|display the source|true or false|true by default|
|disp_comp|display the compilation (image)|true or false|true by default|
|down_tex|display the tex download link|true or false|true by default, if false the tex is not generated either|
|down_pdf|display the pdf download link|true or false|true by default, if false the pdf is not generated either|
|trim|trim the picture (remove white)|true or false|false by default (turn true with optimize)|
|emptypage|add emptypage into the tex used with the picture (not in the download tex)|true or false|false by default (turn true with optimize)|
