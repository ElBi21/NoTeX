# NoTeX

_A custom template for taking notes_

---

## 0) Yeah sure, but what **_IS_** NoTeX to begin with?

In this repository I want to publish the template that I use for taking notes during university classes. I will update it from time to time. If you want to see my notes they'll eventually be uploaded in an (_maybe_) accesible cloud, since I'm not feeling like sharing them at the moment.

The template is under GPL license (until I will find a CC 4.0 license file to replace the GPL one), but it's not excluded that one day I'l write my own license. You are free to use my template, as long as you credit me. It's fine if you want to edit the template, based on your needs, but don't edit a couple lines and then sell it as your own template

---

## 1) File structure

How does the template work? In order to answer such question is worth mentioning the file structure. The template is based on this structure here:

```
├ 📁 chapters
│ ├ 📄 chap0_license.tex
│ ├ 📄 chap1_lorem.tex
│ ├ 📄 chap2_ipsum.tex
│ └ 📄 ...
│
├ 📄 main.tex
├ 📄 preamble.tex
├ 📄 title.tex
└ 📄 NoTeX.pdf
```

whereas:
+ **📁 chapters**: is the folder with all the chapters (the name of the files can also not necessarily be `chapXX_lorem_ipsum.tex`);
+ **📄 main.tex**: is the main file, where all the other files are imported (such as the `preamble` and the `title`);
+ **📄 preamble.tex**: is the preamble file, where all the project's settings are stored (so where all the packages are imported, where all the commands are defined, etc... If you want to change something of the notes, you should do it here);
+ **📄 title.tex**: is the file with the first page's code;
+ **📄 NoTeX.pdf**: the output of the `main.tex` file.

<br></br>
I highly suggest you to make a file for each chapter (the class of the document is `report`, so the `\chapter` command can be used) and then include it into the `main.tex`. An example of a simple project structure could be:
<br></br>
`> ./chapters/chap21_whatever.tex`:
```latex
\chapter{NoTeX is nice}

\noindent In this chapter we are going to show how NoTeX
is a nice template [...] so now we can conclude by saying
that we should all use it. Thanks for coming to my TEDx talk
```

`> ./main.tex`:
```latex
\document[12pt, letterpaper]{report}

% Assume that here we import preamble.tex and title.tex

\begin{document}

% Assume that here we place the table of contents and the title.
% From the next line we'll import all the chapters

% [...]

\input{chapters/chap21_whatever.tex}
\pagebreak

\input{chapters/chap22_secretChap.tex}
\pagebreak

\input{chapters/appendix.tex}

\end{document}
```

The structure that I suggest you to follow is to first include a file with the `\input` command, then use a `\pagebreak` to format it evenly. Little tip: suppose that `appendix.tex` is our last chapter: notice how there is no `\pagebreak`: this is because otherwise we would have a blank page at the end. I suggest you to break between each chapter in the `main.tex` file just to keep everything in order and have a better overview of the project.

---

## 2) Customization of the project

In order to customize the project you have to edit the `preamble.tex` file. The file is divided in multiple parts:
1) the `packages` section;
2) the `custom colors` section;
3) the `commands` related to the `packages`;
4) the `boxes` section;
5) the `custom commands` section;
6) the `toc` command;

The structure itself is pretty self-explanatory.

---

## 3) Special Thanks

I'd like to thank [SeniorMars](https://github.com/SeniorMars) for both his [repository](https://github.com/SeniorMars/dotfiles) and his [video](https://www.youtube.com/watch?v=DOtM1mrWjUo) over the way he takes notes with _LaTeX_, which inspired me to build my own template and taking notes with it. Oh btw, you should thank [Daniel Falbo](https://github.com/danielfalbo) too, since if he didn't ask me "_Hey, why don't you update your notes on GitHub?_" then all this material won't be here.