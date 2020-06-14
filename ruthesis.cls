%%% =========================================================================
%%% File Name: ruthesis.cls
%%% Last Modification Date: %G%     %U%
%%% Current Version: %M%    %I%
%%% File Creation Date: Tue Nov 21 11:09:28 1995
%%% Author: Jan Erik Odegard  <odegard@ece.rice.edu>
%%%
%%% Copyright: All software, documentation, and related files in this
%%%            distribution are Copyright (c) 1995-1996 Rice University
%%% =========================================================================
%%%
%%% This is a port of the original Rice thesis style for LaTeX to
%%% LaTeX2e. The port is still not complete but it does work with a
%%% few minor hacks in your actual documant (e.g., the linespacing for
%%% tables is not right but can be fixed by inserting the command
%%% '\linespacing{1}' inside the 'table' environemnt as nedded for
%%% tabular data).
%%%
%%% This is not a clean and optimal LaTeX2e class port yet. I am working
%%% on that but this class file has been used for a PhD thesis that did
%%% pass a preliminary inspection by the graduate office.
%%%
%%% I would appreciate any help/comments and improvements. The goal is
%%% to make this an official Rice thesis style for LaTeX2e that can
%%% exist in parallel with the old LaTeX thesis style.
%%%
%%\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{ruthesis}[1995/11/21 Thesis Class, ECE, Rice University, jeo]

\LoadClass[12pt]{report}
\RequirePackage{ifthen}
\RequirePackage[dvips]{graphicx}

\DeclareOption{draft}{\typeout{DRAFT MODE}}
\DeclareOption{12pt}{\typeout{12pt mode selected but not implemented}}
\ProcessOptions

\newif\if@ruthesis
\@ruthesistrue

%%% \def\ds@draft{\@drafttrue\overfullrule5pt}
%%% \def\ps@hightop{\let\@mkboth\@gobbletwo
%%%   \def\@oddhead{\hfill\vbox to0pt{\vskip-.4in\hbox{\thepage}\vss}\hfill}
%%%   \def\@oddfoot{}}
%%% \def\now{%
%%%   {\count255=\time\divide\count255 by60
%%%     \ifnum\count255<10 0\fi\number\count255:\multiply\count255 by60
%%%     \advance\count255 by-\time\ifnum\count255>-10 0\fi\number -\count255}}
%%% \def\ps@draft{%
%%%   \ps@hightop\def\@oddhead{{\normalsize\today,\
%%%       {\small\bf DRAFT},\ \now\hfil\thepage}}}
%%% \if@draft\ps@draft\raggedbottom\typeout{DRAFT MODE}\else\ps@empty\fi


%%% Do we need this?
%\renewcommand{\normalsize}{\fontsize{12}{15}\selectfont}

%\lineskip 1pt
%\normallineskip 1pt
\def\baselinestretch{1.5}

\if@twoside
 \oddsidemargin 21pt
 \evensidemargin 59pt
 \marginparwidth 95pt
\else
 \oddsidemargin .5in
 \evensidemargin 0in
 \marginparwidth .6in
\fi
\marginparsep .1in

%\advance\oddsidemargin -.0625in \advance\evensidemargin -.0625in

\topmargin 0in

\headheight \baselineskip
\headsep 1.5\baselineskip

%%My fix for the bottom-center page numbering - Psycho.

%\footheight \baselineskip
%\footskip 2.5\baselineskip

\textheight 9in
\advance\textheight -\headheight
\advance\textheight -\headsep
\textwidth 6in

\columnsep 10pt
\columnseprule 0pt

\footnotesep 11.4pt

\skip\footins 18pt plus 12pt minus 6pt

\floatsep 24pt plus 6pt minus 6pt

\textfloatsep 36pt plus 10pt minus 10pt

\intextsep 24pt plus 6pt minus 6pt

\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em plus 1fil}
\def\@dotsep{4.5}
\setcounter{tocdepth}{2}

\def\tableofcontents{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{Contents\@mkboth{CONTENTS}{CONTENTS}} \thispagestyle{empty}
 \@starttoc{toc}\if@restonecol\twocolumn\fi}

\def\l@part#1#2{\addpenalty{-\@highpenalty}
 \addvspace{2.25em plus 1pt}
 \begingroup
 \@tempdima 3em
 \parindent \z@ \rightskip \@pnumwidth
 \parfillskip -\@pnumwidth
 \parskip \z@
 {\large \bf
 \leavevmode
 #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
 \nobreak
 \endgroup}

\def\l@chapter#1#2{\pagebreak[3]
 \vskip 1.0em plus 1pt
 \@tempdima 1.5em
 \begingroup
 \parindent \z@ \rightskip \@pnumwidth
 \parfillskip -\@pnumwidth
 \parskip \z@
 \large \bf
 \leavevmode
 \advance\leftskip\@tempdima
 \hskip -\leftskip
 #1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par
 \endgroup}

\def\l@section{\@dottedtocline{1}{1.4em}{2.0em}}
\def\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\def\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
%%%%%%%%%%%%%%%%%%%
\def\IEEEproofname{Proof}
%%%%%%%%%%%%%%%%%%%

%% ENVIRONMENTS
% "box" symbols at end of proofs
\def\IEEEQEDclosed{\mbox{\rule[0pt]{1.3ex}{1.3ex}}} % for a filled box
% V1.6 some journals use an open box instead that will just fit around a closed one
\def\IEEEQEDopen{{\setlength{\fboxsep}{0pt}\setlength{\fboxrule}{0.2pt}\fbox{\rule[0pt]{0pt}{1.3ex}\rule[0pt]{1.3ex}{0pt}}}}

% v1.7 name change to avoid namespace collision with amsthm. Also add support
% for an optional argument.
\def\IEEEproof{\@ifnextchar[{\@IEEEproof}{\@IEEEproof[\IEEEproofname]}}
\def\@IEEEproof[#1]{\par\noindent\hspace{2em}{\itshape #1: }}
\def\endIEEEproof{\hspace*{\fill}~\IEEEQED\par}


%\itemindent is set to \z@ by list, so define new temporary variable
\newdimen\@IEEEtmpitemindent
\def\@begintheorem#1#2{\@IEEEtmpitemindent\itemindent\topsep 0pt\rmfamily\trivlist%
    \item[\hskip \labelsep{\indent\itshape #1\ #2:}]\itemindent\@IEEEtmpitemindent}
\def\@opargbegintheorem#1#2#3{\@IEEEtmpitemindent\itemindent\topsep 0pt\rmfamily \trivlist%
% V1.6 IEEE is back to using () around theorem names which are also in italics
% Thanks to Christian Peel for reporting this.
    \item[\hskip\labelsep{\indent\itshape #1\ #2\ (#3):}]\itemindent\@IEEEtmpitemindent}
% V1.7 remove bogus \unskip that caused equations in theorems to collide with
% lines below.
\def\@endtheorem{\endtrivlist}

% V1.6
% display command for the section the theorem is in - so that \thesection
% is not used as this will be in Roman numerals when we want arabic.
% LaTeX2e uses \def\@thmcounter#1{\noexpand\arabic{#1}} for the theorem number
% (second part) display and \def\@thmcountersep{.} as a separator.
% V1.7 intercept calls to the section counter and reroute to \@IEEEthmcounterinsection
% to allow \appendix(ices} to override as needed.
%
% special handler for sections, allows appendix(ices) to override
\gdef\@IEEEthmcounterinsection#1{\arabic{#1}}
% string macro
\edef\@IEEEstringsection{section}

% redefine the #1#2[#3] form of newtheorem to use a hook to \@IEEEthmcounterinsection
% if section in_counter is used
\def\@xnthm#1#2[#3]{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}\@newctr{#1}[#3]%
     \edef\@IEEEstringtmp{#3}
     \ifx\@IEEEstringtmp\@IEEEstringsection
     \expandafter\xdef\csname the#1\endcsname{%
     \noexpand\@IEEEthmcounterinsection{#3}\@thmcountersep
          \@thmcounter{#1}}%
     \else
     \expandafter\xdef\csname the#1\endcsname{%
       \expandafter\noexpand\csname the#3\endcsname \@thmcountersep
          \@thmcounter{#1}}%
     \fi
     \global\@namedef{#1}{\@thm{#1}{#2}}%
     \global\@namedef{end#1}{\@endtheorem}}}

%%%%%%%%%%%%%%%%%%%

% definition of \IEEEPARstart
% THIS IS A CONTROLLED SPACING AREA, DO NOT ALLOW SPACES WITHIN THESE LINES
%
% The token \@IEEEPARstartfont will be globally defined after the first use
% of \IEEEPARstart and will be a font command which creates the big letter
% The first argument is the first letter of the first word and the second
% argument is the rest of the first word(s).
\def\IEEEPARstart#1#2{\par{%
% if this page does not have enough space, break it and lets start
% on a new one
\@IEEEtranneedspace{\@IEEEPARstartMINPAGELINES\baselineskip}{\relax}%
% V1.7 move this up here in case user uses \textbf for \@IEEEPARstartFONTSTYLE
% which uses command \leavevmode which causes an unwanted \indent to be issued
\noindent
% calculate the desired height of the big letter
% it extends from the top of \@IEEEPARstartHEIGHTTEXT in the current font
% down to \@IEEEPARstartDROPDEPTH below the current baseline
\settoheight{\@IEEEtrantmpdimenA}{\@IEEEPARstartHEIGHTTEXT}%
\addtolength{\@IEEEtrantmpdimenA}{\@IEEEPARstartDROPDEPTH}%
% extract the name of the current font in bold
% and place it in \@IEEEPARstartFONTNAME
\def\@IEEEPARstartGETFIRSTWORD##1 ##2\relax{##1}%
{\@IEEEPARstartFONTSTYLE{\selectfont\edef\@IEEEPARstartFONTNAMESPACE{\fontname\font\space}%
\xdef\@IEEEPARstartFONTNAME{\expandafter\@IEEEPARstartGETFIRSTWORD\@IEEEPARstartFONTNAMESPACE\relax}}}%
% define a font based on this name with a point size equal to the desired
% height of the drop letter
\font\@IEEEPARstartsubfont\@IEEEPARstartFONTNAME\space at \@IEEEtrantmpdimenA\relax%
% save this value as a counter (integer) value (sp points)
\@IEEEtrantmpcountA=\@IEEEtrantmpdimenA%
% now get the height of the actual letter produced by this font size
\settoheight{\@IEEEtrantmpdimenB}{\@IEEEPARstartsubfont\@IEEEPARstartCAPSTYLE{#1}}%
% If something bogus happens like the first argument is empty or the
% current font is strange, do not allow a zero height.
\ifdim\@IEEEtrantmpdimenB=0pt\relax%
\typeout{** WARNING: IEEEPARstart drop letter has zero height! (line \the\inputlineno)}%
\typeout{ Forcing the drop letter font size to 10pt.}%
\@IEEEtrantmpdimenB=10pt%
\fi%
% and store it as a counter
\@IEEEtrantmpcountB=\@IEEEtrantmpdimenB%
% Since a font size doesn't exactly correspond to the height of the capital
% letters in that font, the actual height of the letter, \@IEEEtrantmpcountB,
% will be less than that desired, \@IEEEtrantmpcountA
% we need to raise the font size, \@IEEEtrantmpdimenA
% by \@IEEEtrantmpcountA / \@IEEEtrantmpcountB
% But, TeX doesn't have floating point division, so we have to use integer
% division. Hence the use of the counters.
% We need to reduce the denominator so that the loss of the remainder will
% have minimal affect on the accuracy of the result
\divide\@IEEEtrantmpcountB by 200%
\divide\@IEEEtrantmpcountA by \@IEEEtrantmpcountB%
% Then reequalize things when we use TeX's ability to multiply by
% floating point values
\@IEEEtrantmpdimenB=0.005\@IEEEtrantmpdimenA%
\multiply\@IEEEtrantmpdimenB by \@IEEEtrantmpcountA%
% \@IEEEPARstartfont is globaly set to the calculated font of the big letter
% We need to carry this out of the local calculation area to to create the
% big letter.
\global\font\@IEEEPARstartfont\@IEEEPARstartFONTNAME\space at \@IEEEtrantmpdimenB%
% Now set \@IEEEtrantmpdimenA to the width of the big letter
% We need to carry this out of the local calculation area to set the
% hanging indent
\settowidth{\global\@IEEEtrantmpdimenA}{\@IEEEPARstartfont
\@IEEEPARstartCAPSTYLE{#1\@IEEEPARstartITLCORRECT}}}%
% end of the isolated calculation environment
% add in the extra clearance we want
\advance\@IEEEtrantmpdimenA by \@IEEEPARstartSEP\relax%
% add in the optional offset
\advance\@IEEEtrantmpdimenA by \@IEEEPARstartHOFFSET\relax%
% V1.7 don't allow negative offsets to produce negative hanging indents
\@IEEEtrantmpdimenB\@IEEEtrantmpdimenA
\ifnum\@IEEEtrantmpdimenB < 0 \@IEEEtrantmpdimenB 0pt\fi
% \@IEEEtrantmpdimenA has the width of the big letter plus the
% separation space and \@IEEEPARstartfont is the font we need to use
% Now, we make the letter and issue the hanging indent command
% The letter is placed in a box of zero width and height so that other
% text won't be displaced by it.
\hangindent\@IEEEtrantmpdimenB\hangafter=-\@IEEEPARstartDROPLINES%
\makebox[0pt][l]{\hspace{-\@IEEEtrantmpdimenA}%
\raisebox{-\@IEEEPARstartDROPDEPTH}[0pt][0pt]{\hspace{\@IEEEPARstartHOFFSET}%
\@IEEEPARstartfont\@IEEEPARstartCAPSTYLE{#1\@IEEEPARstartITLCORRECT}%
\hspace{\@IEEEPARstartSEP}}}%
{\@IEEEPARstartWORDFONTSTYLE{\@IEEEPARstartWORDCAPSTYLE{\selectfont#2}}}}

%%%%%%%%%%%%%%%%%%%

\def\listoffigures{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{List of Figures\@mkboth
 {ILLUSTRATIONS}{ILLUSTRATIONS}} \thispagestyle{empty}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}List of Figures}\@starttoc{lof}\if@restonecol
 \twocolumn\fi}

\def\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

\def\listoftables{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{List of Tables\@mkboth
 {TABLES}{TABLES}} \thispagestyle{empty}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}List of Tables}\@starttoc{lot}\if@restonecol
 \twocolumn\fi}

\let\l@table\l@figure

\def\l@frontmatter#1#2{\pagebreak[3]
 \@tempdima 1.5em \begingroup
 \parindent \z@ \rightskip \@pnumwidth
 \parfillskip -\@pnumwidth
 \leavevmode #1\hfil \hbox to\@pnumwidth{\hss #2}\par
 \endgroup}

\def\thebibliography#1{\chapter*{Bibliography\@mkboth
 {BIBLIOGRAPHY}{BIBLIOGRAPHY}}\addcontentsline
 {toc}{chapter}{\protect\numberline {\hfil}Bibliography}\list
 {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \usecounter{enumi}}
 \def\newblock{\hskip .11em plus .33em minus .03em}
 \sloppy
 \uchyph=1\sfcode`\.=1000\relax}

\let\endthebibliography=\endlist

\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \else \newpage \fi \thispagestyle{empty}\c@page\z@}

\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

% Rich Baraniuk's modifications to make fig and table caps work
%\renewcommand{\fnum@figure}{Figure \thefigure \setlength{\baselineskip}{5.5mm}}
%\renewcommand{\fnum@table}{Table \thetable \setlength{\baselineskip}{5.5mm}}
\renewcommand{\fnum@figure}{Figure \thefigure \linespacing{1}}
\renewcommand{\fnum@table}{Table \thetable \linespacing{1}}

\newcommand{\ricelogo}{%
  \includegraphics[scale=0.5]{/net/dsp1/tex/macros/rice-shield.ps}}
\newcommand{\art}{\@coverart}

\def\makecover{%
\begin{titlepage}
  \null\linespacing{1}\setcounter{page}{0}\vfill
  \vbox to 0pt{\vss\vbox to 8.75in{\parskip 0pt \parindent 0pt
      \rule{\textwidth}{2mm}
      \vskip 3pt
      {\Huge \textsc{\textbf{\@ctitle}} \par}
      \vskip 6pt
      \rule{\textwidth}{2mm}
      \vskip 12pt
      {\Large \hfill \@author \par}
      \vskip 12pt
      \begingroup
      \begin{center}
        \art
      \end{center}
      \endgroup
      \setlength{\unitlength}{1mm}
      \begin{picture}(20,20)(-7,0)
        \put(0,0){\ricelogo}
        \put(20,10){Thesis:\ \@degree \par}
        \put(20,6){\@department \par}
        \put(20,2){\@school,  \@address\ (\@month\ \@year) \par}
      \end{picture}}}
    \cleardoublepage
\end{titlepage}}

\def\maketitle{%
\begin{titlepage}
  \null\linespacing{1}\setcounter{page}{1}\vfill
  \vbox to 0pt{\vss\vbox to 8.75in{\parskip 0pt \parindent 0pt\centering
      {\large \uppercase\expandafter{\@school} \par} \vskip 0pt plus .1fil
      {\large \expandafter{\@department} \par} \vskip 0pt plus 3fil
      {\Large \bf \@title \par} \vskip 0pt plus 1.3fil
      {\large by \par} \vskip 0pt plus 1fil
      {\large \bf \@author \par} \vskip 0pt plus 3fil
      {\large \sc A Thesis Submitted \\
        in Partial Fulfillment of the \\
%         in Fulfillment of the \\
        Requirements for the Degree \par} \vskip 0pt plus 1.1fil
      {\large \bf \@degree \par} \vskip 0pt plus 4.5fil
      \begingroup
      \leftskip .5\textwidth \rightskip 0pt plus 1fil
      {\sc %Approved, Thesis Committee:
       \par} \vskip 2.5em
    %  \moveright\leftskip\vbox{ \leftskip}
      \def\and{\par \vskip 2.25em minus 1em\moveright\leftskip%
        \vbox{ \leftskip}}
      %\@committee \par
      \endgroup \vskip 0pt plus 2fil
      {\large \@address \par} \vskip 0pt plus .8fil
      %{\large \@month, \@year \par}}}\cleardoublepage
      {\large \@year \par}}}\cleardoublepage
\end{titlepage}}

\newif\if@bigcommittee \@bigcommitteefalse

\def\school#1{\gdef\@school{#1}}
\def\ctitle#1{\gdef\@ctitle{#1}}
\def\department#1{\gdef\@department{#1}}
\def\coverart#1{\gdef\@coverart{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\committee#1{\gdef\@committee{#1}}
\def\bigcommittee#1{\@bigcommitteetrue\gdef\@committee{#1}}
\def\address#1{\gdef\@address{#1}}
\def\donemonth#1{\gdef\@month{#1}}
\def\doneyear#1{\gdef\@year{#1}}

\def\@school{University of Technology, Sydney}
\def\@ctitle#1{\@title}
\def\@department{Faculty of Engingeering and Information Technology}
\def\@coverart{\includegraphics{/net/dsp1/tex/macros/rice-shield-big.ps}}
\def\@degree{Doctor of Philosophy}
\def\@committee{member 1, Chairman \\ prof \and
 member 2 \\ prof \and member 3 \\ prof}
\def\@address{Sydney, Australia}
\def\@month{\ifcase\month ?\or January\or February\or March\or April\or
 May\or June\or July\or August\or September\or October\or
 November\or December\fi}
\def\@year{\number\year}

\def\abstract{\cleardoublepage \pagestyle{empty} \global\@topnum\z@
 \@afterindentfalse \begingroup
 \def \baselinestretch{1.7} \parskip \z@ \parindent \z@ \par
 \null \centering {{\large \center{ABSTRACT}}} \vskip .2in
{\bf \@title \par} \vskip .1in  by \vskip .0in \@author \vskip .4in \par
\endgroup \setcounter
 {footnote}{0}\def\thefootnote{\fnsymbol{footnote}}\addcontentsline
 {toc}{frontmatter}{\protect\numberline {\hfil}Abstract}}

\def\endabstract{\setcounter{footnote}{0}
  \pagestyle{plain}\thispagestyle{empty}}


\def\certificate{\chapter*{Certificate of Authorship/Originality}\thispagestyle{empty}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Certificate}}

\def\endcertificate{\setcounter{footnote}{0}}


\def\dedication{\chapter*{Dedication}\thispagestyle{empty}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Dedication}}

\def\enddedication{\setcounter{footnote}{0}}


\def\acknowledge{\chapter*{Acknowledgements}\thispagestyle{empty}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Acknowledgments}}

\def\endacknowledge{\setcounter{footnote}{0}}


\def\publication{\chapter*{List of Publications}\thispagestyle{empty}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}List of Publications}}

\def\endpublication{\setcounter{footnote}{0}}


\def\preface{\chapter*{Preface} \thispagestyle{empty}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Preface}}

\def\endpreface{\setcounter{footnote}{0}}


\def\notation{\chapter*{Nomenclature and Notation}\thispagestyle{empty}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Notation}}

\def\endnotation{\setcounter{footnote}{0}}


\def\abbreviation{\chapter*{Abbreviation}\thispagestyle{empty}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Abbreviation}}

\def\endabbreviation{\setcounter{footnote}{0}}


\def\vita{\chapter*{Vita}\thispagestyle{empty}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{chapter}{\protect\numberline
 {\hfil}Vita}}

\def\endvita{\setcounter{footnote}{0}}

\def\frontmatter{\relax}
\def\endfrontmatter{\cleardoublepage
  \pagenumbering{arabic}\def\thefootnote{\arabic{footnote}}}


\def\linespacing#1{\def\baselinestretch{#1} \let\@tempa\@currsize
 \let\@currsize\relax \@tempa}

\def\@makechapterhead#1{\begingroup
 \def \baselinestretch{1} \parskip \z@ \parindent \z@ \par
 \Large\bf \null \vskip 1.5ex \centering
 \ifnum \c@secnumdepth >\m@ne \@chapapp~\thechapter \vskip 3.5ex \fi
 #1 \vskip 3ex plus .2ex\endgroup}

\def\@makeschapterhead#1{\begingroup
 \def \baselinestretch{1} \parskip \z@ \parindent \z@ \par
 \null \vskip .3in \centering
 \Large \bf #1\par \endgroup \nobreak \vskip .6in\relax}

\def\chapter{\cleardoublepage
 \thispagestyle{plain}
 \global\@topnum\z@
 \@afterindentfalse
 \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
 \refstepcounter{chapter}
 \typeout{\@chapapp\space\thechapter.}
 \addcontentsline{toc}{chapter}{\protect
 \numberline{\thechapter}#1}\else
 \addcontentsline{toc}{chapter}{#1}\fi
 \chaptermark{#1}
 \addtocontents{lof}{\protect\addvspace{\baselineskip}}
 \addtocontents{lot}{\protect\addvspace{\baselineskip}}
 \if@twocolumn
 \@topnewpage[\@makechapterhead{#2}]
 \else \@makechapterhead{#2}
 \@afterheading
 \fi}

\def\@schapter#1{\if@twocolumn \@topnewpage[\@makeschapterhead{#1}]
 \else \@makeschapterhead{#1}
 \@afterheading\fi}

\def\section{\@startsection{section}{1}{\z@}{-3.25ex plus -1ex minus
 -.2ex}{1.5ex plus .2ex}{\large\bf}}
\def\subsection{\@startsection{subsection}{2}{\z@}{-3.25ex plus -1ex minus
 -.2ex}{1.5ex plus .2ex}{\normalsize\bf}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-3.25ex plus
 -1ex minus -.2ex}{1.5ex plus .2ex}{\normalsize\bf}}
\def\paragraph{\@startsection
 {paragraph}{4}{\z@}{3.25ex plus 1ex minus .2ex}{-1em}{\normalsize\bf}}
\def\subparagraph{\@startsection
 {subparagraph}{4}{\parindent}{3.25ex plus 1ex minus
 .2ex}{-1em}{\normalsize\bf}}

\def\chaptermark#1{}

\setcounter{secnumdepth}{2}

\def\appendix{\par
 \setcounter{chapter}{0}
 \setcounter{section}{0}
 \def\@chapapp{Appendix}
 \def\thechapter{\Alph{chapter}}}

\if@twoside
\def\ps@headings{%
  \let\@mkboth\markboth
  \def\@oddfoot{}
  \def\@evenfoot{}
  \def\@evenhead{\rm \thepage\hfil \sl \leftmark}
  \def\@oddhead{\hbox{}\sl \rightmark \hfil \rm\thepage}
  \def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
        \@chapapp\ \thechapter. \ \fi ##1}}{}}
  \def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
        \thesection. \ \fi ##1}}}}
\else
\def\ps@headings{%
  \let\@mkboth\markboth
  \def\@oddfoot{}\def\@evenfoot{}
  \def\@oddhead{\hbox {}\hfil \rm\thepage}
  \def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
        \@chapapp\ \thechapter. \ \fi ##1}}}}
\fi

\def\ps@myheadings{\let\@mkboth\@gobbletwo
\def\@oddhead{\hbox{}\sl\rightmark \hfil \rm\thepage}
\def\@oddfoot{}\def\@evenhead{\rm \thepage\hfil\sl\leftmark\hbox {}}
\def\@evenfoot{}\def\chaptermark##1{}\def\sectionmark##1{}
\def\subsectionmark##1{}}

\ps@headings
\onecolumn
\if@twoside\else\raggedbottom\fi

\pagenumbering{roman}
\def\thefootnote{\fnsymbol{footnote}}

%
% Until Graduate Studies comes to their senses, put all page numbers
% in the upper-right.  They think that the page number at the bottom-center
% is too close to the bottom of the page.
%
\let\ps@plain\ps@headings
