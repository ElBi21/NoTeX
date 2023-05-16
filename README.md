<h1 align="center">NoTeX</h1>

<p align="center"><i>A custom LaTeX template for taking notes • <code>v1.2</code></i></p>
<p align="center"> <a href="Introduction">0) Introduction</a> • 1) File structure • 2) Customization • 3) About the boxes • 4) Special thanks</p>

---

## Introduction 

Yeah sure, but what **_IS_** NoTeX to begin with?
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
├ 📄 macro.tex
├ 📄 main.tex
├ 📄 preamble.tex
├ 📄 title.tex
└ 📄 NoTeX.pdf
```

whereas:
+ **📁 chapters**: is the folder with all the chapters (the name of the files can also not necessarily be `chapXX_lorem_ipsum.tex`);
+ **📄 macros.tex**: is a file made to store all the `macros` relative to the document;
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

% Assume that here we import preamble.tex, title.tex and macros.tex

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
5) the `toc` command;

If you aim to change the main color of the file, just edit the `doc` color. A large number of elements depend on such color, like the **Table of Contents**, the **Chapters' first page**, or the `question` custom box.

Further customization can be done by editing the `macros.tex` file, where all the macros (and custom commands) are stored.
The structure itself is pretty self-explanatory.

---

## 3) About the boxes

You can see that in the file there are 2 types of boxes: **theory** boxes and **practice** boxes. The **theory boxes** are recognisable by the **blue** line on the left of the boxes, while the **practice boxes** have a **yellow** line. **Remark** and **Curiosity** boxes are "*special*", so they have their own colors. The **Question** box uses the main document's color (`doc`). Here is a list of all the boxes officially working:

| Box cathegory | Box name | Relative code | Notes |
|-|-|-|-|
| **Theory** | Definition | <pre>\begin{definition}{customName}<br>  [...]<br>\end{definition}</pre> | |
| **Theory** | Theorem | <pre>\begin{theorem}{customName}<br>  [...]<br>\end{theorem}</pre> | |
| **Theory** | Corollary | <pre>\begin{corollary}{customName}<br>  [...]<br>\end{corollary}</pre> | |
| **Theory** | Lemma | <pre>\begin{lemma}{customName}<br>  [...]<br>\end{lemma}</pre> | |
| **Theory** | Proof | <pre>\begin{proof}<br>  [...]<br>\end{proof}</pre> | <p align="center">*Must be used straight after <br>another **Theory** box. An example can<br>be found at the end of this section*</p> |
| **Practice** | Example | <pre>\begin{example}{customName}<br>  [...]<br>\end{example}</pre> | |
| **Practice** | Exercise | <pre>\begin{exercise}{customName}<br>  [...]<br>\end{exercise}</pre> | |
| **Practice** | Solution | <pre>\begin{solution}<br>  [...]<br>\end{solution}</pre> | <p align="center">*Similarly to the `proof` box,<br> it must be used after a **Practice** box*</p> |
| **Remark** | Remark | <pre>\begin{remark}{customName}<br>  [...]<br>\end{remark}</pre> | |
| **Curiosity** | Curiosity | <pre>\begin{curiosity}{customName}<br>  [...]<br>\end{curiosity}</pre> | |
| **Question** | Question | <pre>\begin{question}<br>  [...]<br>\end{question}</pre> | |

<br><br>
Two examples for using both the `proof` and the `solution` boxes:
```latex
% About the proof box

\begin{theorem}{MyTheorem}
  This is a theorem.
  \\    % <-- Remember to make a new line
\end{theorem}
\begin{proof}{theorem}
  This is the proof of the theorem
\end{proof}
```
```latex
% About the solution box

\begin{exercise}{MyTheorem}
  Let us consider this integral:
  \[ \int_{-2}^0 x^2 \; \dd x \]
  \\    % <-- Remember to make a new line
\end{exercise}
\begin{solution}{exercise}
  The solution is a specific \textbf{real} number $a \in \mathbb{R}$
\end{solution}
```

---

## 4) Special Thanks ❤️

I'd like to thank [SeniorMars](https://github.com/SeniorMars) for both his [repository](https://github.com/SeniorMars/dotfiles) and his [video](https://www.youtube.com/watch?v=DOtM1mrWjUo) over the way he takes notes with _LaTeX_, which inspired me to build my own template and taking notes with it. Oh btw, you should thank [Daniel Falbo](https://github.com/danielfalbo) too, since if he didn't ask me "_Hey, why don't you upload your notes on GitHub?_" then all this material won't be here.

If you want to contribute to the template, just feel free to do so! It's not guaranteed that your contribution will be implemented, but it could be worth a shot!
