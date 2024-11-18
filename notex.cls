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
\LoadClass[12pt, letterpaper]{report}   % Loads the report class, which allows for the \chapter command

% --- Packages Section ---
\RequirePackage[dvipsnames]{xcolor}     % Package for colors
\RequirePackage{tcolorbox}              % Package for boxes
\RequirePackage[a4paper]{geometry}      % Package for the geometry of the file
\RequirePackage{listings}               % Package for code
\RequirePackage{ifthen}                 % Package for class logic
\RequirePackage{calc}                   % Package for calculating logic
\RequirePackage{tikz}                   % Package for drawings
\RequirePackage{array}                  % Package for better tables options
\RequirePackage{titlesec}               % Package for customizing titles
\RequirePackage{titletoc}               % Package for customizing toc
\RequirePackage{fancyhdr}               % Package for the HDR
\RequirePackage{hyperref}               % Package for links

\RequirePackage[T1]{fontenc}            % Package for font encoding
\RequirePackage{fouriernc}              % Package with the font
\RequirePackage{courier}                % Package with code font
%\RequirePackage{cascadia-code}
%\RequirePackage[nottdefault]{sourcecodepro}

\RequirePackage{amsmath}                % Package for math symbols
\RequirePackage{amssymb}                % Package for symbols
\RequirePackage{gensymb}                % Package for symbols
\RequirePackage{fontawesome5}           % Package for icons

\RequirePackage{graphicx}               % Package for images
\RequirePackage{multirow}               % Package for multirows
\RequirePackage{nicefrac}               % Package for better text fractions
\RequirePackage{makecell}               % Package for better cell formatting

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

\definecolor{manualBG}{HTML}{aeb0b9}

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

\newcommand{\sectionname}{Section}


\renewcommand*\ttdefault{lmtt}

% Remove indent from beginning of lines
\newlength\tindent
\setlength{\tindent}{\parindent}
\setlength{\parindent}{0pt}
\renewcommand{\indent}{\hspace*{\tindent}}
\newcommand{\nl}{
    
\vspace{12pt}

}

\contentsmargin{0cm}
\titlecontents{chapter}[3.7pc]
{\addvspace{30pt}
	\begin{tikzpicture}[remember picture, overlay]
		\draw[fill=maindoccol!90,draw=maindoccol!90] (-7, -0.1) rectangle (-0.12, 0.5);
        \draw[fill=white!60,draw=white!60] (-0.6, -0.15) rectangle (-0.10, 0.55);
		\pgftext[left,x=-3.5cm,y=0.2cm]{\color{white}\Large\sc\bfseries Chapter\ \color{maindoccol}\Large\sc\bfseries \thecontentslabel};
	\end{tikzpicture}\color{maindoccol!90} $\quad \blacktriangleright \;$ \large\sc\bfseries}
{}
{}
{\;\titlerule\;\large\sc\bfseries Page \thecontentspage
	\begin{tikzpicture}[remember picture, overlay]
		\draw[fill=maindoccol!90,draw=maindoccol!90] (2pt,0) rectangle (4,0.1pt);
	\end{tikzpicture}}
 
\titlecontents{section}[3.7pc]
{\addvspace{2pt}}
{\contentslabel[\thecontentslabel]{2pc}}
{}
{\hfill\small \thecontentspage}
[]

\titlecontents{subsection}[6.5pc]
{\addvspace{1.75pt}}
{\contentslabel[\thecontentslabel]{2.7pc}}
{}
{\hfill\small \thecontentspage}
[]

\makeatletter
\renewcommand{\tableofcontents}{
	\chapter*{
	  \vspace*{-30\p@}
	  \begin{tikzpicture}[remember picture, overlay]%
		  \pgftext[right,x=15cm,y=0.2cm]{\color{maindoccol!90} \Huge\sc\bfseries \contentsname};%
		  \draw[fill=maindoccol!90,draw=maindoccol!90] (13,-.75) rectangle (20,1);%
		  \clip (13,-.75) rectangle (20,1);
		  \pgftext[right,x=15cm,y=0.2cm]{\color{white} \Huge\sc\bfseries \contentsname};%
	  \end{tikzpicture}}
	\@starttoc{toc}}
\makeatother

\newcommand{\notextoc}{
\pagenumbering{Roman}
\setcounter{page}{1}
\pagestyle{plain}
\pagebreak
\tableofcontents
\pagebreak
\pagestyle{fancy}
\setcounter{page}{0}
\pagenumbering{arabic}
}

\hypersetup{
    colorlinks=true,
    linkcolor=MidnightBlue,
    anchorcolor=MidnightBlue,
    urlcolor=MidnightBlue,
}

% Boxes commands
\newcommand{\boxdesc}[1]{\fontsize{6.5}{6.5}\selectfont\textcolor{white}{\textsc{#1}}}
\newcommand{\codetextstyle}{\ttfamily\linespread{1}\fontsize{10}{10}\selectfont}
\newcommand{\manlower}{\tcblower\fontsize{9}{9}\selectfont}

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
        colback=definitionTitleBG!55,
        rounded corners=all,
        arc=8pt,
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
        colback=theoremTitleBG!55,
        rounded corners=all,
        arc=8pt,
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
        arc=8pt,
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
        arc=8pt,
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
        arc=8pt,
        leftrule=1mm,
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
        arc=8pt,
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
    enlarge top initially by=1mm,
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
    enlarge top initially by=1mm,
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

\newtcolorbox{codedefine}{
    colback=codeBG!15,
    colbacklower=manualBG,
    colframe=codeBG!90,
    enhanced,
    breakable,
    sidebyside,
    bicolor,
    righthand ratio=0.45,
    rounded corners=all,
    arc=1mm,
    toprule=4mm,
    enlarge top initially by=1mm,
    enlarge bottom by=0.5mm,
    skin first=enhanced,
    skin middle=enhanced,
    skin last=enhanced,
    overlay={
        \filldraw[OrangeRed] ([xshift=3mm, yshift=-2mm]frame.north west) circle (1mm);
        \filldraw[Dandelion] ([xshift=6mm, yshift=-2mm]frame.north west) circle (1mm);
        \filldraw[YellowGreen] ([xshift=9mm, yshift=-2mm]frame.north west) circle (1mm);
        \node[anchor=north] at ([yshift=0.1mm]frame.north) {\fontsize{8}{8}\selectfont\textcolor{white}{\texttt{Code Manual}}};
    },
}


% LSTListing Style

\lstdefinestyle{notexstand}{
    commentstyle=\color{codeCOMMENT},
    keywordstyle=\color{codeKEY},
    numberstyle=\scriptsize\color{codeVALUES},
    stringstyle=\color{codeSTRING},
    basicstyle=\ttfamily\linespread{0.8}\selectfont\color{black!80},
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
    showlines=false
}

\lstdefinestyle{notexterm}{
    commentstyle=\color{codeCOMMENT!70},
    keywordstyle=\color{codeKEY},
    stringstyle=\color{codeSTRING},
    basicstyle=\ttfamily\linespread{0.8}\selectfont\color{white!80},
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
    language=bash,
    numbers=none,
    showlines=false
}

\lstset{style=notexstand}

%% --- TitleSec options

\titleformat{\chapter}[display]{\vspace{-40pt}\fontsize{20pt}{20pt}\selectfont}{\textsc{\textcolor{gray!50}{\raisebox{43pt}{\chaptername}}\textcolor{gray!30}{\fontsize{120pt}{120pt}\selectfont{\thechapter}}}}{0pt}{\vspace{-47pt}\fontsize{24pt}{24pt}\selectfont\quad}

%\titleformat{\section}[block]{\begin{tikzpicture}\draw[white](0,1) circle (0.1pt) node [anchor = south] {\thesection};draw[white](0,1) circle (0.1pt) node [anchor = north] {\textsc{\textcolor{gray!50}{\sectionname}}}\end{tikzpicture}}{0pt}{\quad}


%% --- FancyHDR options

\renewcommand{\chaptermark}[1]{\markboth{\textbf{\textsc{\chaptername\ \thechapter}}\ \textbullet\ #1}{}}

\fancypagestyle{fancy}{%
    \fancyhf{}
    \fancyhead[L]{\leftmark}
    \fancyfoot[R]{Page \textbf{\thepage}}
    \renewcommand{\footrulewidth}{0.1pt}
    \renewcommand{\headrulewidth}{0.1pt}
}

\fancypagestyle{plain}{%
    \fancyhf{}
    \fancyfoot[R]{Page \textbf{\thepage}}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0.1pt}
}


%% --- Post-Load setups
\geometry{
    left=\marleft,
    right=\marright,
    top=\martop,
    bottom=\marbottom
}

\pagestyle{fancy}