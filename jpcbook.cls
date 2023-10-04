\NeedsTeXFormat{LaTeX2e}
\usepackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\ProvidesClass{cedri}
\LoadClass[11pt,twoside]{book}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{glossaries}
\RequirePackage{fancyhdr}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\if@twoside
     \setlength\oddsidemargin   {0\p@}
     \setlength\evensidemargin  {0\p@}
     \setlength\marginparwidth {30\p@}
  \else
     \setlength\oddsidemargin   {0\p@}
     \setlength\evensidemargin  {0\p@}
     \setlength\marginparwidth  {40\p@}
  \fi
\setlength{\headheight}{13.59999pt}
\marginparsep 10pt
\marginparwidth 40pt
\hoffset=0pt
\voffset=0pt
\parindent=0pt
\topmargin 0pt \headsep 25pt
\textheight 22cm \textwidth 16cm
\brokenpenalty=10000

\setstretch{1.5}
\newif
    \iffigurespage
    \figurespagetrue 
\newif
    \iftablespage
    \tablespagetrue
\RequirePackage{ifxetex}
\ifxetex
    \usepackage{fontspec}
\else
    \usepackage[T1]{fontenc}
    \usepackage[utf8]{inputenc}
    \usepackage{lmodern}
\fi

\def\prefacesection{\@ifstar\@prefacesection\@@prefacesection}

\def\@prefacesection#1{\chapter*{#1}}

\def\@@prefacesection#1{\chapter*{#1}
                        \addcontentsline{toc}{chapter}{#1}
                        }
                        
\def\afterpreface{\tableofcontents
                    \cleardoublepage 
                    }
%%% config headers and footers from the chapter welcome
\def\bodystart{\pagenumbering{arabic}
                \pagestyle{fancy}
                \renewcommand{\headrulewidth}{0.4pt}
                \renewcommand{\footrulewidth}{0.4pt}
                \fancyhf{}
                \fancyhead[RO]{\nouppercase{\@company}}
                \fancyhead[LE]{\nouppercase{\@subtitle}}
                \fancyfoot[LE,RO]{\nouppercase{\thepage}}
                \fancypagestyle{plain}{
                \fancyhf{}
                \fancyfoot[R]{\nouppercase{\thepage}}
                \renewcommand{\headrulewidth}{0pt}
                \renewcommand{\footrulewidth}{0.4pt}}
}
%%% config layout abstract
\makeatother
\newenvironment{conf-abstract}[4][]{
  \needspace{15\baselineskip}
  \begin{center}
    { \renewcommand\textsuperscript[1]{}
      \phantomsection\addcontentsline{toc}{section}
      {\texorpdfstring{#2}{#2(#3)}}}
    {{\large\bfseries #2\par}}
    \bigskip
    {\normalfont #3\par}
    \medskip
    {\footnotesize #4}
  \end{center}
}{\bigskip
\par
}

