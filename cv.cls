% TODO instead of requiring \sepspace after entries, perhaps I should include this spacing by default in the command

\author{Edwin Wenink}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2022/07/28 Edwin Wenink's CV class]

% Use article as base class
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
\RequirePackage[style=authoryear, natbib]{biblatex}
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

%%% Custom sectioning (sectsty package)
%%% ------------------------------------------------------------
\RequirePackage{sectsty}

\sectionfont{%			            % Change font of \section command
	\usefont{OT1}{phv}{b}{n}%		% bch-b-n: CharterBT-Bold font
	\sectionrule{0pt}{0pt}{-5pt}{3pt}}


%%% Setting up variables
%%% ------------------------------------------------------------
\newcommand*{\setthemecolor}[1]{\def\@themecolor{#1}}


%%% Macros
%%% ------------------------------------------------------------
\newlength{\spacebox}
\settowidth{\spacebox}{8888888888}			% Box to align text
\newcommand{\sepspace}{\vspace*{1em}}		% Vertical space macro

\newcommand{\MyName}[1]{ % Name
		\Huge \usefont{OT1}{phv}{b}{n} \hfill #1
		\par \normalsize \normalfont}
		
\newcommand{\MySlogan}[1]{ % Slogan (optional)
		\large \usefont{OT1}{phv}{m}{n}\hfill \textit{#1}
		\par \normalsize \normalfont}

\newcommand{\NewPart}[1]{\section*{{\LARGE \color{\@themecolor}\#} \uppercase{#1}}}

\newcommand{\PersonalEntry}[2]{
		\noindent\hangindent=2em\hangafter=0 % Indentation
		\parbox{\spacebox}{        % Box to align text
		\textit{#1}}		       % Entry name (birth, address, etc.)
		\hspace{1.5em} #2 \par}    % Entry value

\newcommand{\SkillsEntry}[2]{      % Same as \PersonalEntry
		\noindent\hangindent=2em\hangafter=0 % Indentation
		\parbox{\spacebox}{        % Box to align text
		\textit{#1}}			   % Entry name (birth, address, etc.)
		\hspace{1.5em} #2 \par}    % Entry value	
		
\newcommand{\EducationEntry}[4]{
		\noindent \textbf{#1} \hfill      % Study
        \fbox{#2} \par
		%\colorbox{Black}{%
			%\parbox{6em}{%
			%\hfill\color{White}#2}} \par  % Duration
		\noindent \textit{#3} \par        % School
		\noindent\hangindent=2em\hangafter=0 \small #4 % Description
		\normalsize \par}

\newcommand{\WorkEntry}[4]{				  % Same as \EducationEntry
		\noindent \textbf{#1} \hfill      % Jobname
        \fbox{#2} \par
		%\colorbox{Black}{\color{White}#2} \par  % Duration
		\noindent \textit{#3} \par              % Company
		\noindent\hangindent=2em\hangafter=0 \small #4 % Description
		\normalsize \par}



%%% Extra customization and styling
%%% ------------------------------------------------------------
\renewcommand{\thesubsection}{\number\numexpr\value{subsection}.\relax} %Do not show section number
\RequirePackage{wrapfig}

% TODO Themed signs
\newcommand{\pipe}{{\color{\@themecolor} \quad\textbar\quad}}
\newcommand{\halfpipe}{{\color{\@themecolor} \hspace{0.2em}\textbar\hspace{0.2em}}}
\newcommand{\coloredbullet}{{\color{\@themecolor} \textbullet}}
