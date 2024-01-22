<h1 align="center">NoTeX</h1>

<p align="center"><i>A custom LaTeX template for taking notes • <code>v1.4</code></i></p>

---

## Yeah sure, but what **_IS_** NoTeX to begin with?

In this repository I want to publish the template that I use for taking notes during university classes. I will update it from time to time. If you want to see my notes they'll eventually be uploaded in an (_maybe_) accesible cloud, since I'm not feeling like sharing them at the moment.

The template is under GPL license (until I will find a CC 4.0 license file to replace the GPL one), but it's not excluded that one day I'l write my own license. You are free to use my template, as long as you credit me. It's fine if you want to edit the template, based on your needs, but don't edit a couple lines and then sell it as your own template

---

## Table of contents
1. [File structure](#-1-file-structure)
2. [Customization of the project](#2-customization-of-the-project)

---

## 1) File structure

How does the template work? In order to answer such question is worth mentioning the file structure. The template is based on this structure here:

```
├ 📁 assets
│ ├ 📁 images
│ │ └ 📄 ...
│ │
│ ├ 📁 preamble
│ │ ├ 📄 boxes.tex
│ │ ├ 📄 colors.tex
│ │ ├ 📄 custom_commands.tex
│ │ ├ 📄 packages_setups.tex
│ │ ├ 📄 packages.tex
│ │ ├ 📄 preamble_assembler.tex
│ │ ├ 📄 section_styles.tex
│ │ └ 📄 table_of_contents.tex
│ │
│ ├ 📄 macros.tex
│ └ 📄 title.tex
│
├ 📁 chapters
│ ├ 📄 chap0_license.tex
│ ├ 📄 chap1_lorem.tex
│ ├ 📄 chap2_ipsum.tex
│ └ 📄 ...
│
├ 📄 main.tex
└ 📄 NoTeX.pdf
```

whereas:
+ **📁 assets**: is the folder with all the elements that are needed to build the PDF (such as images, packages, settings, etc...):
  + **📁 images**: is the folder for all the images used in the PDF. It's not necessary to put your images here, but it's highly suggested in order to maintain a clear environment;
  + **📁 preamble**: it's the folder with all the preamble settings (packages, their settings, the custom boxes, etc...):
    + **📄 boxes.tex**: this file contains all the commands for the boxes;
    + **📄 colors.tex**: this file contains all the custom colors;
    + **📄 custom_commands.tex**: this file contains all the custom commands needed for the packages / their relative settings;
    + **📄 packages_setups.tex**: this file contains all the settings for all the packages;
    + **📄 packages.tex**: this file queries for all the needed packages;
    + **📄 preamble.assembler.tex**: this file connects all the other files in the `preamble` folder;
    + **📄 section_styles.tex**: this file has all the settings relative to the style of the `chapter`, `section` and `subsection` elements;
    + **📄 table_of_contents.tex**: this file contains the settings for the table of contents. Heavily inspired by [SeniorMars](https://github.com/SeniorMars)' template;
  + **📄 macros.tex**: is a file made to store all the `macros` relative to the document;
  + **📄 title.tex**: is the file with the first page's code;
+ **📁 chapters**: is the folder with all the chapters (the name of the files can also not necessarily be `chapXX_lorem_ipsum.tex`);
+ **📄 main.tex**: is the main file, where all the other files are imported (such as the `preamble` and the `title`);
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

% Assume that here we import preamble_assembler.tex, title.tex and macros.tex

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

In order to customize the project you have to edit the files inside the `preamble` folder. The folder contains multiple files:
1) the `packages` file;
2) the `colors` file;
3) the `packages_setups` file, related to the `packages`' settings;
4) the `section_styles` file, with all the commands relative to the `Chapter`, `Section` and `Subsection` elements;
5) the `boxes` file, which contains all the commands used to generate the boxes;
6) the `custom_commands` file, where all the custom commands needed for the packages' settings are stored;
7) the `table_of_contents` file, with the table of contents' commands;

If you aim to change the main color of the file, just edit the `doc` color in the `colors.tex` file. A large number of elements depend on such color, like the **Table of Contents**, the **Chapters' first page**, or the `question` custom box.

Further customization can be done by editing the `macros.tex` file, where all the macros (and custom commands) are stored, and the `title.tex` file, which handles the title page of the document.
The structure itself of the project is pretty self-explanatory.

---

## 3) About the boxes

You can see that in the file there are 2 types of boxes: **theory** boxes and **practice** boxes. The **theory boxes** are recognisable by the **blue** line on the left of the boxes, while the **practice boxes** have a **yellow** line. **Remark** and **Curiosity** boxes are "*special*", so they have their own colors. The **Question** box uses the main document's color (`doc`). Here is a list of all the boxes officially working:

<table align="center">
  <tr>
    <th>Box cathegory</th>
    <th>Box name</th>
    <th>Relative code</th>
    <th>Notes</th>
  </tr>
  <tr>
    <td align="center" rowspan="5"><b>Theory</b></td>
    <td align="center">Definition</td>
    <td><pre>\begin{definition}{customName}<br>  [...]<br>\end{definition}</pre></td>
    <td></td>
  </tr>
  <tr>
    <td align="center">Theorem</td>
    <td><pre>\begin{theorem}{customName}<br>  [...]<br>\end{theorem}</pre></td>
    <td></td>
  </tr>
  <tr>
    <td align="center">Corollary</td>
    <td><pre>\begin{corollary}{customName}<br>  [...]<br>\end{corollary}</pre></td>
    <td></td>
  </tr>
  <tr>
    <td align="center">Lemma</td>
    <td><pre>\begin{lemma}{customName}<br>  [...]<br>\end{lemma}</pre></td>
    <td></td>
  </tr>
  <tr>
    <td align="center">Proof</td>
    <td><pre>\begin{proof}<br>  [...]<br>\end{proof}</pre></td>
    <td><p align="center"><i>Must be used straight after <br>another <b>Theory</b> box. An example can<br>be found at the end of this section</i></p></td>
  </tr>
  <tr>
    <td align="center" rowspan="3"><b>Practice</b></td>
    <td align="center">Example</td>
    <td><pre>\begin{example}{customName}<br>  [...]<br>\end{example}</pre></td>
    <td></td>
  </tr>
  <tr>
    <td align="center">Exercise</td>
    <td><pre>\begin{exercise}{customName}<br>  [...]<br>\end{exercise}</pre></td>
    <td></td>
  </tr>
  <tr>
    <td align="center">Solution</td>
    <td><pre>\begin{solution}<br>  [...]<br>\end{solution}</pre></td>
    <td><p align="center"><i>Similarly to the <b>proof</b> box,<br> it must be used after a <b>Practice</b> box</i></p></td>
  </tr>
  <tr>
    <td align="center"><b>Remark</b></td>
    <td align="center">Remark</td>
    <td><pre>\begin{remark}{customName}<br>  [...]<br>\end{remark}</pre></td>
    <td></td>
  </tr>
  <tr>
    <td align="center"><b>Curiosity</b></td>
    <td align="center">Curiosity</td>
    <td><pre>\begin{curiosity}{customName}<br>  [...]<br>\end{curiosity}</pre></td>
    <td></td>
  </tr>
  <tr>
    <td align="center"><b>Question</b></td>
    <td align="center">Question</td>
    <td><pre>\begin{question}<br>  [...]<br>\end{question}</pre></td>
    <td></td>
  </tr>
</table>

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

## 4) Time complexity

How well does NoTeX perform? It depends on the compiler and on the compile settings that you use. I'm providing here some benchmarks made on my computers with different OSs, and I'll leave also the specs for further comparison:

<table align="center">
  <tr>
    <th colspan="2">Examinated element</th>
    <th>Linux Mint</th>
    <th>macOs</th>
  </tr>
  <tr>
    <td align="center" rowspan="3"><b>HW/SW Specs</b></td>
    <td align="center"><b>OS Version</b></td>
    <td align="center">Linux Mint 21.2</td>
    <td align="center">macOs Monterey</td>
  </tr>
  <tr>
    <td align="center"><b>CPU</b></td>
    <td align="center">Intel i7-4770 @ 3.9 GHz</td>
    <td align="center">N/A</td>
  </tr>
  <tr>
    <td align="center"><b>RAM</b></td>
    <td align="center">16GB DDR3</td>
    <td align="center">8GB DDR3</td>
  </tr>
  <tr>
    <td align="center" rowspan="2"><b>Compiler<br><a href="https://github.com/tectonic-typesetting/tectonic">tectonic</a></b></td>
    <td align="center"><b>Command used</b></td>
    <td align="center" colspan="2"><code>tectonic main.tex -Z continue-on-errors</code></td>
  </tr>
  <tr>
    <td align="center"><b>Time needed<br>(on average)</b></td>
    <td align="center">~23s</td>
    <td align="center">~40s</td>
  </tr>
</table>

---

## 5) Special Thanks ❤️

I'd like to thank [SeniorMars](https://github.com/SeniorMars) for both his [repository](https://github.com/SeniorMars/dotfiles) and his [video](https://www.youtube.com/watch?v=DOtM1mrWjUo) over the way he takes notes with _LaTeX_, which inspired me to build my own template and taking notes with it. Oh btw, you should thank [Daniel Falbo](https://github.com/danielfalbo) too, since if he didn't ask me "_Hey, why don't you upload your notes on GitHub?_" then all this material won't be here.

If you want to contribute to the template, just feel free to do so! It's not guaranteed that your contribution will be implemented, but it could be worth a shot!
