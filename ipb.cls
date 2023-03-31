% It is not recommended to change this file. Unless you want to stylistically change this template.

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
%\oddsidemargin 0.5in \evensidemargin 0in
%\marginparwidth 40pt


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

%\RequirePackage{xparse}
%% Departamento
%%\NewDocumentCommand{\dept}{m}{#1}
%% Primeiro autor
%\NewDocumentCommand{\authnum}{m}{#1}
%% Segundo autor
%\NewDocumentCommand{\secauthnum}{m}{#1}
%\NewDocumentCommand{\secondauthor}{m}{#1}
%% Curso
%\NewDocumentCommand{\course}{m}{#1}
%\NewDocumentCommand{\courseyear}{m}{#1}
%% Supervisores
%\NewDocumentCommand{\supervisor}{m}{#1}
%\NewDocumentCommand{\cosupervisor}{m}{#1}

% Departamento
\def\dept#1{\gdef\@dept{#1}}
% Autores
\def\authnum#1{\gdef\@authnum{#1}}
\def\secondauthor#1{\gdef\@secondauthor{#1}}
\def\secauthnum#1{\gdef\@secauthnum{#1}}
% Curso
\def\@course{Master Smart Systems Engineering}
\def\course#1{\gdef\@course{#1}}
\def\@courseyear{\the\year} % default spelling
\def\courseyear#1{\gdef\@courseyear{#1}}
% Supervisors
\def\@supervisor{Orientador} % default spelling
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\cosupervisor#1{\gdef\@cosupervisor{#1}}

% % %  conditionals
\newif\iffigurespage
\newif\iftablespage
\figurespagetrue 
\tablespagetrue

\RequirePackage{ifxetex}

%\ifxetex
%\usepackage{fontspec}
%\else
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{lmodern}
%\fi

\def\coverpage{
% See: https://tex.stackexchange.com/questions/62448/remove-vertical-space-at-start-of-latex-document
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

    %Dissertation presented to the School of Technology and Management of Bragança to obtain the Master Degree in \@course.\\
    
    % \vspace{4em}
    %  Supervisor:\\
    % \@supervisor\\
    % \ifdefined\@cosupervisor
    % \@cosupervisor\\
    % \fi
    
% 	\vspace*{\fill}
    % \vfill
    
%     This dissertation does not include the criticisms and suggestions made by the jury
    \vspace{5.5em}
	Groningen\\
	\@courseyear
\end{center}
% \cleardoublepage
}

\def\titlep{%
\thispagestyle{empty}%

\begin{center}
    \begin{figure}
        \centering
        \includegraphics[width=0.6\columnwidth, keepaspectratio]{images/hanzelogo.png}\\ 
        \caption{Caption}
    \end{figure}

\end{center}


\null\vskip1in%
\begin{center}
	\vspace{6em}
    {\Huge\expandafter{\bf \@title}}
    \vfill
    {\Large\textbf{
    \@author \ifdefined\@authnum \quad\@authnum \fi\\
}}
    \vfill
    Dissertation presented to the School of Technology and Management of Bragança to obtain the Master Degree in \@course.\\
    
	    \vspace{4em}
	    Work oriented by:\\
	    \@supervisor\\
    \ifdefined\@cosupervisor
    \@cosupervisor\\
    \fi
	
    \vfill
%     This dissertation does not include the criticisms and suggestions made by the jury\\
    \vspace{2em}
	Bragança\\
	\@courseyear
\end{center}
\cleardoublepage
}

\def\beforepreface{%
        \pagenumbering{gobble}
        \pagestyle{empty}
        \coverpage
        % \titlep
        % \pagestyle{plain}
        %\ifdisclaimer\disclaimerpage\fi
        %\signaturepage
        %\cleardoublepage
}


\def\prefacesection{\@ifstar\@prefacesection\@@prefacesection}

\def\@prefacesection#1{%
        \chapter*{#1}
}

\def\@@prefacesection#1{%
        \chapter*{#1}
        \addcontentsline{toc}{chapter}{#1}
}

\def\afterpreface{%
% \cleardoublepage
\clearpage

\pagenumbering{arabic}
\setcounter{page}{5}
        \tableofcontents
        \iftablespage
                \listoftables
                \addcontentsline{toc}{chapter}{\listtablename}
        \fi
        \iffigurespage
% 	\newpage
\clearpage
% \mbox{}
                \addcontentsline{toc}{chapter}{\listfigurename}
                \listoffigures
                
        \fi
	}

\def\bodystart{%
        \clearpage
        %\cleardoublepage
        % \setcounter{page}{1}
        % \pagenumbering{arabic}
        \pagestyle{headings}}

% Redefine \thebibliography to go to a new page and put an entry in the
% table of contents
\let\@ldthebibliography\thebibliography
\renewcommand{\thebibliography}[1]{\newpage
                \@ldthebibliography{#1}%
\addcontentsline{toc}{chapter}{\bibname}}


% Start out normal
\pagestyle{headings}

\makeatother