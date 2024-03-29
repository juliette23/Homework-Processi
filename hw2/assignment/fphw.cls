%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Felipe Portales' HomeWorks
% Maintainer: Felipe Portales-Oliva (f.portales.oliva@gmail.com)
% 
% Document class to produce simple yet stylish homework submissions 
%
% This package is public domain, according to :
%    The Unlicense <https://unlicense.org>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Identification

\NeedsTeXFormat{LaTeX2e} % we need to have LaTeX2e for this to compile
\ProvidesClass{fphw}[2019/03/19] % fpshw is the name we need to provide to 
                                  % the documentclass command on the .tex file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Preliminary declarations:
%%%% These are some commands where we declare new commands for the class

% We define the macro for the name of the professor
\newcommand{\professor}[1]{ \newcommand{\professorloc}{#1} }
% We define the macro for the name of the course
\newcommand{\class}[1]{ \newcommand{\classlocal}{#1} }
% We define the macro for the name of the institution
\newcommand{\institute}[1]{ \newcommand{\instituteloc}{#1} }
% We define the macro for the name of the institution
\newcommand{\group}[1]{ \newcommand{\grouploc}{#1} }

%these are auxiliary definitions used in the title section
\newcommand{\CourseLang}{Corso}
\newcommand{\DateLang}{Data di consegna}
\newcommand{\StudentLang}{Studente}
\newcommand{\GroupLang}{Gruppo}
\newcommand{\ProfessorLang}{Professoressa}

% Header and footers, we will use the titles also
\RequirePackage{fancyhdr}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Options
%%%% We now pass the options of the class

% Two Columns are difficult to read and grade, we will not use them
\DeclareOption{twocolumn}{\OptionNotUsed}

% Two sided paper are difficult to read and grade, we will not use them
\DeclareOption{twoside}{\OptionNotUsed}


    % we hardcode some language options
\DeclareOption{spanish}{
    \renewcommand{\CourseLang}{Curso}
    \renewcommand{\ProfessorLang}{Docente}
    \renewcommand{\DateLang}{Fecha de entrega}
    \renewcommand{\StudentLang}{Nombre estudiante}
}

\PassOptionsToClass{a4paper}{article}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Bulk Declarations
%%%% Here we do more declarations and call other files


% we need to load 
\LoadClass{article}


% we will modify sections, subsections and sub subsections
\RequirePackage{titlesec}
% Modification of section 
\titleformat{\section}[block]{\normalsize\bfseries\filcenter}{\thesection.}{.3cm}{} 

% modification of subsection and sub sub section
\titleformat{\subsection}[runin]{\bfseries}{ \thesubsection.}
{1mm}{}[.\quad]
\titleformat{\subsubsection}[runin]{\bfseries\itshape}{ \thesubsubsection.}
{1mm}{}[.\quad]

% Geometry lets us modify the sizes of the document nicely
\RequirePackage{geometry}
% Decent margins for the documents, as it is meant to be printed
\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm}

\fancyhead{}
\fancyfoot{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt} % we want rules 
\renewcommand{\footrulewidth}{0.4pt}
\fancyhead[RO] {\footnotesize\thepage}
\fancyhead[LO] {\footnotesize{\ifx\classlocal\undefined{}\else\itshape\classlocal{} --{} \fi}\makeatletter\@title\makeatother }
\fancyfoot[RO] {\footnotesize\itshape\makeatletter\@author\makeatother}

% New title style for the document
\renewcommand{\maketitle}{%
    \thispagestyle{plain}
    \begin{center}
        \ifx\instituteloc\undefined{}\else{\scshape \instituteloc} \\[10pt] \fi
        \hrule
        \vspace{10pt}
        {\LARGE \bfseries \@title} \\[5pt]
        \StudentLang: {\itshape \@author}
        \\
        \ifx\grouploc\undefined{}\else{\GroupLang: {\itshape\grouploc}}\fi
        \vspace{8pt}
        \hrule
        \vspace{10pt}
        \ifx\classlocal\undefined{}\else\CourseLang: {\itshape \classlocal{} \ifx\professorloc\undefined{}\else{}\fi  }\fi
        \\
        \ifx\professorloc\undefined{}\else{\ProfessorLang: {\itshape\professorloc}}\fi 
        \\
        \DateLang: {\itshape\@date}
        \vspace{15pt}
    \end{center}
}


\usepackage[most]{tcolorbox}
\newtcolorbox{four}[1][]{%
    enhanced,
    breakable,
    frame hidden,
    colback=white,
    overlay unbroken={%
            \draw[thick,double] (interior.north west)--(interior.south west)--(interior.south east);
        },
    overlay first={
            \draw[thick,double] (interior.north west)--(interior.south west);
        },
    overlay middle={
            \draw[thick,double] (interior.north west)--(interior.south west);
        },
    overlay last={
            \draw[thick,double] (interior.north west)--(interior.south west)--(interior.south east);
        },
    #1,
}

% definition of the "problem" environment
\newenvironment{problem}
    {\begin{center}\begin{four}}
    {\end{four}\end{center}}


%%% We finish the class with this command
\endinput
