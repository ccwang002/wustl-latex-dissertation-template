% WUSTL thesis/dissertation template
% Copyright 2021–2023 Liang-Bo Wang
%
% This work may be distributed and/or modified under the conditions of the LaTeX Project Public
% License, either version 1.3 of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `unmaintained'.
%
% This work consists of the files wustlthesis.cls.


\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{wustlthesis}[2025/12/26 WUSTL thesis/dissertation template]


% ---- Define Page Layout -----------------------------------------------------
\LoadClass[letterpaper,12pt,openany,oneside,onecolumn]{memoir}

% Page margin
\setlrmarginsandblock{1in}{1in}{*}
\setulmarginsandblock{1in}{88pt}{*}  % 1in + 16pt = 88pt

% Header and footer location
% Note though the style specifies that nothing can be inside the page margins, the style guide
% doc file actually places the page numbers in the margin. The settings below mimics the doc.
\setheadfoot{18pt}{16pt}
\setheaderspaces{*}{6pt}{*}

% Margin note location
% Note that the style guide prohibits margin notes.
\setmarginnotes{1em}{4em}{\onelineskip}

% Math environment
\RequirePackage{amsmath}

% Unicode fonts
\RequirePackage{fontspec}
\RequirePackage{unicode-math}

% Localization specific settings
\RequirePackage[english]{babel}

% Quotation style
\RequirePackage[autostyle,english=american]{csquotes}


% ---- Main page style --------------------------------------------------------
\makepagestyle{main}
   \makeevenfoot{main}{}{\thepage}{}
   \makeoddfoot{main}{}{\thepage}{}

% Default page style
\pagestyle{plain}

% Quotation style
\AtBeginEnvironment{quote}{\SingleSpacing}

% Chapter style
\makechapterstyle{thesis}{%
    \chapterstyle{tandh}
    \renewcommand*{\chapnamefont}{\normalfont\LARGE\bfseries}
    \renewcommand*{\chapnumfont}{\normalfont\LARGE\bfseries}
    \renewcommand*{\chaptitlefont}{\normalfont\LARGE\bfseries}
    \renewcommand*{\printchaptername}{%
        \OnehalfSpacing\centering\chapnamefont\chaptername\ }
    \renewcommand*{\printchapternum}{\thechapter:\ }
    \renewcommand*{\printchapternonum}{\OnehalfSpacing\centering}
}

% Default chapter style
\chapterstyle{thesis}

% Appendix style
\addto{\captionsenglish}{\renewcommand{\appendixname}{Appendix}}
\makechapterstyle{thesisappendix}{%
    \chapterstyle{thesis}
    \renewcommand*{\printchaptername}{%
        \OnehalfSpacing\centering\chapnamefont\appendixname\ }
}
\apptocmd{\appendix}{\chapterstyle{thesisappendix}}{}{}

% Section numbering down to subsection
\setsecnumdepth{subsection}
\maxsecnumdepth{subsection}


% ---- Supplemental figures and tables  -----------------------------------------
\newcommand{\suppfigurename}{Supplemental Figure}
\newfloat[chapter]{suppfigure}{lof}{\suppfigurename}
\renewcommand\thesuppfigure{%
    S\ifnum\c@chapter>\z@ \thechapter.\fi \@arabic\c@suppfigure%
}

\newcommand{\supptablename}{Supplemental Table}
\newfloat[chapter]{supptable}{lot}{\supptablename}
\renewcommand\thesupptable{%
    S\ifnum\c@chapter>\z@ \thechapter.\fi \@arabic\c@supptable%
}


% ---- Bibliography/References style ------------------------------------------
\setlength{\bibitemsep}{\onelineskip}

% Re-define memoir citation commands
\newcommand*{\fref}[1]{\figurerefname~\ref{#1}}
\newcommand*{\tref}[1]{\tablerefname~\ref{#1}}
\newcommand*{\pref}[1]{\pagerefname~\pageref{#1}}
\newcommand*{\Aref}[1]{\appendixrefname~\ref{#1}}
\newcommand*{\Cref}[1]{\chapterrefname~\ref{#1}}
\newcommand*{\Sref}[1]{\sectionrefname\ref{#1}}


% ---- Table of contents (ToC) -----------------------------------------------
\setrmarg{3em}
\setpnumwidth{1.5em}

\maxtocdepth{subsection}  % put 3 levels into the ToC
\addto{\captionsenglish}{\renewcommand{\contentsname}{Table of Contents}}
\renewcommand{\cftdotsep}{0.5}
\renewcommand*{\cftchapterfont}{\normalfont}
\renewcommand*{\cftchapterpagefont}{\normalfont}
\renewcommand*{\cftchapterleader}{\cftchapterfont\cftdotfill{\cftchapterdotsep}}
\renewcommand*{\cftchapterdotsep}{\cftdotsep}
\renewcommand*{\cftchaptername}{\chaptername}
\renewcommand*{\cftchapterpresnum}{\ }
\renewcommand*{\cftchapteraftersnum}{:}
\renewcommand*{\cftappendixname}{\appendixname}

\setlength{\cftbeforechapterskip}{6pt plus 1pt minus 1pt}
\setlength{\cftbeforesectionskip}{6pt plus 1pt minus 1pt}
\setlength{\cftbeforesubsectionskip}{6pt plus 1pt minus 1pt}


% ---- List of figures (LoF), and list of tables (LoT) -----------------------
\pretocmd{\listoffigures}{\clearpage}{}{}
\renewcommand*{\cftfigurename}{\figurename}
\renewcommand*{\cftfigurepresnum}{\ }
\renewcommand*{\cftfigureaftersnum}{:}
\setlength{\cftbeforefigureskip}{6pt plus 1pt minus 1pt}
\cftsetindents{figure}{0em}{2.5em}

% include supplemental figures in LoF
\newlistentry{suppfigure}{lof}{0}
\renewcommand*{\cftsuppfigurename}{\figurename}
\renewcommand*{\cftsuppfigurepresnum}{\ }
\renewcommand*{\cftsuppfigureaftersnum}{:}
\setlength{\cftbeforesuppfigureskip}{\cftbeforefigureskip}
\cftsetindents{suppfigure}{0em}{2.5em}


\pretocmd{\listoftables}{\clearpage}{}{}
\renewcommand*{\cfttablename}{\tablename}
\renewcommand*{\cfttablepresnum}{\ }
\renewcommand*{\cfttableaftersnum}{:}
\setlength{\cftbeforetableskip}{6pt plus 1pt minus 1pt}
\cftsetindents{table}{0em}{2.5em}

% include supplemental tables in LoT
\newlistentry{supptable}{lot}{0}
\renewcommand*{\cftsupptablename}{\tablename}
\renewcommand*{\cftsupptablepresnum}{\ }
\renewcommand*{\cftsupptableaftersnum}{:}
\setlength{\cftbeforesupptableskip}{\cftbeforetableskip}
\cftsetindents{supptable}{0em}{2.5em}

% No chapter space inserted in LoF and LoT
\renewcommand{\insertchapterspace}{}


% ---- Title page -----------------------------------------------------
\newcommand{\settitle}[1]{\def\thesistitle{#1}}
\newcommand{\setauthor}[1]{\def\thesisauthor{#1}}
\newcommand{\setthesistype}[1]{\def\thesistype{#1}}
\newcommand{\setthesisdegree}[1]{\def\thesisdegree{#1}}
\newcommand{\setthesisdegreeabbrv}[1]{\def\thesisdegreeabbrv{#1}}
% Degree officially earn date must be in December, May, or August
\newcommand{\setdegreedatemy}[2]{%
    \def\degreeearnmonth{#1}
    \def\degreeearnyear{#2}}

\newcommand{\setthesisadvisorwithtitle}[1]{\def\thesisadvisorwithtitle{#1}}
\newcommand{\setthesiscommittee}[1]{\def\thesiscommittee{#1}}
\newcommand{\setthesisschool}[1]{\def\thesisschool{#1}}
\newcommand{\setthesisdepartment}[1]{\def\thesisdepartment{#1}}
\newcommand{\setthesispresentee}[1]{\def\thesispresentee{#1}}
\newcommand{\setthesisabstractfulldegree}[1]{\def\thesisabstractfulldegree{#1}}

\newcommand{\thetitlepage}{%
    % Define a different page numbering for title page
    % to avoid this warning (pdf backend): ignoring duplicate destination with the name 'page.i'
    \pagenumbering{Alph}
    \begin{titlingpage}
    \thispagestyle{empty}
    \SingleSpacing
    \setSingleSpace{1.2}
    \centering
    WASHINGTON UNIVERSITY IN ST.~LOUIS \\[\onelineskip]
    \thesisschool \\
    \thesisdepartment \\[3\onelineskip]

    \thesistype\ Examination Committee: \\
    \thesiscommittee

    \vfill
    \thesistitle \\
    by\\
    \thesisauthor \\[4\onelineskip]

    A \MakeLowercase{\thesistype} presented to \\
    \thesispresentee \\
    in partial fulfillment of the \\
    requirements for the degree \\
    of \thesisdegree

    \vfill
    \vfill
    \degreeearnmonth\ \degreeearnyear\\
    St.~Louis, Missouri
    \end{titlingpage}
    \clearpage%
}


% ---- Thesis copyright page -------------------------------------------------
\newcommand{\thesiscopyright}[1]{{%
    \clearpage
    \thispagestyle{empty}
    \mbox{}
    \vfill
    \centering #1
    \vfill
    \clearpage%
}}


% ---- Acknowledgements page -------------------------------------------------
\newcommand{\thesisacknowledgments}{%
    \chapter*{Acknowledgments}
    \vspace*{-1.5in}\phantomsection\vspace*{1.5in}
    \addcontentsline{toc}{chapter}{Acknowledgements}%
}


% ---- Dedication page -------------------------------------------------------
\newcommand{\thesisdedication}[1]{{%
    \clearpage
    \label{thesisdedication}
    \mbox{}
    \vfill
    \centering #1
    \vfill
    \clearpage%
}}


% ---- Abstract page ---------------------------------------------------------
\BeforeBeginEnvironment{abstract}{%
    \vspace*{-1.5in}\phantomsection\vspace*{1.5in}
    \addcontentsline{toc}{chapter}{Abstract}%
}
% Update the abstract title.
% Note the \addto{\captionLANG}{...} is needed to override babel.
% Ref: https://tex.stackexchange.com/a/24778
\addto{\captionsenglish}{%
    \renewcommand{\abstractname}{%
        ABSTRACT OF THE \MakeUppercase{\thesistype}\\
        \thesistitle \\
        by \\
        \thesisauthor \\
        \thesisabstractfulldegree \\
        Washington University in St.~Louis, \degreeearnyear \\
        \thesisadvisorwithtitle%
    }}
\renewcommand{\absnamepos}{center}
\renewcommand{\abstractnamefont}{%
    \vspace{-\beforechapskip}
    \vspace{-\baselineskip}
    \normalfont\normalsize%
}
\renewcommand{\abstracttextfont}{\normalfont\normalsize}
\AtBeginDocument{
    \setlength{\absleftindent}{0em}
    \setlength{\absparindent}{0em}
    \setlength{\absrightindent}{0em}
}
