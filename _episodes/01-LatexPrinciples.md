---
title: "Latex Principles"
teaching: 10
exercises: 0
questions:
- "What is Latex?"
- "How is it different from other text software, like Word?"
objectives:
- "Introduction to Latex principle"
- "See why Latex is special"
keypoints:
- "Latex separates the content (text, figure...) from the form (how the document will look like)"
- "In order to get my document I need to compile my source file"
---

## What it is

LaTeX is a typesetting system, you can use it for writing articles, books, thesis or any kind of writing document.

It integrates a lot of useful tools for managing figures, tables, table of contents, equation etc.

Latex is ideal because it generates beautiful documents easily.

## How it works

Latex is different from a what-you-see-is-what-you-get software like Microsoft Word, because you can't see how the document will look like immediately : before it has been processed by the Latex software, this process is called **compilation**.

The compilation transforms your text source into a PDF document, distributing text across lines and pages, composing paragraphs, building tables, generating formulas, inserting images, keeping of track of numbering and references, etc.

As author you edit a source file which is just a simple text file, containing your text along with formatting commands. Those commands will be read during the compilation and will lead to the final document.

**TODO** Graphique presentant le principe

## Who does what

As author, you produce content meaning you focus on the text---and only the text!---while issuing formatting instructions to express your intention by defining the role and function of each part of text.

The compilation is in charge of the layout. It will translate your intentions into graphical design using pre-established style sheets and adhering to typographical conventions.

## Why it's nice ?
By separating the content (the text and the formating) from the form (how it will look like) Latex has a lot of nice feature that are hard to beat :

* The document will always looks nice, because the pre-established style are designed to be functional and readable
* It can manage huge document, because the pictures and other huge file are not loaded when you type
* You can manage easily citation, references, tables of contents
* You can easily change the style of your document, for example if you decide at some point to change the font size of the title, it will take you 2 seconds to do it
* You can write nice equations


{% include links.md %}
