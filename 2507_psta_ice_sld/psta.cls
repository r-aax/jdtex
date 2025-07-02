% Licensed with CC-BY-SA
% Designed by S. Znamenskij, znamensk@rustex.botik.ru, svz@latex.pereslavl.ru
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{psta}[2025/05/20 18:18:16 Document class for PSTA journal and other bilingual proceedings]
\makeatletter
%%% Dependence of language {{{1
\newcommand\la@ifundefined[1]{\@ifundefined{\languagename-\article@id-#1}}%
\newcommand\la@nameuse[1]{\@nameuse{\languagename-\article@id-#1}}%
\gdef\la@nameshow#1{\@nameshow{\languagename-\article@id-#1}}%
\gdef\la@namedef#1{\@namedef{\languagename-\article@id-#1}}%
\gdef\l@namedef#1{\@namedef{\languagename-#1}}%
\newcommand\l@ifundefined[1]{\@ifundefined{\languagename-#1}}%
\newcommand\l@nameuse[1]{\@nameuse{\languagename-#1}}%
\errorcontextlines\maxdimen
\def\tracethe#1{\wlog{\string#1=\the#1}}%
\gdef\@nameshow#1{}% Redefine it to switch logging
\gdef\@nameshow#1{\wlog{\expandafter\string\csname #1\endcsname =\expandafter\meaning\csname#1\endcsname }}% Redefine it to switch logging
%    \wlog{\e@a@Tc\string{#1}=\e@a@Tc\meaning{#1}.}}%
%% \e@a@ - expansion order altering
%% A - argument in braces
%% a - argument without braces
%% C - \cs from \csname cs\endcsname in braces
%% c - \cs from \csname cs\endcsname without braces
%% S - aSsignement token, show
%% T - other single token
%% X ending - expand after following
%% l - \languagename-\article@id- prefixed
%% xC -  expanded value of C
%% xA -  expanded value of A
\newcommand{\e@a@ScC}[3]{\e@a@ScxA{#1}{#2}{\csname#3\endcsname}}%
\newcommand{\e@a@Scc}[3]{\e@a@Sca{#1}{#2\expandafter}{\csname#3\endcsname}}%
\newcommand{\e@a@SceA}[4]{\e@a@Tc{#1}{#2#3}#3{#4}\@nameshow{#2}}%
\newcommand{\e@a@Sca}[3]{\e@a@Tc{#1}{#2}#3\@nameshow{#2}}%
\newcommand{\e@a@SclC}[3]{\e@a@ScC{#1}{#2}{\languagename-\article@id-#3}}%
\newcommand{\e@a@Sclc}[3]{\e@a@Scc{#1}{#2}{\languagename-\article@id-#3}}%
\newcommand{\e@a@ScxA}[3]{\e@a@SceA{#1}{#2}\expandafter{#3}}%
\newcommand{\e@a@ScxxA}[3]{\e@a@SceA{#1}{#2}{\expandafter\expandafter\expandafter}{#3}}%
\newcommand{\e@a@SlcC}[3]{\e@a@ScC{#1}{\languagename-\article@id-#2}{#3}}%
\newcommand{\e@a@SlcxA}[3]{\e@a@ScxA{#1}{\languagename-\article@id-#2}{#3}}%
\newcommand{\e@a@SlcxxA}[3]{\e@a@ScxxA{#1}{\languagename-\article@id-#2}{#3}}%
\newcommand{\e@a@SlcxC}[3]{\e@a@SlcxxA{#1}{#2}{\csname#3\endcsname}}%
\newcommand{\e@a@Tc}[2]{\expandafter#1\csname#2\endcsname}%
\newcommand{\e@a@Tlc}[2]{\e@a@Tc#1{\languagename-\article@id-#2}}%
\newcommand{\glet@lclc}{\global\let@lclc}%
\newcommand{\glet@cc}{\global\let@cc}%
\newcommand{\g@addto@lcxA}{\e@a@SlcxA\g@addto@macro}%
\newcommand{\let@lc}[1]{\let@c{\languagename-\article@id-#1}}%
\newcommand{\let@c}[2]{\e@a@Tc\let{#1}#2\@nameshow{#1}}%
\newcommand{\let@cc}[2]{\e@a@Scc\let{#1}{#2}}%
\newcommand{\let@lcc}[2]{\let@cc{\languagename-\article@id-#1}{#2}}%
\newcommand{\let@clc}[2]{\let@cc{#1}{\languagename-\article@id-#2}}%
\newcommand{\let@lclc}[2]{\let@clc{\languagename-\article@id-#1}{#2}}%
\newcommand{\gdef@lclC}[2]{\gdef@lcC{#1}{\languagename-\article@id-#2}}%
\newcommand{\gdef@cA}[2]{\e@a@Sca\gdef{#1}{{#2}}}%
\newcommand{\xdef@cA}[2]{\e@a@Sca\xdef{#1}{{#2}}}%
\newcommand{\gdef@lcA}[2]{\gdef@lca{#1}{{{#2}}}}%
\newcommand{\gdef@lca}[2]{\e@a@Sca\gdef{\languagename-\article@id-#1}#2}%
\newcommand{\gdef@lcC}[2]{\e@a@SlcC\gdef{#1}{#2}}%
\newcommand{\gdef@cxA}[2]{\e@a@ScxA{\gdef}{#1}{#2}}%
\newcommand{\gdef@lcxA}[2]{\e@a@ScxA{\gdef}{\languagename-\article@id-#1}{#2}}%
\newcommand{\gdef@cxxA}[2]{\e@a@ScxxA{\gdef}{#1}{#2}}%
\newcommand{\gdef@lcxxA}[2]{\e@a@ScxxA{\gdef}{\languagename-\article@id-#1}{#2}}%
%%% Remove {{{1
\def\tracing#1{\if#1a\errorcontextlines\maxdimen\showboxbreadth\maxdimen\showboxdepth\maxdimen\tracinggroups\@ne\tracingifs\@ne\tracinglostchars\tw@\tracingmacros\tw@\tracingnesting\@ne\tracingoutput\@ne\tracingpages\@ne\tracingparagraphs\@ne\tracingrestores\@ne\tracingscantokens\@ne\tracingstats\tw@\tracingassigns\@ne\tracingcommands\thr@@
\else\tracingcommands\z@\errorcontextlines\m@ne\showboxbreadth\m@ne\showboxdepth\m@ne\tracingassigns\z@\tracinggroups\z@\tracingifs\z@\tracinglostchars\@ne\tracingmacros\z@\tracingnesting\z@\tracingonline\z@\tracingoutput\z@\tracingpages\z@\tracingparagraphs\z@\tracingrestores\z@\tracingscantokens\z@\tracingstats\z@\fi}%
%%% Declare Language options {{{1
\xdef\russian@lang{\string russian}%
\def\russian@encoding{T2A}%
\xdef\english@lang{\string english}%
\def\english@encoding{T1}%
\@ifundefined{pstarussianpartonly}{\let\article@lang\english@lang}{\let\article@lang\russian@lang}
\def\set@russian{\let\languagename\russian@lang}\set@russian
\def\set@english{\let\languagename\english@lang}%
\def\g@set@fontenc{\global\expandafter\fontencoding\expandafter{\csname\languagename @encoding\endcsname}\global\let\encodingdefault\f@encoding}%
\def\g@set@hyphenation{\language\csname l@\languagename\endcsname\relax}%\selectfont
\def\Russian{\set@russian\g@set@hyphenation\g@set@fontenc}%
\def\English{\set@english\g@set@hyphenation\g@set@fontenc}%

\let\latexmarkboth\markboth
\def\pdflang{en}
\def\DeclareLanguageEncoding#1#2#3#4{%
  \expandafter\def\csname#1NativeEncoding\endcsname{#2}%
  \@namedef{ParIn#1}{#2\ParInLanguage{#1}}%
  \DeclareOption{#1}{%
    \AtBeginDocument{\main@language{#1}%
    \def\pdflang{#3}#2%
    \edef\article@lang{\string #1}\PassOptionsToPackage{babel}{#1}}#4%
  }}%
\DeclareLanguageEncoding{russian}{}{ru}{}%
\DeclareLanguageEncoding{ukrainian}{}{ua}{}%
\DeclareLanguageEncoding{english}{}{en}{}%
\DeclareLanguageEncoding{francais}{}{fr}{}%
%
% Add extra language or encoding declarations if needed, please, with the appropriate co mment!
%
\def\ArticleEncoding{utf8}%
\def\DeclareInputEncoding#1{%
  \DeclareOption{#1}{\def\ArticleEncoding{#1}\PassOptionsToPackage{inputenc}{#1}}}%
\DeclareInputEncoding{cp1251}%
\DeclareInputEncoding{utf8}\def\utfVIIIname{utf8}%
\DeclareInputEncoding{koi8-r}%
%%% Declare other options and process {{{1
\def\underliedclass{amsproc}%
  \DeclareOption{book}{\def\underliedclass{amsbook}}%
  \DeclareOption{article}{\def\underliedclass{amsart}}%
%
\ifx\pdfoutput\undefined\let\pdfoutput\z@\fi \expandafter \PassOptionsToPackage
  \ifcase\pdfoutput {dvips,hiresbb}{graphics}\else{pdftex}{graphics,lscape}\fi
%
\DeclareOption{blind}{\xdef\psta@blind{y}}\@ifundefined{psta@blind}{\def\psta@blind{n}}{}%
\DeclareOption{oldsystem}{\xdef\old@system{y}}\def\old@system{n} % move to draft
\DeclareOption{hyphenbreaks}{\def\hyphenbreaks{y}}\def\hyphenbreaks{n}%
\DeclareOption{fancyverts}{\def\load@fancyvrb{y}}\def\load@fancyvrb{n}%
\def\SoftSpaces{\spaceskip2.5ptplus3.5ptminus1.5pt}%
\def\NormalSpaces{\spaceskip\z@}%
%\DeclareOption{a4paper}{\def\@aIVpaper{y}}\def\@aIVpaper{n}%
\DeclareOption{secsymbol}{\font\SecSignFont=ts1-lmr10 \font\SecSignBoldFont=ts1-lmbx10
    \def\S@cChar{{\SecSignFont\char"A7}}\def\S@CChar{{\SecSignBoldFont\char"A7}}\AtBeginDocument
  {\def\sectionmark{\pagebreak[2]\@secmark\pstamarkright\sectionrunhead{\S@CChar\sectionname}}%
  \def\tocsection#1#2#3{\everypar {\S@CChar}\bigskip \noindent \parfillskip \z@
  \leftskip .2\hsize plus.2 \hsize minus .2\hsize
  \rightskip \leftskip \textsf {#1}\par{\@ifempty{#2}{}{\textbf {\S@CChar#2. }} }{#3}}%
  \renewcommand*{\p@section}{\S@cChar}%
  \def\@seccntformat#1{\S@CChar\csname the#1\endcsname.\hspace*{0.5em}}}}%
%
\PassOptionsToPackage{colorlinks,pdfa,bookmarksopen,hyperfigures,citecolor=citecolor,urlcolor=urlcolor,linkcolor=linkcolor,bookmarksdepth=2}{hyperref}%
%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\underliedclass}}%
\ProcessOptions
%%% Load packages
\LoadClass{\underliedclass}%
%\RequirePackage{uniquecounter}%
\InputIfFileExists{data/otherlanguagepages}{}{}%
\InputIfFileExists{data/main.pages}{%
  \def\switch@language@icon{\ifx\article@lang\russian@lang
  %\wlog{Russian}%
    \switch@language@icon@\russian@lang\english@lang\else
  %\wlog{English}%
    \switch@language@icon@\english@lang\russian@lang\fi}%
  }{\let\switch@language@icon\relax}%
\IfFileExists{ifxetex.sty}{\RequirePackage{ifxetex}}{}%
\IfFileExists{iftex.sty}{\RequirePackage{iftex}}{}%
\ifxetex
\else
 \InputIfFileExists{glyphtounicode}{%
 \InputIfFileExists{glyphtounicode-cmr}{}{}%
 \InputIfFileExists{glyphtounicode-ntx}{}{}%
 \pdfgentounicode=1}{\RequirePackage{cmap}}%
\fi
\PassOptionsToPackage{amsmath}{intlimits,sumlimits,namelimits,centertags}%
\let\equation\gather
\let\endequation\endgather
\IfFileExists{url.sty}{\RequirePackage[hyphens]{url}}{}%
\RequirePackage{amsmath,amssymb,amscd,euscript}%
\RequirePackage[citation-order,sorted-cites,compressed-cites,initials,sorted-cites,compressed-cites,backrefs,nobysame]{amsrefs}%
\RequirePackage[pdflang=\pdflang, pagebackref,unicode]{hyperref}%
\RequirePackage{textcase}
\RequirePackage{backref}%
\IfFileExists{mathtext.sty}{\RequirePackage[warn]{mathtext}}{}%
\RequirePackage[T1,T2A]{fontenc}%
\def \LinkToHomepage{\PSTAprepared\ \today\ \PSTAfor\startquote\JournalLink\stopquote}%
\RequirePackage{geometry}%
\IfFileExists{floatrow.sty}{\RequirePackage{floatrow}\floatsetup[table]{capposition=top}}{}%

%%% Load psta packages
\def\publname{\TopHead}%
\@ifundefined{journalabbreviationinenglish}{\def\journalabbreviationinenglish{psta}}{}%
\def\PublicationInfo{{}\PSTAprepared{ }\PSTAfor \emph{\JournalLink} \PSTAat \two@digits{\the\day}.\two@digits{\the\month}.\two@digits{\the\year} }%
\def\PublicationLink#1{}%
\def\orgdef#1\\ #2\\ #3\\ #4\\ #5\\ {%
  \expandafter\def\csname english-*#1\endcsname{#3}%
  \expandafter\def\csname russian-*#1\endcsname{#5}%
  \expandafter\orgdef@\csname#1\expandafter\endcsname
    \csname english-#1\expandafter\endcsname
    \csname russian-#1\endcsname{#2}{#3}{#4}{#5}{#1}}%
\def\orgdef@#1#2#3#4#5#6#7#8{%
  \def#1{\csname\languagename-#8\endcsname}%
  \def#2{\href{#4}{#5}}%
  \def#3{\href{#6}{#7}}}%

\def\ForCommaSpaceSeparatedListUntillPoint#1#2.{\ProceedNextUntillComma{#1}#2, ,}%
\def\ProceedNextUntillComma#1#2, #3{#1#2\ifx,#3\@firstoffour\fi\ProceedNextUntillComma{#1}#3}%
\def\@firstoffour#1#2#3#4{#1}%
\def\CanDependOnLanguage#1#2{\def#2{\expandafter
    \ifx\csname#1-\expandafter\@gobble\string#2\expandafter\endcsname\relax
        \csname default-\expandafter\@gobble\string#2\expandafter\endcsname
    \else\csname#1-\expandafter\@gobble\string#2\expandafter\endcsname\fi}}%
\def\CanDependOnMainLanguage{\CanDependOnLanguage\article@lang}%
\def\CanDependOnLanguagename{\CanDependOnLanguage\languagename}%
\def\CanDependOnBibLanguage{\CanDependOnLanguage\BibLanguage}%
\def\AtLanguageDefine#1#2#3{\expandafter\def\csname #1-\expandafter\@gobble\string#2\endcsname{#3}}%
\def\DefineDefaultRussian#1#2#3{\CanDependOnLanguage\languagename{#1}%
  \AtLanguageDefine{default}{#1}{#2}\AtLanguageDefine{russian}{#1}{#3}}%
%
\if y\old@system\PassOptionsToPackage{inputenc}{cp1251}\def\cyrillicencoding{cp1251}\def\Year{\the\year}\fi
\RequirePackage{inputenc}%
\expandafter\RequirePackage[russian,english]{babel}%
\def\switch@language{\RussianEnglish{\letlanguagename\english@lang}{\letlanguagename\russian@lang}\selectlanguage{\languagename}}%

\def\set@headline@encoding#1{\global\expandafter
    \let\expandafter\headline@language\csname #1@lang\endcsname\expandafter
    \def\expandafter\patchpdfheadlineencoding\expandafter{\expandafter\let\expandafter
    \encodingdefault\csname#1@encoding\endcsname}}%
\def\ParInLanguage#1{\g@set@language{#1}\edef\languagename{\expandafter\string #1}}%
%\foreign@language{russian}%\wlog{\string\languagename=\languagename}%
\inputencoding{\ArticleEncoding}%
\catcode 64=11
\set@headline@encoding{\article@lang}%
\edef\@tempa{\journalabbreviationinenglish-\ArticleEncoding.sty}%
\def\DoiAndLink{}%
\RequirePackage[rgb,hyperref]{xcolor}%
\def\@@mod{rgb}\selectcolormodel{rgb}%
\convertcolorsUtrue\convertcolorsDtrue
\begingroup
    \pdfcompresslevel=0
  \IfFileExists{data/\jobname.xmp}{%
    \immediate\pdfobj stream attr {%
      /Type /Metadata
      /Subtype /XML
    } file{data/\jobname.xmp}%
    \pdfcatalog {/Metadata \the\pdflastobj\space 0 R}%
    \pdfcompresslevel=0
     \def\pdfx@numcoords{/N 3 /Alternate/DeviceRGB}%
      \immediate\pdfobj stream attr{\pdfx@numcoords} file{psta/sRGBIEC1966-2.1.icm}%
    \edef\pdfx@outintent@dict{%
      /Type /OutputIntent /S/GTS_PDFA1 /OutputConditionIdentifier (IEC sRGB)/DestOutputProfile 1 0 R/Info(IEC 61966-2.1 Default RGB colour space - sRGB)
      /RegistryName(http://www.iec.ch) }%
    }{}%
    {}%
\endgroup
\IfFileExists{data/\jobname.pdfinfo}{%
    \newread \read@info@
    \openin \read@info@ = data/\jobname.pdfinfo
    \ifeof  \read@info@ \errmessage{unreadable data/\jobname.pdfinfo!} \else
    \read \read@info@ to\pdf@info@@@
\begingroup
    \edef\0{\string\0}%
    \edef\1{\string\1}%
    \edef\2{\string\2}%
    \edef\3{\string\3}%
    \edef\({\string\(}%
    \edef\){\string\)}%
  \xdef\pdf@info@@{\pdf@info@@@}%
\endgroup
  \closein\read@info@\fi
\AtBeginDocument{%
   \edef\0{\string\\0}%
   \def\PDF@FinishDoc{%
   \begingroup
   \pdfinfo{\pdf@info@@}%
     \endgroup}}}{}{}%
\InputIfFileExists{psta/\journalabbreviationinenglish-\ArticleEncoding.sty}{}{%
  \wlog{No psta/\journalabbreviationinenglish-\ArticleEncoding.sty!}%
   \orgdef JournalLink\\ psta.psiras.ru/index_en.htm\\ Program Systems: Theory and Applications\\
psta.psiras.ru\\ Program Systems: Theory and Applications\\
\def\PSTASubmitted{Submitted to}%
\def\PSTAat{at }%
\def\PSTAfor{for the journal }%
\def\PSTAacknowledgments{Acknowledgments}%
\def\PSTAprepared{Prepared }%
\def\PSTAsubmitting{(submitting)}%
\def\PSTAsubmit{To the journal }%
\def\SSylkaa{Sample citation of this publication:}%
\def\UDCname{UDC}%
\def\GRNTIname{CSCSTI}%
\def\bibIssuetext{No.}%
\def\bibVoltext{Vol.}%
\def\bibissuetext{no.~}%
\def\bibpagestext{pp.}%
\def\bibpaperidtext{id}%
\def\bibpagetext{p.}%
\def\Figurename{Figure}%
\def\fnum@figure{Figure \thefigure}%
\def\inrussianname{In Russian}%
\def\keywordsname{Key words and phrases}%
\def\manyauthors{About the authors}%
\def\oneauthor{About the author}%
\def\startquote{``}%
\def\stopquote{''}%
\def\PSTArubric{%
         principles and technologies of electronic publications\or
         information systems in culture and education\or
         information technology in medicine\or
         information systems in economics\or
         artificial intelligence, intelligent systems, neural networks\or
         theoretical computer science\or
         computational science\or
         optimization Methods and Control Theory\or
         hardware and software for supercomputers\or
         hardware, software and distributed supercomputer systems\or
         necrologs\or
         contents\or
         author index\or
         contents (in Russian)\or
         author index (in Russian)}%
\def\PSTACRediT{conceptualization\or methodology\or software\or validation\or formal analysis\or investigation\or resources\or data curation\or writing (original draft)\or writing (review \& editing)\or visualization\or supervision\or project administration\or funding acquisition}%
\def\TopHead{{\large\textcolor{red}{!!!\hss ---\hss---}\hss Missing \textcolor{red}{psta} subdirectory from
  \href{https://psta.psiras.ru/publ-conditions/psta.zip}{\textcolor{red}{\textbf{psta.zip}}},
   \textcolor{red}{\hss ---\hss---\hss!!!}}}}%
  \def\and{, }%
\ifx\utfVIIIname\ArticleEncoding\else\let\PSTAmkXMP\relax\fi
%
\definecolor{darkred}{rgb}{0.3,0,0}%
\definecolor{lightgray}{rgb}{0.5,0.5,0.5}%
\definecolor{gray}{rgb}{0.45,0.45,0.45}%
\definecolor{citecolor}{rgb}{0,0.3,0.25}%
\definecolor{urlcolor}{rgb}{0.25,0,0.1}%
\definecolor{linkcolor}{rgb}{0,0.1,0.25}%
\definecolor{backrefcolor}{rgb}{0.55,0.55,0.55}%
\definecolor{verbatimrules}{rgb}{0.1,0.3,.2}%
\expandafter\let\expandafter\@indexbordercolor\csname\string\color@verbatimrules\endcsname
\definecolor{verbatimbgu}{rgb}{.85,0.97,.9}%
\definecolor{verbatimbg}{rgb}{.92,1,.92}%
\definecolor{verbatimtitle}{rgb}{0.1,0.4,0.2}%
\definecolor{verbatimnumbers}{rgb}{0.7,0.8,0.8}%
\definecolor{verbatimdefault}{rgb}{0.25,0.2,0.3}%
\definecolor{authorsmarks}{rgb}{0.1,0.3,0.3}%
\definecolor{string}{rgb}{0.45,0.45,0.1}%
\definecolor{gt}{rgb}{0.55,0.75,0.45}%
\definecolor{word}{rgb}{0.25,0.25,0.25}%
\definecolor{key}{rgb}{0.1,0.4,0.1}%
\definecolor{variable}{rgb}{0.4,0,0}%
\definecolor{comment}{rgb}{0.15,0.2,0.6}%
\definecolor{parameter}{rgb}{0,0.2,0.5}%
%
%
\if n\old@system
\Urlmuskip=0mu plus 2mu\relax
\fi
%\RequirePackage{bookmark}
%\RequirePackage[figure,table]{totalcount}%
\AtBeginDocument{\let\cites\cite}%

%%
\long\def\NothebibliographyinEnglish#1\end{\end}%
%
\def\HideFromPeer#1{\textcolor{authorsmarks}{$\langle$#1$\rangle$}}%
\IfFileExists{../get-psta}{\def\psta@blind{y}}{}%
\def\@Reviewer{\par\hugeskip \PSTAAssigned\par\bigskip \AnonimousReview}%
\newskip\psta@v@pt
\newskip\bigsoftskipamount
\newskip\hugerskipamount
\newskip\hugeskipamount\def\hugeskip{\@@par\penalty-100\vskip\hugeskipamount}%
\newskip\smallerskipamount\def\smallerskip{\@@par\penalty200\vskip\smallerskipamount}%
\newskip\biggerskipamount\def\biggerskip{\@@par\penalty100\vskip\biggerskipamount}%
\def\set@fontsize#1#2#3{%
    \@defaultunits\@tempdimb#2pt\relax\@nnil
    \edef\f@size{\strip@pt\@tempdimb}%
    \@defaultunits\@tempskipa#3pt\relax\@nnil
    \edef\f@baselineskip{\the\@tempskipa}%
    \edef\f@linespread{#1}%
    \let\baselinestretch\f@linespread
    \normalbaselineskip\f@baselineskip\relax
    \normalbaselineskip\f@linespread\normalbaselineskip
    \let\size@update\psta@ajust@vskips}%
\def\psta@set@vskips{%\tracing a
  \@tempdima\psta@v@tolerance\psta@v@pt
  \@tempdimb\psta@v@tolerance\@tempdima
  \@tempdimb 2\@tempdimb
  \advance\@tempdimb \@tempdima
  \psta@setskip \parskip {2}%
  \psta@setskip \smallskipamount 3%
  \psta@setskip \smallerskipamount{4.5}%
  \psta@setskip \medskipamount 6%
  \psta@setskip \biggerskipamount 9%
  \psta@setskip \bigskipamount {12}%
  \psta@setsoftskip \bigsoftskipamount {12}%
  \psta@setskip \hugerskipamount{18}%
  \psta@setskip \hugeskipamount{24}%
  \belowdisplayskip=\smallskipamount
  \belowdisplayshortskip=\smallskipamount
  \abovedisplayshortskip=\parskip
  \abovedisplayskip=\smallskipamount
  \baselineskip=\smallskipamount %\tracing 0
  \advance\baselineskip .75\normalbaselineskip
   \setbox\strutbox\hbox{%
        \vrule\@height7\psta@v@pt
              \@depth3\psta@v@pt
              \@width\z@}%
      \let\size@update\relax%
  \floatsep \medskipamount %(default 12pt plus 2pt minus 2pt) the separation between floats in top or bottom areas
  \dblfloatsep \medskipamount %(default 12pt plus 2pt minus 2pt) the separation between double-column floats on two column pages
  \textfloatsep \biggerskipamount %(default 20pt plus 2pt minus 4pt) the separation between top or bottom area and the text area
  \dbltextfloatsep \biggerskipamount %(default 20pt plus 2pt minus 4pt) the analog of \textfloatsep for two-column floats
  \intextsep \medskipamount%(default 12pt plus 2pt minus 2pt) the separation of float to the surrounding text is controlled by
  \jot=\smallskipamount  \belowdisplayskip=\abovedisplayskip}%
\def\vTolerance#1 {\def\psta@v@tolerance{#1}}\vTolerance 0.1
\def\psta@setskip#1#2{#1=#2\psta@v@pt plus#2\@tempdima minus #2\@tempdimb\relax}%
\def\psta@setsoftskip#1#2{#1=#2\psta@v@pt plus\dimexpr#2\@tempdima*2\relax minus #2\@tempdimb\relax}%
\def\psta@v@tighter{\@@par \psta@v@pt 0.75\psta@v@pt \psta@set@vskips}%
\let\vTighter\psta@v@tighter
\def\psta@v@taller{\@@par \psta@v@pt 1.333\psta@v@pt \psta@set@vskips}%
\def\psta@ajust@vskips{%
  \psta@v@pt\psta@vscale\normalbaselineskip
  \if y\psta@use@vscale\else\advance\psta@v@pt\normalbaselineskip
  \fi
  \divide \psta@v@pt 12
  \psta@set@vskips}%
\def\vExpand#1 {\let\psta@use@vscale n\def\psta@vscale{#1}\csname psta@ajust@vskips\endcsname }\vExpand 0 %
\def\vScale#1 {\let\psta@use@vscale y\def\psta@vscale{#1}\csname psta@ajust@vskips\endcsname }%
\AtBeginDocument{\psta@ajust@vskips}%

%%%%%%%%%%%%                  EnumItem                             %%%%%%%%%%%%%%
\RequirePackage{enumitem}%
\setlist[enumerate]{labelindent=0cm, labelwidth=.5\parindent, itemindent=0\parindent,leftmargin=\parindent,rightmargin=.333\parindent
    ,topsep=1.5\parskip,parsep=.5\parskip,itemsep=.5\parskip,before={\psta@v@tighter},after={\@@par\psta@v@taller},first={\parindent=.666\parindent}, ref={{\upshape\footnotesize
    \textsf{(\emph{\theenumi})\!}}}}%
\newbox\pstabulletbox\setbox\pstabulletbox\hbox{\,\raise.3ex\hbox{$\scriptscriptstyle\bullet$}\!}%
\setlist[itemize]{labelindent=0pt, labelwidth=0pt, itemindent=0pt,leftmargin=1\parindent,rightmargin=.333\parindent,label=\copy\pstabulletbox
    ,topsep=1.5\parskip,parsep=.5\parskip,itemsep=.5\parskip,before={\psta@v@tighter},after={\@@par\psta@v@taller},first={\parindent=.666\parindent}}%
\setlist[description]{labelindent=.25\parindent, labelwidth=1\parindent, leftmargin=1\parindent,rightmargin=.333\parindent,style=unboxed%
    ,topsep=1.5\parskip,parsep=.5\parskip,itemsep=.5\parskip,before={\psta@v@tighter},after={\@@par\psta@v@taller},first={\parindent=.666\parindent}}%
\renewcommand{\descriptionlabel}[1]{\hspace\labelsep{\scalebox{1.05}{\emph{#1}}}}%
\def\FV@Space{\kern.5em}%
\def\pstarus#1#2{\russian@alph{\csname c@#2\endcsname}}%
\def\pstaRus#1#2{\russian@Alph{\csname c@#2\endcsname}}%
\def\pstarualph#1{{\footnotesize\textsf(}#1\textit{\pstarus\alph*}{\footnotesize\textsf)}}%
\def\pstarualphei#1{{\footnotesize\textsf(}\textit{#1\pstarus\alph*}{\footnotesize\textsf)}}%
\def\pstaruAlph#1{{\scriptsize\textsf(#1\pstaRus\expandafter\alph*\scriptsize\textsf)}}%
\@ifundefined{SetEnumitemKey}{}{%
  \SetEnumitemKey{parindent}{labelwidth=\parindent, itemindent=0pt,leftmargin=\parindent,rightmargin=0pt}  }%
\SetEnumitemKey{--}{label=--,leftmargin=1.3em,itemindent=0em,rightmargin=0.5em}%
\SetEnumitemKey{1.1}{label*=\arabic*.}%
\SetEnumitemKey{1)}{leftmargin=0em,itemindent=2.8em,rightmargin=0em,label={\footnotesize\textup{\arabic*}\kern-.5pt\scriptsize${\string)}$},
    ref={\footnotesize\textup{\arabic*}\kern-.5pt\scriptsize${\string)}$}}%
\SetEnumitemKey{123}{label={\textup{\textsf\scriptsize(\!\footnotesize\textit{\arabic*}\kern-.5pt\scriptsize\textsf)}},
    ref={\textup{\footnotesize\textsf(\emph{\arabic*}\textsf)}}}%
\SetEnumitemKey{iii}{label={\upshape\footnotesize\textsf(}\textit{\roman*}{\upshape\footnotesize\textsf)},
    ref={\footnotesize\textsf(}\emph{\roman*}{\footnotesize\textsf)}}%
\SetEnumitemKey{abc}{label={\footnotesize\textsf(}\emph{\alph*}{\footnotesize\textsf)},
    ref={\footnotesize\textsf(}\emph{\alph*}{\footnotesize\textsf)}}%
\SetEnumitemKey{ABC}{label={\scriptsize\textsf(\emph{\Alph*}\textsf)},
    ref={\footnotesize\textsf(\emph{\Alph*}\textsf)}}%
\SetEnumitemKey{ABVGD}{label={\pstaruAlph{\noexpand}},ref={\pstaruAlph{\noexpand}}}%
\SetEnumitemKey{abvgd}{label={\pstarualphei{\noexpand}},ref={\pstarualphei{\noexpand}}}%
\SetEnumitemKey{inner}{labelindent=0\parindent, labelwidth=0\parindent, leftmargin=0\parindent,rightmargin=.333\parindent}%
\SetEnumitemKey{inner-desc}{labelindent=-.25\parindent, leftmargin=0.5\parindent,rightmargin=.333\parindent}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                    %%%%%%%%%%%%%                  Upright Braces                       %%%%%%%%%%%%%%
\edef\pstastringOpen{\string(}%
\edef\pstastringClose{\string)}%
\def\pstastringOpenUp{\relax \ifmmode \pstastringOpen\else\textup\pstastringOpen\fi}%
\def\pstastringCloseUp{\relax \ifmmode \pstastringClose\else\textup\pstastringClose\fi}%
\catcode`(=13 \catcode`)=13
\def\UprightTextParens{\catcode`(=13 \catcode`)=13 \let(\pstastringOpenUp \let)\pstastringCloseUp}%
\def\NoUprightTextParens{\catcode`(=12 \catcode`)=12}\NoUprightTextParens
%
\newcommand\WerbatimToken[1]{\edef#1{\string#1}}%
\WerbatimToken\EndWeed
\WerbatimToken\Bound
\WerbatimToken\Weed@Cursor
\WerbatimToken\Weed@@Cursor
\let\wlogpsta\wlog
\gdef\@secondfirstoftwo#1#2{#2#1}%
%
\let\equation\gather \let\endequation\endgather
\RequirePackage{nameref,color,graphics,pdflscape,upref,rotating}%
\RequirePackage{array}\setlength{\extrarowheight}{1pt}%
%%%%%%%%%%%%%%%  General Cyrillic support  %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%
\def\RussianEnglish{\ifx\languagename\russian@lang \expandafter\@firstoftwo\else\expandafter\@secondoftwo\fi}%
\IfFileExists{extdash.sty}{\RequirePackage[shortcuts]{extdash}%
  \renewcommand{\cyrdash}{\scalebox{0.75}[1]{\textemdash}}}{}
\def\EXD@emdash{\RussianEnglish{\cyrdash}{---}}
\def\emdash{\RussianEnglish{\cyrdash}{---}}%
%
\def\AMS@IoC#1{{\noexpand\IoC#1}}%
\def\AMS@UTFviii@two@octets#1#2{{\noexpand\UTFviii@two@octets\string #1\string#2}}%
\def\AMS@UTFviii@three@octets#1#2#3{{\noexpand\UTFviii@three@octets\string #1\string#2\string#3}}%
\def\AMS@UTFviii@four@octets#1#2#3#4{{\noexpand\UTFviii@four@octets\string #1\string#2\string#3\string#4}}%
\def\protectcyrchar#1#2{\def#1##1{\AMS@UTFviii@two@octets{#1}{##1}}}%



\catcode`\'=12
\def\@extract@initials#1#2{%
    \begingroup
        \auto@protect\ini@hyphen
        \auto@protect\nobreakspace
        \let\-=\@empty
        \let\do\protectcyrchar
        \doА\doБ\doВ\doГ\doД\doЕ\doЁ\doЖ\doЗ\doИ\doЙ\doК\doЛ\doМ\doН\doО\doП%
        \doР\doС\doТ\doУ\doФ\doХ\doЦ\doЧ\doШ\doЩ\doЪ\doЫ\doЬ\doЭ\doЮ\doЯ%
        \let\IoC\AMS@IoC
        \let\UTFviii@two@octets\AMS@UTFviii@two@octets
        \let\UTFviii@three@octets\AMS@UTFviii@three@octets
        \let\UTFviii@four@octets\AMS@UTFviii@four@octets
        \let\do\auto@protect\amsrefs@textsymbols
        \let\do\auto@protect\amsrefs@textaccents
        \normalize@edef\@tempa{#1}%
        \auto@protect\UTFviii@two@octets
        \auto@protect\UTFviii@three@octets
        \auto@protect\UTFviii@four@octets
        \auto@protect\IoC
        \ifx\@tempa\@empty
        \else
            \process@hyphens\@tempa
            \process@dots\@tempa
            \process@names\@tempa
            \@chomp\@tempa{~}%
        \fi
        \RussianEnglish{\let~\between@initials
        \edef\@tempa{\@tempa}}{}%
        \@nameshow{@tempa}%
        #2\@xp\endgroup
    \@tempa
}%
\def\between@initials{\kern.1em}%

\def\etcname{\RussianEnglish{\Etcname}{etc.}}%

\def\set@logo#1{\hbox to\hsize{\fontsize{6}{7\p@}#1}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% subjclass related

\renewcommand*\subjclass[2][1991]{%
  \@ifundefined{subjclassids@#1}{\ClassWarning {\@classname}{Unknown Subject Classification!}}{%
%  \expandafter\show\csname subjclassids@#1\endcsname
    \expandafter\g@addto@macro\csname subjclassids@#1\endcsname{\csname #1 \endcsname{#2}}}%
%  \expandafter\show\csname subjclassids@#1\endcsname
  }%
\expandafter\def\csname 2000 \endcsname#1{{\mscsubj #1, , \@nil}}%
\expandafter\def\csname 2010 \endcsname#1{{\mscsubj #1, , \@nil}}%
\expandafter\def\csname 2020 \endcsname#1{{\mscsubj #1, , \@nil}}%
\def\mscsubj#1; #2, #3,#4\@nil{\msclink{}{#1}\msclink{; }{#2}\msclink{, }{#3}}
\def\msclink#1#2{\@ifempty{#2}{}{#1\href{https://mathscinet.ams.org/mathscinet/search/mscbrowse.html?sk=default&sk=#2}{#2}}}%
\def\newsubjectclass#1{%
  \@namedef{subjclassids@#1}{}%
  \@namedef{setsubjclass#1}{%\tracingall
    \expandafter\expandafter\expandafter\@ifempty
        \expandafter\expandafter\expandafter{\csname subjclassids@#1\endcsname}{}{%
          {\tiny\ld@nameuse{#1name} {\@nameuse{subjclassids@#1}}\par
          }}}}%
\newsubjectclass{2000}%
\newsubjectclass{2010}%
\newsubjectclass{2020}%
\newsubjectclass{UDC}%
\newsubjectclass{BBC}%
\newsubjectclass{GRNTI}%
\@namedef{english-2000name}{\textsf{2000} {\scriptsize\emph{Mathematics Subject Classification}: }}%
\@namedef{english-2010name}{\textsf{2010} {\scriptsize\emph{Mathematics Subject Classification}: }}%
\@namedef{english-2020name}{\textsf{2020} {\scriptsize\emph{Mathematics Subject Classification}: }}%
\@namedef{english-UDCname}{\href{http://scs.viniti.ru/udc/}{UDC}}%
\@namedef{english-BBCname}{\href{http://bbk.rsl.ru/external/bbk?block=ETALON}{BBC}}%
\@namedef{english-GRNTIname}{\href{http://scs.viniti.ru/rubtree/main.aspx?tree=RGNTI}{CSCSTI}}%
\def\ld@nameuse#1{\l@ifundefined{#1}{\csname default-#1\endcsname}{\l@nameuse{#1}}}%
% %% Paper design
%%
%
%%
%% 1. Page Dimensions
%%
\def\ps@firstpage{\ps@plain
  \def\@oddfoot{}%
  \def\@evenfoot{\@oddfoot}%
  \def\@oddhead{\@serieslogo}%
  \let\@evenhead\@oddhead % in case an article starts on a left-hand page
}%
\widowpenalty=500
\clubpenalty=500
\brokenpenalty=500
\interlinepenalty=100
\AtBeginDocument{\def\verbatim@font{\Small\ttfamily}\thispagestyle{empty}}%
%%
%% 2. Headline and strings
%%
\AtBeginDocument{\xdef\PSTAhsize{\the\hsize}}%
\def\ps@headings{\ps@empty
  \def\@evenhead{%
    \setTrue{runhead}%
    \let\savedlanguagename\languagename \let\languagename\headline@language \g@set@fontenc
    \scriptsize \hbox to \PSTAhsize
    {\rlap{\thepage}\let\ \space\hfil\scshape{\leftmark{}{}}\hfil\hskip0ptminus4.44mm}\hss\switch@language@icon
    \let\languagename\savedlanguagename  \g@set@fontenc}%
  \def\@oddhead{%
    \setFalse{runhead}%
    \let\savedlanguagename\languagename \let\languagename\headline@language \g@set@fontenc
    \scriptsize \hbox to  \PSTAhsize{\switch@language@icon
    \hfil\hskip0ptminus 4.44mm
    \scshape{\let\ \space\rightmark{}{}}\hfil \llap{\thepage}}%
    \let\languagename\savedlanguagename  \g@set@fontenc}}%
\AtBeginDocument{\allowdisplaybreaks[2]\let\pstamarkboth\markboth}%
\pagestyle{headings}%
\def\@captionheadfont{\small\scshape}%
\def\@captionfont{\small}%

%%
%% 3. Title page and last page
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% authors related
%% 1. Record data
%

\def\l@ValueDBname#1#2{%\l@ValueDBname{value}{DB name}
% example:\l@ValueDBname{Спиридонов, Александр Олегович}{author}%
% example:\l@ValueDBname{\KFPU }{address}%
  \expandafter\PrefixDBnameValue\expandafter{\languagename-\article@id-}{#2}{#1}}%
\def\ValuexPrefixDBname#1#2#3{\edef\@tempa{{#2}{#3}}%
  \expandafter\expandafter\expandafter\PrefixDBnameValue\@tempa{#1}}%
\def\ePrefixDBnameValue#1#2#3{%
  \edef\@tempb{{#1}{#2}{#3}}%
  \wlog{\detokenize{\ePrefixDBnameValue{#1}{#2}{#3}}(\@tempb)}%
  \expandafter\expandafter\expandafter\PrefixDBnameValue\@tempb}%
\def\PrefixDBnameValue#1#2#3{%{\languagename-\article@id-}{DB name}{value}%
  \expandafter \def\expandafter\@tempc\expandafter{\detokenize{#1#2=#3}}%
  \expandafter\ifx\csname\@tempc\endcsname\relax
    \@ifundefined{#1#2.power}{\count@\@ne
      \gdef@cxA{#1#2.list}{\csname#2@format\endcsname{1}}%
    }{%
      \e@a@Tc\count@{#1#2.power}\advance \count@\@ne
      \gdef@cxxA{#1#2.list}%
         {\csname#1#2.list\expandafter\endcsname
         \csname#2@join\expandafter\endcsname
         \csname#2@format\expandafter\endcsname\expandafter
            {\number\count@}}}%
    \gdef@cA{#1#2.\number\count@}{#3}%
    \gdef@cxA{#1#2.power}{\number\count@}%
    \glet@cc{\@tempc}{#1#2.power}%
    \glet@cc{#1#2.current}{#1#2.power}%
  \else
    \glet@cc{#1#2.current}\@tempc%
  \fi
  }%

\def\appendNumberPrefixName#1#2#3{%
  \edef\@tempa{{#2}{#3}{authors}{}{#1}}%
  \expandafter\PrefixNameNumberEndingValue@\@tempa}%
\def\appendPrefixNameNumberEndingValue#1#2#3#4#5{%
  \edef\@tempa{{#1}{#2}{#3}{#4}{#5}}%
  \expandafter\PrefixNameNumberEndingValue@\@tempa}%
\def\PrefixNameNumberEndingValue@#1#2#3#4#5{%
  \wlog{\string\PrefixNameNumberEndingValue{#1}{#2}{#3}{#4}{#5}}%
  \@ifundefined{#1#2#3#4=#5}{%
  \xdef@cA{#1#2#3#4=#5}{y}%
  \expandafter\ifx\csname#1#2#3-#4.list\endcsname\relax
    \xdef@cA{#1#2#3-#4.list}{\expandafter\noexpand\csname#2-#4@format\endcsname{#5}}%
    \xdef@cA{#1#2#3-#4-dash}{n}%
    \global\let@cc{#1#2#3-#4-beforedash}{#1#2#3-#4.list}%
  \else
    \count@ = \@nameuse{#1#2#3-#4-lastid}%
    \advance\count@\@ne
    \ifnum #5 > \count@
      \xdef@cA{#1#2#3-#4.list}{%
        \csname #1#2#3-#4.list\endcsname
        \c@list@join
        \csname #2-#4@format\endcsname{#5}}%
      \global\let@cc{#1#2#3-#4-beforedash}{#1#2#3-#4.list}%
      \xdef@cA{#1#2#3-#4-dash}{n}%
    \else
      \if n\@nameuse{#1#2#3-#4-dash}%
        \xdef@cA{#1#2#3-#4-dash}{y}%
        \expandafter\g@addto@macro\csname#1#2#3-#4.list\expandafter\endcsname\expandafter
        {\expandafter\c@list@join\csname #2-#4@format\endcsname{#5}}%
        \@nameshow {#1#2#3-#4.list}%
      \else
        \xdef@cA{#1#2#3-#4.list}{%
          \csname #1#2#3-#4-beforedash\endcsname
          \noexpand\c@list@dash%
          \expandafter\noexpand\csname #2-#4@format\endcsname{#5}}%
      \fi\fi\fi
  \xdef@cA{#1#2#3-#4-lastid}{#5}}{}}%

\def\l@author@data@#1{\@author@data@{\languagename-\article@id-}{#1}}
\def\@author@data@#1#2{% example: \l@author@data@{address}%
  \@namedef{#2}##1{%
  \@ifundefined{Num-of-common-#1#2es}{\gdef@cA{Num-of-common-#1#2es}{0}}{}%
  \expandafter\PrefixDBnameValue\expandafter{#1}{#2}{##1}%
  \la@ifundefined{author.current}%
    {\let@cc{Num-of-common-#1#2es}{#1#2.power}%
      \expandafter\expandafter\expandafter\l@ValueDBname
      \expandafter\expandafter\expandafter{\csname#1#2.current\endcsname}{Common-#2}}%
    {\appendPrefixNameNumberEndingValue{#1}{#2}{\csname #1#2.current\endcsname}{authors}{\csname\languagename-\article@id-author.current\endcsname}%
      }}}%

\def \image#1{\@namedef {\role@\e@a@Tlc.{\role@.current}.image}{#1}\@nameshow{\role@\e@a@Tlc.{\role@.current}.image}}%
\def \imageurl#1{\@namedef {\role@.\csname\languagename-\article@id-\role@.current\endcsname.imageurl}{#1}}%
\def \imageauthor{\futurelet\next\imageauthor@}%
\def \imageauthor@{\ifx\next[\expandafter\image@author@@\else\expandafter\image@author@\fi}%
\def \image@author@#1{\@namedef {\role@.\csname\languagename-\article@id-\role@.current\endcsname.imageauthor}{\textcolor{verbatimnumbers}{#1}}}%
\def \image@author@@[#1]#2{\@namedef {\role@.\csname\languagename-\article@id-\role@.current\endcsname.imageauthor}{\href{#1}{\textcolor{verbatimnumbers}{#2}}}}%
%
\def\orcid#1{\e@a@ScxA\def{\role@.\la@nameuse{\role@.current}.orcid}{#1}}%
%
\def\addtonameonce#1#2{%
  \@ifundefined{#1}%
    {\@namedef{#1}{#2}\@namedef{#1=<\detokenize{#2}>}{!}}%
    {\@ifundefined{#1=<\detokenize{#2}>}%
      {\expandafter\g@addto@macro\csname#1\endcsname{#2}}%
      {}}}%
\def\email@#1{\PrefixDBnameValue{}{email}{#1}%
  \addtonameonce{author\csname\languagename-\article@id-author.current\endcsname-email\article@id.list}{\hboxemail{#1}}%
  \@ifundefined{email\csname email.current\endcsname.author}{%
    \e@a@SclC\edef{email\csname email.current\endcsname.author}{author.current}}%
  \expandafter\ifnum \csname email\csname email.current\endcsname.author\endcsname=
      \csname\languagename-\article@id-author.current\endcsname
    \else \errmessage{Different authors \csname email\csname email.current\endcsname.author\endcsname\space and
      \csname\languagename-\article@id-author.current\endcsname\space have the same email <\csname email.\csname email.current\endcsname\endcsname>!}\fi}%
\def \email{\catcode`\_=12 \catcode`\%=12 \catcode`\$=12 \catcode`\&=12 \catcode`\"=12 \catcode`\^=12 \email@@}%
\def\email@@#1{\email@{#1}\catcode`\_=8 \catcode`\%=14 \catcode`\$=3 \catcode`\&=4 \catcode`\"=13 \catcode`\^=7 }%
\def \correspondent{\ePrefixDBnameValue {correspondent-}{email}{\csname email.current\endcsname}%
  \appendPrefixNameNumberEndingValue {}{correspondent}{\csname email.current\endcsname}{authors}%
    {\csname\languagename-\article@id-author.current\endcsname}%
  \gdef@lcA{author\la@nameuse{author.current}.envelope}{\emailicon}}%
\def\emailicon{$^{\includegraphics[width=5pt, height=4pt]{psta/envelope.pdf}}$}%
%
\def \CRediTdetails#1,{\@ifnextchar .% e.g. 1[conceptualization],. or 1,.
    {\CRediTdetailLast#1[]\@gobble}%
    {\CRediTdetailNonLast#1[]}}%
\def \CRediTdetailLast#1[{\@ifnextchar ]% e.g. 11[]
    {\ifcase#1\PSTACRediT\fi\@gobble}%
    {\CRediTLast}}%
\def \CRediTLast#1][]{#1}%
\def \CRediTdetailNonLast#1[{\@ifnextchar ]% e.g. 11[]
    {\ifcase#1\PSTACRediT\fi\CRediTjoin@\expandafter\CRediTdetails\@gobble}%
    {\CRediTNext}}%
\def \CRediTjoin@{, }%
\def \CRediTNext#1][]{#1\CRediTjoin@ \CRediTdetails}%
\def \CRediT#1#2{\e@a@Tlc\def{\role@.\csname\languagename-\article@id-\role@.current\endcsname
      .CRediT}{#2 (\CRediTdetails#1,.)}%
    \la@nameshow{\role@.\csname\languagename-\article@id-\role@.current\endcsname.CRediT}% % DEBUGDING !!!
    }%
\long\def\info#1{\long\e@a@Tlc\def{\role@.\la@nameuse{\role@.current}.info}{#1}}%
\l@author@data@{thanks}\let\thanks@\thanks
\expandafter\def\expandafter\do@thanks\expandafter#\expandafter1\expandafter{\thanks@{#1}\catcode`_=8 }%
\def \thanks{\catcode`_=12 \do@thanks}%
\l@author@data@{address}%

\renewcommand{\title}[2][]{%
    \@ifnotempty{#2}{\e@a@Tlc\def{title}{#2}\e@a@Tlc\def{shorttitle}{\let\subtitle\@gobble #2}}%
    \global\let\role@\uNDefined%
    \@ifnotempty{#1}{\e@a@Tlc\def{shorttitle}{\let\subtitle\@gobble #1}}}%
\def\shortauthors#1{\if y\psta@blind\else\e@a@Tlc\def{headlineauthors}{#1}\fi}%
\def\headlineauthors#1#2{\if y\psta@blind\else\expandafter
    \def\csname russian-headlineauthors\endcsname{#1}\expandafter
    \def\csname english-headlineauthors\endcsname{#2}}%
\def\person@#1#2{% #1=role #2-Names
    \xdef\role@{#1}%
    \l@ValueDBname{#2}{#1}%
    \expandafter\psta@extract@initials@\csname\languagename-\article@id-#1.\la@nameuse{#1.current}.initials\endcsname#2, , ,\@nil
    \expandafter\@extract@lastname\csname\languagename-\article@id-#1.\la@nameuse{#1.current}.lastname\endcsname#2,\@nil
    \la@nameshow{#1.\la@nameuse{#1.current}.initials}%
% example: \russian-author.1.initials=macro:->{А}.\,{В}.
    \gdef@lclC{#1.\la@nameuse{#1.current}.FIO}{%
        #1.\la@nameuse{#1.current}.lastname\expandafter\endcsname
      \expandafter~\csname
        \languagename-\article@id-#1.\la@nameuse{#1.current}.initials}%
% example: \russian-author.1.FIO=macro:->Головешкин~{А}.\,{В}.
    \e@a@Tlc\@extract@otherinitials@
        {#1.\la@nameuse{#1.current}.first\expandafter}%
        \csname\languagename-\article@id-#1.\la@nameuse{#1.current}.otherinitials\endcsname#2, , ,\@nil
    \la@nameshow{#1.\la@nameuse{#1.current}.otherinitials}%
% example: \russian-author.1.otherinitials=macro:->{В}.
  \e@a@Tc\@extract@firstname@{#1.\la@nameuse{#1.current}.first}#2, , ,\@nil
  \gdef@lcxxA{FirstO#1.\la@nameuse{#1.current}}%
    {\csname
      \ifnum\language=\l@russian cyr\else lat\fi @#1%
    \expandafter\endcsname\csname
      \languagename-\article@id-#1.\la@nameuse{#1.current}.initials%
    \expandafter\endcsname \expandafter
      {\csname\languagename-\article@id-#1.\la@nameuse{#1.current}.first%
        \expandafter\expandafter\expandafter \endcsname
        \expandafter\expandafter\expandafter~\csname
          \languagename-\article@id-#1.\la@nameuse{#1.current}.otherinitials%
        \endcsname}#2, , ,\@nil}%
% example: \russian-FirstOauthor.1=macro:->{А}.~{В}.~Головешкин
% \english-FirstOauthor.1=macro:->Alexey~V.~Goloveshkin
    \gdef@lcxxA{short#1.\la@nameuse{#1.current}}{\csname
      cyr@#1\expandafter\endcsname
      \csname\languagename-\article@id-#1.\la@nameuse{#1.current}.initials\expandafter\endcsname
      \csname\languagename-\article@id-#1.\la@nameuse{#1.current}.initials\expandafter\endcsname#2, , ,\@nil}%
  \gdef@lcA{#1.\la@nameuse{#1.current}}{#2}%
  \la@ifundefined{#1s.FIO}%
    {\glet@lclc{#1s.FIO}{#1.\la@nameuse{#1.current}.FIO}}%
    {\g@addto@lcxA{#1s.FIO}%
      {\expandafter\and \csname\languagename-\article@id-#1.\la@nameuse{#1.current}.FIO\endcsname}}%
  \la@ifundefined{short#1s}%
    {\glet@lclc{short#1s}{short#1.\la@nameuse{#1.current}}
  }{%
    \g@addto@lcxA{short#1s}{\expandafter\and
    \csname\languagename-\article@id-short#1.\la@nameuse{#1.current}\endcsname}}%
  \la@ifundefined{FirstO#1s}%
    {\glet@lclc{FirstO#1s}{FirstO#1.\la@nameuse{#1.current}}
  }{%
    \g@addto@lcxA{FirstO#1s}%
    {\expandafter\and
      \csname\languagename-\article@id-FirstO#1.\la@nameuse{#1.current}\endcsname}}%
  \glet@lclc{headline#1s}{\RussianEnglish{short}{FirstO}#1s}}%
\renewcommand{\author}[1]{%
  \if  y\psta@blind\person@{author}{??, ? ?} \else\person@{author}{#1}\fi
  }%
\def\@extract@otherinitials@#1#2#3,#4#5,#6\@nil{\ifx\space#4
  \@extract@otherinitials@@#1#2#5 \@nil\else
  \@extract@otherinitials@@#1#2#4#5 \@nil\fi}%
\def\@extract@otherinitials@@#1#2#3 #4\@nil{\def#1{#3}%
  \@ifempty{#4}{\def#2{}}{\@extract@initials{#4}{\edef\@tempa{\def\@nx#2{\@tempa}}}}}%
\def\psta@extract@initials@#1#2,#3,#4\@nil{\@extract@initials{#3}{\edef\@tempa{\def\@nx#1{\@tempa}}}}%
\def\@extract@firstname@#1#2,#3#4,#5\@nil{\ifx#3\space \@extract@firstname#1#4 ,\else\@extract@firstname#1#3#4 ,\fi}%
\def\@extract@firstname#1#2 #3,{\def#1{#2}}%
\def\@extract@lastname#1#2,#3\@nil{\def#1{#2}}%
\def\cyr@author#1#2#3,#4\@nil{#1~#3}%
\def\lat@author#1#2#3,#4\@nil{#2~#3}%
%
%\def\@secondofthree#1#2#3{#2}%
%\def\@thirdofthree#1#2#3{#3}%
\def\submittedby#1{\la@namedef{PSTA@recommended}{#1}}%
\def \ReceivedRevisedPublished#1 #2 #3 {\def\PSTA@history{\medskip
  \historyLineFormat{\PSTAreceived}{#1;}
  \historyLineFormat{\PSTArevised}{#2;}
  \historyLineFormat{\PSTApublished}{#3.}}\def\PSTA@stamp{#3}}%
\def \ReceivedRevisedAcceptedPublished#1 #2 #3 #4 {\def\PSTA@history{\medskip
  \historyLineFormat{\PSTAreceived}{#1;} 
  \historyLineFormat{\PSTArevised}{#2;} 
  \historyLineFormat{\PSTAaccepted}{#3;} 
  \historyLineFormat{\PSTApublished}{#4.}}\def\PSTA@stamp{#4}}%
\gdef\psta@doiversion{}%
\gdef\extrayear{}%
\def\pstaPublished#1#2{\g@addto@macro{\PSTA@history}{\historyLineFormat{\PSTApublished}{#1\rlap{ {\href{https://doi.org/\PSTAdoi\pagerange#2}{\DOIicon\quad\PSTAdoi\pagerange#2}}}}}}%
\def\pstaAccepted#1#2{\g@addto@macro{\PSTA@history}{\historyLineFormat{\PSTAaccepted}{#1\rlap{ {\href{https://doi.org/\PSTAdoi\pagerange#2}{\DOIicon\quad\PSTAdoi\pagerange#2}}}}}}%
\def\pstaCorrected#1#2#3{\g@addto@macro{\PSTA@history}{\historyLineFormat{\PSTAcorrected}{#1}}\def\PSTA@stamp{#1}\gdef\psta@doiversion{#2}\def\copyrightYear{#3}}%
\def \PublicationHistory#1 #2 #3 {%
  \let\Published\pstaPublished
  \let\Corrected\pstaCorrected
  \def\PSTA@history{\medskip
  \historyLineFormat{\PSTAreceived}{#1}\par
  \historyLineFormat{\PSTArevised}{#2}\par}#3}%
\let\ReceivedRevisedPublishedHistory\PublicationHistory
\let\copyrightYear\Year
\def \received#1 {\def\PSTA@received{#1}}%
\def  \revised#1 {\def\PSTA@revised{#1}}%
\def \accepted#1 {\def\PSTA@accepted{#1}}%
\def\published#1 {\ReceivedRevisedPublished{\PSTA@received} {\PSTA@revised} \@ifundefined{PSTA@accepted}{}{{\PSTA@accepted}} {#1} }%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% format thanks, info, image
\def\swap@fio#1, #2\endswap@fio{#2 #1}%
\def\swap@fio@#1, #2\endswap@fio{{\footnotesize{{#2}} %
  \small\textbf{#1}}}%
\def\format@info#1{{%
  \def\hboxemail##1{\hbox{\hrefemail{##1}}}%
  \hypertarget{\languagename-\article@id-author.#1}{\begingroup
    \small \hfil\textsf{{}\expandafter\expandafter\expandafter
    \swap@fio\csname\languagename-\article@id-author.#1\endcsname\endswap@fio}%
    \vadjust{\vskip2pt}\newline
    \@ifundefined{\languagename-\article@id-author.#1.info}{\la@nameuse{author.#1.address}}%
        {\la@nameuse{author.#1.info}}
    \vskip\medskipamount
    \@ifundefined{author.#1.orcid}{}{\edef\orcid@url{\@nameuse{author.#1.orcid}}%
      \hbox{\hskip3cm\llap{\hss\iDicon\quad}\quad
      \href{https://orcid.org/\orcid@url}{\scriptsize
      \expandafter\nolinkurl\expandafter{\orcid@url}}}}%
    \hbox{\hskip3cm\sffamily\scriptsize\itshape
      \la@ifundefined{author#1.envelope}{}{\bfseries}\llap
      {e-mail:}\quad \vtop{\csname author#1-email\article@id.list\endcsname}}%
    \endgroup}
  \parfillskip0pt \@@par\parfillskip0pt \@@par}}
\def\includeauthorgraphics#1{\leavevmode\llap
  {\rotatebox{90}{\rlap{\scalebox{.5}{\vbox
    {\hsize\maxdimen\noindent\Large\textsf{#1}\@@par\vskip3mm}}}}}}%

\def\author@join@info{\par \csname BetweenAuthorsInfos \endcsname}
\def\author@format@info#1{%
    \immediate\write\@auxout{\string\gdef\string\authorsinfo@languagename{\languagename}}%
    \@ifundefined{author.#1.image}%
        {\noindent\leavevmode\format@info{#1}{\parfillskip\z@\@@par}}%
        {\hbox to \hsize{\hss
            $\vcenter{\hbox{%
               \@ifundefined{author.#1.imageauthor}{}{%
                \includeauthorgraphics{\csname author.#1.imageauthor\endcsname}}%
                {\expandafter\@secondfirstoftwo\expandafter
                    {\expandafter{\csname author.#1.image\endcsname}}%
                    {\includegraphics[width=\@AuthorImageWidth]}%
        }}}\hskip2mm
         \vcenter{\vbox{\advance\hsize-\@AuthorImageWidth\advance\hsize-2mm\null\format@info{#1}{\parfillskip\z@\@@par}}}$\hss}}}%
\def\shortauthor@format#1{%
    \la@nameuse{shortauthor.#1} \authorsmark{#1}}%
\let\authorsinfo@languagename\@gobble
\def\author@format@intitle#1{\hyperlink{\la@ifundefined{authorsinfo@page}{\authorsinfo@languagename
      }{\languagename}-\article@id-author.#1}{\expandafter\expandafter\expandafter
    \swap@fio@\csname\languagename-\article@id-author.#1\endcsname\endswap@fio
    \authorsmark{#1}\la@nameuse{author#1.envelope}}}%
\def\noauthormarks{\global\let\authorsmark\@gobble}\noauthormarks
\def\author@join@intitle{, \penalty -2}%
\def\address@join{,\newline}%
\let\thanks@join=\address@join
\def\c@list@join{,\,}%
\def\c@list@dash{--}%

\def\authorsmark@#1{%
  \leavevmode \raise.7ex\hbox{\scalebox{0.75}{\textcolor
    {authorsmarks}{{\tiny\bfseries{\textsf{#1}}}}}}}%

\def\authorsmarkleft#1{\llap{\authorsmark{#1}}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% keywords related
\def\keywords#1{\e@a@Tlc\def {keywords}{#1}}%
\def\dedication#1#2{\e@a@Tlc\def {dedication}{\vbox{\hsize= #1 \noindent\textcolor[rgb]{0,0.4,0.6}{\emph{#2}}}}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% abstract related
\def\@abstractenvname{abstract}%
\long\def\abstract#1\end{\endgroup\long\global\e@a@Tlc\def{abstract}{#1}%
           \begingroup \def \@currenvir{abstract}\@endpefalse
        \end}%
\let\endabstract\@empty
%%% for maketitle {{{1
\def\check@author@attribute@#1{{%
    \expandafter \ifx\csname russian-\article@id-#1\expandafter\endcsname\csname english-\article@id-#1\endcsname \else\errmessage
      {#1 isn't the same in different languages (\la@nameuse{#1} != \@nameuse{#1})!}\fi}}%
 \@namedef{address-authors@format}#1{#1}%
 \@namedef{thanks-authors@format}#1{#1}%
\def\check@author@attribute#1{{%
    \dimen@\z@
    \@namedef{#1@format}##1{%
      \check@author@attribute@{#1##1-authors\article@id.list}%
      \e@a@Tlc\ifx{#1##1-authors\article@id.list}\relax\else
        \e@a@Tlc\ifnum{author.current}>1
        %\@nameshow{address-authors@format}%
          \setbox\@tempboxa=\hbox{\authorsmark@{%
            \la@nameuse{#1##1-authors\article@id.list}\kern.2em}}%
          %\showbox\@tempboxa
          \wlog{wd(#1-authormarks) = \the\wd\@tempboxa}%
          \ifdim\dimen@<\wd\@tempboxa
            \dimen@=\wd\@tempboxa\fi\fi\fi}%
    \@namedef{author-#1@join}##1##2{}%
    \@namedef{#1@join}{}%
    \la@nameuse{#1.list}%
    \gdef@lcxxA{#1-authors-len}{\the\dimen@}}}%
\def\@email@format#1{%
  \@ifundefined{email#1-authors\article@id.list}{}%
      {\@ifundefined{email#1}{}{
        \authorsmark{\@nameuse{email#1-authors\article@id.list}{\kern.2em}}%
  \la@nameuse{email.#1}}}}%
\def\author@atribute@format#1#2{%
%\tracingall
  \la@ifundefined{#2#1-authors\article@id.list}{}%
      {\authorsmarkleft{\la@nameuse{#2#1-authors\article@id.list}{\kern.2em}}%
  \la@nameuse{#2.#1}}}%
\def\list@address@or@thanks#1{%
  \la@ifundefined{Common-#1.list}{}{%
    \check@author@attribute{Common-#1}%
    \l@use@format@join{Common-#1}%
    {##1{\la@nameuse{#1.##1}}}%
    {{\newline}}}%
  \@ifundefined{Num-of-common-\languagename-\article@id-#1es}{}{%
    \ifnum\@nameuse{Num-of-common-\languagename-\article@id-#1es} < \la@nameuse{address.current}%
      \la@nameshow{#1-authors-len}%
      \par\parindent\z@\leftskip=\la@nameuse{#1-authors-len}%
      \l@use@format@join{#1}%
        {##1{\author@atribute@format{##1}{#1}%
          \ifnum\@nameuse{Num-of-common-\languagename-\article@id-#1es}<##1 %
            \global\let\g@tempc\newline
          \else\global\let\g@tempc\@empty\fi}}%
        {{{\g@tempc}}}\fi}}%
\def\l@use@format@join#1#2#3{\leavevmode
  \la@ifundefined{#1.list}{%
    \@ifundefined{#1.list}{}{%
      \@namedef{#1@format}#2%
      \@namedef{#1@join}#3\@nameuse{#1.list}%
  }}{%
    \check@author@attribute{#1}%
    \@namedef{#1@format}#2%
    \@namedef{#1@join}#3\la@nameuse{#1.list}}}%
\def\email@format#1{\authorsmark{\@nameuse{email\@nameuse{correspondent-email.#1}.author}}\correspondent@format@{\@nameuse{correspondent-email.#1}}}%
\def\correspondent@format@#1{\emailicon\!\hrefemail{\csname email.#1\endcsname}}%
\def\hrefemail#1{\href{mailto: #1}{#1}}%
\def\email@join{, \penalty 2 }%
\def\notitlepage#1#2{\@namedef{done#1#2}{!}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% maketitle
\font\colonTitlefont=larm1000  at 6pt%
\font\boldcolonTitlefont=labx1000  at 6pt%
\gdef\psta@leftline@{{\headline@language@\pstaleftline}}%
\gdef\psta@rightline@{{\headline@language@\pstarightline}}%
\gdef\pstamarkleft#1{\gdef\pstaleftline{#1}\psta@mark@update}%
\gdef\pstamarkright#1{\gdef\pstarightline{#1}\psta@mark@update}%
\gdef\pstamarkboth#1#2{\gdef\pstaleftline{#1}\gdef\pstarightline{#2}\psta@mark@update}%
\gdef\psta@mark@update{\latexmarkboth{\protect\psta@leftline@}{\protect\psta@rightline@}}%
\gdef\headline@language@{\let\languagename\headline@language\let\language@group\languagename
    \patchpdfheadlineencoding}%
\def\JournalRubric#1{\def\JournalRubric@{\ifcase #1\PSTArubric\fi}}%
\def\ArticleType#1{\def\ArticleType@{\csname PSTA#1\endcsname}}\ArticleType{RAR}%
\def\switch@language@icon@#1#2{%
  \@ifundefined{\article@id-the@first@page}{\expandafter
      \def\csname\article@id-the@first@page\endcsname{\the\c@page}}{}%
  \hypertarget{#1-\article@id-page\number\c@page}\strut
  %\wlog{hypertarget{#1-\article@id-page\number\c@page}}\strut
  \@ifundefined{#1-\article@id-named@page.list}{%
    \wlog{undefined{#1-\article@id-named@page.list}}%
  }{%
    \let\named@page@join\relax
    \def\named@page@format##1{%
      \ifnum\the\c@page < \@nameuse{#1-\article@id-\@nameuse{#1-\article@id-named@page.##1}@page} 
   %     \wlog{\the\c@page < \@nameuse{#1-\article@id-\@nameuse{#1-\article@id-named@page.##1}@page}}%
      \else
   %     \wlog{\the\c@page !< \@nameuse{#1-\article@id-\@nameuse{#1-\article@id-named@page.##1}@page}}%
       % \ifnum \@nameuse{#2-\article@id-named@page.current}>##1
        \@ifundefined{#2-\article@id-\@nameuse{#1-\article@id-named@page.##1}@page}{%
          \wlog{undefined{#2-\article@id-\@nameuse{#1-\article@id-named@page.##1}@page}}%
        }{%
          \@tempcnta\the\c@page
          \advance\@tempcnta by\@nameuse{#2-\article@id-\@nameuse{#1-\article@id-named@page.##1}@page}%
          \advance\@tempcnta-\@nameuse{#1-\article@id-\@nameuse{#1-\article@id-named@page.##1}@page}\relax
   %     \wlog{\the\c@page--\@nameuse{#1-\article@id-\@nameuse{#1-\article@id-named@page.##1}@page}
   %         +\@nameuse{#2-\article@id-\@nameuse{#1-\article@id-named@page.##1}@page}=\the \@tempcnta}%
        \@ifundefined{#1-\article@id-thebibliography@page}{}%
           {\ifnum \c@page>\csname#1-\article@id-maketitle@page\endcsname
                \@ifundefined{#2-\article@id-thebibliography@page}
                  {\@tempcnta=\@abspage@last\advance\@tempcnta \csname \article@id-the@first@page\endcsname }%
                  {\ifnum \@nameuse{#2-\article@id-thebibliography@page}
                        <\numexpr\@nameuse{#2-\article@id-maketitle@page}+2\relax
                    \ifnum \c@page<\csname#1-\article@id-thebibliography@page\endcsname
    %                  \wlog{{#1}{#2}(\the\c@page<\csname#1-\article@id-thebibliography@page\endcsname)&(\the
    %                        \c@page>\csname#1-\article@id-maketitle@page\endcsname)&(\@nameuse
    %                        {#2-\article@id-thebibliography@page}<\numexpr\@nameuse{#2-\article@id-maketitle@page}+2\relax)}%
                      \@tempcnta=\numexpr\@abspage@last+\the@first@page\relax
                    \fi\fi}\fi}%
        }\fi
    %\wlog{{#2-page \the\@tempcnta<?>\@abspage@last+\the@first@page-1}}%
    }{%
    \@nameuse{#1-\article@id-named@page.list}%
    \ifnum\the\@tempcnta<\numexpr\@abspage@last+\the@first@page\relax
     % \wlog{hyperlink{#2-\article@id-page\the\@tempcnta} \numexpr\@abspage@last+\the@first@page}%
      $\vcenter{\hbox{\hyperlink{#2-\article@id-page\the\@tempcnta}{\includegraphics[width=6mm]{psta/leave-#1}}}}$\fi}}}%
\AtBeginDocument{\edef\the@first@page{\the\c@page}}\let\article@id\@empty
\def\maketitle{\par \if y\psta@blind \vfill\fi\pagebreak
  \@ifundefined{IssueDOI}{\let\IssueDOI\@gobble}{}%
  \@ifundefined{pagerange}{\global\let\pagerange\@empty}{}%
  \global\let\article@lang\languagename
  \RussianEnglish{\set@headline@encoding{russian}}{\set@headline@encoding{english}}%
   \wlog{maketitle \languagename}%
  \edef\psta@sandbox{%
    \@ifundefined{article@lang}{}{\article@lang-}%
    \@ifundefined{article@id}{}{\article@id-}}%
  \@topnum\z@ % this prevents figures from falling at the top of page 1
  \let@lclc{prev-prev-maketitle}{prev-maketitle}%
  \let@lclc{prev-maketitle}{maketitle}%
  \la@ifundefined{maketitle}{%
    \la@namedef{maketitle}{}%
    \topmargin=\RussianEnglish{11}{12}mm
    \textheight=\RussianEnglish{170}{167}mm
    \textwidth=\RussianEnglish{116}{111}mm
    \linewidth=\textwidth \columnwidth=\textwidth \hsize=\textwidth
    \xdef\PSTAhsize{\the\hsize}%
    \evensidemargin=\RussianEnglish{16}{18.5}mm
    \oddsidemargin =\RussianEnglish{16}{18.5}mm
    \def\Russian{\selectlanguage{russian}}%
    \def\English{\selectlanguage{english}}%
    \expandafter\@maketitle\expandafter{\languagename}}{}}%
\def\@tempa#1-#2-#3.{\xdef\psta@lastpage{#2}}%
\@ifundefined{pstarussianpartonly}{}{%
  \expandafter\@tempa\pagerange-3-.%
  \let\maketitle@\maketitle
  \long\def\maketitle#1\maketitle{%
    \let\switch@language@icon\relax
    \advance\c@page\psta@lastpage
    \divide\c@page 2 \Russian
    \maketitle@}}%
\def\NamedLanguagePage#1{\global\expandafter\edef\csname #1@page\endcsname{\the\c@page}%
  \write\@auxout{\string\NamedLanguagePage@{\article@lang-\article@id-}{#1}{\the \c@page}}}%
\def\NamedLanguagePage@#1#2#3{\global\@namedef{#1#2@page}{#3}\@nameshow{#1#2@page}%
  \PrefixDBnameValue{#1}{named@page}{#2}}%
\edef\stringhash{\string#}%
\def\second@bgroup@third@minus@first@egroup#1#2#3{#2{#3-#1}}%
\def\add@prefix#1#2{\@ifundefined{no-prefix-\string#2}{\expandafter
  \let\csname no-prefix-\string#2\endcsname#2}{}\expandafter
  \second@bgroup@third@minus@first@egroup\csname no-prefix-\string#2\endcsname
  {\def#2}{#1}}%
\def\@maketitle#1{%
  \selectlanguage{#1}%
  \ifx\russian@lang\article@lang
    \let\@@ref\gost@@ref \let\@ifgost\@firstoftwo \let\LastPunct\empty
  \else
    \let\@@ref\ams@@ref\let\@ifgost\@secondoftwo\let\LastPunct.\fi
  \@ifundefined{pstaenglishspartonly}{%
    \setcounter{figure}{0}
    \setcounter{table}{0}
    \setcounter{section}{0}
    \setcounter{equation}{0}
    \setcounter{footnote}{0}
    \@ifundefined{c@theorem}{}{\setcounter{theorem}{0}}\add@prefix{#1}\theHtheorem
    \@ifundefined{c@remark}{}{\setcounter{remark}{0}\add@prefix{#1}\theHremark}
    \@ifundefined{c@problem}{}{\setcounter{problem}{0}\add@prefix{#1}\theHproblem}
    \@ifundefined{c@axiom}{}{\setcounter{axiom}{0}\add@prefix{#1}\theHaxiom}
    \@ifundefined{c@hypothesis}{}{\setcounter{hypothesis}{0}\add@prefix{#1}\theHhypothesis}
    \@ifundefined{c@note}{}{\setcounter{note}{0}\add@prefix{#1}\theHnote}
    \@ifundefined{c@definition}{}{\setcounter{definition}{0}\add@prefix{#1}\theHdefinition}
    \@ifundefined{c@corollary}{}{\setcounter{corollary}{0}\add@prefix{#1}\theHcorollary}
    \@ifundefined{c@example}{}{\setcounter{example}{0}\add@prefix{#1}\theHexample}
    \@ifundefined{c@lemma}{}{\setcounter{lemma}{0}\add@prefix{#1}\theHlemma}
    \@ifundefined{c@statement}{}{\setcounter{statement}{0}\add@prefix{#1}\theHstatement}
    \@ifundefined{c@thm}{}{\setcounter{thm}{0}\add@prefix{#1}\theHthm}
    \@ifundefined{c@proposition}{}{\setcounter{proposition}{0}\add@prefix{#1}\theHproposition}
    \expandafter\add@prefix\expandafter{\psta@sandbox}\theHfigure
    \expandafter\add@prefix\expandafter{\psta@sandbox}\theHtable
    \expandafter\add@prefix\expandafter{\psta@sandbox}\theHsection
    \@ifundefined{subcaption}{}%
          {\renewcommand\thesubfigure{\textit{\ifx\russian@lang\article@lang\pstarus\alph{subfigure}\else\alph{subfigure}\fi}}}%
    \@ifundefined{@saved@thm}{\let \@saved@thm\@thm}{}%
      \def\@thm{\relax\ifvmode\pagebreak[2]\else\pagebreak[1]\fi \vskip\parskip\@saved@thm}%
    \ifx\russian@lang\article@lang \def\fps@figure{ht}\def\fps@table{ht}\else \def\fps@figure{tbp}\def\fps@table{tbp}\fi%
    \@ifundefined{no@prefix@InnerCite}{\let\no@prefix@InnerCite\InnerCite}{}%
    \edef\InnerCite##1{\noexpand\no@prefix@InnerCite{\noexpand#1-\article@id-##1}}%
    \@nameshow{InnerCite}%
  %  \@ifundefined{no@prefix@eqref}{\let\no@prefix@eqref\eqref}{}%
  %  \def\eqref##1{\no@prefix@eqref{#1-##1}}%
  %  \@nameshow{eqref}%
  %  \@nameshow{no@prefix@eqref}%
    \write\@auxout{\string\@ifundefined{nnewlabel}{\string\let\string\nnewlabel\string\newlabel}{}%
      \string\def\string\newlabel \stringhash1{\string\nnewlabel{#1-\stringhash
        1}}}
    \@ifundefined{no@prefix@hyperref}{\let\no@prefix@hyperref\hyperref}{}%
    \def\hyperref[##1]##2{\no@prefix@hyperref[#1-##1]{##2}}%
  %  \@ifundefined{no@prefix@subref}{\let\no@prefix@subref\subref}{}%
  %  \def\subref##1{\no@prefix@subref{#1-##1}}%
    \@ifundefined{no@prefix@ref}{\let\no@prefix@ref\ref}{}%
    \def\ref##1{\no@prefix@ref{#1-##1}}%
    \@ifundefined{no@prefix@autoref}{\let\no@prefix@autoref\autoref}{}%
    \def\autoref##1{\no@prefix@autoref{#1-##1}}%
    \def\Altref##1##2{{\hyperref[##2]{##1~\no@prefix@ref*{#1-##2}}}}%
  }{%
    \def\Altref##1##2{{\hyperref[##2]{##1}~\ref{##2}}}}%
  \let\longref\Altref
  \ifx\russian@lang\article@lang\make@title@pages{#1}{english}\else\make@title@pages{#1}{russian}\fi}%
\def\title@bookmark #1\subtitle #2\relax{\pdfbookmark[0]{#1}{\psta@sandbox maketitle}}%
\def\killextrapage{\clearpage \let \@outputpage\relax}
\newif \ifHugeTitlepage
\def\make@title@pages#1#2{\par \break
  \NamedLanguagePage{maketitle}%
  \e@a@Tlc\ifnum{author.current}>1
    \global\let\authorsmark\authorsmark@\wlog{authorsmarks on!}\fi
  \thispagestyle{firstpage}% this sets first page specifications
    \normaltopskip0pc\relax
    \topskip0pc\relax
  \let\par\@@par
  \topskip\z@
  \setbox\@tempboxa\vbox{{\ifHugeTitlepage\tiny\else\scriptsize\fi
    \noindent$\copyright$ {\hyperlink{\@ifundefined{#1-\article@id-authorsinfo@page}{#2}{#1}-\article@id-authorsinfo}{\la@nameuse{authors.FIO}}}%
    \hskip2ptplus80cm\copyrightYear \hskip0ptplus280cm
    \hbox{\relax}\hskip 2mmplus3cm$\vcenter
      {\hbox{\csname journallicense\endcsname}}$\parfillskip\z@ \par
    \medskip
    \noindent{\footnotesize\textsf{%
      \@ifundefined{pstaotherpages}{}{%
        \href{\JournalURL read/psta\Year\string_\Issue
          \string_\pstaotherpages.pdf}{%
            \textsf{\linktootherlanguagepaper:}\hskip 2mmplus7cm
            \textit{\JournalURL read/psta\Year\string_\Issue
            \string_\pstaotherpages.pdf}}}}\parfillskip\z@\par}%
    }}%
    \enlargethispage
    {\dimexpr-\ht\@tempboxa-\dp\@tempboxa-1pc\relax}%
  \pstamarkboth{\hyperlink{\@ifundefined{#1-\article@id-authorsinfo@page}{#2}{#1}-\article@id-authorsinfo}{\@nameuse{#1-\article@id-headlineauthors}}}%
    {{\hyperlink{\psta@sandbox abstract}{\@nameuse{\psta@sandbox shorttitle}}}}%
  \wlog{{hyperlink{\@ifundefined{#1-\article@id-authorsinfo@page}{#2}{#1}-\article@id-authorsinfo}{}}%
    {{hyperlink{\psta@sandbox abstract}{}}}}%
  \begingroup
   \let\@makefnmark\relax  \let\@thefnmark\relax
   \if y\psta@blind \else\vbox to \z@{\vss  \unvbox\@tempboxa \vskip-\vsize}\fi
   \vskip-5mm
   \hbox to\hsize{\tiny
       \scalebox{0.9}{\textit\ArticleType@} \hfill{ }%
        \scalebox{0.85}{\hbox{\textsc{\JournalRubric@}}}}%
   \c@footnote\z@
   \e@a@Tlc\ifx{headlineauthors}\relax\def\pstaleftline{\pstarightline}\fi
   \normalfont\ifHugeTitlepage\scriptsize\else\small\fi
    \csname makecrossmark\endcsname
   \@ifundefined{setsubjclassUDC}{\bigskip}{\noindent\@nameuse{setsubjclassUDC}}%
     {\noindent\tiny\@ifundefined{doi@link}{}{\doi@link{\pagerange}}\par}%
     \psta@ajust@vskips
   \ifHugeTitlepage\else\vskip \bigsoftskipamount\fi
   \vskip \bigsoftskipamount
   {\ifHugeTitlepage\fontsize{10}{11\p@}\else\fontsize{11}{12\p@}\fi\selectfont\relax
   \centering
     \def\\{\protect\linebreak}%
     \la@ifundefined{title}{}{%
       \let\subtitlepunct\displaysubtitlemode
       \let\subtitlespace\displaysubtitlemode
        \ifHugeTitlepage\else\Large\fi\bfseries
       {\la@nameuse{title}}}\par}%
  {\expandafter\expandafter\expandafter\title@bookmark
  \csname \languagename-\article@id-title\endcsname\subtitle\relax}% 
   \vskip \ifHugeTitlepage\smallerskipamount\else\bigsoftskipamount\fi
   {\hbox to\hsize{\hss\la@nameuse{dedication}}\@@par}
   \vskip \ifHugeTitlepage\smallerskipamount\else\bigsoftskipamount\fi
   \if y\psta@blind \HideFromPeer{\pstahiddenauthorsname}\par\medskip\else
     {\parindent\z@
       \check@author@attribute{thanks}%
       \check@author@attribute{address}%
       \check@author@attribute@{author.current}%
       \let\author@format\author@format@intitle\let\author@join\author@join@intitle
       \la@nameuse{author.list}{}%
       \rightskip=\z@ plus1fill
       \tiny\sffamily\selectfont
       \par\smallskip
       \parindent=\z@
       \@nameshow {Num-of-common-#1-addresses}
       \la@nameshow{address.current}
       \list@address@or@thanks{address}%
        \par
       \rmfamily\itshape
       \leftskip\z@
       \@nameuse{correspondent-email\article@id.list}%
%        \hskip 1ptplus5cm\parfillskip\z@\rightskip \z@
%        \tiny$($\textit{%
%        \@ifundefined{#1-authorsinfo@page}{%
%          \@ifundefined{#2-authorsinfo@page}{}{%
%             \more@info@inAltLang\hyperlink
%               {#2-authorsinfo}{\@nameuse{#2-authorsinfo@page}}}}{%
%          \moreonthis@\hyperlink
%               {#1-authorsinfo}{\@nameuse{#1-authorsinfo@page}}}}$)$
    \@@par}\fi
   \ifHugeTitlepage\else\vskip \bigsoftskipamount\fi
   \vskip \bigsoftskipamount
   \textsf{\relax\h@link@ref{#2-\article@id-abstract}{\abstractname}{\abstractname}. }%
   \label{abstract}%
   {\parindent 1em
     \expandafter\hypertarget
     \expandafter{#1-\article@id-abstract}{\la@nameuse{abstract}}%
     \@ifundefined{#1-\article@id-thebibliography@page}{}{%
        \ifnum\numexpr\@nameuse{#1-\article@id-thebibliography@page}-\@nameuse{#1-\article@id-maketitle@page}\relax<3
           {(\emph{\inotherlanguagename}).}\else
        \@ifundefined{#2-\article@id-thebibliography@page}{}{%
          \ifnum\numexpr\@nameuse{#2-\article@id-thebibliography@page}-\@nameuse{#2-\article@id-maketitle@page}\relax>3
            \ifnum\numexpr\@nameuse{#1-\article@id-thebibliography@page}\relax
              >\numexpr\@nameuse{#2-\article@id-thebibliography@page}\relax (\emph{\csname abs#2#1name\endcsname})\else 
              (\emph{\csname abs#1#2name\endcsname})\fi
            \ifx\languagename\russian@lang\else.\fi\fi}\fi}\par}%
  %\@ifundefined{pstaotherpages}%
   %{\ \expandafter\ifx\csname #1@lang\endcsname\article@lang{\footnotesize
   %  {\hyperlink{#2.abstract}{\hskip\z@ plus\hsize
   %\linebreak[1]\strut\hskip\z@ plus\hsize
   %$($\textit{\foreignlanguage{#2}{\linktootherlanguageabstract}~\pageref{#2.abstract}}$)$}%
   %  \parfillskip\z@\par
   %      }}{}\else\hyperlink{#2.abstract}{(\emph
   %        {\inotherlanguagename}).}\fi\par}{\par}}%
  \medskip
  \textsf{\keywordsname:\enspace}{\la@nameuse{keywords}}\@@par
  \RussianEnglish{}{%
    \@ifundefined{setsubjclass2020}{%
      \@ifundefined{setsubjclass2010}{}{\medskip\@nameuse{setsubjclass2010}}%
      }{\medskip\@nameuse{setsubjclass2020}}}\@@par
  \if y\psta@blind  \@ifundefined{@Reviewer}{}{\noindent\@Reviewer. }%
  \else
    \medskip
    {\la@ifundefined{thanks.list}{}{%
      \textsf{\PSTAacknowledgments: }\list@address@or@thanks{thanks}}%
    \let\PrintURL@\PrintURL\let\PrintDOI@\PrintURL
    \let \IsAmsBibKeys\@firstofone
    \par
    }\vskip \bigsoftskipamount
    \let\virtualpunct.
    \textsf{\SSylkaa}:
      {\let\virtualpunct\@empty\spaceskip2ptplus4pt
      \la@ifundefined{\RussianEnglish{authors.FIO}{FirstOauthors}}{}{%
        \la@ifundefined{authorsinfo@page}{}{\hyperlink{\la@ifundefined
          {authorsinfo@page}{\authorsinfo@languagename}{\languagename}-\article@id-authorsinfo}}%
        {\RussianEnglish{\la@nameuse{authors.FIO}}{\la@nameuse{FirstOauthors}.} }}%
      \textit{\let\\\empty\la@nameuse{title}}\RussianEnglish{ /\!/}{.} \@ifundefined
          {#1PublicationInfo}{\PublicationInfo}{\@nameuse{#1PublicationInfo}} %
     \@ifundefined{#1-\article@id-thebibliography@page}{}{%
        \ifnum\numexpr\@nameuse{#1-\article@id-thebibliography@page}-\@nameuse{#1-\article@id-maketitle@page}\relax<3
           {(\emph{\inrussname}).}\else
          \@ifundefined{#2-\article@id-thebibliography@page}{}{%
            \ifnum\numexpr\@nameuse{#2-\article@id-thebibliography@page}-\@nameuse{#2-\article@id-maketitle@page}\relax>3
              \wlog{#1#2name=\csname#1#2name\endcsname}%
              \ifnum\numexpr\@nameuse{#1-\article@id-thebibliography@page}\relax
                >\numexpr\@nameuse{#2-\article@id-thebibliography@page}\relax (\emph{\csname#2#1name\endcsname})\ifx\languagename\russian@lang\else.\fi\else 
                (\emph{\csname#1#2name\endcsname}).\fi\fi}\fi} { }
      \penalty0\PublicationLink{\pagerange}}%
   \rightskip \z@ \parfillskip \z@ plus2\hsize\@@par\medskip\pagebreak[1]
 \fi
 \endgroup
 \let\thebibliography\REbibliography
 \if\psta@blind y\hugeskip\pagebreak\fi
}%
\newif\iftransbibliography
\def\maybespace{\hskip1ptplus.5\hsize\strut\penalty-2000}%
\def\h@link@ref#1#2#3{\@ifundefined{pstaotherpages}{\hyperlink{#1}{#2}}{%
    %\href{\JournalURL read/psta\Year\string_\Issue\string_\pstaotherpages.pdf}%
    {#3}}}%
%%% makefinish {{{1
\def\makefinish{%
  \if y\psta@blind \else
    \medskip
    {\scriptsize\csname PSTA@history\endcsname}%
    \medskip
    \let\\\space
    \la@ifundefined{PSTA@recommended}{}{{%
      \noindent\leavevmode
      {\small\PSTArecommended}\hskip 1emplus500cm
      \textit{\la@nameuse{PSTA@recommended}}\leftskip0ptplus5cm
      \parfillskip0pt\@@par}}%
    \csname BeforeAuthorsInfos \endcsname
    \makeauthorsinfo
    \vskip0ptplus3cm\fi}%

\def\Appendixes{\let\enddoc@text@@\enddoc@text@\let\enddoc@text@\relax\enddoc@text\let \enddoc@text\enddoc@text@@}%
\def\bib@endgroup{}%
\def\AuthorImageWidth#1{\gdef\@AuthorImageWidth{#1}}\AuthorImageWidth{30mm}%
\long\def\BeforeAuthorsInfos#1{\expandafter\gdef\csname BeforeAuthorsInfos \endcsname{#1}}%
\def\BeforeEnglishRefs#1{\expandafter\gdef\csname BeforeEnglishRefs \endcsname{#1}}%
\def\BetweenAuthorsInfos#1{\expandafter\gdef\csname BetweenAuthorsInfos \endcsname{#1}}\BetweenAuthorsInfos{\smallskip }%
\def\thebibliographyinEnglishReal{\transbibliographytrue{%
    \csname BeforeEnglishRefs \endcsname }\small \theenglishbibliography}%
\def\PstaFinalSkip#1{\expandafter\gdef\csname PstaFinalSkip \endcsname{#1}}\expandafter\gdef\csname PstaFinalSkip \endcsname{\vskip 0ptplus.5\vsize\break}%
\def\newlineindent{\hfill\break\hbox{\strut\qquad}}%
\def\historyLineFormat#1#2{\hbox to 56mm{\textsl{#1}\hss{\tiny#2}}}%
\def\CRediTs{\ifcase\la@nameuse{author.current}\or\else
        \@ifundefined{\languagename-\article@id-author.1.CRediT}{\emph{\PSTAnoCRediTstext}}{\PSTACRediTstext:
        \let\author@format\author@format@CRediTs\let\author@join\relax
        \la@nameuse{author.list}}.
     \par\fi}
\def\ConflictsOfIntersts#1{\l@arg\def{PSTAconflictsofinterests}{#1}}
\def\author@format@CRediTs#1{\ifcase#1\or \else; \fi\emph{\@nameuse{\languagename-\article@id-FirstOauthor.#1}}~\--- \@nameuse{\languagename-\article@id-author.#1.CRediT}}%
\def\@ifoneauthor#1#2{\ifcase\la@nameuse{author.current}\or#1\else#2\fi}%
\def\makeauthorsinfo{%
        \label{infO}%
        %\microtypecontext{expansion=sloppy}%
         \let\author@format\author@format@info\let\author@join\author@join@info
        %\show\person@body
        \la@ifundefined{author.current}{}%
        {%
          \noindent\hypertarget{\languagename-\article@id-authorsinfo}{\strut}\section*{\@ifoneauthor\oneauthor\manyauthors:}%
            \nobreak
       \la@nameuse{author.list}%
    \par}%
    \NamedLanguagePage{authorsinfo}%
    \medskip
    \CRediTs\nobreak\par
    \emph{\@ifoneauthor\PSTAconflictofinterests\PSTAconflictsofinterests.}\nobreak\@@par}

\def\makepstaQ{%
    \expandafter\ifx\csname psta-Q\endcsname\relax\else
    \bigskip\par%\noindent
    \textbf{{\itshape \PSTAjouQ\/}:}%
    \csname psta-Q\endcsname\fi
    \expandafter\ifx\csname psta-A\endcsname\relax\else
    \par\textbf{{\itshape \PSTAjouA\/}:}%
    \csname psta-A\endcsname \vfill\fi
    \bgroup\expandafter\ifx\csname psta-In\endcsname\relax\else
    \bigskip\small\par\textit{\Postupila}%
    \csname psta-In\endcsname.\fi
    \egroup}%

%\def\short@author#1{\l@nameuse{#1.shortauthor}}%
\def\displaysubtitlemode{\unskip\\[1ptplus1pt] \normalsize \itshape}%
\def\subtitlerelax#1\relax{}%
\def\subtitle{\futurelet\@next\subtitle@}%
\def\subtitle@{\ifx\@next(\expandafter\subtitle@@@
  \else\expandafter\subtitle@@\fi}
\def\subtitle@@@(#1){\subtitlespace$($#1$)$}%
\def\subtitle@@#1{\subtitlepunct\MakeTextUppercase{#1}}%
\def\subtitlepunct{\unskip. }%
\def\subtitlespace{ }%
%%
%% 3. Sectioning
%%
\def\section{\@startsection{section}{1}%
  \normalparindent{\bigskipamount}{\smallskipamount}%
  {\normalfont\sffamily\bfseries\raggedright}}%
\def\subsection{\@startsection{subsection}{2}%
  \normalparindent{\biggerskipamount}{\smallskipamount}%%
  {\normalfont\sffamily\bfseries\raggedright}}%
\def\subsubsection{\@startsection{subsubsection}{3}%
  \normalparindent{\medskipamount}{\smallskipamount}%%
  {\normalfont\sffamily\itshape\raggedright}}%
\def\paragraph{\@startsection{paragraph}{4}%
  \normalparindent{\smallerskipamount}{\parskip}%%
  {\normalfont\sffamily\raggedright}}%
\def\subparagraph{\@startsection{subparagraph}{5}%
  \z@{2\psta@v@pt}{-\fontdimen2\font\raggedright}%
  {\normalfont\sffamily}}%
\def\@makechapterhead#1{\global\topskip 7.5pc\relax
  \begingroup
  \fontsize{\@xivpt}{18}\sffamily\bfseries\raggedright
    \ifnum\c@secnumdepth>\m@ne
      \leavevmode \hskip-\leftskip
      \rlap{\vbox to\z@{\vss
          \hbox{\hskip\normalparindent\normalsize\sffamily\mdseries
              \MakeTextUppercase\@xp{\chaptername}\enspace\thechapter}%
          \vskip 3pc}}\hskip\leftskip\fi
     \hskip\normalparindent#1\par \endgroup
  \skip@34\p@ \advance\skip@-\normalbaselineskip
  \vskip\skip@ }%
\def\@makeschapterhead#1{\global\topskip 7.5pc\relax
  \begingroup
  \fontsize{\@xivpt}{18}\sffamily\bfseries\raggedright
  #1\par \endgroup
  \skip@34\p@ \advance\skip@-\normalbaselineskip
  \vskip\skip@ }%
\def\appendix{\par
  \c@chapter\z@ \c@section\z@
  \let\chaptername\appendixname
  \def\thechapter{\@Alph\c@chapter}}%
%%
%% 3. Lists
%%
\def\@listI{\leftmargin\leftmargini \parsep\z@skip
  \topsep\listisep \itemsep\z@skip
  \listparindent\normalparindent}%
\let\@listi\@listI
\def\@listii{\leftmargin\leftmarginii
  \labelwidth\leftmarginii \advance\labelwidth-\labelsep
  \topsep\z@skip \parsep\z@skip \partopsep\z@skip \itemsep\z@skip}%
\def\@listiii{\leftmargin\leftmarginiii
  \labelwidth\leftmarginiii \advance\labelwidth-\labelsep}%
\def\@listiv{\leftmargin\leftmarginiv
  \labelwidth\leftmarginiv \advance\labelwidth-\labelsep}%
\def\@listv{\leftmargin\leftmarginv
  \labelwidth\leftmarginv \advance\labelwidth-\labelsep}%
\def\@listvi{\leftmargin\leftmarginvi
  \labelwidth\leftmarginvi \advance\labelwidth-\labelsep}%
\newskip\listisep
\listisep\smallskipamount
\def\@listIZ{\leftmargin18pt \parsep=.5\smallskipamount
  \topsep2\parsep \itemsep\z@skip  \listparindent\normalparindent}%
\AtBeginDocument{\leftmargini=\parindent
\leftmarginii=0.6667\parindent
\leftmarginiii=1.3333\parindent
\def\labelenumi{{\upshape\footnotesize
    \textsf{(\emph{\theenumi})\!}}}%
\def\labelitemi{{$\m@th\scriptstyle \bullet$}}}%
\renewenvironment{quotation}{\list{}{%
    \leftmargin\parindent \listparindent\normalparindent
    \itemindent\parindent
    \rightmargin\leftmargin \parsep\z@ \@plus\p@}%
  \item[]%
}{%
  \endlist
}%
\if y\load@fancyvrb\input {psta/verbvert.sty}\fi
\gdef\backref#1{\@ifundefined{\psta@sandbox thebibliography@page}{}{\ifnum\numexpr\@nameuse
    {\psta@sandbox thebibliography@page}-\@nameuse{\psta@sandbox maketitle@page}\relax>2 { }
   \hskip-2ptminus2pt\textcolor{backrefcolor}{$\uparrow${\tiny#1}}\fi}}%
\def\@@itempenalty{\@M \@itempenalty=\saved@itempenalty }%
\def\@@beginparpenalty{\@M \let\@beginparpenalty\saved@beginparpenalty}%
\def\REbibliography#1{%
  \def\Bibitem{\English\BRorg@bibitem}%
  \def\RBibitem{\Russian\BRorg@bibitem}%
  \RussianEnglish{\let \bibitem\RBibitem
     \interlinepenalty 4000
     \clubpenalty 4000 \widowpenalty 4000
   }{\let\bibitem\Bibitem \let\PrintRINC\PrintNothing
     \interlinepenalty 4000
     \clubpenalty 8000 \widowpenalty 8000
     \def\RBibitem{\errmessage{Command \string\RBibitem\space
        is not available in the english bibliography!}\bibitem }}%
    \leftmargini\z@
    \section*{\thereferences}\expandafter
    \refstepcounter{aux@counter}\def\@biblabel ##1{{[##1]}}%
    \edef\saved@itempenalty{\the\@itempenalty}%
    \@itempenalty=\@@itempenalty
    \let\saved@beginparpenalty\@beginparpenalty
    \let \@beginparpenalty\@@beginparpenalty
    \let \DOI=\doi
    \small
    \def\@bibitem##1{\par\currentbiblink\z@
      \gdef\CurrentBib{\expandafter\pstacutpar\BR@backref{\psta@sandbox ##1}}%
        \let\\\newline@AB@\@skiphyperreftrue \H@item \@skiphyperreffalse
        \@ifundefined{\psta@sandbox thebibliography@page}{}{\ifnum
            \numexpr\@nameuse{\psta@sandbox thebibliography@page}-\@nameuse{\psta@sandbox maketitle@page}\relax>2
          \Hy@raisedlink {\hyper@anchorstart
            {cite.\psta@sandbox ##1\@extra@b@citeb }\relax \hyper@anchorend }%
\wlog {anchor:cite.\psta@sandbox ##1\@extra@b@citeb }%
          \if@filesw
            \begingroup \let \protect \noexpand
              \immediate \write \@auxout {\string \bibcite
                {\psta@sandbox ##1}{{\the \value {\@listctr }}{}}\string
                \gdef \string \totalbibitems{\the \value {\@listctr }}}%
            \endgroup \fi\fi}
        \misc@\ignorespaces}
    \list
     {\@biblabel {\arabic {enumi}}}{\settowidth\labelwidth{\@biblabel{#1}}%
        \itemindent\labelsep
        \leftmargin \labelwidth
        \leftskip\leftmargini
        \usecounter {enumi}}
    \let\PrintDOI@\PrintCopy\let\PrintURL@\PrintCopy
    \let\IsAmsBibKeys\OnlyAmsBibKeys
    \def \allowbeak {\penalty \z@ \hskip 0ptplus2pt}%
    \@itempenalty =50\let\bib@endgroup\endgroup
    \sfcode `\.=1000\relax
    \def\newblock{\hskip .11em plus .33em minus .07em}%
    \def\makelabel##1{\hfil ##1}%
    \rightskip 0ptplus1mm\SoftSpaces
    \NamedLanguagePage{thebibliography}%
}%
\newcounter{aux@counter}%
\def\pstacutpar#1\par{#1}%

\newif\if@Ref@
\newif\if@finalpunct@ \@finalpunct@true
\newif\ifmoreref@
\newif\ifbook@
\newif\ifprocpaper@
\newif\if@kern

\def\test@Ref@{\if@Ref@\else\@@Ref\fi}%
\let\@end@thebibliography@hook\par
\def\@@Ref{\ifhmode\unskip\@@par\else\leavevmode\fi
  \begingroup \global\@finalpunct@true\@Ref@true
  \def\envir@end{\end@@ref}%
  \let\par\end@@ref
  \global\let\nofrills@list\empty
  \refbreaks %
  \procpaper@false \book@false \moreref@false
  \def\curbox{\z@}\setbox\z@\vbox\bgroup}%

\gdef\@ref{\@kernfalse
    \ifmoreref@ \commaunbox@AB@\translbox@AB@
    \else \@kerntrue
    \fi
    \if@kern\kern-\tw@ sp\kern\m@ne sp\fi \@@ref}%


\def\nofrills{\expandafter
    \ifx\envir@end\end@@ref \let\do\relax
        \xdef\nofrills@list{\nofrills@list\do\curbox}%
    \else\errmessage{\Invalid@@ \string\nofrills}\fi}%

\def\end@ref@{%
        \def\nofrillscheck##1{%
            \def\do####1{\ifx##1####1\let\frills@\@gobble\fi}%
        \let\frills@\@firstofone \nofrills@list}%
    \@ref}%

\def\end@@ref{\makerefbox@AB@ \z@ {\egroup }\end@ref@\endgroup
    \keyhook@ \global \let \keyhook@ \empty}\let\keyhook@\empty

\def\refbreaks{%
    \let\volinfo\volinfo@AB@
    \let\refconcat\refconcat@AB@
    \let\vadjust\vadjust@AB@
    \let\newpage\newpage@AB@
    \let\newline\newline@AB@
    \let\linebreak\linebreak@AB@
    \def\holdover##1{\RIfM@\penalty -\@M\null\hfil$
            \clubpenalty\z@\widowpenalty\z@\interlinepenalty\z@ \offinterlineskip\@@par
            \setbox\z@\lastbox\unskip \unpenalty \refconcat@AB@{##1}\noindent
            $\hfil\penalty -\@M
        \else {\parfillskip0pt \@@par}\refconcat@AB@{##1}\noindent
        \fi}}%

\def\makerefbox@AB@#1#2{\test@Ref@\@@par
  \setbox\z@\lastbox
  \global\setbox\@ne\hbox{\unhbox\holdoverbox
    \ifvoid\z@\else\unhbox\z@\unskip\unskip\unpenalty\fi}%
  \egroup
  \setbox\curbox\box\ifdim\wd\@ne>\z@ \@ne \else\voidb@x\fi
  \def\curbox{#1}\setbox#1\vbox\bgroup \hsize.3\maxdimen \noindent\leftskip0pt
  #2\relax}%
\def\refconcat@AB@#1{\setbox\z@\lastbox \setbox\holdoverbox\hbox{%
    \unhbox\holdoverbox \unhbox\z@\unskip\unskip\unpenalty#1}}%
\def\@finalpunct{\if@finalpunct@.\fi
    \refquotes@\nobreak\CurrentBib\refbreak@AB@@}%
\def\@@finalpunct{\ifnum\lastkern=\m@ne\unkern\fi\refquotes@
    \if@finalpunct@.\fi
    \unhbox\biblinkbox@AB@\CurrentBib\refbreak@AB@@}%
\newbox\holdoverbox
\newbox\translbox@AB@
\def\transl@#1{\unskip\unskip
    \makerefbox@AB@\z@{\@@par\egroup}%
    \let\savedef@\finalpunct  \let\finalpunct\empty \end@ref@
    \book@false\procpaper@false #1
    \def\punct@##1##2{\unskip\unskip ##2{\@No@Color;}\allowbreak\ }%
    \global\let\nofrills@list\empty%
    \let\finalpunct\savedef@ \moreref@true
    \def\curbox{\translbox@AB@}%
    \setbox\translbox@AB@\vbox\bgroup \hsize\maxdimen \noindent
    \misc@\nofrills}%
%
\def\punct@#1{#1}%
\def\commaunbox@AB@#1{\ppunbox@AB@,\space{#1}\empty}%
\def\pnktunbox@AB@#1{\ppunbox@AB@.\space{#1}\empty}%
\def\pnktunbox@AB@#1{\ppunbox@AB@\empty\space{#1}\empty}%
\def\ppunbox@AB@#1#2#3#4{\ifvoid#3\else
  \let\prespace@\relax
  \ifnum\lastkern=\m@ne \unkern\let\punct@\@gobble
    \ifnum\lastkern=-\tw@ \unkern\let\prespace@\ignorespaces \fi
  \fi
  \nofrillscheck#3%
  \punct@{#1}\refquotes@\refbreak@AB@@
  \let\punct@\@firstofone
  \prespace@
  \frills@{#2\@gobble}\space
  \unhbox#3\breakcheck
  \frills@{#4\@gobble}{\kern\m@ne sp}\fi}%
\def\nofrills@@#1{\DN@{#1}\ifx\next\nofrills \let\frills@\@gobble
   \expandafter\expandafter\expandafter\next@\expandafter\@gobble
  \else \let\frills@\@firstofone\expandafter\next@\fi}%
\def\nofrillscheck#1{\def\nofrills@{\nofrills@@{#1}}%
  \futurelet\next\nofrills@}%
\def\newpage@AB@{\vadjust{\vfill\break@AB@}}%
\def\break@AB@{\holdover{\penalty -\@M}}%
\def\linebreak@AB@{\holdover{\penalty -\@M}}%
\def\newline@AB@{\holdover{\hfill\penalty -\@M}}%
\def\endline@AB@{\holdover{\hfill\penalty -\@M}}%
\let\vadjust@\vadjust
\def\vadjust@AB@#1{\holdover{\vadjust@{#1}}}%
\def\breakcheck{\edef\refbreak@AB@@{\ifnum\lastpenalty=\z@\else
  \penalty\the\lastpenalty\relax\fi}\unpenalty}%

\gdef\gost@@ref{%
  \ifvoid\publaddrbox@AB@\let \AB@beforepubl v\else\let\AB@beforepubl n\fi
  \ppunbox@AB@\empty\space\misc@box@AB@\empty%
  \ppunbox@AB@\empty\space\bybox@AB@\empty%
  \ifbook@% Case 1: \book etc.
    \ppunbox@AB@{}{ }\bookbox@AB@\empty
    \ppunbox@AB@{,}{ }\bookinfobox@AB@\empty
    \ppunbox@AB@{.}{-- \bibbookVoltext~}\bookvolbox@AB@\empty
    \ppunbox@AB@{:}{ \voltitletext@}\voltitlebox@AB@\empty
    \ppunbox@AB@{,}{ }\procbox@AB@\empty%
    \ppunbox@AB@{}{ (}\procinfobox@AB@)%
    \ppunbox@AB@{,}{ }\serialbox@AB@{}%
    \ppunbox@AB@{.}{-- \bibVoltext~}\volbox@AB@\empty
    \ppunbox@AB@,{ \volinfotext@ }\volinfobox@AB@\empty
    \ppunbox@AB@{.}{-- \bibserIssuetext }\serissuebox@AB@\empty
    \ppunbox@AB@,{ \issueinfotext@ }\issueinfobox@AB@\empty
    \ppunbox@AB@{,}{ }\editionbox@AB@ \empty%
    \ppunbox@AB@{/}{ \bibedtext~}\edbox@AB@ \empty%
    \ppunbox@AB@{/}{ \bibedstext~}\edsbox@AB@ \empty%
    \ppunbox@AB@{,}{ }\finalbookinfobox@AB@\empty
    \ppunbox@AB@{.}{-- }\publaddrbox@AB@\empty%
    \ppunbox@AB@{\if v\AB@beforepubl.-- \else :\fi}{ }\publbox@AB@ \empty
    \ppunbox@AB@{;}{ }\publlbox@AB@ \empty
    \ppunbox@AB@{,}{ }\publaddrrbox@AB@{}%
    \ppunbox@AB@{;}{ }\publllbox@AB@ \empty
    \ppunbox@AB@{,}{ }\publaddrrrbox@AB@{}%
    \ppunbox@AB@{.}{-- }\yrbox@AB@{}%
    \ppunbox@AB@{.}{-- }\isbnbox@AB@{}%
    \else
    \ifprocpaper@ % Case 2: \paper ... \inbook
      \ifvoid \byybox@AB@
        \ppunbox@AB@{}{ }\paperbox@AB@{}%
        \ppunbox@AB@{,}{ }\paperinfobox@AB@{}%
      \else
        \ppunbox@AB@{}{ }\paperbox@AB@{}%
        \ppunbox@AB@{,}{ }\paperinfobox@AB@{}%
        \ppunbox@AB@{:}{ \byytext@ }\byybox@AB@\empty\fi
      \ppunbox@AB@{ /\!/ }{\inbook@text }\bookbox@AB@\empty
      \ppunbox@AB@{,}{ }\bookinfobox@AB@\empty
      \ppunbox@AB@{.}{-- \bibbookVoltext~}\bookvolbox@AB@\empty
      \ppunbox@AB@{:}{ \voltitletext@}\voltitlebox@AB@\empty
      \ppunbox@AB@{,}{ }\procbox@AB@\empty%
      \ppunbox@AB@{}{ (}\procinfobox@AB@)%
      \ppunbox@AB@{,}{ }\serialbox@AB@{}%
      \ppunbox@AB@{.}{-- \bibvoltext~}\volbox@AB@\empty
      \ppunbox@AB@,{ \volinfotext@ }\volinfobox@AB@\empty
      \ppunbox@AB@{.}{-- \bibserIssuetext }\serissuebox@AB@\empty
      \ppunbox@AB@,{ \issueinfotext@ }\issueinfobox@AB@\empty
      \ppunbox@AB@{,}{ }\editionbox@AB@ \empty%
      \ppunbox@AB@{,}{ \bibedtext~}\edbox@AB@ \empty%
      \ppunbox@AB@{,}{ \bibedstext~}\edsbox@AB@ \empty%
      \ppunbox@AB@{,}{ }\finalbookinfobox@AB@\empty
      \ppunbox@AB@{,}{ }\publaddrbox@AB@\empty%
      \ppunbox@AB@{\if v\AB@beforepubl.-- \else :\fi}{ }\publbox@AB@ \empty
      \ppunbox@AB@{;}{ }\publlbox@AB@ \empty
      \ppunbox@AB@{,}{ }\publaddrrbox@AB@{}%
      \ppunbox@AB@{;}{ }\publllbox@AB@ \empty
      \ppunbox@AB@{,}{ }\publaddrrrbox@AB@{}%
       \ifvoid \monthissuebox@AB@
          \ppunbox@AB@{.}{-- }\yrbox@AB@{}%
        \else
          \ppunbox@AB@{.}{--  }\monthissuebox@AB@\empty
          \ppunbox@AB@{}{ }\yrbox@AB@{}\fi
        \ppunbox@AB@{.}{-- }\isbnbox@AB@{}%
      \ppunbox@AB@{.}{-- \bibPagestext~}\pagesbox@AB@\empty
    \else % Case 3: \paper ... \jour
      \ppunbox@AB@{}{ }\paperbox@AB@{}%
      \ppunbox@AB@{,}{ }\paperinfobox@AB@{}%
      \ppunbox@AB@{,}{ \proc@text@}\procbox@AB@{}%
      \ppunbox@AB@{}{ (}\procinfobox@AB@)%
      \ppunbox@AB@{ /\!/ }{}\jourbox@AB@{}%
        \ifvoid \monthissuebox@AB@
          \ppunbox@AB@{.}{-- }\yrbox@AB@{}%
        \else
          \ppunbox@AB@{.}{-- }\monthissuebox@AB@\empty
          \ppunbox@AB@{}{ }\yrbox@AB@{}\fi
      \ifvoid\volbox@AB@
        \ppunbox@AB@{.}{-- }\yrbox@AB@{}%
        \ppunbox@AB@{,}{ \volinfotext@}\volinfobox@AB@\empty
        \ppunbox@AB@{.}{-- \bibIssuetext}\issuebox@AB@\empty
        \ppunbox@AB@{,}{ \issueinfotext@}\issueinfobox@AB@\empty
      \else
        \ppunbox@AB@{.}{-- \bibVoltext~}\volbox@AB@\empty
        \ppunbox@AB@{,}{ }\volinfobox@AB@\empty
        \ppunbox@AB@{.}{-- \bibIssuetext}\issuebox@AB@\empty
        \ppunbox@AB@{,}{ \issueinfotext@}\issueinfobox@AB@\empty
      \fi
      \ppunbox@AB@{.}{-- \bibPagestext~}\pagesbox@AB@\empty
  \fi \fi
  \ppunbox@AB@{.}{-- \bibpaperidtext~}\paperidbox@AB@\empty
  \ppunbox@AB@\empty{ (}\miscnotebox@AB@)\empty%
  \ppunbox@AB@{.}{-- }\totalpagesbox@AB@{~\bibpagestext}%
  \ppunbox@AB@\empty{ \ (}\langbox@AB@{)}\empty%
  \ppunbox@AB@{.}{-- }\finalinfobox@AB@\empty
  \ppunbox@AB@\empty{ (\withtext}\withbox@AB@)%
  \global\currentbiblink=0
  \ppunbox@AB@\empty{ }\@@finalinfobox@AB@\empty
  \finalpunct
}%

\gdef\ams@@ref{%
  \ppunbox@AB@\empty\space\misc@box@AB@\empty%
  \ppunbox@AB@\empty\space\bybox@AB@\empty%
  \ifbook@% Case 1: \book etc.
    \ppunbox@AB@{.}{ }\bookbox@AB@\empty
    \ppunbox@AB@{,}{ }\bookinfobox@AB@\empty
    \ppunbox@AB@{.}{ \bibbookVoltext~}\bookvolbox@AB@\empty
    \ppunbox@AB@{:}{ \voltitletext@}\voltitlebox@AB@\empty
    \ppunbox@AB@{,}{ }\procbox@AB@\empty%
    \ppunbox@AB@{}{ (}\procinfobox@AB@)%
    \ppunbox@AB@{,}{ }\serialbox@AB@{}%
    \ppunbox@AB@{,}{ \bibvoltext~}\volbox@AB@\empty
    \ppunbox@AB@,{ \volinfotext@ }\volinfobox@AB@\empty
    \ppunbox@AB@,{ \bibserissuetext }\serissuebox@AB@\empty
    \ppunbox@AB@,{ \issueinfotext@ }\issueinfobox@AB@\empty
    \ppunbox@AB@{,}{ }\editionbox@AB@ \empty%
    \ppunbox@AB@{,}{ \bibedtext~}\edbox@AB@ \empty%
    \ppunbox@AB@{,}{ \bibedstext~}\edsbox@AB@ \empty%
    \ppunbox@AB@{,}{ }\finalbookinfobox@AB@\empty
    \ppunbox@AB@{,}{ }\publbox@AB@ \empty
    \ppunbox@AB@{,}{ }\publaddrbox@AB@{}%
    \ppunbox@AB@{;}{ }\publlbox@AB@ \empty
    \ppunbox@AB@{,}{ }\publaddrrbox@AB@{}%
    \ppunbox@AB@{;}{ }\publllbox@AB@ \empty
    \ppunbox@AB@{,}{ }\publaddrrrbox@AB@{}%
    \ppunbox@AB@,{ }\yrbox@AB@{}%
    \ppunbox@AB@,{ }\isbnbox@AB@{}%
    \else
    \ifprocpaper@ % Case 2: \paper ... \inbook
      \ifvoid \byybox@AB@
        \ppunbox@AB@{.}{ \startquote}\paperbox@AB@{\stopquote}%
        \ppunbox@AB@{,}{ }\paperinfobox@AB@{}%
      \else
        \ppunbox@AB@{,}{ \startquote}\paperbox@AB@{\stopquote}%
        \ppunbox@AB@{,}{ }\paperinfobox@AB@{}%
        \ppunbox@AB@{:}{ \byytext@ }\byybox@AB@\empty\fi
      \ppunbox@AB@{,}{ \inbook@text }\bookbox@AB@\empty
      \ppunbox@AB@{,}{ }\bookinfobox@AB@\empty
      \ppunbox@AB@{.}{ \bibbookVoltext~}\bookvolbox@AB@\empty
      \ppunbox@AB@{:}{ \voltitletext@}\voltitlebox@AB@\empty
      \ppunbox@AB@{,}{ }\procbox@AB@\empty%
      \ppunbox@AB@{}{ (}\procinfobox@AB@)%
      \ppunbox@AB@{,}{ }\serialbox@AB@{}%
      \ppunbox@AB@{,}{ \bibvoltext~}\volbox@AB@\empty
      \ppunbox@AB@,{ \volinfotext@ }\volinfobox@AB@\empty
      \ppunbox@AB@,{ \bibserissuetext }\serissuebox@AB@\empty
      \ppunbox@AB@,{ \issueinfotext@ }\issueinfobox@AB@\empty
      \ppunbox@AB@{,}{ }\editionbox@AB@ \empty%
      \ppunbox@AB@{,}{ \bibedtext~}\edbox@AB@ \empty%
      \ppunbox@AB@{,}{ \bibedstext~}\edsbox@AB@ \empty%
      \ppunbox@AB@{,}{ }\finalbookinfobox@AB@\empty
      \ppunbox@AB@{,}{ }\publbox@AB@ \empty
      \ppunbox@AB@{,}{ }\publaddrbox@AB@{}%
      \ppunbox@AB@{;}{ }\publlbox@AB@ \empty
      \ppunbox@AB@{,}{ }\publaddrrbox@AB@{}%
      \ppunbox@AB@{;}{ }\publllbox@AB@ \empty
      \ppunbox@AB@{,}{ }\publaddrrrbox@AB@{}%
      \ifvoid \monthissuebox@AB@
        \ppunbox@AB@,{ }\yrbox@AB@{}%
      \else
        \ppunbox@AB@,{ }\monthissuebox@AB@\empty
        \ppunbox@AB@{}{ }\yrbox@AB@{}\fi
        \ppunbox@AB@,{ }\isbnbox@AB@{}%
      \ppunbox@AB@{,}{ \bibpagestext~}\pagesbox@AB@\empty
    \else % Case 3: \paper ... \jour
      \ppunbox@AB@{.}{ \startquote}\paperbox@AB@{\stopquote}%
      \ppunbox@AB@{,}{ }\paperinfobox@AB@{}%
      \ppunbox@AB@{,}{ \proc@text@}\procbox@AB@{}%
      \ppunbox@AB@{}{ (}\procinfobox@AB@)%
      \ppunbox@AB@{,}{ }\jourbox@AB@{}%
      \ifvoid\volbox@AB@
        \ppunbox@AB@{,}{ }\yrbox@AB@{}%
        \ppunbox@AB@{,}{ \volinfotext@}\volinfobox@AB@\empty
        \ppunbox@AB@{,}{ \bibissuetext}\issuebox@AB@\empty
        \ppunbox@AB@{,}{ \issueinfotext@}\issueinfobox@AB@\empty
      \else
        \ppunbox@AB@{,}{ }\volbox@AB@\empty
        \ppunbox@AB@{,}{ }\volinfobox@AB@\empty
        \ppunbox@AB@:{}\issuebox@AB@\empty
        \ppunbox@AB@{,}{ \issueinfotext@}\issueinfobox@AB@\empty
        \ifvoid \monthissuebox@AB@
          \ppunbox@AB@{}{ (}\yrbox@AB@{)}%
        \else
          \ppunbox@AB@{}{ (}\monthissuebox@AB@\empty
          \ppunbox@AB@{}{ }\yrbox@AB@{)}\fi \fi
      \ppunbox@AB@,{ \bibpagestext~}\pagesbox@AB@\empty \fi\fi
  \ppunbox@AB@,{ \bibpaperidtext~}\paperidbox@AB@\empty
  \ppunbox@AB@\empty{ (}\miscnotebox@AB@)\empty%
  \ppunbox@AB@,{ }\totalpagesbox@AB@{~\bibpagestext}%
  \ppunbox@AB@\empty{ \ (}\langbox@AB@{){\global\@finalpunct@true}}\empty%
  \ppunbox@AB@{,}{ }\finalinfobox@AB@\empty
  \ppunbox@AB@\empty{ (\withtext}\withbox@AB@)%
  \global\currentbiblink=0
  \ppunbox@AB@\empty{ }\@@finalinfobox@AB@\empty
  \finalpunct
}%
\font\invis@font=labx1000 at 1.1pt
\def\DefineIcon#1.#2#3#4 {%
  \@namedef{#1icon}{\kernel@ifnextchar[{\@nameuse{#1IconAlt}}{%
    \kernel@ifnextchar.{\@nameuse{#1iconRaw}\@gobble}{\@nameuse{#1iconAlt}{#1}}}}% . = []
  \@namedef{#1IconAlt}[##1]{\textup{\@nameuse{#1iconAlt}{##1}}}%
  \IfFileExists{psta/#1_logo.#2#3#4}{%
    \@namedef{#1iconAlt}####1{\rlap{\textcolor{white}{{\invis@font{####1}}}}\@nameuse{#1iconRaw}}%
    \@namedef{#1iconRaw}{$\vcenter{\hbox{\includegraphics[height=2.7ex]{psta/#1_logo}}}$}%
  }{% Else
    \@namedef{#1iconAlt}####1{\scalebox{0.7}{\hbox{\textcolor{black}{\textup{####1}}}}}%
    \@namedef{#1iconRaw}{\@nameuse{#1iconAlt}{#1}}}}%
\DefineIcon DOI.png \DefineIcon RSCI.pdf \DefineIcon arXiv.png \DefineIcon URL.png \DefineIcon MN.png \DefineIcon AMS.png \DefineIcon iD.pdf
\newcount\currentbiblink \global\currentbiblink=0
\newbox\biblinkbox@AB@
\def\skiptospace#1 {}%
\def\@IdTypeDef#1#2#3#4{\def#1{%
      \ifx\href\psta@next\expandafter#2\else
        \ifx:\psta@next\expandafter\expandafter\expandafter#3\else
          \ifx=\psta@next\expandafter\expandafter\expandafter
            \expandafter\expandafter\expandafter\expandafter#3\else
            \expandafter\expandafter\expandafter\expandafter
            \expandafter\expandafter\expandafter#4\fi\fi\fi}}%
\catcode`\%=13 \def\activepercent{%}\catcode`%=14
\def \OnlyAmsBibKeys#1{\makerefbox@AB@\biblinkbox@AB@{\unhbox\biblinkbox@AB@\space\catcode`(=12 \catcode`)=12 \catcode`_=12 \catcode`^=12 \catcode`~=12 \catcode`\% =12
    \expandafter#1\@gobble}}%
\let \IsAmsBibKeys\@firstofone
\def\IdTypeDef#1#2#3#4#5#6#7{% #1=priority #2=name #3=search #4=urlroot #5=format #6={icon} #7={alttext}
  \expandafter
    \def\csname#2\endcsname{\catcode`(=12 \catcode`)=12 \catcode`_=12 \catcode`^=12 \catcode`~=12 \catcode`\% =12 %\expandafter\let\activepercent\%
        \@nameuse{#2CheckHref}}%
        \expandafter
    \def \csname #2CheckHref\expandafter\endcsname\expandafter {\expandafter\global\expandafter
      \futurelet\expandafter\psta@next\csname #2@CheckHref@\endcsname}\expandafter
    \@IdTypeDef
        \csname #2@CheckHref\expandafter\endcsname
        \csname #2NextHref\expandafter\endcsname
        \csname #2AfterColon\expandafter\endcsname
        \csname #2Search\endcsname
    \expandafter\def\csname#2@CheckHref@\expandafter\endcsname\expandafter
        {\expandafter\IsAmsBibKeys\expandafter{\csname#2@CheckHref\endcsname}}%
    \@namedef{#2Search}##1 {%
      \@nameuse{#2@ifFoundAfter#3}##1\and{\@firstoftwo}#3##1\and{\@secondoftwo}\AmSBib}%
    \@namedef{#2NextHref}##1##2##3{#5{#6}{#7}{##2}{##3}}% format{icon}{alttext}{url}{text}%
    \@namedef{#2AfterColon}##1##2 {#5{#6}{#7}{#4##2}{##2}}% format{icon}{alttext}{url}{text}%
    \@namedef{#2@ifFoundAfter#3}##1#3##2\and##3##4\AmSBib{##3{#5{#6}{#7}{#4##2}{##2}}{#5{#6}{#7}{#4##2}{##2}}}}%
\def\PrintAsIcon#1#2#3#4{\href{#3}{#1[{[#2]}]}}% URLicon AltText LinkURL LinkText
\def\PrintCopy#1#2#3#4{\rlap{\textcolor{white}{{\invis@font #3}}}\href{#3}{#1}}% URLicon AltText LinkURL LinkText
\def\PrintURL#1#2#3#4{\href{#3}{#1\quad\nolinkurl{#3}}}\let\PrintURL@\PrintURL% URLicon AltText LinkURL LinkText
\def\PrintAsRINC#1#2#3#4{\href{#3}{#1[{[#2:#4]}]}}% URLicon AltText LinkURL LinkText
\def\PrintWithId#1#2#3#4{\href{#3}{{\scriptsize#2{#1} \footnotesize{#4}}}}% URLicon AltText LinkURL LinkText
\def\PrintNothing#1#2#3#4{}%
\IdTypeDef2{isbn}{ }{https://isbnsearch.org/isbn/}\PrintWithId{}{ISBN}%
\def\isbn@CheckHref@{\makerefbox@AB@\isbnbox@AB@{\unhbox\isbnbox@AB@\space\catcode`(=12 \catcode`)=12 \catcode`_=12 \catcode`^=12 \catcode`~=12 \catcode`\% =12 \expandafter\isbn@CheckHref\@gobble}}%
\IdTypeDef2{mathscinet}{=}{http://www.ams.org/mathscinet-getitem?mr=}\PrintAsIcon\AMSicon{MathSciNet}%
\IdTypeDef2{URL}{}{}\PrintAsIcon\URLicon{URL}%
\def\URLSearch#1 {\PrintURL@\URLicon{URL}{#1}{}}%
\IdTypeDef6{mathnet}{=}{https://mi.mathnet.ru/}\Printmathnet@\MNicon{MathNet}\def\Printmathnet@{\PrintURL@}%
\def\mathnetSearch#1 {\Printmathnet@\MNicon{MathNet}{#1}{}}%
\IdTypeDef7{doi}{.org/}{https://doi.org/}\PrintDOI@\DOIiconRaw{Crossref}\let\PrintDOI@\PrintURL%
\IdTypeDef5{arxiv}{/abs/}{https://arxiv.org/abs/}\PrintWithId\arXivicon{arXiv}%
\IdTypeDef6{rinc}{=}{https://elibrary.ru/item.asp?id=}\PrintRINC\RSCIicon{\RINC}\let\PrintRINC\PrintAsIcon
\def\Href#1#2{\href{#1}{\textsl{#2}\raise.3ex\hbox{\includegraphics[height=1.7ex]{psta/URL_logo.png}}}}\def\http{\URL http}\def\https{\URL https}\def\www{\URL http://www}%
\def\cyrURL{\URL \href}\def\http{\URL http}\def\https{\URL https}\def\www{\URL http://www}%
\let\elibrary\rinc
\let\elib\rinc
\let\elink\URL\let\Eprint\URL
\let\crossref\doi
\def\bookinfo{\makerefbox@AB@\bookinfobox@AB@{\rm %\aftergroup\procpaper@true\aftergroup\book@false
    }}\newbox\bookinfobox@AB@
\def\book{\makerefbox@AB@\bookbox@AB@{\it \aftergroup\book@true\aftergroup\procpaper@false}}\newbox\bookbox@AB@
\def\bookvol{\makerefbox@AB@\bookvolbox@AB@\empty}\newbox\bookvolbox@AB@
\def\by{\makerefbox@AB@\bybox@AB@{\empty\rm}}\newbox\bybox@AB@
\def\bysame{\by\hbox to3em{\hrulefill}\thinspace\kern\z@}%
\def\byy{\makerefbox@AB@\byybox@AB@\empty}\newbox\byybox@AB@\let\byytext@\empty
\def\continuepunct#1#2#3#4{}%
\def\citnum{\makerefbox@AB@\citnumbox@\empty}%
\def\citnumisi{\makerefbox@AB@\citnumisibox@\empty}%
\def\citnummsn{\makerefbox@AB@\citnummsnbox@\empty}%
\def\citnumelib{\makerefbox@AB@\citnumelibbox@\empty}%
\def\edition{\makerefbox@AB@\editionbox@AB@\empty}\newbox\editionbox@AB@
\def\ed{\makerefbox@AB@\edbox@AB@\empty}\newbox\edbox@AB@
\def\eds{\makerefbox@AB@\edsbox@AB@\empty}\newbox\edsbox@AB@
\def\endquotes{\def\refquotes@{''\let\refquotes@\empty}}%
\def\finalbookinfo{\makerefbox@AB@\finalbookinfobox@AB@\empty}\newbox\finalbookinfobox@AB@
\def\@@finalinfo{\global\@finalpunct@true\makerefbox@AB@\@@finalinfobox@AB@\empty}\newbox\@@finalinfobox@AB@
\def\finalinfo{\global\@finalpunct@true\makerefbox@AB@\finalinfobox@AB@\empty}\newbox\finalinfobox@AB@
\def\Hrefs#1{}%
\def\inbook{\makerefbox@AB@\bookbox@AB@{\it \aftergroup\procpaper@true\aftergroup\book@false}}\let\inbook@text\empty
\newbox\isbnbox@AB@
\def\isi#1{\ignorespaces}%
\def\issn{\makerefbox@AB@\issnbox@AB@\empty}\newbox\issnbox@AB@
\def\issueinfo{\makerefbox@AB@\issueinfobox@AB@\empty}\newbox\issueinfobox@AB@\let\issueinfotext@\empty
\def\issue{\makerefbox@AB@\issuebox@AB@\empty} \newbox\issuebox@AB@
\def\jour{\makerefbox@AB@\jourbox@AB@{\@ifgost\empty\it\aftergroup\jour@true}}\newbox\jourbox@AB@
\def\jour@true{\global\book@false\global\procpaper@false}%
\def\lang{\global\@finalpunct@true\makerefbox@AB@\langbox@AB@\empty} \newbox\langbox@AB@
\def\misc@{\makerefbox@AB@\misc@box@AB@\empty%\ifx\cyrillicencoding\@undefined\else\select@language{russian}\fi
}\newbox\misc@box@AB@
\def\miscnote{\makerefbox@AB@\miscnotebox@AB@\empty} \newbox\miscnotebox@AB@
\def\monthissue{\makerefbox@AB@\monthissuebox@AB@\empty}\newbox\monthissuebox@AB@\let\monthissuetext@\empty
\def\moreref{\transl@ \frenchspacing\global\set@english\g@set@fontenc}\let\transl\moreref
\def\morerref{\transl@\frenchspacing\global\set@russian\g@set@fontenc}\let\rtransl\morerref
\def\@No@Color{\textcolor{black}}%
\def\page{\global\let\page@text=\bibpagetext\makerefbox@AB@\pagesbox@AB@\empty}\global\let\page@text=\bibpagestext
\def\pages{\global\let\page@text=\bibpagestext\makerefbox@AB@\pagesbox@AB@\empty}\newbox\pagesbox@AB@
\def\paperinfo{\makerefbox@AB@\paperinfobox@AB@\empty}\newbox\paperinfobox@AB@
\newif\ifbibpaper@
\def\paper{\makerefbox@AB@\paperbox@AB@{\aftergroup\bibpaper@true\@ifgost\it\empty}}\newbox\paperbox@AB@
\def\papernumber{\makerefbox@AB@\paperidbox@AB@\empty}\newbox\paperidbox@AB@
\def\preprintinfo{\makerefbox@AB@\bookinfobox@AB@{\aftergroup\book@true\rm \let\@my@href=\href\relax\def\href##1##2{\@my@href{##1}{{\tt ##2}}}}}%
\def\procinfo{\makerefbox@AB@\procinfobox@AB@\empty}\newbox\procinfobox@AB@\let\proc@text@\empty
\def\proc{\makerefbox@AB@\procbox@AB@\empty}\newbox\procbox@AB@
\def\publaddr{\makerefbox@AB@\publaddrbox@AB@\empty}\newbox\publaddrbox@AB@
\def\publaddrr{\makerefbox@AB@\publaddrrbox@AB@\empty}\newbox\publaddrrbox@AB@
\def\publaddrrr{\makerefbox@AB@\publaddrrrbox@AB@\empty}\newbox\publaddrrrbox@AB@
\def\publll{\makerefbox@AB@\publllbox@AB@\empty}\newbox\publllbox@AB@
\def\publl{\makerefbox@AB@\publlbox@AB@\empty}\newbox\publlbox@AB@
\def\publ{\makerefbox@AB@\publbox@AB@\empty} \newbox\publbox@AB@
\def\raggedref{\par\rightskip 0mmplus7mm\par\rightskip 0mm\par}%
\def\scopus#1{\ignorespaces}%
\def\serial{\makerefbox@AB@\serialbox@AB@{\rm \ifbibpaper@\aftergroup\procpaper@true\aftergroup\book@false\fi}}\newbox\serialbox@AB@
\def\serissue{\makerefbox@AB@\serissuebox@AB@\empty}\newbox\serissuebox@AB@
\def\sortdate{\makerefbox@AB@\sortdatebox@\empty}\newbox\sortdatebox@
\def\toappear{\miscnote \bibt@appear}%
\def\totalpages{\global\@finalpunct@false\makerefbox@AB@\totalpagesbox@AB@\empty}\newbox\totalpagesbox@AB@
\def\volinfo@AB@{\makerefbox@AB@\volinfobox@AB@\empty}\newbox\volinfobox@AB@ % !!!! \volinfo conflicts with amsart.cls
 \def\volinfotext@{}%
\def\vol{\makerefbox@AB@\volbox@AB@{\bf}}\newbox\volbox@AB@
\def\voltitle{\makerefbox@AB@\voltitlebox@AB@{\it}}\newbox\voltitlebox@AB@\let\voltitletext@\empty
\def\with{\makerefbox@AB@\withbox@AB@{\empty\rmfamily}}\newbox\withbox@AB@
\def\yr{\makerefbox@AB@\yrbox@AB@\empty} \newbox\yrbox@AB@
\let\bookvols=\bookvol
\let\eprintinfo=\preprintinfo
\let\manyby=\by % for backward compatibility
\let\paperid=\papernumber
\let\preprint=\book \let\eprint=\preprint
\let\refbreak@AB@@=\empty
\let\refquotes@\empty
\let\thesisinfo=\preprintinfo
\let\thesis=\preprint
\let\finalpunct=\@@finalpunct

%%%%%%%%%%%%%%% TOC
\def\psta@if@has@minus#1-#2#3\end@test@minus{\if;#2\expandafter\@secondoftwo\else\expandafter\@firstoftwo\fi}%
\def\PageLink#1#2{#2}%
%
\def\boldtocpages#1{\subsection*{\Title}\addcontentsline{toc}{subsection}{\Title}\let\Title\@empty}%
\long\def\tocpages#1#2{%
    \leftskip=1em\parindent-\leftskip
    \rightskip 14mm \parfillskip-\rightskip
    \def\\{\unskip\space\ignorespaces}\let\ =\\
    \nobreak\@@par\SoftSpaces
    \ifx\Author\@empty \else{{ \footnotesize\textsc{\Author} }}\fi
    \ifx\Title\@empty \else   {%\small
       \itshape{\Title\nobreak}}%
    \@ifempty{#1}{}{\nobreak{ \small\dotfill}\hbox{ \em{\LastPagerange{#1}{#2}}}}\fi\@@par
    \let\Author\@empty\let\Title\@empty}%
\let\Title\@empty \let\Author\@empty
%
\def\NonLastPagerange#1#2{\FormatPagerange{}{}{#2}{#1}, }%
\def\LastPagerange#1#2{\FormatPagerange{\hbox to 8mm}{\hss}{#2}{#1}}%
\def\FormatPagerange#1#2#3#4{\psta@if@has@minus#4-;\end@test@minus{\FormatPagerange@{#1}{#2}{#3}#4\endFormatPagerange@}{\PageLink{#3}{#4}#1{#2}}}%
\def\FormatPagerange@#1#2#3#4-#5\endFormatPagerange@{\href{\IssueURL{#4-#5}.pdf}{\PageLink{#3}{#4}\textcolor{lightgray}{#1{--\PageLink{#3}{#5}#2}}}}%
\let\AUpages\LastPagerange
%
\def\formatPagerange#1{\expandafter\formatPagerange@#1-;\endPagerange}%
\def\formatPagerange@#1-#2#3\endPagerange{\formatPagerange@@#1-;\endPagerange
   \if;#2\else--\formatPagerange@@#2#3\endPagerange\fi}%
  \def\formatPagerange@@#1-;\endPagerange{%\href[page=#1]{psta\Year\_\Issue}%
    {#1}}%

\def\dirsection#1{\everypar{}\pagebreak[1]\bigskip
  \hbox to\hsize{%\vrule width .15pt  depth 1ex height  .3pt\vrule width .2em height .3pt depth 0pt\hskip.8em%\hrulefill
    \hskip1em
    \hbox{\scalebox{0.83}{\hbox{\lower1.2ex\hbox{\tiny\textsf{ \MakeUppercase{#1} }}}}}\hfill%\hfill\hrulefill\hfill\hfill\hrulefill
     % \vrule width .15pt height  .3pt depth 2ex\hskip10mm}%
    }\nobreak\medskip}%
%

\def\ell@#1{\strut\nobreak\hskip \z@ plus#1\hsize}%
\def\boldfirst#1,{{\small\textsc{#1}},}%
\def\AUauthor#1#2#3#4{{%\parskip 2.5mmplus1mm\baselineskip10pt
   \SoftSpaces
     \parindent=-1em \leftskip=1em \rightskip14mm
    \boldfirst#1\ell@1\penalty2000\space\ell@8%
    \lower1pt\hbox{\textcolor{lightgray}{{\tiny${}_{}^<$}}}%
    {\footnotesize\textsf{\href{mailto:#2}{#2}}}%
    \lower1pt\hbox{\textcolor{lightgray}{{\tiny${}_{}^>$}}}%
    \ell@1\penalty3000\space\ell@1
    \hbox {#4\hskip -14mm}\break
    \Small\emph{#3}\@@par\pagebreak[2]}}%
%
\def\tocwrite#1{\def\Title{#1}}%
\long\def\theabstract#1{\def\Abstract{#1}}%
\def\directiontitle#1#2{\subsection*{#1}\thispagestyle{firstpage}}%
\def\toctitle#1#2{\hypertarget{#2}{\section*{#1}}\thispagestyle{firstpage}\let\Title\@empty\thetitle
    {#1}\pstamarkboth{#1}{#1}}%
\def\thetitle#1{\def\Title{#1}}%
\def\theauthor#1{\def\Author{#1}}%
\expandafter\ifx \csname forVolumes\endcsname\relax
\def\forVolumes{\expandafter\forVolumes@\jobname\relax}%
\def\forVolumes@#1#2\relax{\if1#1\expandafter\@firstoftwo\else
    \expandafter\@secondoftwo\fi}\fi
\gdef\psta#1{\if-#1\expandafter\psta@\fi}%
\gdef\psta@#1 #2 \psta{\expandafter\xdef\csname psta-#1\endcsname{#2}\psta}%
\ifx \No\undefined \DeclareRobustCommand{\No}{\ifmmode{\nfss@text{\textnumero}}\else\textnumero\fi}\fi
\let\wlog\@gobble
\let\wlog\wlogpsta
\if y\hyphenbreaks \g@addto@macro\UrlBreaks{\do-}\fi
\AtBeginDocument{%
  \def\save@labelwidth{%
    \if@filesw
    \immediate\write\@auxout{%
    \string\newlabel{[bibenv:\the\c@bib@env]}{\the\@maxlabelwidth}}%
    \global\let\save@labelwidth\relax\fi}%
    \@ifpackageloaded {subcaption}%
        {\captionsetup[subtable]{labelfont=rm}%
        \captionsetup[sub]{labelfont=rm}%
        \DeclareCaptionLabelFormat{pstac}{{\scriptsize(}\kern-.3pt#2\kern-.3pt\scriptsize)}%
        \captionsetup[subfigure]{justification=centering,singlelinecheck=false,labelformat=pstac}%
        \captionsetup[sub]{justification=centering,singlelinecheck=false,labelformat=pstac}}{}}%
\def\authorid#1{}%
\renewcommand{\topfraction}{0.98} % maximum size of the top area for floats
\renewcommand{\textfraction}{0.03}   % minimum size of the text area, i.e., the area that must not be occupied by floats
\setcounter{topnumber}{3}           % the maximum number of floats on a text (!) page
\setcounter{totalnumber}{3}     % 2 may work better
\renewcommand{\floatpagefraction}{0.97} % minimum part of the page (or column) that need to be occupied by floats to be allowed to form a float page (or column)
\@ifundefined{Year}{\edef\Year{\the\year}}{}%
\@ifundefined{copyrightYear}{\let\copyrightYear\Year}{}%
\ifx\article@lang\russian@lang \selectlanguage{russian}\else\selectlanguage{english}\fi
%
%\errorcontextlines\maxdimen\showboxbreadth\maxdimen\showboxdepth\maxdimen
\endinput
% vim:ts=2:shiftwidth=2:expandtab:syn=tex:iskeyword=@,48-58,95,128-255,@-@:
