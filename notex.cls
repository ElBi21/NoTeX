\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notex}[2024 ElBi21 LaTeX class for taking notes]

% Class outline:
%  1. Load of the class - End of file
%  2. Packages
%  3. Colors
%  4. Commands
%  5. Class Options
% ---+---+---+---+---+---+---+---+---+---

%% --- Class options ---

%\DeclareOption{includemacros}{
    %\typeout{Including the notexmacros package...}
%    \RequirePackage{notexmacros}
%} % Package with macros
%\ProcessOptions\relax               % Process the options

% --- Load class ---
\LoadClass[10pt, letterpaper]{report}   % Loads the report class, which allows for the \chapter command

% --- Packages Section ---
\RequirePackage[dvipsnames]{xcolor}     % Package for colors
\RequirePackage{tcolorbox}              % Package for boxes
\RequirePackage[a4paper]{geometry}      % Package for the geometry of the file
\RequirePackage{listings}               % Package for code
\RequirePackage{ifthen}                 % Package for class logic
\RequirePackage{calc}                   % Package for calculating logic
\RequirePackage{tikz}                   % Package for drawings

\RequirePackage[T1]{fontenc}            % Package for font encoding
\RequirePackage{fouriernc}              % Package with the font
\RequirePackage{courier}
%\RequirePackage{cascadia-code}
%\RequirePackage[nottdefault]{sourcecodepro}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{gensymb}
\RequirePackage{fontawesome5}

\RequirePackage{graphicx}
\RequirePackage{multirow}

\tcbuselibrary{most}                    % Loads tcolorbox options
\DeclareMathAlphabet{\mathcal}{OMS}{zplm}{m}{n}

% --- Colors ---
\definecolor{maindoccol}{HTML}{6E000D}  % Standard color, can be overwritten with \maincol

\definecolor{theoryLINE}{HTML}{6682f1}
\definecolor{practiceLINE}{HTML}{fecf54}

\definecolor{lemmaBG}{HTML}{78d2e1}
\definecolor{lemmaTitleBG}{HTML}{7dd0de}

\definecolor{theoremBG}{HTML}{70bfbd}
\definecolor{theoremTitleBG}{HTML}{6ad3d0}

\definecolor{definitionBG}{HTML}{97bcea}
\definecolor{definitionTitleBG}{HTML}{97cbea}

\definecolor{corollaryBG}{HTML}{8293e5}
\definecolor{corollaryTitleBG}{HTML}{7b94ec}

\definecolor{proofBG}{HTML}{40a560}

\definecolor{codeBG}{HTML}{554e63}
\definecolor{codeTitleBG}{HTML}{7b94ec}

\definecolor{exerciseBG}{HTML}{e7c650} % fcdf9c
\definecolor{exerciseTitleBG}{HTML}{f5e48e} % ffd87e

\definecolor{exampleBG}{HTML}{e59c3d} % fcdf9c
\definecolor{exampleTitleBG}{HTML}{f8d3a2} % ffd87e

\definecolor{solutionBG}{HTML}{c4f8e1} % - a5e3fa -  
\definecolor{solutionTitleBG}{HTML}{9cffd3} % - beedfe - 

\definecolor{remarkBG}{HTML}{ee9595} % - a5e3fa - 
\definecolor{remarkLINE}{HTML}{9d1830} % - 41b9e4 - 
\definecolor{remarkTitleBG}{HTML}{feb7b7} % - beedfe - 

\definecolor{curiosityBG}{HTML}{97e687} % - a5e3fa
\definecolor{curiosityLINE}{HTML}{43a82e} % - 41b9e4
\definecolor{curiosityTitleBG}{HTML}{c0f5b5} % - beedfe

\definecolor{codeCOMMENT}{HTML}{649541} % 98C379
\definecolor{codeSTRING}{HTML}{37864A} % 60A470
\definecolor{codeKEY}{HTML}{C678DD}
\definecolor{codeFUNC}{HTML}{61AFEF}
\definecolor{codeVALUES}{HTML}{C69438} % E5C07B

% --- Commands ---

% Class related
\newcommand{\maincol}[2]{ \definecolor{maindoccol}{#1}{#2} }
\newcommand{\marleft}{25mm}
\newcommand{\marright}{25mm}
\newcommand{\marbottom}{25mm}
\newcommand{\martop}{25mm}

\renewcommand*\ttdefault{lmtt}

\newcommand{\boxdesc}[1]{\fontsize{6.5}{6.5}\selectfont\textcolor{white}{\textsc{#1}}}
\newcommand{\codetextstyle}{\ttfamily\linespread{1}\fontsize{10}{10}\selectfont}

% Counters
\newcounter{examplecounter}
\newcounter{exercisecounter}

% Boxes
\newtcolorbox{definition}[1]{
    title=\fontfamily{ppl}\selectfont{{#1}},
    coltitle=black,
    halign title=left,
    attach boxed title to top left = {
        xshift=6mm,
        yshift=-\tcboxedtitleheight/2,
        yshifttext=-\tcboxedtitleheight/2
    },
    boxed title style = {
        colback=definitionTitleBG!65!white!80,
        rounded corners=all,
        arc=2.5mm,
    },
    colback=definitionBG!30,
    colframe=definitionBG!90,
    enhanced,
    breakable,
    rounded corners=all,
    arc=1mm,
    leftrule=3mm,
    enlarge top initially by=1.5mm,
    skin first=enhanced,
    skin middle=enhanced,
    skin last=enhanced,
    overlay={
        \node[rotate=90, anchor=east] at ([xshift=1.5mm, yshift=-1.1mm]frame.north west) {\boxdesc{Definition}};
    },
}

\newtcolorbox{theorem}[1]{
    title=\fontfamily{ppl}\selectfont{{#1}},
    coltitle=black,
    halign title=left,
    attach boxed title to top left = {
        xshift=6mm,
        yshift=-\tcboxedtitleheight/2,
        yshifttext=-\tcboxedtitleheight/2
    },
    boxed title style = {
        colback=theoremTitleBG!65!white!80,
        rounded corners=all,
        arc=2.5mm,
    },
    colback=theoremBG!30,
    colframe=theoremBG!90,
    enhanced,
    breakable,
    rounded corners=all,
    arc=1mm,
    leftrule=3mm,
    enlarge top initially by=1.5mm,
    skin first=enhanced,
    skin middle=enhanced,
    skin last=enhanced,
    skin=bicolor,
    overlay={
        \node[rotate=90, anchor=east] at ([xshift=1.5mm, yshift=-0.8mm]frame.north west) {\boxdesc{Theorem}};
    },
    colbacklower=proofBG,
}

\newtcolorbox{lemma}[1]{
    title=\fontfamily{ppl}\selectfont{{#1}},
    coltitle=black,
    halign title=left,
    attach boxed title to top left = {
        xshift=6mm,
        yshift=-\tcboxedtitleheight/2,
        yshifttext=-\tcboxedtitleheight/2
    },
    boxed title style = {
        colback=lemmaTitleBG!65!white!80,
        rounded corners=all,
        arc=2.5mm,
    },
    colback=lemmaBG!30,
    colframe=lemmaBG!90,
    enhanced,
    breakable,
    rounded corners=all,
    arc=1mm,
    leftrule=3mm,
    enlarge top initially by=1.5mm,
    skin first=enhanced,
    skin middle=enhanced,
    skin last=enhanced,
    overlay={
        \node[rotate=90, anchor=east] at ([xshift=1.5mm, yshift=-1.1mm]frame.north west) {\boxdesc{Lemma}};
    },
}

\newtcolorbox{corollary}[1]{
    title=\fontfamily{ppl}\selectfont{{#1}},
    coltitle=black,
    halign title=left,
    attach boxed title to top left = {
        xshift=6mm,
        yshift=-\tcboxedtitleheight/2,
        yshifttext=-\tcboxedtitleheight/2
    },
    boxed title style = {
        colback=corollaryTitleBG!65!white!80,
        rounded corners=all,
        arc=2.5mm,
    },
    colback=corollaryBG!30,
    colframe=corollaryBG!90,
    enhanced,
    breakable,
    rounded corners=all,
    arc=1mm,
    leftrule=3mm,
    enlarge top initially by=1.5mm,
    skin first=enhanced,
    skin middle=enhanced,
    skin last=enhanced,
    overlay={
        \node[rotate=90, anchor=east] at ([xshift=1.5mm, yshift=-1.1mm]frame.north west) {\boxdesc{Corollary}};
    },
}

\newtcolorbox{proof}{
    colback=proofBG!25,
    colframe=proofBG!90,
    enhanced,
    breakable,
    rounded corners=all,
    arc=1mm,
    sharp corners=north,
    leftrule=3mm,
    skin first=enhanced,
    skin middle=enhanced,
    skin last=enhanced,
    grow to left by=8mm,
    grow to right by=5.5mm,
    enlarge bottom finally by=-3.5mm,
    overlay={
        \node[rotate=90, anchor=east] at ([xshift=1.5mm, yshift=-1.1mm]frame.north west) {\boxdesc{Proof}};
    },
}

\newtcolorbox{exercise}{
    title=\fontfamily{ppl}\selectfont{{\fontsize{8}{8}\selectfont \faPencil*} \; \thesection.\theexercisecounter \addtocounter{exercisecounter}{1}},
    coltitle=black,
    halign title=left,
    attach boxed title to top left = {
        xshift=6mm,
        yshift=-\tcboxedtitleheight/2,
        yshifttext=-\tcboxedtitleheight/2
    },
    boxed title style = {
        colback=exerciseTitleBG!65!white!80,
        rounded corners=all,
        arc=2.5mm,
    },
    enhanced,
    colback=exerciseBG!30,
    colframe=exerciseBG!90,
    enhanced,
    breakable,
    rounded corners=all,
    arc=1mm,
    leftrule=3mm,
    enlarge top initially by=1.5mm,
    skin first=enhanced,
    skin middle=enhanced,
    skin last=enhanced,
    overlay={
        \node[rotate=90, anchor=east] at ([xshift=1.5mm, yshift=-1.1mm]frame.north west) {\boxdesc{Exercise}};
    },
}

\newtcolorbox{example}{
    title=\fontfamily{ppl}\selectfont{{\fontsize{8}{10}\selectfont \faLightbulb} \; \thesection.\theexamplecounter \addtocounter{examplecounter}{1}},
    coltitle=black,
    halign title=left,
    attach boxed title to top left = {
        xshift=6mm,
        yshift=-\tcboxedtitleheight/2,
        yshifttext=-\tcboxedtitleheight/2
    },
    boxed title style = {
        colback=exampleTitleBG!65!white!80,
        rounded corners=all,
        arc=2.5mm,
        leftrule=1mm,
    },
    enhanced,
    colback=exampleBG!30,
    colframe=exampleBG!90,
    enhanced,
    breakable,
    rounded corners=all,
    arc=1mm,
    leftrule=3mm,
    enlarge top initially by=1.5mm,
    skin first=enhanced,
    skin middle=enhanced,
    skin last=enhanced,
    overlay={
        \node[rotate=90, anchor=east] at ([xshift=1.5mm, yshift=-1.1mm]frame.north west) {\boxdesc{Example}};
    },
}

\newtcolorbox{codeblock}[1]{
    colback=codeBG!15,
    colframe=codeBG!90,
    enhanced,
    breakable,
    rounded corners=all,
    arc=1mm,
    toprule=4mm,
    enlarge top initially by=-0.8mm,
    enlarge bottom by=0.5mm,
    skin first=enhanced,
    skin middle=enhanced,
    skin last=enhanced,
    overlay={
        \filldraw[OrangeRed] ([xshift=3mm, yshift=-2mm]frame.north west) circle (1mm);
        \filldraw[Dandelion] ([xshift=6mm, yshift=-2mm]frame.north west) circle (1mm);
        \filldraw[YellowGreen] ([xshift=9mm, yshift=-2mm]frame.north west) circle (1mm);
        \node[anchor=north] at ([yshift=0.1mm]frame.north) {\fontsize{8}{8}\selectfont\textcolor{white}{\texttt{#1}}};
    },
}

\newtcolorbox{terminal}{
    colback=black!95!Periwinkle!90,
    colframe=codeBG!90,
    enhanced,
    breakable,
    rounded corners=all,
    arc=1mm,
    toprule=4mm,
    enlarge top initially by=-0.8mm,
    enlarge bottom by=0.5mm,
    skin first=enhanced,
    skin middle=enhanced,
    skin last=enhanced,
    overlay={
        \filldraw[OrangeRed] ([xshift=3mm, yshift=-2mm]frame.north west) circle (1mm);
        \filldraw[Dandelion] ([xshift=6mm, yshift=-2mm]frame.north west) circle (1mm);
        \filldraw[YellowGreen] ([xshift=9mm, yshift=-2mm]frame.north west) circle (1mm);
        \node[anchor=north] at ([yshift=0.1mm]frame.north) {\fontsize{8}{8}\selectfont\textcolor{white}{\texttt{Terminal}}};
    },
}


% LSTListing Style

\lstdefinestyle{notexstand}{
    commentstyle=\ttfamily\color{codeCOMMENT},
    keywordstyle=\ttfamily\color{codeKEY},
    numberstyle=\ttfamily\linespread{1}\scriptsize\color{codeVALUES},
    stringstyle=\ttfamily\color{codeSTRING},
    basicstyle=\ttfamily\color{black!80},
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=4,
    basewidth=0.44em,
    aboveskip=0pt,
    belowskip=0pt,
}

\lstdefinestyle{notexterm}{
    commentstyle=\ttfamily\color{codeCOMMENT},
    keywordstyle=\ttfamily\color{codeKEY},
    numberstyle=\ttfamily\linespread{1}\scriptsize\color{codeVALUES},
    stringstyle=\ttfamily\color{codeSTRING},
    basicstyle=\ttfamily\color{white!80},
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=4,
    basewidth=0.44em,
    aboveskip=0pt,
    belowskip=0pt,
    language = bash,
    numbers=none
}

\lstset{style=notexstand}




%% --- Post-Load setups
\geometry{
    left=\marleft ,
    right=\marright ,
    top=\martop ,
    bottom=\marbottom
}