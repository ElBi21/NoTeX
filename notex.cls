\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notex}[2024 ElBi21 LaTeX class for taking notes]

% Class outline:
%  1. Load of the class - End of file
%  2. Packages
%  3. Colors
%  4. Commands
%  5. Class Options
% ---+---+---+---+---+---+---+---+---+---

% --- Load class ---
\LoadClass[10pt, letterpaper]{report}                % Loads the report class, which allows for the \chapter command

% --- Packages Section ---
\RequirePackage{xcolor}                 % Package for colors
\RequirePackage{tcolorbox}              % Package for boxes
\RequirePackage[a4paper]{geometry}      % Package for the geometry of the file
\RequirePackage{listings}               % Package for code

\RequirePackage[T1]{fontenc}            % Package for font encoding
\RequirePackage{fouriernc}              % Package with the font
%\RequirePackage{sourcecodepro}

\RequirePackage{notexmacros}            % Package with macros


% --- Colors ---
\definecolor{maindoccol}{HTML}{6E000D}  % Standard color, can be overwritten with \maincol

\definecolor{theoryLINE}{HTML}{6682f1}
\definecolor{practiceLINE}{HTML}{fecf54}

\definecolor{lemmaBG}{HTML}{b1e0e8}
\definecolor{lemmaTitleBG}{HTML}{c1e5eb}

\definecolor{theoremBG}{HTML}{9adfdd}
\definecolor{theoremTitleBG}{HTML}{a8e3e1}

\definecolor{definitionBG}{HTML}{97bcea}
\definecolor{definitionTitleBG}{HTML}{97cbea}

\definecolor{corollaryBG}{HTML}{6da2ec}
\definecolor{corollaryTitleBG}{HTML}{89b8fa}

\definecolor{proofBG}{HTML}{d8c3f0}
\definecolor{proofTitleBG}{HTML}{ceb2ed}

\definecolor{exerciseBG}{HTML}{faf0bc} % fcdf9c
\definecolor{exerciseTitleBG}{HTML}{fff2af} % ffd87e

\definecolor{exampleBG}{HTML}{ffd39a} % fcdf9c
\definecolor{exampleTitleBG}{HTML}{ffe3be} % ffd87e

\definecolor{solutionBG}{HTML}{c4f8e1} % - a5e3fa -  
\definecolor{solutionTitleBG}{HTML}{9cffd3} % - beedfe - 

\definecolor{remarkBG}{HTML}{ee9595} % - a5e3fa - 
\definecolor{remarkLINE}{HTML}{9d1830} % - 41b9e4 - 
\definecolor{remarkTitleBG}{HTML}{feb7b7} % - beedfe - 

\definecolor{curiosityBG}{HTML}{97e687} % - a5e3fa
\definecolor{curiosityLINE}{HTML}{43a82e} % - 41b9e4
\definecolor{curiosityTitleBG}{HTML}{c0f5b5} % - beedfe

% --- Commands ---

% Class related
\newcommand{\maincol}[2]{ \definecolor{maindoccol}{#1}{#2} }

%% --- Class options ---
%\DeclareOption{maincol}{\typeout{Saw foo.}}
%\ProcessOptions\relax               % Process the options

%% --- Post-Load setups
\geometry{
    left=25mm,
    right=25mm,
    top=25mm,
    bottom=25mm
}

\lstdefinestyle{notexstand}{
    basicstyle = \ttfamily\footnotesize,
}