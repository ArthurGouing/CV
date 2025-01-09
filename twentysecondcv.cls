\ProvidesClass{twentysecondcv}[2017/01/08 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage{mathptmx} % Font    % \RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage{fontawesome5}
\RequirePackage{tikz}
\RequirePackage[colorlinks=false]{hyperref}

\usetikzlibrary{positioning}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

% Set background color on main page
% Set text color on main page
\AtBeginDocument{
	\pagecolor{mysecondarycolorlight}
	\color{myprimarycolordark}
}

% URL color parameters:
\hypersetup{colorlinks, urlcolor={mysecondarycolordark}}


%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

% \renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	\setlength\TotalSectionLength{\linewidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	\vspace{16pt}% Whitespace before the section title
	{\color{mysecondarycolordark} \LARGE \textbf{#1} \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
}

% Define custom commands for CV info
\newcommand{\cvname}[1]       {\renewcommand{\cvname}{#1}}
\newcommand{\cvdate}[1]       {\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]       {\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]    {\renewcommand{\cvaddress}{#1}}
% Other Info
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}
% Links
\newcommand{\cvsite}[1]    {\renewcommand{\cvsite}{#1}}
\newcommand{\cvtwitter}[1] {\renewcommand{\cvtwitter}{#1}}
\newcommand{\cvgithub}[1]  {\renewcommand{\cvgithub}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=myprimarycolordark,myprimarycolordark,text=mysecondarycolorlight] (char) {#1};}}

% Command for printing computer skill
\def\iscomputerskills{False}
\newcommand\computerskills[1]{ 
	\def\iscomputerskills{}
	\renewcommand{\computerskills}{
		\setlength{\leftskip}{1.5em}
		\setlength{\rightskip}{1.5em}
		\foreach \x in {#1} {
			\x \\ \smallskip
		}
	}
}

% Command for printing language skill
\def\islanguagekills{False}
\newcommand\languageskills[1]{ 
	\def\islanguagekills{}
	\renewcommand{\languageskills}{
		\setlength{\leftskip}{1.5em}
		\setlength{\rightskip}{1.5em}
		\foreach \x in {#1}{
			\x \\ \smallskip
		}
	}
}

% Command for printing interest
\def\isinterest{False}
\newcommand\interest[1]{ 
	\def\isinterest{}
	\renewcommand{\interest}{
		\setlength{\leftskip}{1.5em}
		\setlength{\rightskip}{1.5em}
		\foreach [count=\i] \x in {#1}{
			\x \\ \smallskip
		}
	}
}

%----------------------------------------------------------------------------------------
%	 TITLE LAYOUT
%----------------------------------------------------------------------------------------
\newcommand{\makemytitle}{


	\begin{center}

	\color{myprimarycolordark}

	%----- Name -------------------------------------

	{\Huge\color{myprimarycolorlight}\textbf{\cvname}}

	%---- Job ----------------------------------------

	{\Large\textbf{\cvjobtitle}}

	%----- About me ----------------------------------
	
	\vspace{1ex}
	\ifthenelse{\equal{\aboutme}{}}{}{
		\justify{\aboutme}
	}

	%---- Line --------------------------------------------

	% \vspace{1ex}
	% \noindent\hrule height 2pt width \textwidth % depth 1ex
	\vspace{2ex}


	%------------------------------------------------
	\end{center}
}

%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=myprimarycolorlight, anchor=north, minimum width=9cm, minimum height=\paperheight+10cm] (box) at (-5cm, 5cm){};
	\end{tikzpicture}

	%------------------------------------------------


	%------------------------------------------------

	\begin{textblock}{6}(0.5, 0.5)

		\color{mysecondarycolordark!80}
			
	  %---- Profile picuture --------------------------

		\ifthenelse{\equal{\profilepic}{}}{}{
			\begin{center}
				\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
					\clip (600/2, 567/2) circle (567/2);
					\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\profilepic}};
				\end{tikzpicture}
			\end{center}
		}

		%---- Information --------------------------------

		\profilesection{Information}

		\renewcommand{\arraystretch}{2.}
		\begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
			% Date of birth
			\ifthenelse{\equal{\cvdate}{}}{}{\textsc{\Large\icon{\Info}} & \cvdate\\}
			% Place
			\ifthenelse{\equal{\cvaddress}{}}{}{\Large\icon{\faIcon{map-marker-alt}} & \cvaddress\\}
			% Email (icon could be faIcon{at})
			\ifthenelse{\equal{\cvmail}{}}{}{\Large\icon{\faIcon{envelope}} & \href{mailto:\cvmail}{\cvmail}\\}
			% Phone number
			\ifthenelse{\equal{\cvnumberphone}{}}{}{\Large\icon{\faIcon{phone-alt}} & \cvnumberphone\\}
			% Web Site
			% \ifthenelse{\equal{\cvsite}{}}{}{\large\icon{\faIcon{link}} & \href{\cvsite}{Personal Website}\\}
		\end{tabular}
		\\
		{
		\null
		% Personal Website
		\ifthenelse{\equal{\cvsite}{}}{}{\hfill\textsc{\LARGE\href{\cvsite}{\icon{\faIcon{link}}}}}     
		% % Github
		\ifthenelse{\equal{\cvgithub}{}}{}{\hfill\textsc{\LARGE\href{\cvgithub}{\icon{\faIcon{github}}}}}     
		% % Twitter
		\ifthenelse{\equal{\cvtwitter}{}}{}{\hfill\textsc{\LARGE\href{\cvtwitter}{\icon{\faIcon{twitter}}}}}
		% % Linkeding
		\ifthenelse{\equal{\cvlinkedin}{}}{}{\hfill\textsc{\LARGE\href{\cvlinkedin}{\icon{\faIcon{linkedin}}}}}
		\hfill \null
		}\\

		% More Icon info : https://latexdraw.com/fontawesome-ready-icons-to-use-in-latex/

		%----- Computer Skills ---------------------------

		\ifthenelse{\equal{\iscomputerskills}{}}{
		\profilesection{Computer skills}
		\begin{flushleft}
			\computerskills
		\end{flushleft}
		}{}
			
		%---- Language Skills ----------------------------

		\ifthenelse{\equal{\islanguagekills}{}}{
		\profilesection{Language skills}
		\begin{flushleft}
			\languageskills
		\end{flushleft}
		}{}
			
		%----- Interest -----------------------------------

		\ifthenelse{\equal{\isinterest}{}}{
		\profilesection{Interest}
		\begin{flushleft}
			\interest
		\end{flushleft}
		}{}
			
		%------------------------------------------------
			
	\end{textblock}


	%------------------------------------------------
	\renewcommand{\makeprofile}{
		\begin{tikzpicture}[remember picture,overlay]
 	  		\node [rectangle, fill=myprimarycolorlight, anchor=north, minimum width=9cm, minimum height=\paperheight+10cm] (box) at (-5cm, 5cm){};
		\end{tikzpicture}
		\color{myprimarycolordark}
	}

}

%----------------------------------------------------------------------------------------
%	 CREATE NEW PAGE COMMAND
%----------------------------------------------------------------------------------------
\newcommand{\cvnewpage}{
	\newgeometry{left=7.6cm,top=0.3cm,right=2cm,bottom=0.3cm,nohead,nofoot}
	\newpage
	\makeprofile
}

%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[1]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=myprimarycolorlight,myprimarycolorlight,text=mysecondarycolorlight](char){#1};%
}

\renewcommand{\subsection}[1]{
	{%
		\Large\round{#1}%
	}
}
\renewcommand{\section}[1]{%
	\setlength\TotalSectionLength{\linewidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	\addtolength\TotalSectionLength{-2em}% Modifier to remove overfull box warning
	\vspace{1ex}% Whitespace before the section title
	{\color{myprimarycolordark}\huge  \rule[0.15\baselineskip]{1em}{1pt} \textbf{#1} \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}} % Print the title and auto-width rule
	\\
}


%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[4]{%
  \color{myprimarycolordark}
	#1&\parbox[t]{0.83\textwidth}{%
  	\color{myprimarycolordark}
		\textbf{#2}%
		\hfill%
		{\raggedleft \small \emph{#3} \par}%
		#4\vspace{\parsep}%
	} \\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	\textbf{#1}&\parbox[t]{0.75\textwidth}{%
		#2%
	} \\ \smallskip
}

%----------------------------------------------------------------------------------------
%	 DRAW PALETTE COMMAND
%----------------------------------------------------------------------------------------

\newcommand{\drawpalette}{
	% Liste des couleurs à afficher
	\newcommand{\colorslist}{
	    {myprimarycolordark},
	    {myprimarycolorlight},
	    {mysecondarycolordark},
	    {mysecondarycolorlight},
	}
	
	% Création de la palette avec TikZ
	\begin{tikzpicture}
	% Dessiner chaque couleur
	\foreach \colorname [count=\foreachindex] in \colorslist{
	    % % Rectangle coloré
	    \node[fill=\colorname, minimum width=4cm, minimum height=1cm] (rect-\colorname) at (0, -1.5*\numexpr\foreachindex\relax) {};
	    % % Nom de la couleur
	    \node (label-\colorname)[right=0.5cm of rect-\colorname] {\texttt{\colorname}};
	}
	\end{tikzpicture}
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=1.1cm,right=2cm,bottom=0.2cm,nohead,nofoot]{geometry}
