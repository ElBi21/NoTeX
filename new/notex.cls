\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notex}[2024 ElBi21 LaTeX class for taking notes]

% Class outline:
%  1. Packages
%  2. Colors
%  3. Commands
%  4. Class Options
%  5. Load of the class - End of file
% ---+---+---+---+---+---+---+---+---+---

% --- Packages Section ---
\RequirePackage{xcolor}             % Package for colors
\RequirePackage{tcolorbox}          % Package for boxes
\RequirePackage{notexmacro}         % Package with macros
%\RequirePackage{lstlisting}         % Lstlisting or minted? Must choose

% --- Colors ---
\definecolor{maindoccol}{HTML}{6E000D} % Standard color, can be overwritten with \maincol

% --- Commands ---

% Class related
\newcommand{\maincol}[2]{ \definecolor{maindoccol}{#1}{#2} }

% --- Class options ---
%\DeclareOption{maincol}{\typeout{Saw foo.}}
%\ProcessOptions\relax               % Process the options

% --- Load class - End of class ---
\LoadClass[]{report}                % Loads the report class, which allows for the \chapter command