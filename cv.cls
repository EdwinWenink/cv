\author{Edwin Wenink}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2022/07/28 Edwin Wenink's CV class]

% Use article as the base class
\LoadClass{article}

%%% Required packages
%%% ------------------------------------------------------------
\RequirePackage[margin=3.5cm]{geometry}
%\textheight=700px                    % Saving trees ;-)

%\setlength\parindent{0pt}
%\RequirePackage{parskip}
% Wrap long urls with hyphens
\PassOptionsToPackage{hyphens}{url}\RequirePackage{hyperref} 
% Underscores in doi break, the next command fixes that
\newcommand{\doi}[1]{\textsc{doi}: \href{http://dx.doi.org/#1}{\nolinkurl{#1}}}
\RequirePackage{comment}
\RequirePackage{ifplatform}
% Adding natbib adds \citet and \citep command
% Bibliography
%\usepackage[style=alphabetic,sorting=nyt,sortcites=true,maxbibnames=9,autopunct=true,babel=hyphen,hyperref=true,abbreviate=false,backref=true,backend=biber]{biblatex}
\RequirePackage[backend=biber,
    isbn=false,
    style=numeric,
    sortcites=true,
    sorting=ydnt,  % sort by year descending; all papers have my name in it by default
    maxbibnames=99 ]{biblatex} % Print all author names
\RequirePackage{graphicx}
\RequirePackage{float}
% Pretty tables
\RequirePackage[table,xcdraw, svgnames]{xcolor}      % Colors by their 'svgnames'
\RequirePackage{tabularx}
%\newcolumntype{b}{X}
%\newcolumntype{s}{>{\hsize=.5\hsize}X}

\RequirePackage[english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{csquotes}
\RequirePackage[protrusion=true,expansion=true]{microtype}
\RequirePackage{amsmath,amsfonts,amsthm}     % Math packages
\RequirePackage{graphicx}                    % Enable pdflatex
\RequirePackage{url}

\frenchspacing              % Better looking spacings after periods
\pagestyle{empty}           % No pagenumbers/headers/footers

%%% Custom biblatex styling: make author name bold in the bibliography
% https://tex.stackexchange.com/questions/73136/make-specific-author-bold-using-biblatex
\RequirePackage{xpatch}
\newbibmacro*{name:bold}[2]{%
  \edef\blx@tmp@name{\expandonce#1, \expandonce#2}%
  \def\do##1{\ifdefstring{\blx@tmp@name}{##1}{\bfseries\listbreak}{}}%
  \dolistloop{\boldnames}}
\newcommand*{\boldnames}{}

\xpretobibmacro{name:family}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:given-family}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:family-given}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:delim}{\begingroup\normalfont}{}{}

\xapptobibmacro{name:family}{\endgroup}{}{}
\xapptobibmacro{name:given-family}{\endgroup}{}{}
\xapptobibmacro{name:family-given}{\endgroup}{}{}
\xapptobibmacro{name:delim}{\endgroup}{}{}

% API to provide a list of author name varieties that should be made bold
% Needed because the macros apply to the *formatted* names
\newcommand*{\setboldnames}[1]{\forcsvlist{\listadd\boldnames}{#1}}


%%% Custom sectioning (sectsty package)
%%% ------------------------------------------------------------
\RequirePackage{sectsty}

\sectionfont{%			            % Change font of \section command
	\usefont{OT1}{phv}{b}{n}%		% bch-b-n: CharterBT-Bold font
	\sectionrule{0pt}{0pt}{-5pt}{3pt}}


%%% Setting up variables
%%% ------------------------------------------------------------
\newcommand*{\setthemecolor}[1]{\def\@themecolor{#1}}
\newif\iflong


%%% Macros
%%% ------------------------------------------------------------
\newlength{\spacebox}
\settowidth{\spacebox}{88888888888}			% Box to align text
\newcommand{\sepspace}{\vspace*{1em}}		% Vertical space macro

\newcommand{\MyName}[1]{ % Name
		\Huge \usefont{OT1}{phv}{b}{n} \hfill #1
		\par \normalsize \normalfont}
		
\newcommand{\MySlogan}[1]{ % Slogan (optional)
		\large \usefont{OT1}{phv}{m}{n}\hfill \textit{#1}
		\par \normalsize \normalfont}

% NOTE: I also let \NewPart reset the subsection counter so
% subsection* commands with manual numbering are not necessary
\newcommand{\NewPart}[1]{\section*{{\LARGE \color{\@themecolor}\#} \uppercase{#1}}\setcounter{subsection}{0}}

\newcommand{\PersonalEntry}[2]{
		\noindent\hangindent=2em\hangafter=0 % Indentation
		\parbox{\spacebox}{        % Box to align text
		\textit{#1}}		       % Entry name (birth, address, etc.)
		\hspace{1.5em} #2 \par}    % Entry value
            

\newcommand{\SkillsEntry}[2]{      % Same as \PersonalEntry
		\noindent\hangindent=0em\hangafter=0 % Indentation
		\parbox{\spacebox}{        % Box to align text
		\textbf{#1}}			   % Skill name
		\hspace{1.5em} #2 \par     % Entry value	
        \sepspace}
		
\newcommand{\EducationEntry}[4]{
		\noindent \textbf{#1} \hfill      % Study
        \fbox{#2} \par
		%\colorbox{Black}{%
			%\parbox{6em}{%
			%\hfill\color{White}#2}} \par  % Duration
		\noindent \textit{#3} \par        % School
        \iflong
		\noindent\hangindent=2em\hangafter=0 \small #4 % Description
        \fi
		\normalsize \par
        \sepspace
        }

\newcommand{\WorkEntry}[4]{				  % Same as \EducationEntry
		\noindent \textbf{#1} \hfill      % Jobname
        \fbox{#2} \par
		%\colorbox{Black}{\color{White}#2} \par  % Duration
		\noindent \textit{#3} \par              % Company
        \iflong
		\noindent\hangindent=2em\hangafter=0 \small #4 % Description
        \fi
		\normalsize \par
        \sepspace}



%%% Extra customization and styling
%%% ------------------------------------------------------------
\renewcommand{\thesubsection}{\number\numexpr\value{subsection}.\relax} %Do not show section number
\RequirePackage{wrapfig}

\newcommand{\pipe}{{\color{\@themecolor} \quad\textbar\quad}}
\newcommand{\halfpipe}{{\color{\@themecolor} \hspace{0.2em}\textbar\hspace{0.2em}}}
\newcommand{\coloredbullet}{{\color{\@themecolor} \textbullet}}
