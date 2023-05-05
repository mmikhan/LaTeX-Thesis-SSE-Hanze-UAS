\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ipb}[2015/11/24 MSc class]

\LoadClass[12pt,twoside]{report}

%% Required packages.
% Line spacing
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage[acronym,toc,nonumberlist]{glossaries}
\RequirePackage{emptypage}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

%%%%%
%%%%%   SETUP MARGINS AND PENALTIES
%%%%%

% We need 1" margins except on the binding edge, where it is 1 1/2"
% Theses may be either single or double sided
\if@twoside
\setlength\oddsidemargin   {0\p@}
\setlength\evensidemargin  {0\p@}
\setlength\marginparwidth {40\p@}
\else
\setlength\oddsidemargin   {0\p@}
\setlength\evensidemargin  {0\p@}
\setlength\marginparwidth  {40\p@}
\fi

\marginparsep 10pt
\topmargin 0pt \headsep 1cm
\textheight 22cm \textwidth 16cm

% Disallow page breaks at hyphens (this will give some underfull vbox's,
% so an alternative is to use \brokenpenalty=100 and manually search
% for and fix such page breaks)
\brokenpenalty=10000
\setstretch{1.0}

%%%%%
%%%%%   SETUP COMMANDS
%%%%%

\def\courseyear#1{\gdef\@courseyear{#1}}

% % %  conditionals
\newif\iffigurespage
\newif\iftablespage
\figurespagetrue
\tablespagetrue

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{lmodern}

\def\coverpage{
\setlength{\voffset}{-1.5cm}
\setlength{\headsep}{5pt}

\begin{center}
    \includegraphics[width=0.9\columnwidth, keepaspectratio]{images/hanzelogo.png}\\
\end{center}

\begin{center}
    \vspace{4em}
    {\Huge\expandafter{\bf \@title}}
    \vfill

    \vspace{2em}
    by

    {\Large\textbf{
    \@author \ifdefined\@authnum \quad\@authnum \fi\\
    }}

    \vfill
    \vspace{4em}
    GRADUATION REPORT

    \vfill
    \vspace{4em}
    \normalsize
    Submitted to

    Hanze University of Applied Sciences Groningen

    \vfill
    \vspace{1em}
    in partial fulfillment of the requirements \\
    for the degree of

    \vfill
    \vspace{1em}
    Master Smart Systems Engineering

    \vspace{5.5em}
    Confidential document

    \vspace{5.5em}
    Groningen\\

    \@courseyear
\end{center}
}

\def\beforepreface{%
\pagenumbering{gobble}
\pagestyle{empty}
\coverpage
}

\def\afterpreface{%
\clearpage
\pagenumbering{arabic}
\setcounter{page}{5}
\tableofcontents
\iftablespage
\listoftables
\addcontentsline{toc}{chapter}{\listtablename}
\fi

\iffigurespage
\clearpage
\addcontentsline{toc}{chapter}{\listfigurename}
\listoffigures
\fi
}

\def\bodystart{%
\clearpage
\pagestyle{plain}}

% Redefine \thebibliography to go to a new page and put an entry in the
% table of contents
\let\@ldthebibliography\thebibliography
\renewcommand{\thebibliography}[1]{\newpage
\@ldthebibliography{#1}%
\addcontentsline{toc}{chapter}{\bibname}}


% Start out normal
\pagestyle{headings}

\makeatother
