% Created by Murat Can Karacabey
% this is inspired by Michael Pollind's Awesome CV 
% Created from scratch as a much simpler alternative to it to actually learn LaTeX.
% Might be interpreted as an easier-to-edit or easier-to-understand-what-is-going-on version of it.
\author{Murat Can Karacabey}
\RequirePackage[dvipsnames]{xcolor} % moved here I guess article class causes option clash with xcolor if used after loading the class
\LoadClass[11pt]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{muratcan_cv}[2020/04/15 Muratcan CV Class]
\RequirePackage[sfdefault]{noto}
\RequirePackage{etoolbox}
\RequirePackage{pgffor}
\RequirePackage{titlesec}
\RequirePackage{tikz}
\RequirePackage{fontspec}
\RequirePackage{enumitem}
\RequirePackage[left=0.5in,top=0.1in,right=0.5in,bottom=0.1in]{geometry} % DOCUMENT MARGINS 
\RequirePackage{hyperref}
\RequirePackage{fontawesome}
\RequirePackage{mfirstuc}
\RequirePackage{ifthen}
\RequirePackage{lipsum}
\RequirePackage{array}
\usepackage{xcolor}
\pagestyle{empty}

\usepackage{comment}

%Setup
\newcommand*{\setname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\newcommand*{\setmobile}[1]{\def\@mobile{#1}}
\newcommand*{\setposition}[1]{\def\@position{#1}}
\newcommand*{\setmail}[1]{\def\@mail{#1}}
\newcommand*{\setcitizenship}[1]{\def\@citizenship{#1}}
\newcommand*{\setlinkedinaccount}[1]{\def\@linkedinaccount{#1}}
\newcommand*{\setgithubaccount}[1]{\def\@githubaccount{#1}}

\hypersetup{
  colorlinks=true,
  urlcolor=themecolor, % URL COLOR!
}

% Header
\newcommand\headerview{
  \hfill
  \begin{minipage}{0.85\linewidth} % extend header length here
    \bigskip
    \center \name \\[0.15cm]
    \contact
  \end{minipage}
  \hfill
}

\newcommand{\linkedinview}{\href{https://www.linkedin.com/in/\@linkedinaccount}{\ \faLinkedin\ \ \footnotesize \@linkedinaccount}}
\newcommand{\githubview}{\href{https://github.com/\@githubaccount}{\footnotesize \@githubaccount \ \ \faGithub\ \ }}

\newcommand{\name}{%
  {\LARGE \color{themecolor} \@firstname \ \textsc{\@lastname}}
}

\newcommand{\contact}{%
  {\small \@mail\ \cpshalf \@mobile \ \cpshalf \linkedinview
    } % 
}


% Helper commands
\newcommand\ruleafter[1]{#1~{\color{themecolor}\hrulefill}} % a trick to put the line with <before> parameter in \titleformat

%colorful pipe separator
\newcommand{\cps}{{\color{themecolor} \quad\textbar\quad}}
\newcommand{\cpshalf}{{\color{themecolor} \textbar\hspace{0.2em}}}
\newcommand{\coloredbullet}{{\color{themecolor} \textbullet}}

\setlist[itemize,1]{label=\coloredbullet, labelsep=0.3em, left=-0.5em}

% Edit section styles
\titleformat{\section}      % Customise the \section command 
{\large\bfseries\scshape\raggedright\color{themecolor}} % Make the \section headers large (\Large),
% small capitals (\scshape) and left aligned (\raggedright)
{}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
{\ruleafter}                           % Can be used to insert code before the heading

\titlespacing*{\section}{-1pt}{-10pt}{2pt}

% Textview commands
\newcommand{\experience}[2]{%
  \mbox { \hspace{1em} \scshape \textbf{#1} }%
}

\newcommand{\datetext}[1]{%
  {\itshape  \footnotesize \mdseries  \color{black} #1 }
}

\newcommand{\datetextbold}[1]{%
  {\footnotesize \mdseries  \color{black} \textbf{#1} }
}

\newcommand{\datedexperience}[2]{%
  \begin{small} \mbox { \hspace{1em} \textbf{#1} } \end{small} \hfill \datetextbold{#2}\\[0.01cm] %
}

\newcommand{\explanation}[2]{%
  \mbox { \hspace{1.2em} \footnotesize \emph{#1}} \hfill \datetext{#2}\\[0.03cm] %
}

\newcommand{\explanationdetail}[1]{%
  \indent \indent \begin{minipage}{0.87\linewidth} \footnotesize #1 \end{minipage} \\[0.01cm]
}

\newcommand{\textblock}[1]{%
  \indent \explanationdetail{#1}
}

\newcommand\createskill[2]{%
  \textbf{#1} & #2
}

\newcommand\createskills[1]{%
  \explanationdetail{
    \begin{tabular}{rl}
      \makeatletter
      \@for\thisitem:=#1\do{\thisitem \\[0.1cm]}
      \makeatother
    \end{tabular}
  }
}

% \newcommand\summary[1]{%
%   \section{Summary}
%   \textbf{#1}
% }