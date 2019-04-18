\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{psta}[2018/09/08 09:38:13                                        Document class for PSTA journal and other bilingual proceedings]
\makeatletter
% Licensed with CC-BY-SA 
% Designed by S. Znamenskij, znamensk@rustex.botik.ru, svz@latex.pereslavl.ru
%
\def\tracing#1{\if#1a\errorcontextlines\maxdimen\showboxbreadth\maxdimen\showboxdepth\maxdimen\tracinggroups\@ne\tracingifs\@ne\tracinglostchars\tw@\tracingmacros\tw@\tracingnesting\@ne\tracingoutput\@ne\tracingpages\@ne\tracingparagraphs\@ne\tracingrestores\@ne\tracingscantokens\@ne\tracingstats\tw@\tracingassigns\@ne\tracingcommands\thr@@
\else\tracingcommands\z@\errorcontextlines\m@ne\showboxbreadth\m@ne\showboxdepth\m@ne\tracingassigns\z@\tracinggroups\z@\tracingifs\z@\tracinglostchars\@ne\tracingmacros\z@\tracingnesting\z@\tracingonline\z@\tracingoutput\z@\tracingpages\z@\tracingparagraphs\z@\tracingrestores\z@\tracingscantokens\z@\tracingstats\z@\fi}
\def\l@Arg#1#2{\expandafter#1\csname\languagename-#2\endcsname}%
%\gdef\langshow#1{\wlog{\l@Arg\string{#1}=\l@Arg\meaning{#1}}}% # DEBUGDING !!!
\edef\langshow#1{}
\edef\english@lang{\string english}\let\next@to@russian\english@lang
\let\english@encoding\latintext
\edef\russian@lang{\string russian}\let\next@to@english\russian@lang
\let\russian@encoding\cyrillictext
\let\article@lang\russian@lang
\let\latexmarkboth\markboth
\def\LatinOne{\let\CyrLat\@firstoftwo}%
\def\CyrillicUnicode{\let\CyrLat\@secondoftwo}%
%
\def\DeclareLanguageEncoding#1#2{%
  \expandafter\def\csname#1NativeEncoding\endcsname{#2}%
  \DeclareOption{#1}{\edef\article@lang{\string #1}\PassOptionsToPackage{babel}{#1}}%
  }%
%
\def\ArticleEncoding{cp1251}%
\def\DeclareInputEncoding#1{%
  \DeclareOption{#1}{\def\ArticleEncoding{#1}\PassOptionsToPackage{inputenc}{#1}}}%
%  
% Add extra language or encoding declarations if needed, please, with the appropriate comment! 
%
\DeclareLanguageEncoding{russian}{\CyrillicUnicode}%
\DeclareLanguageEncoding{ukrainian}{\CyrillicUnicode}%
\DeclareLanguageEncoding{english}{\LatinOne}%
\DeclareLanguageEncoding{francais}{\PassOptionsToPackage{babel}{francais}}%
%   
\DeclareInputEncoding{cp1251}%
\DeclareInputEncoding{utf8}\def\utfVIIIname{utf8}%
\DeclareInputEncoding{koi8-r}%
%
\def\underliedclass{amsproc}%
  \DeclareOption{book}{\def\underliedclass{amsbook}}%
  \DeclareOption{article}{\def\underliedclass{amsart}}%
%
\ifx\pdfoutput\undefined\let\pdfoutput\z@\fi \expandafter \PassOptionsToPackage 
  \ifcase\pdfoutput {dvips,hiresbb}{graphics}\else{pdftex}{graphics,lscape}\fi
%
\DeclareOption{oldsystem}{\xdef\old@system{y}}\def\old@system{n}
\DeclareOption{hyphenbreaks}{\def\hyphenbreaks{y}}\def\hyphenbreaks{n}
\DeclareOption{fancyverts}{\def\load@fancyvrb{y}}\def\load@fancyvrb{n}%
\DeclareOption{sloppy}{\def\@sloppy{\sloppy}}\def\@sloppy{}%
\DeclareOption{a4paper}{\def\@aIVpaper{y}}\def\@aIVpaper{n}
\DeclareOption{secsymbol}{\font\SecSignFont=ts1-lmr10 \font\SecSignBoldFont=ts1-lmbx10 
    \def\S@cChar{{\SecSignFont\char"A7}}\def\S@CChar{{\SecSignBoldFont\char"A7}}\AtBeginDocument
  {\def\sectionmark{\pagebreak[2]\@secmark\pstamarkright\sectionrunhead{\S@CChar\sectionname}}%
  \def\tocsection#1#2#3{\everypar {\S@CChar}\bigskip \noindent \parfillskip \z@ 
  \leftskip .2\hsize plus.2 \hsize minus .2\hsize 
  \rightskip \leftskip \textsf {#1}\par{\@ifempty{#2}{}{\textbf {\S@CChar#2. }} }{#3}}%
  \renewcommand*{\p@section}{\S@cChar}%
  \def\@seccntformat#1{\S@CChar\csname the#1\endcsname.\hspace*{0.5em}}}}%
%    
  \PassOptionsToPackage{colorlinks,bookmarksopen,citecolor=citecolor,urlcolor=urlcolor,linkcolor=linkcolor}{hyperref}%
%  \PassOptionsToPackage{backrefs}{amsrefs}\fi
%
\def\psta@class@options{}
\DeclareOption*{\expandafter\g@addto@macro\expandafter\psta@class@options\expandafter{\expandafter,\CurrentOption}}
\ProcessOptions*\@options \relax    
\LoadClassWithOptions{\underliedclass}
\RequirePackage[T1,T2A]{fontenc}%
\def \LinkToHomepage{\PSTAprepared\ \today\ \PSTAfor\startquote\JournalLink\stopquote}
\def\BottomHead{\ifx\article@lang\languagename\@ifundefined{@Reviewer}{\LinkToHomepage}{\noindent\@Reviewer}.\fi\parfillskip\z@ plus \hsize\@@par}
\usepackage[hyphens]{url}
\global\let\xmp@TitleEN\@empty
\global\let\xmp@AuthorEN\@empty
\global\let\xmp@KeywordsEN\@empty
\global\let\xmp@SubjectEN\@empty
\global\let\xmp@TitleRU\@empty
\global\let\xmp@AuthorRU\@empty
\global\let\xmp@KeywordsSMP\@empty
\global\let\xmp@KeywordsRU\@empty
\global\let\xmp@SubjectRU\@empty
\PassOptionsToPackage{pagebackref,unicode}{hyperref}
\providecommand{\pdfxopts}{a-2u}
\IfFileExists{etoolbox.sty}{\RequirePackage{etoolbox}}{\let\old@system y}
\IfFileExists{floatrow.sty}{\RequirePackage{floatrow}\floatsetup[table]{capposition=top}}{}
\IfFileExists{ted.sty}{\RequirePackage{ted}}{}
\@ifundefined{Year}{\edef\Year{\the\year}}{%
    \if y \old@system \else
      \AtBeginDocument{\PSTAmkXMP}\fi}
  \def\PSTAmkXMP{{\Hy@pdfstringtrue
  \def\firstpage##1-##2;{##1}%
  \def\lastpage##1-##2-##3;{##2}%
  \def\psta@cut@prefix##1:->{}%
  \def\pdfuse##1{\expandafter\expandafter\expandafter
    \psta@cut@prefix\expandafter\meaning\csname##1\endcsname}%
  \chardef\reserved@out15 %
  \ch@ck7\reserved@out\write%
  \edef\UT{\expandafter\string\csname UTFviii@two@octets \endcsname}%
  \edef\AND{\expandafter\string\csname and \endcsname}%
  \def\subs##1##2{\expandafter\@temptokena\expandafter{\the\ted@toks}\Substitute**{\the\@temptokena}{##1}{##2}}
  \def\Subs{\subs{\lcurl}{}\subs{\rcurl}{}\subs{\UT}{}}\let\lSep\relax
  \def\WriteXMP##1##2{%
    \edef\reserved@a{\string##1}%
      \expandafter\@temptokena\expandafter{\reserved@a}%
      \Substitute**{\the\@temptokena}{\string ~}{ }##2%
      \immediate\write\reserved@out{\the\ted@toks }}%
  \immediate\openout\reserved@out\jobname.xmpdata\relax%
  \edef\lcurl{\string{}
  \edef\rcurl{\string}}
  \@ifundefined{\article@lang-title}{}{\WriteXMP{\Title{\pdfuse{\article@lang-title}}}{}}%
  \@ifundefined{russian-title}{}{\WriteXMP{\TitleRU{\pdfuse{russian-title}}}{}}%
  \@ifundefined{english-title}{}{\WriteXMP{\TitleEN{\pdfuse{english-title}}}{}}%
  \if y\psta@blind\WriteXMP{\AuthorXMP{hidden}}{}\else
      \@ifundefined{\article@lang-Fshortauthors}{}{
        \WriteXMP{\AuthorXMP{\pdfuse{\article@lang-Fshortauthors}}}{\Subs\subs{\AND}{\lSep{x-default}}}%
        \WriteXMP{\Copyright{\Year \pdfuse{\article@lang-Fshortauthors}  \pdfuse{\article@lang-Licensed}}}{\Subs\subs{\AND}{; }}%
      }\fi
  \@ifundefined{\article@lang-keywords}{}{\WriteXMP{\KeywordsXMP{\pdfuse{\article@lang-keywords}}}{\subs{, }{\lSep{x-default}}}}%
  \@ifundefined{russian-keywords}{}{\WriteXMP{\KeywordsRU{\pdfuse{russian-keywords}}}{\subs{, }{\lSep{ru}}}}%% 
  \@ifundefined{english-keywords}{}{\WriteXMP{\KeywordsEN{\pdfuse{english-keywords}}}{\subs{, }{\lSep{en}}}}%  
  \if y\psta@blind\WriteXMP{\Author{hidden}}\else
  \@ifundefined{\article@lang-Fshortauthors}{}{\WriteXMP{\Author{\pdfuse{\article@lang-Fshortauthors}}}{\Subs\subs{\AND}{; }}}\fi
  \@ifundefined{\article@lang-keywords}{}{\WriteXMP{\Keywords{\pdfuse{\article@lang-keywords}}}{}}% 
  \WriteXMP{\Copyrighted{CC-BY}}{}%
  \WriteXMP{\PublicationType{journal}}{}%
  \@ifundefined{\article@lang-PSI}{}{\WriteXMP{\Org{\pdfuse{\article@lang-*PSI}}}{}}%
  \WriteXMP{\Producer{PSTA publishing system}}{}
  \WriteXMP{\CreatorTool{pdfTeX + pdfx.sty with opttion \pdfxopts\space and PSTA patch}}{}%
  \@ifundefined{JournalURL}{}{\WriteXMP{\WebStatement{\JournalURL}}{}}% should be URL to copyright statement on the web
  \@ifundefined{Volume}{%
    }{%
    \WriteXMP{\Url{\IssueURL\pagerange}}{}% should be URL to copyright statement on the web
    \WriteXMP{\Volume{\Volume}}{}%
    \WriteXMP{\Issue{\FullIssue}}}{}%
  \WriteXMP{\CoverDisplayDate{\Year}}{}%
  \@ifundefined{Issue}{}{%
    \WriteXMP{\CoverDate{\Year-\ifcase\Issue\or03\or06\or09\else12\fi}}{}}%  must be in format  YYYY-MM-DD  or  YYYY-MM
  \@ifundefined{@Reviewer}{%
    \@ifundefined{PSTAdoi}{%
      \@ifundefined{\article@lang-PSTASubmitted}{}{\WriteXMP{\Subject{\pdfuse{\article@lang-PSTASubmitted} \journalabbreviationinenglish\space}}{}}%
      }{ % \tracing a
        \@ifundefined{\article@lang-*JournalLink}{}{\WriteXMP{\Subject{\pdfuse{\article@lang-*JournalLink} \Volume:\FullIssue, \pdfuse{\article@lang-bibpagetext} \pagerange. DOI:\PSTAdoi}}{}}%
      \@ifundefined{russian-*JournalLink}{}{\WriteXMP{\SubjectRU{\pdfuse{russian-*JournalLink} \Volume:\FullIssue, \pdfuse{russian-bibpagetext} \pagerange. DOI:\PSTAdoi}}{}}%
      \@ifundefined{english-*JournalLink}{}{\WriteXMP{\SubjectEN{\pdfuse{english-*JournalLink} \Volume:\FullIssue, \pdfuse{english-bibpagetext} \pagerange. DOI:\PSTAdoi}}{}}%
      \WriteXMP{\Doi{\PSTAdoi}}{}{}%    
    }}{%
      \@ifundefined{\article@lang-PSTAAssigned}{}{\WriteXMP{\Subject{\pdfuse{\article@lang-PSTAAssigned}\pdfuse{\article@lang-AnonimousReview}\pdfuse{@Reviewer}}}{}}%
  }%
  \@ifundefined{pagerange}{}{%
    \WriteXMP{\Lastpage{\expandafter\expandafter\expandafter\lastpage\expandafter\pagerange\expandafter-\pagerange-;}}{}
    \WriteXMP{\Firstpage{\expandafter\firstpage\pagerange-;}}{}}%
  \@ifundefined{Journallink}{}{\WriteXMP{\Journaltitle{\pdfuse{russian-*JournalLink}}}{}}%
  \@ifundefined{Journalnumber}{}{\WriteXMP{\Journalnumber{\Journalnumber}}{}}%  ISSN
   \immediate\closeout\reserved@out%
  }\let\PSTAmkXMP\relax}%
  \IfFileExists{\jobname.xmp}{%
      \IfFileExists{\jobname.xmpdata}{%
          \def\lSep{\langSep}%
          \usepackage[\pdfxopts]{psta-pdfx}%
          \setRGBcolorprofile{sRGB_IEC61966-2-1_black_scaled.icc}{sRGB_IEC61966-2-1_black_scaled}{sRGB IEC61966 v2.1 with black scaling}{http://www.color.org}%
          \gdef\ColorProfileDir{/Library/Application Support/Adobe/Color/Profiles/Recommended/}%
          \let\PSTAmkXMP\relax}{\usepackage{hyperref}}{\let\PSTAmkXMP\relax}}{\usepackage{hyperref}}
  \def\and{, }%
\RequirePackage{hyperref}
\if y\old@system\PassOptionsToPackage{inputenc}{cp1251}\def\cyrillicencoding{cp1251}\def\Year{\the\year}\fi
\RequirePackage{inputenc}%
\ifx\article@lang\russian@lang\edef\tempa@{[english,russian]}%
\else\ifx\article@lang\english@lang\edef\tempa@{[russian,english]}%
\else\edef\tempa@{[russian,english,\article@lang]}%
\fi\fi
\expandafter\RequirePackage\tempa@{babel}
\expandafter\xdef\csname next@to@\article@lang\endcsname{\string english}
\global\let\headline@language\article@lang
\def\russian@encoding{T2A}%  
\def\english@encoding{T1}%
\def\text@encoding#1{\language\csname l@#1\endcsname\relax \expandafter\let\expandafter\defaultencoding\csname#1@encoding\endcsname}%\selectfont
\def\set@headline@encoding#1{\global\expandafter
    \let\expandafter\headline@language\csname #1@lang\endcsname\expandafter
    \def\expandafter\patchpdfheadlineencoding\expandafter{\expandafter\let\expandafter
    \encodingdefault\csname#1@encoding\endcsname}}%
\def\ParInLanguage#1{\patchpdfheadlineencoding\par\text@encoding{#1}\edef\languagename{\string #1}}
\foreign@language{russian}%
\inputencoding{\ArticleEncoding}%
\catcode 64=11
\set@headline@encoding{\article@lang}%
\ifx\utfVIIIname\ArticleEncoding\else\let\PSTAmkXMP\relax\fi
\def\orgdef#1\\ #2\\ #3\\ #4\\ #5\\ {%
  \expandafter\def\csname english-*#1\endcsname{#3}%
  \expandafter\def\csname russian-*#1\endcsname{#5}%
  \expandafter\orgdef@\csname#1\expandafter\endcsname
    \csname english-#1\expandafter\endcsname
    \csname russian-#1\expandafter\endcsname{#2}{#3}{#4}{#5}{#1}}%
\def\orgdef@#1#2#3#4#5#6#7#8{%
  \def#1{\csname\languagename-#8\endcsname}%
  \def#2{\href{http://#4}{#5}}%
  \def#3{\href{http://#6}{#7}}}%
\def\EnglishRussianCaption#1#2#3{%
  \def#1{\csname \languagename-\expandafter\@gobble\string#1\expandafter\endcsname}%
  \expandafter\def\csname english-\expandafter\@gobble\string#1\expandafter\endcsname{#2}%
  \expandafter\def\csname russian-\expandafter\@gobble\string#1\endcsname{#3}}
\def\publname{\TopHead}
\@ifundefined{journalabbreviationinenglish}{\def\journalabbreviationinenglish{psta}}{}%
\def\PublicationInfo{{}\PSTAprepared{ }\PSTAfor \emph{\JournalLink} \PSTAat \today}
\def\PublicationLink#1{}
\edef\@tempa{\journalabbreviationinenglish-\ArticleEncoding.sty}%
\InputIfFileExists{\journalabbreviationinenglish-\ArticleEncoding.sty}{}{}
\def\sloppy{\spaceskip2.5ptplus3.5ptminus1.5pt\expandafter\everypar\expandafter{\the\everypar\def\sloppy{}}}
\IfFileExists{t2atli.fd}{\let\pstatextnumero\textnumero \def\textnumero{{\fontfamily{tli}\selectfont\pstatextnumero}}}{}
%\IfFileExists{xcolor.sty}{\RequirePackage{xcolor}}{
  \RequirePackage{color}
%}
\definecolor{darkred}{rgb}{0.3,0,0}
\definecolor{lightgray}{rgb}{0.5,0.5,0.5}
\definecolor{citecolor}{rgb}{0,0.3,0.25}
\definecolor{urlcolor}{rgb}{0.2,0,0.1}
\definecolor{linkcolor}{rgb}{0,0.07,0.2}
\definecolor{backrefcolor}{rgb}{0.55,0.55,0.55}
\definecolor{verbatimrules}{rgb}{0.1,0.3,.2}
\definecolor{verbatimbgu}{rgb}{.85,0.97,.9}
\definecolor{verbatimbg}{rgb}{.92,1,.92}
\definecolor{verbatimtitle}{rgb}{0.1,0.4,0.2}
\definecolor{verbatimnumbers}{rgb}{0.7,0.8,0.8}
\definecolor{verbatimdefault}{rgb}{0.25,0.2,0.3}
\definecolor{authorsmarks}{rgb}{0.4,0.6,0.4}
\definecolor{string}{rgb}{0.45,0.45,0.1}
\definecolor{gt}{rgb}{0.55,0.75,0.45}
\definecolor{word}{rgb}{0.25,0.25,0.25}
\definecolor{key}{rgb}{0.1,0.4,0.1}
\definecolor{variable}{rgb}{0.4,0,0}
\definecolor{comment}{rgb}{0.15,0.2,0.6}
\definecolor{parameter}{rgb}{0,0.2,0.5}
%
%
\if n\old@system 
\patchcmd{\pdfstringdef}
  {\csname HyPsd@babel@}
  {\let\bbl@info\@gobble\csname HyPsd@babel@}
  {}{}
%https://tex.stackexchange.com/questions/193025/babel-hyperref-redefining-shorthand-several-times-per-page
\Urlmuskip=0mu plus 2mu\relax
\fi
%\RequirePackage{bookmark}  
\RequirePackage{textcase,cite,backref}
%\RequirePackage[figure,table]{totalcount}
\RequirePackage[citation-order,sorted-cites,compressed-cites,initials,sorted-cites,compressed-cites,backrefs,nobysame]{amsrefs}
%%
\long\def\NothebibliographyinEnglish#1\end{\end}%
%
\IfFileExists{Assigned.tex}{\input{Assigned.tex}\global\def\jobname{Assigned}
  \def\HideFromPeer##1{\textcolor{authorsmarks}{$\langle$\PSTAblind$\rangle$}}%
  \def\psta@blind{y}%
  \def\@Reviewer{\PSTAAssigned\AnonimousReview\hskip 1emplus3cm \Reviewer}}{\def\psta@blind{n}\let\HideFromPeer\@firstofone}
\def\otherlanguagepages#1{\def\pstaotherpages{#1}\let\thebibliographyinEnglish\NothebibliographyinEnglish}%
\newskip\psta@v@point
\newskip\hugerskipamount
\newskip\hugeskipamount\def\hugeskip{\@@par\penalty-9000\vskip\hugeskipamount}
\newskip\smallerskipamount\def\smallerskip{\@@par\penalty-1000\vskip\smallerskipamount}
\newskip\biggerskipamount\def\biggerskip{\@@par\penalty-5000\vskip\biggerskipamount}
\def\set@fontsize#1#2#3{%
    \@defaultunits\@tempdimb#2pt\relax\@nnil
    \edef\f@size{\strip@pt\@tempdimb}%
    \@defaultunits\@tempskipa#3pt\relax\@nnil
    \edef\f@baselineskip{\the\@tempskipa}%
    \edef\f@linespread{#1}%
    \let\baselinestretch\f@linespread
    \normalbaselineskip\f@baselineskip\relax
    \normalbaselineskip\f@linespread\normalbaselineskip
    \let\size@update\psta@ajust@vskips}
\def\psta@set@vskips{%\tracing a
  \@tempdima\psta@v@tolerance\psta@v@point
  \@tempdimb\psta@v@tolerance\@tempdima
  \@tempdimb 2\@tempdimb  
  \advance\@tempdimb \@tempdima 
  \psta@setskip \parskip {1.5}% 
  \psta@setskip \smallskipamount 3%
  \psta@setskip \smallerskipamount{4.5}%
  \psta@setskip \medskipamount 6%
  \psta@setskip \biggerskipamount 9%
  \psta@setskip \bigskipamount {12}%
  \psta@setskip \hugerskipamount{18}%
  \psta@setskip \hugeskipamount{24}%
  \belowdisplayskip=4\psta@v@point plus \psta@v@point minus .7\psta@v@point 
  \belowdisplayshortskip=\smallskipamount
  \abovedisplayshortskip=\parskip  
  \abovedisplayskip=\medskipamount  
  \baselineskip=\smallskipamount %\tracing 0 
  \advance\baselineskip .75\normalbaselineskip 
     \setbox\strutbox\hbox{%
          \vrule\@height7\psta@v@point
                \@depth3\psta@v@point
                \@width\z@}%
        \let\size@update\relax%
  \jot=\smallskipamount  \itemsep=\parskip   \parsep=\parskip   \belowdisplayskip=\abovedisplayskip}
\def\vTolerance#1 {\def\psta@v@tolerance{#1}}\vTolerance 0.1
\def\psta@setskip#1#2{#1=#2\psta@v@point plus#2\@tempdima minus #2\@tempdimb\relax}
\def\psta@v@tighter{\@@par \psta@v@point 0.8\psta@v@point \psta@set@vskips}
\def\psta@ajust@vskips{%
  \psta@v@point\psta@vscale\normalbaselineskip 
  \if y\psta@use@vscale\else\advance\psta@v@point\normalbaselineskip
  \fi
  \divide \psta@v@point 12
%  \wlog{\string\psta@vscale=\psta@vscale\space\string\psta@use@vscale=\psta@use@vscale  \space\the\psta@v@point\space\string\parskip=\the\parskip\space\string\baselineskip=\the\baselineskip}
  \psta@set@vskips}%
\def\vExpand#1 {\let\psta@use@vscale n\def\psta@vscale{#1}\csname psta@ajust@vskips\endcsname }\vExpand 0 %
\def\vScale#1 {\let\psta@use@vscale y\def\psta@vscale{#1}\csname psta@ajust@vskips\endcsname }
\AtBeginDocument{\psta@ajust@vskips}

%%%%%%%%%%%%                  EnumItem                             %%%%%%%%%%%%%%
\IfFileExists{enumitem.sty}{\RequirePackage{enumitem}\@firstofone}{\@gobble}{
\setlist[enumerate,1]{labelindent=0cm, labelwidth=5pt, itemindent=5pt,leftmargin=10pt,rightmargin=5pt
    ,topsep=\parskip,itemsep=\parskip,before={\psta@v@tighter},after={\@@par\psta@ajust@vskips}}%
\newbox\pstabulletbox\setbox\pstabulletbox\hbox{\,\raise.3ex\hbox{$\scriptscriptstyle\bullet$}\!}% 
\setlist[itemize,1]{labelindent=0pt, labelwidth=0pt, itemindent=0pt,leftmargin=10pt,rightmargin=5pt,label=\copy\pstabulletbox
    ,topsep=\parskip,itemsep=\parskip,before={\psta@v@tighter},after={\@@par\psta@ajust@vskips}}%
\setlist[description,1]{labelindent=3pt, labelwidth=1pc, leftmargin=10pt,rightmargin=6pt,style=unboxed%
    ,topsep=\parskip,itemsep=\parskip,before={\psta@v@tighter},after={\@@par\psta@ajust@vskips}}%
\renewcommand{\descriptionlabel}[1]{\hspace\labelsep{\scalebox{1.05}{\emph{#1}}}}
\def\FV@Space{\kern.5em}
\def\pstarus#1#2{\russian@alph{\csname c@#2\endcsname}}
\def\pstaRus#1#2{\russian@Alph{\csname c@#2\endcsname}}
\def\pstarualph#1{{\footnotesize\textsf(}#1\textit{\pstarus\alph*}{\footnotesize\textsf)}}
\def\pstarualphei#1{{\footnotesize\textsf(}\textit{#1\pstarus\alph*}{\footnotesize\textsf)}}
\def\pstaruAlph#1{{\scriptsize\textsf(#1\pstaRus\expandafter\alph*\scriptsize\textsf)}}}{}
\@ifundefined{SetEnumitemKey}{}{%
\SetEnumitemKey{parindent}{labelwidth=\parindent, itemindent=0pt,leftmargin=\parindent,rightmargin=0pt}
\SetEnumitemKey{1.1}{label*=\arabic*.}
\SetEnumitemKey{123}{label={\textup{\textsf\scriptsize(\!\footnotesize\textit{\arabic*}\kern-.5pt\scriptsize\textsf)}},
    ref={\textup{\footnotesize\textsf(\emph{\arabic*}\textsf)}}}
\SetEnumitemKey{iii}{label={\footnotesize\textsf(}\emph{\roman*}{\footnotesize\textsf)},
    ref={\footnotesize\textsf(}\emph{\roman*}{\footnotesize\textsf)}}
\SetEnumitemKey{abc}{label={\footnotesize\textsf(}\emph{\alph*}{\footnotesize\textsf)},
    ref={\footnotesize\textsf(}\emph{\alph*}{\footnotesize\textsf)}}
\SetEnumitemKey{ABC}{label={(\scriptsize\textsf(\emph{\Alph*}\textsf)},
    ref={\footnotesize\textsf(\emph{\Alph*}\textsf)}}
\SetEnumitemKey{ABVGD}{label={\pstaruAlph{\noexpand}},ref={\pstaruAlph{\noexpand}}}
\SetEnumitemKey{abvgd}{label={\pstarualphei{\noexpand}},ref={\pstarualphei{\noexpand}}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                    %%%%%%%%%%%%%                  Upright Braces                       %%%%%%%%%%%%%%  
\edef\pstastringOpen{\string(}
\edef\pstastringClose{\string)}
\def\pstastringOpenUp{\relax \ifmmode \pstastringOpen\else\textup\pstastringOpen\fi}
\def\pstastringCloseUp{\relax \ifmmode \pstastringClose\else\textup\pstastringClose\fi}
\catcode`(=13 \catcode`)=13
\def\UprightTextParens{\catcode`(=13 \catcode`)=13 \let(\pstastringOpenUp \let)\pstastringCloseUp}
\def\NoUprightTextParens{\catcode`(=12 \catcode`)=12}\NoUprightTextParens
%
\newcommand\WerbatimToken[1]{\edef#1{\string#1}}%
\WerbatimToken\EndWeed
\WerbatimToken\Bound
\WerbatimToken\Weed@Cursor
\WerbatimToken\Weed@@Cursor
\let\wlogpsta\wlog
\gdef\@secondfirstoftwo#1#2{#2#1}
% Inspired by the Package{domore}[2013/03/22] by Uwe Lueck
\def\@@ifx#1#2#3#4{\ifx#1#2\expandafter\@firstoftwo\else\expandafter\@secondoftwo\fi{#3}{#4}}%
%\def\@@ifx#1#2#3#4{\ifx#1#2\expandafter\@firstoftwo\else\expandafter\@secondoftwo\fi{\wlog{[\string#1=\string#2]}#3}{\wlog{[\string#1=\meaning#1^^J!=\string#2]}#4}}%
\def\TestThisMacro#1\\{\message{\string #1^^J\@spaces\@spaces\@spaces#1^^J}}%
%\def\TestThisMacro#1\\{}
%%%%%%%%%%%  MACRO \ArrangeList ,<|12345|>=- PRODUCE  ={<1,2,3,4,5>}
%                  \ArrangeList ,<||>=-      PRODUCE  -
% No grouping to be allowed instead of |12345 here, just a single tokens!!! 
\def\ArrangeList#1#2#3#4{\@@ifx#3#4{\@thirdofthree}{\ArrangeList@{#1}{#2#4}#3}}%
% LastStep:   \ArrangeList@ {,}{<1234}|5|>=-   =>  \ArrangeList@ {,}{<1,2345}||>=-
\def\ArrangeList@#1#2#3#4{\@@ifx#3#4{\ArrangeList@@{#2}}{\ArrangeList@{#1}{#2#1#4}#3}}%
\def\ArrangeList@@#1#2#3#4{#3{#1#2}}%
%\TestThisMacro \ArrangeList ,<|12345|>=- \\
%\TestThisMacro \ArrangeList ,<||>=- \\     
% 
%%%%%%%%%%%  MACRO  \Weed {1121\relax 22779211}{AFTER}  PRODUCE  AFTER{1279) 
%
\long\def \Weed#1{\Weed@@Check\Weed@Cursor\Weed@@Cursor#1\EndWeed}
\long\def \Weed@@Check#1\Weed@Cursor#2\Weed@@Cursor#3{%
    \@@ifx#3\EndWeed
       {\@secondfirstoftwo{{#1#2}}}%
       {\@@ifx#3\relax
          {\Weed@@Check#1\Weed@Cursor#2\Weed@@Cursor}
          {\Weed@Check#1\Weed@Cursor#2\Weed@@Cursor#3}}} 
\long\def \Weed@Check#1\Weed@Cursor#2#3{%
    \@@ifx#2\Weed@@Cursor{\WeedCompare@@#1\Weed@Cursor#3#2}%
    {\@@ifx#2\relax
        {\Weed@@Check#1\Weed@Cursor#3}%
        {\@@ifx#3\Weed@@Cursor\WeedCompare@@\WeedCompare@#1\Weed@Cursor#2#3}}}%
\long\def \WeedCompare@@#1\Weed@Cursor#2\Weed@@Cursor#3{%
    \@@ifx#3\EndWeed
       {\@secondfirstoftwo{{#1#2}}}%
          {\@@ifx#2#3%
                {\Weed@Check\Weed@Cursor#1#2\Weed@@Cursor}%
                {\Weed@Check\Weed@Cursor#1#2#3\Weed@@Cursor}}}
\long\def \WeedCompare@#1\Weed@Cursor#2#3\Weed@@Cursor#4{%
    \@@ifx#4\relax
        {\Weed@Check\Weed@Cursor#1#2#3\Weed@@Cursor}%
        {\@@ifx#2#4%
            {\Weed@Check\Weed@Cursor#1#2#3\Weed@@Cursor}%
            {\Weed@Check#1#2\Weed@Cursor#3\Weed@@Cursor#4}}}
%
%   \tracingall
%\TestThisMacro \Weed {112122779211}{AFTER}\\
%\TestThisMacro \Weed{\relax \relax 112\relax \relax 122779211\relax \relax}{AFTER}\\
%\TestThisMacro \Weed {12\relax \relax 122779}{AFTER}\\
%\TestThisMacro \Weed {1\relax 1\relax 122779}{AFTER}\\
%\TestThisMacro \Weed {\relax 12\relax 122779\relax }{AFTER}\\
%
\def\@ifrus{\ifx\languagename\russian@lang \expandafter\@firstoftwo\else\expandafter\@secondoftwo\fi}
%%%%%%%%%%%%%%%  General Cyrillic support  %%%%%%%%%%%%%%%%%%%%%%%%
\DefineName{etc}{\Etcname}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% author related
\catcode`\'=11
\def\AG@abbreviate@author#1{\expandafter\AG@name@split #1,{},{},{},\@nil
    \expandafter\@ifempty\expandafter{\the\AG@shortauthors}{%
        \expandafter\expandafter\expandafter
        \AG@groupswap\expandafter\expandafter\expandafter    
        {\expandafter \bib'initials\expandafter~\bib'surname}%
        {\AG@shortauthors}{}}{\expandafter\expandafter\expandafter
        \AG@groupswap\expandafter\expandafter\expandafter    
        {\expandafter \bib'initials\expandafter~\bib'surname}%
        {\AG@shortauthors\expandafter}{\the\AG@shortauthors, }}
   % \tracingmacros=0
    }
\def\AG@groupswap#1#2#3{#2{#3#1}}%
\def\AG@name@split#1,#2#3,#4#5,#6\@nil{%
  \def\bib'surname{#1}%
  \ifx\bib'surname\@empty \EmptyNameWarning\fi
  \def\bib'given{#2#3}%
  \def\bib'jr{#4#5}%
  \ifx\@empty\bib'given \NameCheck #1 ??\@nil
  \else \extract@initials{#2#3}%
  \fi
}
\def\@count@chars#1{\ifx \@nil#1\empty\else \advance \@tempcnta \@ne \@xp \@count@chars \fi} 
\def\bib@field@patches{%
    \ifx\bib'author\@empty
        \ifx\bib'editor\@empty
            \let\current@primary\bib'translator
            \let\print@primary\PrintTranslatorsA
        \else
            \let\current@primary\bib'editor
            \let\print@primary\PrintEditorsA
        \fi
    \else
        \let\current@primary\bib'author
        \let\print@primary\PrintAuthors
    \fi
    \ifx\bib'address\@empty
        \let\bib'address\bib'place
    \fi
    \ifx\bib'organization\@empty
        \ifx\bib'institution\@empty
            \let\bib'organization\bib'school
        \else
            \let\bib'organization\bib'institution
        \fi
    \fi
    \ifx\bib'date\@empty
        \ifx\bib'year\@empty
            \let\bib@year\bib'status
        \else
            \bib@parsedate\bib'year
        \fi
    \else
        \bib@parsedate\bib'date
    \fi
    \def\@tempa{year}%
    \ifx\bib'volume\@tempa
        \let\bib'volume\bib@year
        \let\bib'date\@empty
    \fi
%    \ifx\setbib@@\setbib@article
%        \ifx\bib'volume\@empty
%            \ifx\bib'number\@empty\else
%                \let\bib'volume\bib'number
%                \let\bib'number\@empty
%            \fi
%        \fi
%    \fi
    \bib@language@fixup
}

\renewcommand{\PrintNames@a}[4]{%
    \PrintSeries{\name}
        {#1}
        {,}{ \set@othername}
        {,}{ \set@othername}
        {,}{ \set@othername}
        {#2}{#4}{#3}%
}
\def\InitialPunct{.}
\BibSpec{firstauthor}{
   +{}{}{surname}
   +{}{ }{initials}
   +{}{ \parenthesize}{jr}
  }
\BibSpec{coauthor}{
   +{,}{ }{transition}
   +{}{ }{surname}
   +{}{ }{initials}
   +{}{ \parenthesize}{jr}
  }
\BibSpec{middleauthor}{
   +{,}{ }{transition}
   +{}{ }{surname}
   +{}{ }{initials}
   +{}{ \parenthesize}{jr}
  }
\BibSpec{lastauthor}{
   +{,}{ }{transition}
   +{}{ }{surname}
   +{}{ }{initials}
   +{}{ }{jr}
  }
\def\biblanguageEnglish{english}
\let\biblanguagedefault\biblanguageEnglish

\BibSpecAlias{firsteditor}{firstauthor}
\BibSpecAlias{issue}{number}
\BibSpecAlias{coeditor}{coauthor}
\BibSpecAlias{middleeditor}{coeditor}
\BibSpecAlias{lasteditor}{coeditor}
\BibSpec{firsted}{
 +{}{}{initials}
 +{}{ }{surname}
 +{}{ }{jr}
}
\BibSpec{coed}{
 +{,}{ }{initials}
 +{}{ }{surname}
 +{}{ }{jr}
}
\BibSpec{middleed}{
 +{,}{ }{initials}
 +{}{ }{surname}
 +{}{ }{jr}
}
\BibSpec{lasted}{
 +{,}{ }{initials}
 +{}{ }{surname}
 +{}{ }{jr}
}
\def\bib@language@fixup{%    
    \ifx\bib'hyphenation\@empty
        \ifx\bib'language\@empty
            \expandafter\find@noncyr\bib'author\@nill 
            \edef\bib@language{\bib@cyr@lat{\string russian}{\string english}}%
        \else
            \let\bib@language\bib'language
        \fi
    \else
        \let\bib@language\bib'hyphenation
    \fi
   % \expandafter\aftergroup
    \csname bib@set@\bib@language\endcsname
    \def\@tempa##1 ##2\@nil{\lowercase{\def\bib@language{##1}}}%
    \@firstofone{\@xp\@tempa\bib@language} \@nil}
\let\bib@selectlanguage@\bib@selectlanguage
\def\bib@selectlanguage{\afterassignment\bib@selectlanguage@
    \bib@language@fixup}
\def\emdash{\---}%
\font\bib@author@font=lacc1000 at 6.5pt
\def\PrintAuthorList#1{{\bib@author@font{\PrintNames{}{}{#1}}}}
\def\find@noncyr#1\@nill{\open@names#1\name{}\@nill}%
\def\open@names#1\name#2#3\@nill{\@ifempty{#2}%
    {\lowercase{\lookfor@v#1v\@nill}}%
    {\open@names#1#2#3\@nill}}

\def\AMS@IoC#1{{\noexpand\IoC#1}}
\def\AMS@UTFviii@two@octets#1#2{{\noexpand\UTFviii@two@octets\string #1\string#2}}
\def\AMS@UTFviii@three@octets#1#2#3{{\noexpand\UTFviii@three@octets\string #1\string#2\string#3}}
\def\AMS@UTFviii@four@octets#1#2#3#4{{\noexpand\UTFviii@four@octets\string #1\string#2\string#3\string#4}}

\def\extract@initials#1{\@extract@initials{#1}{\edef\@tempa{\def\@nx\bib'initials{\@tempa}}}}
\catcode`\'=12
\def\@extract@initials#1#2{%
    \begingroup
        \auto@protect\ini@hyphen
        \auto@protect\nobreakspace
        \let\-=\@empty
        \let~\relax
        \let\IoC\AMS@IoC
        \let\UTFviii@two@octets\AMS@UTFviii@two@octets
        \let\UTFviii@three@octets\AMS@UTFviii@three@octets
        \let\UTFviii@four@octets\AMS@UTFviii@four@octets
        \@apply\auto@protect\amsrefs@textsymbols
        \@apply\auto@protect\amsrefs@textaccents
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
        %\show\@tempa
        #2\@xp\endgroup
    \@tempa
}
   
\def\@lookfor#1{\csname @lookfor#1\endcsname}
\def\reserved@a#1#2{\expandafter\def\csname lookfor@#1\endcsname ##1#1##2\@nill
        {\@ifempty{##2}{\csname lookfor@#2\endcsname##1#2\@nill}{\bib@set@lat}}}
\reserved@a vh\reserved@a ht\reserved@a tb\reserved@a bd\reserved@a df\reserved@a
    fg\reserved@a gj\reserved@a  jk\reserved@a ks\reserved@a  sl\reserved@a
    lm\reserved@a mn\reserved@a nq\reserved@a qu\reserved@a
    uw\reserved@a wx\reserved@a xy\reserved@a
    yz\reserved@a z{end}%
\def\lookfor@end#1\@nill{\bib@set@cyr}%
\def\bib@set@lat{%\message{(bib-lat)}
    \let\bib@cyr@lat\@secondoftwo}
\def\bib@set@cyr{%\message{(bib-cyr)}
        \let\bib@cyr@lat\@firstoftwo}
\let\bib@set@russian\bib@set@cyr
\let\bib@set@english\bib@set@lat
\let\bib@set@french\bib@set@lat

%\let\bib@author@font\normalfont

\let\bib@title@font\textit
\let\bib@volume@font\textbf
\def\EnglishInitialCaps#1{#1}%
\def\@eprint{{\scriptsize \textsf{URL:} }\url}
\BibSpec{collection.article}{%
    +{}  {\PrintAuthors}                {author}
  +{.}{ \textit}{title}
  +{}{  // \EnglishInitialCaps}{booktitle}
  +{}{  // \EnglishInitialCaps}{conference}
  +{:}{ }{subtitle}
  +{:}{ }{type}
  +{.}{ }{series}
  +{/}{ }{organization}
  +{}{ / \bib@cyr@lat{\bibedstext~\PrintAuthors}{\PrintEditorsA}}{editor}
  +{. \emdash}{ \PrintEdition}{edition}
  +{.}{ \emdash}{place}
  +{:}{ }{publisher}
  +{,}{ \PrintDateB}{date}
  +{.}{ \bibParttext~}{part}
  +{.}{ \bibVoltext~\bib@volume@font}{volume}
  +{,}{ \bibissuetext~}{number}
  +{}{ \parenthesize}{status}
  +{,}{ \bibpagetext~}{pages}
  +{.}{}{transition}
  +{,}{ \@eprint}{eprint}
  +{.}{}{transition}
  +{,}{ }{note}
  +{.}{}{transition}
  +{}{\SentenceSpace \ReviewList}{review}
  +{}{ \parenthesize}{language}
}
\BibSpec{article}{%
    +{}  {\PrintAuthors}                {author}
  +{.}{ \textit}{title}
  %  +{,} { \textit}                     {title}
  %  +{.} { }                            {part}
  +{:}{ }             {part}
    +{:} { \textit}                     {subtitle}
    +{,} { \PrintContributions}         {contribution}
    +{.} { \PrintPartials}              {partial}
  +{}{ // }             {journal}
 %   +{,} { }                            {journal}
  +{.}{ }{series}
  +{,}{ \PrintDateB}{date}
  +{.}{ \bibVoltext~\textbf}      {volume}
  +{,}{ \bibissuetext~}{number}
  +{,}{ \bibpagetext~}  {pages}
  +{} { \parenthesize}{status}
  +{,}{ \PrintDOI}    {doi}
  +{}{ \parenthesize}{language}
  +{}  { \PrintTranslation}           {translation}
  +{,}{ \@eprint}      {eprint}
  +{,}{ }             {note}
  +{.}{}              {transition}
}
\BibSpec{book}{%\DefineSimpleKey{bib}{issue}
    +{}  {\PrintAuthors}                {author}
  +{.}{ }{title}
  +{}{  // \EnglishInitialCaps}{booktitle}
  +{:}{ }{subtitle}
  +{:}{ }{type}
  +{.}{ }{series}
  +{ }{/ }{organization}
  +{}{ / \bib@cyr@lat{\bibedstext~\PrintAuthors}{\PrintEditorsB}}{editor}
  +{.}{ \PrintEdition}{edition}
  +{,}{ \bibvoltext~\bib@volume@font}{volume}
  +{.}{ }{place}
  +{:}{ }{publisher}
  +{,}{ \PrintDateB}{date}
  +{. }{ \bibParttext~}{part}
  +{,}{ \bibissuetext~}{number}
  +{}{ \parenthesize}{status}
  +{. \emdash}{ \PrintPages}{pages}
  +{.}{ }{note}
  +{.}{}{transition}
  +{}{\SentenceSpace \ReviewList}{review}
  +{}{ \parenthesize}{language}
  }
 
\BibSpec{report}{%
  +{}{\PrintAuthors}{author}
  +{.}{ \textit}{title}
  +{:}{ }{type}
  +{}{  // \EnglishInitialCaps}{booktitle}
  +{:}{ }{subtitle}
  +{.}{ }{series}
  +{/}{ }{organization}
  +{}{ / \bib@cyr@lat{\bibedstext~\PrintAuthors}{\PrintEditorsB}}{editor}
  +{.}{ \PrintEdition}{edition}
  +{.}{ }{place}
  +{:}{ }{publisher}
  +{,}{ }{institution}
  +{,}{ \PrintDateB}{date}
  +{.}{ \bibVoltext~\bib@volume@font}{volume}
  +{.}{ \bibParttext~}{part}
  +{,}{ \bibissuetext~}{number}
  +{,}{ \@eprint}      {eprint}
  +{}{ \parenthesize}{status}
  +{. ---}{ \PrintPages}{pages}
  +{.}{}{transition}
  +{,}{ }{note}
  +{.}{}{transition}
  +{}{\SentenceSpace \ReviewList}{review}
  +{}{ \parenthesize}{language}
}
\BibSpec{thesis}{%
  +{}{\PrintAuthors}{author}
  +{}{ / \bib@cyr@lat{\bibedstext~\PrintAuthors}{\PrintEditorsC}}{editor}
  +{.}{ \textit}{title}
  +{,}{ \PrintThesisType}{type}
  +{,}{ }{organization}
  +{,}{ }{institution}
  +{,}{ }{place}
  +{,}{ \PrintDate}{date}
  +{}{ \parenthesize}{status}
  +{,}{ }{note}
  +{.}{}{transition}
  +{.}{ \bibParttext~}{part}
  +{. ---}{ \PrintPages}{pages}
  +{,}{ \@eprint}{eprint}
  +{.}{}{transition}
  +{}{\SentenceSpace \ReviewList}{review}
  +{}{ \parenthesize}{language}
}
\def\etcname{\bib@cyr@lat{\Etcname}{etc.}}%
\newcommand\PrintPages[1]{#1~\bibpagetext}

%%%%%%%% End of file amsrefsgost.sty
%%%%%%%%
\PassOptionsToPackage{amsmath}{intlimits,sumlimits,namelimits,centertags}
\RequirePackage{amssymb,amscd,euscript}% 
\let\equation\gather \let\endequation\endgather
\RequirePackage{nameref,color,graphics,lscape,upref,rotating}
\RequirePackage{array}\setlength{\extrarowheight}{1pt}
\IfFileExists{extdash.sty}{\RequirePackage[shortcuts]{extdash}
\def\EXD@emdash{\bib@cyr@lat{\cyrdash}{---}}}{}
%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% subjclass related
\newcommand\format@subjclass[2]{\@ifundefined{subjclassname@#1}{\ClassWarning {\@classname}{Unknown Subject Classification!}}
    {\@nameuse{subjclassname@#1}{#2} }}
\renewcommand*\subjclass[2][1991]{\format@subjclass{#1}{#2}}
\expandafter\gdef\csname russian-setsubjclasses\endcsname{}%
\expandafter\gdef\csname english-setsubjclasses\endcsname{}%
\@namedef{subjclassname@1999}#1{\global\@namedef{setsubjclass9}{\SCAformat@{1999}{#1}\@@par}}%
\@namedef{subjclassname@2000}#1{\global\@namedef{setsubjclass0}{\SCAformat@{2000}{#1}\@@par}}%
\@namedef{subjclassname@2010}#1{\global\@namedef{setsubjclass1}{\SCAformat@{2010}{#1}\@@par}}%
\@namedef{subjclassname@UDC}#1{\global\@namedef{setsubjclassU}{\noindent \fontSC@A{\UDCname %\fontSC@B
    {} #1\@@par}}}
\@namedef{subjclassname@UDK}#1{\global\@namedef{setsubjclassU}{\noindent \fontSC@A{\UDCname %\fontSC@B
    {} #1\@@par}}}
\@namedef{subjclassname@BBC}#1{\global\@namedef{setsubjclassB}{\noindent \fontSC@A{\BBCname %\fontSC@B
    {} #1\@@par}}}
\@namedef{subjclassname@BBK}#1{\global\@namedef{setsubjclassB}{\noindent \fontSC@A{\BBCname %\fontSC@B
    {} #1\@@par}}}
\def\fontSC@A#1{{\tiny{#1}}}
\def\fontSC@B#1{{\footnotesize\textsf{#1}}}%
\def\fontSC@C#1{{\scriptsize\textit{#1}}}
\def\SCAformat@#1#2{\noindent \fontSC@A{#1} \fontSC@C {Mathematics Subject Classification}\/: \fontSC@B{#2}\@@par}%
\def\set@logo#1{\hbox to\hsize{\fontsize{6}{7\p@}#1}}
\AtBeginDocument{\def\PrintBackRefs#1{\space \SentenceSpace \textcolor{backrefcolor}{$\uparrow $ \csname br@#1\endcsname}.}} 

% %% Paper design
%%
%
%%
%% 1. Page Dimensions 
%%
\def\ps@firstpage{\ps@plain
  \def\@oddfoot{}%
  \let\@evenfoot\@oddfoot
  \def\@oddhead{\@serieslogo}%
  \let\@evenhead\@oddhead % in case an article starts on a left-hand page
}
\widowpenalty=500
\clubpenalty=500
\brokenpenalty=500
\interlinepenalty=100
\AtBeginDocument{\def\verbatim@font{\Small\ttfamily}\thispagestyle{empty}}%
%%
%% 2. Headline and strings 
%%
\pagestyle{headings}
\def\ps@headings{\ps@empty
  \def\@evenhead{%
    \setTrue{runhead}%
    \normalfont\scriptsize
    \rlap{\thepage}\hfil \hbox to .9\hsize
    {\let\ \space\hfil\scshape{\leftmark{}{}}\hfil\hskip0ptminus.04\hsize}\hfil}%
  \def\@oddhead{%
    \setTrue{runhead}%
    \normalfont\scriptsize \hfil \hbox to .9\hsize{
    \hfil\hskip0ptminus.04\hsize
    \scshape{\let\ \space\rightmark{}{}}\hfil}\hfil \llap{\thepage}}%
}
\AtBeginDocument{\allowdisplaybreaks[2]\let\markboth\pstamarkboth}
\def\@captionheadfont{\small\scshape}
\def\@captionfont{\small}

%%
%% 3. Title page and last page  
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% authors related
%% 1. Record data 
%

\def\setlang#1{\let#1=\languagename\g@addto@macro\languagelist#1}
\newcommand\l@ifundefined[1]{\@ifundefined{\languagename-#1}}
\def\mk@Arg#1#2{\expandafter#1\csname#2\endcsname}
\newcommand\l@nameuse[1]{\l@Arg{}{#1}}
\newcommand\l@namedef[1]{\l@Arg\def{#1}}
\newcommand\l@nameedef[1]{\l@Arg\edef{#1}}

\def\l@casenew#1#2#3{% #1 detokenised #2 full #3 class
    \ifx#1\relax 
    \l@ifundefined{#3.id}{\count@=1 }{%
        \l@Arg\count@{#3.id}%
        \advance \count@ 1}%  
    \l@Arg\xdef{#3.id}{\number\count@}%
    \langshow{#3.id}%
    \l@Arg\def{#3.\number\count@}{#2}%
    \langshow{#3.\number\count@}%
    \xdef#1{\number\count@}%
%    \wlog{\string#1=\meaning#1}% % DEBUGDING !!!
    \l@tolist{#3-s}{#3.id}{#3}%
    \else \count@ #1 \fi 
}
    
\def\l@tolist#1#2#3{% #1-{short list name}; #2 {short item id}; #3 CLASS OF LISTS;
    \l@ifundefined{#1.list}%
    {\l@Arg\gdef{#1.list\expandafter}\expandafter
    {\csname#3-format\expandafter\expandafter\expandafter\endcsname
        \expandafter\expandafter\expandafter
    {\csname\languagename-#2\endcsname}}}%
    {\l@Arg\g@addto@macro{#1.list\expandafter}\expandafter
    {\csname#3-join\expandafter\endcsname
    \csname#3-format\expandafter\expandafter\expandafter\endcsname\expandafter\expandafter\expandafter
    {\csname\languagename-#2\endcsname}}}%
    \langshow{#1.list}}%  
\def\Zero@{0}
\def\new@l@data@#1{\expandafter
    \def\csname#1\endcsname##1{%
        \@ifundefined{role@}{%
        \l@Arg\def{author.0.#1}{##1}%
        \langshow{author.0.#1}%
        \expandafter\l@casenew\csname\languagename-#1=\detokenize{##1}\endcsname{##1}{#1}%
        \l@tolist{authors-with-#1.0}{Zero@}{#1-of-author}%
        }{%
        \l@Arg\def{\role@\l@Arg.{\role@.id}.#1}{##1}%
        \langshow{\role@\l@Arg.{\role@.id}.#1}%
        \expandafter\l@casenew\csname\languagename-#1=\detokenize{##1}\endcsname{##1}{#1}%
        \l@tolist{\role@ s-with-#1.\number\count@}{\role@.id}{#1-of-\role@}}}}
\gdef\languagelist{}\gdef\persons{}\gdef\authors{}\gdef\tutors{}
\def \image#1{\@namedef {\role@\l@Arg.{\role@.id}.image}{#1}}%
\def \imageurl#1{\@namedef {\role@.\csname\role@.id\endcsname.imageurl}{#1}}%
\def \imageauthor{\futurelet\next\imageauthor@}%
\def \imageauthor@{\ifx\next[\expandafter\image@author@@\else\expandafter\image@author@\fi}%
\def \image@author@#1{\@namedef {\role@.\csname\role@.id\endcsname.imageauthor}{\textcolor{verbatimnumbers}{#1}}}%
\def \image@author@@[#1]#2{\@namedef {\role@.\csname\role@.id\endcsname.imageauthor}{\href{#1}{\textcolor{verbatimnumbers}{#2}}}}%
\def \theorcid#1{\@namedef {\role@\l@Arg.{\role@.id}.orcid}{#1}\egroup}%
\def\orcid{\bgroup\catcode`\_=12 \catcode`\%=12 \catcode`\$=12 \catcode`\&=12 \catcode`\"=12 \catcode`\^=12
    \global\theorcid}
\def \theemail#1{\@namedef {\role@\l@Arg.{\role@.id}.email}{#1}\egroup}%
\def\email{\bgroup\catcode`\_=12 \catcode`\%=12 \catcode`\$=12 \catcode`\&=12 \catcode`\"=12 \catcode`\^=12
    \global\theemail}
    \long\def\info#1{\long\l@Arg\def{\role@.\csname\languagename-\role@.id\endcsname.info}{#1}}
\new@l@data@{thanks}
\expandafter\def\expandafter\do@thanks\expandafter#\expandafter1\expandafter{\thanks{#1}\catcode`_=8 }
\def \thanks{\catcode`_=12 \do@thanks}
\new@l@data@{address}
\renewcommand{\title}[2][]{%
    \expandafter\setlang\csname\languagename-\endcsname
    \@ifnotempty{#2}{\l@Arg\def{title}{#2}\l@Arg\def{shorttitle}{#2}}%
    \@ifnotempty{#1}{\l@Arg\def{shorttitle}{#1}}}%
\def\shortauthors#1{\if y\psta@blind\else\l@Arg\def{shortauthorsShorted}{#1}\l@Arg\def{FshortauthorsShorted}{#1}\fi}
\def\person@#1#2#3{% #1=Class #2-Short #3-Names
    \xdef\role@{#1}%
    \expandafter\l@casenew\csname\languagename-#1=\detokenize{#3}\endcsname{#3}{#1}%
    \@ifundefined{#1.id}{%
    \@namedef{#1.id}{1}}{%
        \ifnum\numexpr\l@nameuse{#1.id}>\numexpr\@nameuse{#1.id}\expandafter
        \let\csname #1.id\expandafter\endcsname\csname\languagename-#1.id\endcsname\fi}%
    \expandafter\@extract@initials@\csname\languagename-#1.\l@nameuse{#1.id}.initials\endcsname#3, , ,\@nil
    \langshow{#1.\l@nameuse{#1.id}.initials}%
    \expandafter\@extract@firstname@\csname\languagename-#1.\l@nameuse{#1.id}.first\endcsname#3, , ,\@nil
        \expandafter\def\csname\languagename-Fshort#1.\l@nameuse{#1.id}\expandafter
        \expandafter\expandafter\expandafter\expandafter\expandafter\expandafter
            \endcsname\expandafter\expandafter\expandafter\expandafter\expandafter\expandafter\expandafter{\csname
            \ifnum\language=\l@russian cyr\else lat\fi @#1\expandafter\endcsname
            \csname\languagename-#1.\l@nameuse{#1.id}.initials\expandafter\endcsname
            \csname\languagename-#1.\l@nameuse{#1.id}.first\expandafter\endcsname#3, , ,\@nil}%
    \langshow{Fshort#1.\l@nameuse{#1.id}.initials}%
        \expandafter\def\csname\languagename-short#1.\l@nameuse{#1.id}\expandafter
        \expandafter\expandafter\expandafter\expandafter\expandafter\expandafter
            \endcsname\expandafter\expandafter\expandafter\expandafter\expandafter\expandafter\expandafter{\csname
            cyr@#1\expandafter\endcsname
            \csname\languagename-#1.\l@nameuse{#1.id}.initials\expandafter\endcsname
            \csname\languagename-#1.\l@nameuse{#1.id}.first\expandafter\endcsname#3, , ,\@nil}%
%\@ifempty{#2}{}{\l@Arg\def{Fshort#1.\l@nameuse{#1.id}}{#2}}%
    \l@Arg\def{#1.\l@nameuse{#1.id}}{#3}%
    \l@ifundefined{short#1s}{\expandafter\def\csname \languagename-short#1s\expandafter\expandafter\expandafter\endcsname
    \expandafter{\csname\languagename-short#1.\l@nameuse{#1.id}\endcsname}   
    }{%
    \expandafter\g@addto@macro\csname \languagename-short#1s\expandafter\expandafter\expandafter\endcsname
    \expandafter\expandafter\expandafter{\expandafter\expandafter\expandafter\and
    \csname\languagename-short#1.\l@nameuse{#1.id}\endcsname}}%
    \l@ifundefined{Fshort#1s}{\expandafter\def\csname \languagename-Fshort#1s\expandafter\expandafter\expandafter\endcsname
    \expandafter\expandafter    \expandafter{\csname\languagename-Fshort#1.\l@nameuse{#1.id}\endcsname}   
    }{%
    \expandafter\g@addto@macro\csname \languagename-Fshort#1s\expandafter\expandafter\expandafter\endcsname
    \expandafter\expandafter\expandafter{\expandafter\expandafter\expandafter\and
    \csname\languagename-Fshort#1.\l@nameuse{#1.id}\endcsname}}%
    \expandafter\let\csname\languagename-short#1sShorted\expandafter\endcsname\csname\languagename-short#1s\endcsname  
    \expandafter\let\csname\languagename-Fshort#1sShorted\expandafter\endcsname\csname\languagename-Fshort#1s\endcsname  
    \langshow{#1.\l@nameuse{#1.id}}%
    \langshow{Fshort#1.\l@nameuse{#1.id}}
    \langshow{Fshort#1s}%
    \langshow{short#1.\l@nameuse{#1.id}}
    \langshow{short#1s}%
    }
    % 
\newcounter{pstadata}
\def\set@person@loop#1#2{% #1-action
    \setcounter{pstadata}\z@
    \def\person@body{\stepcounter{pstadata}%
    \ifnum\c@pstadata > \l@nameuse{#1.id}\else#2\expandafter\person@body\fi}}%
\renewcommand{\author}[2][]{\if  y\psta@blind \person@{author}{\HideFromPeer{}}{\HideFromPeer{},?}\else\person@{author}{#1}{#2}\fi}%
\def\@extract@initials@#1#2,#3,#4\@nil{\@extract@initials{#3}{\edef\@tempa{\def\@nx#1{\@tempa}}}}
\def\@extract@firstname@#1#2,#3#4,#5\@nil{\ifx#3\space \@extract@firstname#1#4 ,\else\@extract@firstname#1#3#4 ,\fi}
\def\@extract@firstname#1#2 #3,{\def#1{#2}}
\def\cyr@author#1#2#3,#4\@nil{#1~#3}%
\def\lat@author#1#2#3,#4\@nil{#2~#3}%
%
%\def\@firstofthree#1#2#3{#1}
%\def\@secondofthree#1#2#3{#2}
%\def\@thirdofthree#1#2#3{#3}
\def\submittedby#1{\def\submitted@by{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% format thanks, info, image
\def\swap@fio#1,#2\endswap@fio{#2 #1}
\def\format@info#1{\noindent{\begingroup\small \hfil\textbf{{}\expandafter\expandafter\expandafter
    \swap@fio\csname\languagename-#1\endcsname\endswap@fio}%
    \vadjust{\vskip2pt}\newline
    \@ifundefined{\languagename-#1.info}{\l@nameuse{#1.address}}%
        {\l@nameuse{#1.info}}\vskip\medskipamount
        \@ifundefined{#1.orcid}{}{
          \edef\orcid@url{\@nameuse{#1.orcid}}%
          \hbox{\hskip3cm\llap{\hss\iDicon\quad}\quad \href{https://orcid.org/\orcid@url}{\scriptsize\expandafter\nolinkurl\expandafter{\orcid@url}}}}%
        \@ifundefined{#1.email}{}{\hbox{\hskip3cm\llap{\hss{
          \scriptsize\bfseries{\textsf{ e-mail:}}}}\quad\href{mailto:\@nameuse{#1.email}}{\@nameuse{#1.email}}}}\endgroup  \parfillskip0pt \@@par\parfillskip0pt \@@par}}      
\def\includeauthorgraphics#1{\leavevmode\llap{\rotatebox{90}{\rlap{\scalebox{.5}{\vbox{\hsize\maxdimen\noindent\Large\textsf{#1}\@@par\vskip3mm}}}}}}
\def\set@author@info#1{\par \csname BetweenAuthorsInfos \endcsname
    \@ifundefined{author.#1.image}%
        {\noindent\leavevmode\format@info{author.#1}{\parfillskip\z@\@@par}}%
        {\hbox to \hsize{\hss    
            $\vcenter{\hbox{%
               \@ifundefined{author.#1.imageauthor}{}{
                \includeauthorgraphics{\csname author.#1.imageauthor\endcsname}}
                {\expandafter\@secondfirstoftwo\expandafter
                    {\expandafter{\csname author.#1.image\endcsname}}%
                    {\includegraphics[width=\@AuthorImageWidth]}%
        }}}\hskip2mm
         \vcenter{\vbox{\advance\hsize-\@AuthorImageWidth\advance\hsize-2mm\null\format@info{author.#1}{\parfillskip\z@\@@par}}}$\hss}}}  
\def\set@thanks@address{%
    \@footnotetext{{\let\par\@par\vskip -8pt\interlinepenalty\@M
        \scriptsize\psta@ajust@vskips
        \if y\psta@blind \else
        \rightskip 0ptplus1cm
        \l@nameuse{thanks-s.list}%
        \vskip1ex
        \@par\tiny\scshape\parindent\z@\relax\psta@ajust@vskips
        \format@address{\hyperlink{info}{\l@nameuse{author-s.list}}}%
        \l@nameuse{address-s.list}\fi
        \BottomHead}}}
\def\format@thanks#1{\@par#1.}%
\def\format@address#1{\noindent{\tiny\textsf{\copyright}\quad\ignorespaces#1,\hskip1emminus1em \Year}\@@par}
\def\format@address@#1{\expandafter\expandafter\expandafter\expandafter\expandafter\expandafter\expandafter\expandafter
\expandafter\expandafter\expandafter\expandafter \expandafter\expandafter \expandafter
\if
\expandafter\expandafter\expandafter\expandafter\expandafter\expandafter\expandafter\expandafter
\expandafter\expandafter\expandafter\expandafter \expandafter\expandafter \expandafter-#1\else\format@address{#1}\fi}
\@namedef{thanks-format}#1{\format@thanks
    {\l@nameuse{thanks.#1}\l@ifundefined{authors-with-thanks.#1.list}{}{\ifnum
        \l@nameuse{thanks.id}> 1 \authorsmark{\l@nameuse{authors-with-thanks.#1.list}}\fi}}}
\@namedef{address-format}#1{\format@address@
    {\l@nameuse{address.#1}\l@ifundefined{authors-with-address.#1.list}{}{\ifnum
\l@nameuse{address.id}>1 \authorsmark{\l@nameuse{authors-with-address.#1.list}}\fi}}}
\@namedef{author-format}#1{\l@nameuse{shortauthor.#1}%
    \ifnum \l@nameuse{address.id}>1 \authorsmark{#1}\else
    \l@ifundefined{thanks.id}{}{\ifnum \l@nameuse{thanks.id} >1 \authorsmark{#1}\fi}\fi}%
\@namedef{author-join}{, }%
\@namedef{thanks-of-author-join}{, }%
\@namedef{address-of-author-join}{, }%
\def\authorsmark#1{\ifnum \l@nameuse{author.id}>1 \raise.7ex\hbox{\scalebox{0.4}{\textcolor
    {authorsmarks}{{\small(\normalsize\textsf{#1}\small)}}}}\!\!\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% keywords related
\def\keywords#1{\l@Arg\def {keywords}{#1}}
\def\@setkeywords{\penalty9000\vskip3ptplus2pt
    {\noindent\footnotesize\itshape \keywordsname:}\enspace 
    {\scriptsize\textsf{\l@nameuse{keywords}.}\par}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% abstract related
\def\@abstractenvname{abstract}%
\long\def\abstract#1\end{\endgroup\long\global\l@Arg\def{abstract}{#1}
           \begingroup \def \@currenvir{abstract}\@endpefalse
        \end}%
\let\endabstract\@empty
\def\@ifother@language@#1#2{\ifnum \csname l@#1\endcsname=\csname l@\article@lang\endcsname\else\expandafter#2\fi}%
\def\@ifother@language#1#2{\begingroup\edef\languagename{\string #1}
    \ifnum \csname l@\languagename\endcsname=\csname l@\article@lang\endcsname\else
    \text@encoding{#1}#2\fi\endgroup}%
\def\@set@resume{%
    \let\@makefnmark\relax  \let\@thefnmark\relax
    \normalfont
    \set@thanks@address
  \ifx\article@lang\languagename \normalsize\else \small\fi
    \@ifundefined{setsubjclassB}{%
      \@ifundefined{setsubjclassU}{\smallskip}%
          {\@nameuse{setsubjclassU}\nobreak\bigskip}}
      {\@ifundefined{setsubjclassU}{%
        \@ifrus{\@nameuse{setsubjclassB}\nobreak\bigskip}{}}%
       {\@ifrus{\@nameuse{setsubjclassB}}{}\@nameuse{setsubjclassU}\nobreak\bigskip}}
  \ifx\article@lang\languagename
    {\centering \fontsize{11}{13\p@}\selectfont\relax
      \def\\{\protect\linebreak}%
      \hyperlink{info}{\l@nameuse{shortauthors}}%
      \l@ifundefined{title}{}{%
          \let\subtitle\displaysubtitle
          \Large\bfseries\vskip\smallskipamount\l@nameuse{title}}
    \ifx\@empty\@dedicatory \else \baselineskip16\p@
      \vtop{\footnotesize\itshape\@dedicatory\@@par%
        \global\dimen@i\prevdepth}\prevdepth\dimen@i \fi
        \vskip\hugeskipamount}
  \else \footnotesize
    \l@ifundefined{Fshortauthors}{}{\hyperlink{info}{\l@nameuse{Fshortauthors}.} }% 
    \textit{\l@nameuse{title}}. \nobreak\vskip\smallskipamount\fi
  \l@ifundefined{abstract}{}{%
    {\normalfont\Small
      \leftskip 1pc \rightskip\leftskip
    \noindent{\scshape 
    \expandafter\expandafter\expandafter\hyperlink\expandafter\expandafter\expandafter
    {\csname next@to@\languagename\endcsname.abstract}{\abstractname}\expandafter
    \hypertarget\expandafter{\languagename.abstract}{.}}%
      \l@nameuse{abstract}\@@par\smallskip}}
  \ifx\article@lang\languagename \normalsize\else \small\fi
     \l@ifundefined{keywords}{}{\@setkeywords}
     \@@par
  \@ifrus{}{\@ifundefined{setsubjclass9}{}{\nobreak\medskip\@nameuse{setsubjclass9}}
  \@ifundefined{setsubjclass0}{}{\nobreak\medskip\@nameuse{setsubjclass0}}
  \@ifundefined{setsubjclass1}{}{\nobreak\medskip\@nameuse{setsubjclass1}}}\nobreak\bigskip}
\newif\iftransbibliography     
\def\maybespace{\hskip1ptplus.5\hsize\strut\penalty-2000}
\def\@set@self@reference#1{{
    \let\PrintURL@\PrintURL\let\PrintDOI@\PrintURL
    \let \IsAmsBibKeys\@firstofone
    \expandafter\ifx\csname \languagename-title\endcsname\relax\else
      \noindent\textit{\SSylkaa}\@@par\nobreak
      \vskip \parskip
      \small \@sloppy\fi 
      \l@ifundefined{Fshortauthors}{}{\let\virtualpunct\@empty
        \hyperlink{info}{\l@nameuse{Fshortauthors}. }}\startquote
        \hyperlink{\languagename.abstract}{\l@nameuse{title}}\stopquote 
       . \expandafter\textit\PublicationInfo #1 \PublicationLink{\pagerange} 
       \rightskip \z@ \parfillskip \z@ plus2\hsize\@@par}\let\virtualpunct.}\let\virtualpunct.
\def\submittedby@autorsinfo@resume{%  
  \@ifresume{\if y\psta@blind \else
      \makesubmittedby
      \csname AfterSubmittedBy \endcsname
      \expandafter\if\csname ReferenceAfterInfos \endcsname
        \csname BeforeAuthorsInfos \endcsname
        \makeautorsinfo
        \csname AfterAuthorsInfos \endcsname\fi\fi
    \@set@self@reference{}%
    \if y\psta@blind \else
      \expandafter\if\csname ReferenceAfterInfos \endcsname\else
        \csname BeforeAuthorsInfos \endcsname
        \makeautorsinfo
        \csname AfterAuthorsInfos \endcsname \fi\fi
    \@ifundefined{pstaotherpages}{
    \csname BetweenLanguages \endcsname\pagebreak[1]
        \@ifother@language{english}{%
          \selectlanguage{english}%
          \set@headline@encoding\languagename 
        \small\@set@resume}{}}%
        %{\csname DoiAndLink\endcsname}
        \par\let \submittedby@autorsinfo@resume\relax }{}}  
\def\enddoc@text{\par\@@par\@fileswtrue\par\null\@@par
    \@ifresume{\iftransbibliography
        \else\submittedby@autorsinfo@resume\fi
        \leftmargin0pt\leftskip\leftmargin\@ifother@language{english}{\bib@set@lat\@set@self@reference
            { \expandafter\hyperlink\expandafter{\article@lang.abstract}{ (\emph{\csname in\article@lang name\endcsname}).}}}  
    \@ifother@language{russian}{%
       \leftmargin0pt\leftskip\leftmargin
        \hugeskip\pagebreak[1]
        \set@headline@encoding\languagename 
        \selectlanguage{russian}%
          \small\@set@resume
        \hugeskip
        \@set@self@reference{ \expandafter\hyperlink\expandafter{\article@lang 
            abstract}{(\emph{\csname in\article@lang name\endcsname}).}}}{}%\iftransbibliography\bib@endgroup\fi
    \vskip 0ptplus.5\hsize\break}{}}
\def\bib@endgroup{}
\def\AfterAuthorsInfos#1{\expandafter\gdef\csname AfterAuthorsInfos \endcsname{#1}}\AfterAuthorsInfos{\hugeskip}
\def\AfterSubmittedBy#1{\expandafter\gdef\csname AfterSubmittedBy \endcsname{#1}}\AfterSubmittedBy{\hugeskip}
\def\AuthorImageWidth#1{\gdef\@AuthorImageWidth{#1}}\AuthorImageWidth{25mm}
\def\BeforeAuthorsInfos#1{\expandafter\gdef\csname BeforeAuthorsInfos \endcsname{#1}}\BeforeAuthorsInfos{\hugeskip}
\def\BeforeCitationI#1{\expandafter\gdef\csname BeforeCitationI \endcsname{#1}}\BeforeCitationI{\hugeskip}
\def\BeforeEnglishRefs#1{\expandafter\gdef\csname BeforeEnglishRefs \endcsname{#1}}\BeforeEnglishRefs{\hugeskip}
\def\BetweenAuthorsInfos#1{\expandafter\gdef\csname BetweenAuthorsInfos \endcsname{#1}}\BetweenAuthorsInfos{\smallskip }
\def\BetweenLanguages#1{\expandafter\gdef\csname BetweenLanguages \endcsname{#1}}\BetweenLanguages{\vfill\break}
\def\ReferenceAfterInfos{\expandafter\gdef\csname ReferenceAfterInfos \endcsname{yy}}\expandafter\gdef\csname ReferenceAfterInfos \endcsname{no}
\def\transbibliography#1{\thebibliographyinEnglish#1}
\def\thebibliographyinEnglish{\@ifother@language@{russian}\NothebibliographyinEnglish\thebibliographyinEnglishReal}
\def\thebibliographyinEnglishReal{\transbibliographytrue\submittedby@autorsinfo@resume
    \csname BeforeEnglishRefs \endcsname \footnotesize \theenglishbibliography}
\def\makesubmittedby{
        \let\\\space
    \ifx\UndefIned\submitted@by\else\@ifundefined{Predstavil}{}{{
        \nobreak\medskip \noindent\leavevmode
        {\small\Predstavil}\hskip 1emplus500cm
        \textit{\submitted@by}\leftskip0ptplus5cm
        \parfillskip0pt\@@par}}\fi\let\makesubmittedby\relax}
\def\makeautorsinfo{
        %\microtypecontext{expansion=sloppy}%
        \set@person@loop{author}{\set@author@info{\arabic{pstadata}}}{}
        %\show\person@body
        \l@ifundefined{author.id}{}%
        {
          \noindent\strut\textit{\hypertarget{info}{\ifcase\l@nameuse{author.id}\or\oneauthor:\else\manyauthors:\fi}}
            \par\nobreak%\csname BetweenAuthorsInfos \endcsname
    \person@body \par}\let\makeautorsinfo\relax}  
\def\ResumeOn{\global\let\@ifresume\@firstoftwo \wlog{Resume On}}\ResumeOn
\def\NoResume{\global\let\@ifresume\@secondoftwo \wlog{Resume Off}}

\def\makepstaQ{
    \expandafter\ifx\csname psta-Q\endcsname\relax\else
    \bigskip\par%\noindent
    \textbf{{\itshape \PSTAjouQ\/}:}
    \csname psta-Q\endcsname\fi
    \expandafter\ifx\csname psta-A\endcsname\relax\else
    \par\textbf{{\itshape \PSTAjouA\/}:}
    \csname psta-A\endcsname \vfill\fi
    \bgroup\expandafter\ifx\csname psta-In\endcsname\relax\else
    \bigskip\small\par\textit{\Postupila}
    \csname psta-In\endcsname.\fi
    \egroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% maketitle
\font\colonTitlefont=larm1000  at 6pt%
\font\boldcolonTitlefont=labx1000  at 6pt%
\gdef\psta@leftline@{{\headline@language@\pstaleftline}}
\gdef\psta@rightline@{{\headline@language@\pstarightline}}
\gdef\pstamarkleft#1{\gdef\pstaleftline{#1}\psta@mark@update}
\gdef\pstamarkright#1{\gdef\pstarightline{#1}\psta@mark@update}
\gdef\pstamarkboth#1#2{\gdef\pstaleftline{#1}\gdef\pstarightline{#2}\psta@mark@update}
\gdef\psta@mark@update{\latexmarkboth{\protect\psta@leftline@}{\protect\psta@rightline@}}
\gdef\headline@language@{\let\languagename\headline@language\let\language@group\languagename
    \patchpdfheadlineencoding}
\def\maketitle{\par
    \@ifundefined{IssueDOI}{\let\IssueDOI\@gobble}{}
    \@ifundefined{pagerange}{\global\let\pagerange\@empty}{}
    \@topnum\z@ % this prevents figures from falling at the top of page 1
    \let\par\@@par
    \c@footnote\z@
    \l@Arg\ifx{shortauthors}\relax\def\pstaleftline{\pstarightline}\fi 
    \pstamarkboth{\hyperlink{info}{\l@nameuse{FshortauthorsShorted}}}{\hyperlink{\languagename.abstract}{\l@nameuse{shorttitle}}}
    \csname extrapdfinfo\endcsname
    \@sloppy
    \thispagestyle{firstpage}% this sets first page specifications
    \begingroup
      \normaltopskip0pc\relax
      \topskip0pc\relax
      \let\@makefnmark\relax  \let\@thefnmark\relax
      \@set@resume
      \if@titlepage \newpage\else\vskip5pt \fi
      \let\subtitle\inlinesubtitle
    \endgroup% ending (after addresses)
}%

%\def\short@author#1{\l@nameuse{#1.shortauthor}}
\def\displaysubtitle{\\[1ptplus1pt] \large}
\def\inlinesubtitle{\unskip. }\let\subtitle\inlinesubtitle

%%
%% 3. Sectioning 
%%
\def\section{\@startsection{section}{1}%
  \normalparindent{\bigskipamount}{\medskipamount}%
  {\normalfont\sffamily\bfseries\raggedright}}
\def\subsection{\@startsection{subsection}{2}%
  \normalparindent{\biggerskipamount}{\smallerskipamount}%%
  {\normalfont\sffamily\bfseries\raggedright}}
\def\subsubsection{\@startsection{subsubsection}{3}%
  \normalparindent{\medskipamount}{\smallskipamount}%%
  {\normalfont\sffamily\itshape\raggedright}}
\def\paragraph{\@startsection{paragraph}{4}%
  \normalparindent{\smallerskipamount}{\parskip}%%
  {\normalfont\sffamily\raggedright}}
\def\subparagraph{\@startsection{subparagraph}{5}%
  \z@{2\psta@v@point}{-\fontdimen2\font\raggedright}%
  {\normalfont\sffamily}}
\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >-2\relax \refstepcounter{part}%
    \addcontentsline{toc}{part}{\partname\ \thepart.
        \protect\enspace\protect\noindent#1}%
  \else
    \addcontentsline{toc:}{part}{#1}\fi
  \begingroup\raggedright
  \ifnum \c@secnumdepth >-2\relax
       {\sffamily\fontsize{\@xviipt}{22}\bfseries
         \partname\ \thepart} \vskip 20\p@ \fi
  \fontsize{\@xxpt}{25}\sffamily\bfseries
      #1\vfil\vfil\endgroup \newpage\thispagestyle{empty}}
\def\@makechapterhead#1{\global\topskip 7.5pc\relax
  \begingroup
  \fontsize{\@xivpt}{18}\sffamily\bfseries\raggedright
    \ifnum\c@secnumdepth>\m@ne
      \leavevmode \hskip-\leftskip
      \rlap{\vbox to\z@{\vss
          \hbox{\hskip\normalparindent\normalsize\sffamily\mdseries
              \MakeTextUppercase\@xp{\chaptername}\enspace\thechapter}
          \vskip 3pc}}\hskip\leftskip\fi
     \hskip\normalparindent#1\par \endgroup
  \skip@34\p@ \advance\skip@-\normalbaselineskip
  \vskip\skip@ }
\def\@makeschapterhead#1{\global\topskip 7.5pc\relax
  \begingroup
  \fontsize{\@xivpt}{18}\sffamily\bfseries\raggedright
  #1\par \endgroup
  \skip@34\p@ \advance\skip@-\normalbaselineskip
  \vskip\skip@ }
\def\appendix{\par
  \c@chapter\z@ \c@section\z@
  \let\chaptername\appendixname
  \def\thechapter{\@Alph\c@chapter}}
%%
%% 3. Lists 
%%
\def\@listI{\leftmargin\leftmargini \parsep\z@skip
  \topsep\listisep \itemsep\z@skip
  \listparindent\normalparindent}
\let\@listi\@listI
\def\@listii{\leftmargin\leftmarginii
  \labelwidth\leftmarginii \advance\labelwidth-\labelsep
  \topsep\z@skip \parsep\z@skip \partopsep\z@skip \itemsep\z@skip}
\def\@listiii{\leftmargin\leftmarginiii
  \labelwidth\leftmarginiii \advance\labelwidth-\labelsep}
\def\@listiv{\leftmargin\leftmarginiv
  \labelwidth\leftmarginiv \advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
  \labelwidth\leftmarginv \advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
  \labelwidth\leftmarginvi \advance\labelwidth-\labelsep}
\newskip\listisep
\listisep\smallskipamount
\def\@listIZ{\leftmargin18pt \parsep=.5\smallskipamount 
  \topsep2\parsep \itemsep\z@skip  \listparindent\normalparindent}
\AtBeginDocument{\leftmargini=2em
\leftmarginii=1.7em
\leftmarginiii=1.6em
\def\labelenumi{{\upshape\footnotesize
\textsf{(\emph{\theenumi})\!}}}
\def\labelitemi{{$\m@th\scriptstyle
        \bullet$}}}
\renewenvironment{quotation}{\list{}{%
    \leftmargin\parindent \listparindent\normalparindent
    \itemindent\parindent
    \rightmargin\leftmargin \parsep\z@ \@plus\p@}%
  \item[]%
}{%
  \endlist
}

%%
%% 5. Russian punctuation 
%%

\renewenvironment{biblist}[1][]{%
  \normalfont \footnotesize \labelsep .5em\relax
  \list{\BibLabel}{%
    \resetbiblist{00}%
    \usecounter{bib}%
    #1\relax
  }%
  \sloppy
  \interlinepenalty\@m  \clubpenalty\@M \widowpenalty\clubpenalty
  \frenchspacing\parskip1ptplus1ptminus.5pt
  \ResetCapSFCodes
  \let\@bibdef\normal@bibdef
}{%
  \def\@noitemerr{\@latex@warning{Empty bibliography list}}%
  \endlist
}
\if y\load@fancyvrb                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyvrb}
\renewcommand{\theFancyVerbLine}{{\textcolor{verbatimnumbers}{\tiny\itshape\textbf{\arabic{FancyVerbLine}}}}}
%
\AtBeginDocument{\fancyVerts}
%
\def\blacklbrace{\textcolor{black}{\textup\textbraceleft}}
\def\blackrbrace{\textcolor{black}{\textup\textbraceright}}
\def\blacklparent{\textcolor{black}{\textup(}}
\def\blackrparent{\textcolor{black}{\textup)}}
\def\blacklbraket{\textcolor{black}{\textup[}}
\def\blackrbraket{\textcolor{black}{\textup]}}
\def\HighliteSlash{\textcolor{gt}{\string/}}
\def\HighliteGt{\textcolor{gt}{\string>}}
\def\PSTAverbvert{\bgroup\PSTAverbvert@}
\def\PSTAverbVert{\bgroup\PSTAverbBcatcodes \PSTAverbVert@}
\let\textpstaverbfont\textsf
\let\textpstaverbsize\footnotesize
\def\setbsbs{\edef\\{\char 92 }}
\fi
\def\FV@Numbers@psta{\let \FV@RightListNumber \relax 
    \def \FV@LeftListNumber {\@tempcnta =\FV@CodeLineNo \@tempcntb =\FV@CodeLineNo \divide \@tempcntb \FV@StepNumber 
        \multiply \@tempcntb \FV@StepNumber  \ifnum \@tempcnta =\@tempcntb \if@FV@NumberBlankLines 
        \hbox to 0.02\linewidth {\theFancyVerbLine \kern \FV@NumberSep \hss}\else 
        \ifx \FV@Line \empty \else \hbox to 0.02\linewidth {\hss\theFancyVerbLine \kern \FV@NumberSep }\fi 
        \fi \fi }}
\def\PSTAverbvert@box#1{\texorpdfstring{\textpstaverbfont{\pstaVerbCommon{#1}}}{#1}}
\def\HighlightEnvironment#1#2{\DefinePSTAVerbatimEnvironment{#1}{Verbatim}{fontsize=\textpstaverbsize,
    frame=lines,framerule=.25mm,framesep=2mm,rulecolor=\color{verbatimrules},
    label={\tiny \textcolor{verbatimtitle}{\itshape\textpstaverbfont{#2}}},labelposition=topline,
    fillcolor=\color{verbatimtitle},numbers=psta,numbersep=5pt,gobble=0, commandchars=\\\{\},
    formatcom={\spaceskip=.5em\PSTAverbBcatcodes\setbsbs
        \let\PSTAverbvert@box\pstaVerbCommon \color{verbatimdefault}}}\FancyVerts}
\def\HighlightXMLEnvironment#1#2{\DefinePSTAVerbatimEnvironment{#1}{Verbatim}{fontsize=\textpstaverbsize,
    frame=lines,framerule=.25mm,framesep=2mm,rulecolor=\color{verbatimrules},
    label={\tiny \textcolor{verbatimtitle}{\itshape\textpstaverbfont{#2}}},labelposition=topline,
    fillcolor=\color{verbatimtitle}, numbers=psta,numbersep=5pt,gobble=0, commandchars=\\\{\},
    codes={\catcode`/=13  \catcode`==13 \catcode `$=3 },
    formatcom={\PSTAverbBcatcodes\setbsbs
        \let\PSTAverbvert@box\pstaVerbCommon\color{verbatimdefault}\XMLgt\spaceskip=.5em}}\FancyVerts}
\def\HighlightMathEnvironment#1#2{\DefinePSTAVerbatimEnvironment{#1}{Verbatim}{fontsize=\textpstaverbsize,
    frame=lines,framerule=.25mm,framesep=2mm,rulecolor=\color{verbatimrules},
    label={\tiny \textcolor{verbatimtitle}{\itshape\textpstaverbfont{#2}}},labelposition=topline,
    fillcolor=\color{verbatimtitle}, numbers=left,numbersep=5pt,gobble=0,commandchars=\\\{\},
    codes={\catcode`$=3\catcode`_=8\catcode`^=7},formatcom={\let\PSTAverbvert@box\pstaVerbCommon
        \color{verbatimdefault}\spaceskip=.5em}}\FancyVerts}
\catcode`\)=13 \catcode`\(=13 \catcode`\]=13 \catcode`\[=13 \catcode`\|=13 
\if n\old@system 
\pdfstringdefDisableCommands{\def|#1|{#1}\def\PSTAverbvert@box#1{#1}}
\fi
\def\PSTAverbvert@#1|{\PSTAverbvert@box{#1}\egroup}    
\def\PSTAverbVert@#1|{\PSTAverbvert@box{#1}\egroup}    
\def\PSTAverbBcatcodes{\catcode`\#=12 \catcode`\^=12 \catcode`\&=12 \catcode`\_=12 \catcode`\%=12 \catcode`\$=12 
\catcode`\]=13 \catcode`\[=13 \catcode`\)=13 \catcode`\(=13 \catcode`\|=13 
\let[\blacklbraket\let]\blackrbraket\let(\blacklparent\let)\blackrparent \let|=\PSTAverbVert
\let\{\blacklbrace\let\}\blackrbrace}
\def\HighliteAlso#1{\g@addto@macro\PSTAverbBcatcodes{#1}}
\def\FancyVert{\bgroup\PSTAverbBcatcodes \PSTAverbvert@}
\def\fancyVerts{\catcode`|=13 \let |=\PSTAverbvert}
\def\FancyVerts{\catcode`|=13 \let |=\PSTAverbVert}
\def\OtherVerts{\catcode`|=12 }
\catcode`/=13 
\def\HighliteLt#1{\textcolor{gt}{<}\ifx/#1\expandafter\HighliteLt@\else\expandafter\HighliteLt@@\fi#1}
\def\HighliteLt@#1\>{\textcolor{key}{#1}\HighliteGt}
\catcode32=13 \def\HighliteLt@@#1 {\textcolor{key}{#1} }\catcode32=10
\catcode`"12 
\def\XMLeq"#1"{\textcolor{gt}{\string=\string"\textcolor{key}{#1}\string"}}
\catcode`==13
\def\XMLgt{\let\> \HighliteGt \let\< \HighliteLt \let=\XMLeq \let/\HighliteSlash}
\catcode`=12 \catcode`/=12 \catcode`\)=12 \catcode`\(=12 \catcode`\]=12 \catcode`\[=12 \catcode`|=12 
\def\pstaVerbCommon#1{\@ifundefined{psta-Verb\detokenize{#1}}%
    {\expandafter\pstaVerbtestfirstchar\string#1\endpstaVerb#1\endpstaVerb}%
    {\@nameuse{psta-Verb\detokenize{#1}}}}
    \def\kwdef#1#2{\@namedef{psta-Verb\detokenize{#1}}}
\def\pstaVerbtestfirstchar#1#2\endpstaVerb{\@ifundefined{\string#1pstaVerb}{\pstaVerb}{\@nameuse{\string#1pstaVerb}}}
\@namedef{\string $pstaVerb}#1\endpstaVerb{\textcolor{variable}{\textpstaverbfont{\string #1}}}
\@namedef{\string @pstaVerb}#1\endpstaVerb{\textcolor{variable}{\textpstaverbfont{\string #1}}}
\@namedef{\string "pstaVerb}#1\endpstaVerb{\textcolor{string}{\textpstaverbfont{\string #1}}}
\@namedef{\expandafter\@gobble\string \{pstaVerb}#1\endpstaVerb{\textcolor{string}{\textpstaverbfont{\textit{#1}}}}
\@namedef{\string \pstaVerb}#1\endpstaVerb{\textpstaverbfont{#1}}
\def\pstaVerb#1\endpstaVerb{\textcolor{word}{\textpstaverbfont{\string #1}}}%
\def\@firstoffour#1#2#3#4{#1}
\def\coloredkeyframe#1#2#3#4#5{{\setbox\@tempboxa\hbox{#5}%
    \@tempdima \wd\@tempboxa  
    \hbox{\hskip -1pt
        \@@key@ruled     {{#1}{#2}{0.3pt}}{1.00}{0.35}{0.40}{0.60}{0.7}{0.9}{#3}{#4}% 
        \@@key@ruled     {{#1}{#2}{0.3pt}}{0.050}{0.3}{0.33}{0.75}{0.85}{0.95}{#3}{#4}% 
        \@@key@ruled     {{#1}{#2}{0.3pt}}{0.025}{0.2}{0.27}{0.87}{0.90}{0.975}{#3}{#4}% 
        \@@key@ruled{{#1}{#2}{\@tempdima}}{0.000}{0.03}{0.10}{0.92}{0.95}{1}{#3}{#4}% 
        \@@key@ruled     {{#1}{#2}{0.3pt}}{0.025}{0.05}{0.27}{0.95}{0.97}{0.975}{#3}{#4}% 
        \@@key@ruled     {{#1}{#2}{0.3pt}}{0.050}{0.15}{0.33}{0.8}{0.94}{0.95}{#3}{#4}% 
        \@@key@ruled     {{#1}{#2}{0.3pt}}{1.00}{0.25}{0.40}{0.80}{0.89}{0.9}{#3}{#4}% 
    \hskip -1pt\hskip -\@tempdima \box\@tempboxa}}}
\def\@@key@ruled#1#2#3#4#5#6#7#8#9{%    \tracingall
    \@@key@rule{#8}#1{#2}{#3}1\@@key@rule{#9}#1{#3}{#4}1\@@key@rule{#9}#1{#5}{#6}1\@@key@rule{#8}#1{#6}{#7}0}
\def\@@key@rule#1#2#3#4#5#6#7{%
    \@tempdimc=#3\@tempdimc=#5\@tempdimc\advance\@tempdimc#2
    \@tempdimb=#3\@tempdimb=#6\@tempdimb\advance\@tempdimb#2
    \textcolor{#1}{\vrule width #4 depth-\@tempdimc height\@tempdimb}\if1#7\hskip-#4\fi}
    
\def\SyntaxBlack#1,#2{\@namedef{psta-Verb\detokenize{#1}}{\textcolor{black}{\fontfamily{\rmdefault}\textbf{#1}}}%
\if,#2\@firstoffour\fi\SyntaxBlack#2}
\def\pstaFormatTypedef#1{\@namedef{FormatType#1}##1}
\def\pstaFormatType#1#2,#3{\@namedef{psta-Verb\detokenize{#2}}{\@nameuse{FormatType#1}{#2}}%
    \if,#3\@firstoffour\fi\pstaFormatType{#1}#3}
\def\HighlightAs#1: #2.{\pstaFormatType{#1}#2,,\fancyVerts}
\def\SyntaxType#1#2,#3{\@namedef{psta-Verb\detokenize{#2}}{\textcolor{#1}{\textpstaverbfont{#2}}}%
    \if,#3\@firstoffour\fi\SyntaxType{#1}#3}
\def\Highlight#1: #2.{\SyntaxType{#1}#2,,\fancyVerts}
\def\HighlightBlack #1.{\SyntaxBlack#1,,\fancyVerts}
\def\FV@FrameLineWithLabel{\ht \z@ \@tempdimb \dp \z@ \@tempdimb \FancyVerbRuleColor \@tempdima 1.97\@tempdimc
    \@tempdimc0.03\@tempdimc {\vrule \@width \@tempdima \@height \FV@FrameRule \raise \@tempdimb \box \z@ 
     \vrule \@width \@tempdimc \@height \FV@FrameRule }}
\def\DefinePSTAVerbatimEnvironment #1#2#3{\@namedef {#1}{\pagebreak[2]\interlinepenalty 9000
    \FV@Environment {#3}{#2}}\@namedef {end#1}{\@nameuse {FVE@#2}}\@namedef 
    {#1*}{\FV@Environment {#3,showspaces}{#2}}\@namedef {end#1*}{\@nameuse {FVE@#2}\pagebreak[1]\interlinepenalty 150 }}
%
% Adds punctuation after code
\def\KV@FV@end#1{\def\psta@final@punct{#1}}
\def\FV@SingleFrameLine#1{\hbox to\z@ {\kern 0.02\linewidth \ifnum #1=\z@ \let \FV@Label \FV@LabelBegin \else \let \FV@Label \FV@LabelEnd \fi \ifx \FV@Label \relax \FancyVerbRuleColor {\vrule \@width 0.92\linewidth \@height \FV@FrameRule }\else \ifnum #1=\z@ \setbox \z@ \hbox {\strut \enspace \FV@LabelBegin \enspace \strut }\else \setbox \z@ \hbox {\strut \enspace \FV@LabelEnd \enspace \strut }\fi \@tempdimb =\dp \z@ \advance \@tempdimb -.5\ht \z@ \@tempdimc =0.96\linewidth \advance \@tempdimc -\wd \z@ \divide \@tempdimc \tw@ \ifnum #1=\z@ \ifx \FV@LabelPositionTopLine \relax \FancyVerbRuleColor {\vrule \@width 0.96\linewidth \@height \FV@FrameRule }\else \FV@FrameLineWithLabel \fi \else \ifx \FV@LabelPositionBottomLine \relax 
\FancyVerbRuleColor {\vrule depth0pt\@width0.96\linewidth \@height \FV@FrameRule } \csname psta@final@punct\endcsname\else \FV@FrameLineWithLabel \fi \fi \fi \hss }}
%Old approach for compatibility
\def\psta@verb@punct#1#2#3{\rlap{\hskip\textwidth\,\vbox to 0pt{\vss\hbox{\llap{\textcolor{white}{\vrule height 2ex width .5em depth.5ex}\llap{#1}}}#2}}\pagebreak[3]#3}
\def\Add#1{\psta@verb@punct{#1}{\vskip .88\baselineskip}{\vskip -\baselineskip}}
\def\TAdd#1{\psta@verb@punct{#1}{}{}}
\def\finishwith#1{\ifx\saved@endparenv\UndEfinEd\global\let\saved@endparenv\@endparenv\fi\global\expandafter\let\expandafter\@endparenv\csname#1@endparenv\endcsname} 
\@namedef{ @endparenv}{\saved@endparenv}
\@namedef{.@endparenv}{\Add.\saved@endparenv\global\let\@endparenv\saved@endparenv}
\@namedef{,@endparenv}{\Add,\saved@endparenv\global\let\@endparenv\saved@endparenv}
%                                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\endthebibliography{\par\endlist}
\gdef\backref#1{\@ifresume{ \hskip-2ptminus2pt\textcolor{backrefcolor}{$\uparrow_{_{#1}}$}}{}}


\def\@@itempenalty{\@M \let\@itempenalty\saved@itempenalty}
\def\@@beginparpenalty{\@M \let\@beginparpenalty\saved@beginparpenalty}
\def\Bibitem{\gdef\ParInLang{\ParInLanguage{english}}\BRorg@bibitem }
\def\thebibliography#1{%
    \def\@bibitem##1{\par\currentbiblink\z@\ParInLang\gdef\CurrentBib{\expandafter\pstacutpar\BR@backref{##1}}\let\\\newline@AB@\@skiphyperreftrue \H@item \@skiphyperreffalse 
        \Hy@raisedlink {\hyper@anchorstart {cite.##1\@extra@b@citeb }\relax \hyper@anchorend }%
        \if@filesw \begingroup \let \protect \noexpand 
            \immediate \write \@auxout {\string \bibcite {##1}{{\the \value {\@listctr }}{}}\string
            \gdef \string \totalbibitems{\the \value {\@listctr }}}%
        \endgroup \fi  \misc@\ignorespaces} 
    \let\saved@itempenalty\@itempenalty
    \let \@itempenalty\@@itempenalty
    \let\saved@beginparpenalty\@beginparpenalty
    \let \@beginparpenalty\@@beginparpenalty
    \def\RBibitem{\gdef\ParInLang{\ParInLanguage{russian}}\BRorg@bibitem }
    \let\bibitem\RBibitem 
    \refstepcounter{aux@counter}%
    \section*{\refname}
    \setbox\@tempboxa\hbox{[#1]}%
    \def\@biblabel##1{{[##1]}}
    \small 
    \list   
     {\@biblabel {\arabic {enumi}}}{\settowidth\labelwidth{\@biblabel{#1}}\leftmargin \labelwidth
        \advance \leftmargin \labelsep \usecounter {enumi}}\leftskip\leftmargin
    \let\PrintDOI@\PrintAsIcon\let\PrintURL@\PrintAsIcon
    \let\IsAmsBibKeys\OnlyAmsBibKeys
        \psta@v@tighter
%     \baselineskip3.8mmplus1pt
%     \parskip0.5ptplus1pt
     \def\newblock{\hskip .11em plus .33em minus .07em}%
     \def\allowbeak{\penalty\z@\hskip0ptplus2pt}%
     \clubpenalty4000\widowpenalty4000
     \sfcode`\.=1000\relax
     \def\makelabel##1{\hfil ##1}%
     \rightskip 0ptplus1mm\@sloppy}
\def\theenglishbibliography#1{\@fileswfalse\selectlanguage{english}%
    \noindent\textit{\refname }\Small
    \refstepcounter{aux@counter}\def\@biblabel ##1{{[##1]}}%
    \def\@bibitem##1{\par\currentbiblink\z@\gdef\CurrentBib{\expandafter\pstacutpar\BR@backref{##1}}\let\\\newline@AB@\@skiphyperreftrue \H@item \@skiphyperreffalse 
        \misc@\ignorespaces} 
    \def\RBibitem{\errmessage{Command \string\RBibitem\space does not availavle in the english bibliography!}\BRorg@bibitem }
    \let \bibitem\Bibitem 
    \@itempenalty 50\let\bib@endgroup\endgroup
    \let\saved@itempenalty\@itempenalty
    \let \@itempenalty\@@itempenalty
    \let\saved@beginparpenalty\@beginparpenalty
    \let \@beginparpenalty\@@beginparpenalty
    \list {\@biblabel {\arabic {enumi}}}{\settowidth\labelwidth{\@biblabel{#1}}\leftmargin \labelwidth
        \advance \leftmargin \labelsep \usecounter {enumi}}\leftskip\leftmargin%\wd\@tempboxa
    \let\PrintDOI@\PrintAsIcon\let\PrintURL@\PrintAsIcon\let\PrintRINC\PrintNothing
    \let\IsAmsBibKeys\OnlyAmsBibKeys
        \psta@v@tighter
        \def \allowbeak {\penalty \z@ \hskip 0ptplus2pt}% 
        \clubpenalty 4000\widowpenalty 4000 \sfcode `\.=1000\relax 
        \def \makelabel ##1{\hfil ##1}\@sloppy}
\newcounter{aux@counter}
\def\pstacutpar#1\par{#1}

\newif\if@Ref@
\newif\if@finalpunct@ \@finalpunct@true
\newif\ifmoreref@
\newif\ifbook@
\newif\ifprocpaper@
\newif\if@kern

\def\test@Ref@{\if@Ref@\else\@@Ref\fi}
\let\@end@thebibliography@hook\par
\def\@@Ref{\ifhmode\unskip\@@par\else\leavevmode\fi
  \begingroup \global\@finalpunct@true\@Ref@true
  \def\envir@end{\end@@ref}%
  \let\par\end@@ref
  \global\let\nofrills@list\empty
  \refbreaks %
  \procpaper@false \book@false \moreref@false
  \def\curbox{\z@}\setbox\z@\vbox\bgroup}

\gdef\@ref{\@kernfalse
    \ifmoreref@ \commaunbox@AB@\translbox@AB@ 
    \else \@kerntrue 
    \fi 
    \if@kern\kern-\tw@ sp\kern\m@ne sp\fi \@@ref}


\def\nofrills{\expandafter
    \ifx\envir@end\end@@ref \let\do\relax
        \xdef\nofrills@list{\nofrills@list\do\curbox}%
    \else\errmessage{\Invalid@@ \string\nofrills}\fi}%

\def\end@ref@{%
        \def\nofrillscheck##1{%
            \def\do####1{\ifx##1####1\let\frills@\@gobble\fi}%
        \let\frills@\@firstofone \nofrills@list}%
    \@ref}

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
  #2\relax}
\def\refconcat@AB@#1{\setbox\z@\lastbox \setbox\holdoverbox\hbox{%
    \unhbox\holdoverbox \unhbox\z@\unskip\unskip\unpenalty#1}}%
\def\@finalpunct{\if@finalpunct@.\fi
    \refquotes@\nobreak\CurrentBib\refbreak@AB@@}%
\def\@@finalpunct{\ifnum\lastkern=\m@ne\unkern\fi\refquotes@
    \if@finalpunct@.\fi
    \nobreak\unhbox\biblinkbox@AB@\CurrentBib\refbreak@AB@@}%
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
\def\punct@#1{#1}
\def\commaunbox@AB@#1{\ppunbox@AB@,\space{#1}\empty}
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
  \frills@{#4\@gobble}{\kern\m@ne sp}\fi}
\def\nofrills@@#1{\DN@{#1}\ifx\next\nofrills \let\frills@\@gobble
   \expandafter\expandafter\expandafter\next@\expandafter\@gobble
  \else \let\frills@\@firstofone\expandafter\next@\fi}
\def\nofrillscheck#1{\def\nofrills@{\nofrills@@{#1}}%
  \futurelet\next\nofrills@}
\def\newpage@AB@{\vadjust{\vfill\break@AB@}}%
\def\break@AB@{\holdover{\penalty -\@M}}%
\def\linebreak@AB@{\holdover{\penalty -\@M}}%
\def\newline@AB@{\holdover{\hfill\penalty -\@M}}%
\def\endline@AB@{\holdover{\hfill\penalty -\@M}}%
\let\vadjust@\vadjust
\def\vadjust@AB@#1{\holdover{\vadjust@{#1}}}%
\def\breakcheck{\edef\refbreak@AB@@{\ifnum\lastpenalty=\z@\else
  \penalty\the\lastpenalty\relax\fi}\unpenalty}

\gdef\@@ref{%
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
        \ppunbox@AB@,{ \bibserissuetext@ }\serissuebox@AB@\empty
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
            \ppunbox@AB@,{ \bibserissuetext@ }\serissuebox@AB@\empty
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
            \ppunbox@AB@,{ \bibpagestext~}\pagesbox@AB@\empty
            \ppunbox@AB@,{ \paperidtext@ }\paperidbox@AB@\empty \fi \fi
    \ppunbox@AB@\empty{ (}\miscnotebox@AB@)\empty%
    \ppunbox@AB@\empty{ \ (}\langbox@AB@{)}\empty%
    \ppunbox@AB@,{ }\totalpagesbox@AB@{\totalpagestext@}%
    \ppunbox@AB@{,}{ }\finalinfobox@AB@\empty
    \ppunbox@AB@\empty{ (\withtext}\withbox@AB@)%
    \global\currentbiblink=0
    \ppunbox@AB@\empty{ }\@@finalinfobox@AB@\empty
    \finalpunct
}%
\font\invis@font=labx1000 at 4pt
\def\DefineIcon#1.#2#3#4 {%  
  \@namedef{#1icon}{\kernel@ifnextchar[{\@nameuse{#1IconAlt}}{%
    \kernel@ifnextchar.{\@nameuse{#1iconRaw}\@gobble}{\@nameuse{#1iconAlt}{#1:}}}}% . = []
  \@namedef{#1IconAlt}[##1]{\textup{\@nameuse{#1iconAlt}{##1}}}%
  \IfFileExists{#1_logo.#2#3#4}{
    \@namedef{#1iconAlt}####1{\rlap{\textcolor{white}{{\invis@font{####1}}}}\@nameuse{#1iconRaw}}%
    \@namedef{#1iconRaw}{$\vcenter{\hbox{\includegraphics[height=2.7ex]{#1_logo}}}$}%
  }{% Else
    \@namedef{#1iconAlt}####1{\scalebox{0.7}{\hbox{\textcolor{black}{\textup{####1}}}}}%
    \@namedef{#1iconRaw}{\@nameuse{#1iconAlt}{#1}}}}%
\DefineIcon DOI.png \DefineIcon RSCI.pdf \DefineIcon arXiv.png \DefineIcon URL.jpg \DefineIcon MN.png \DefineIcon AMS.png \DefineIcon iD.pdf
\newcount\currentbiblink \global\currentbiblink=0
\newbox\biblinkbox@AB@
\def\skiptospace#1 {}%
\def\@IdTypeDef#1#2#3#4{\def#1{%
      \ifx\href\psta@next\expandafter#2\else
        \ifx:\psta@next\expandafter\expandafter\expandafter#3\else
          \ifx=\psta@next\expandafter\expandafter\expandafter
            \expandafter\expandafter\expandafter\expandafter#3\else
            \expandafter\expandafter\expandafter\expandafter
            \expandafter\expandafter\expandafter#4\fi\fi\fi}}
\catcode`\%=13 \def\activepercent{%}\catcode`%=14
\def \OnlyAmsBibKeys#1{\makerefbox@AB@\biblinkbox@AB@{\unhbox\biblinkbox@AB@\space\catcode`(=12 \catcode`)=12 \catcode`_=12 \catcode`^=12 \catcode`~=12 \catcode`\% =12 
    \expandafter#1\@gobble}}
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
    \@namedef{#2NextHref}##1##2##3{#5{#6}{#7}{##2}{##3}}% format{icon}{alttext}{url}{text}
    \@namedef{#2AfterColon}##1##2 {#5{#6}{#7}{#4##2}{##2}}% format{icon}{alttext}{url}{text}
    \@namedef{#2@ifFoundAfter#3}##1#3##2\and##3##4\AmSBib{##3{#5{#6}{#7}{#4##2}{##2}}{#5{#6}{#7}{#4##2}{##2}}}}%
\def\PrintAsIcon#1#2#3#4{\href{#3}{#1[{[#2]}]}}% URLicon AltText LinkURL LinkText
\def\PrintURL#1#2#3#4{\href{#3}{#1\quad\nolinkurl{#3}}}\let\PrintURL@\PrintURL% URLicon AltText LinkURL LinkText
\def\PrintAsRINC#1#2#3#4{\href{#3}{#1[{[#2:#4]}]}}% URLicon AltText LinkURL LinkText
\def\PrintWithId#1#2#3#4{\href{#3}{#2{#1:} {#4}}}% URLicon AltText LinkURL LinkText
\def\PrintNothing#1#2#3#4{}% 
\IdTypeDef2{isbn}{ }{https://isbnsearch.org/search?s=}\PrintWithId{ }{ISBN}%
\IdTypeDef2{mathscinet}{=}{http://www.ams.org/mathscinet-getitem?mr=}\PrintAsIcon\AMSicon{MathSciNet}%
\IdTypeDef2{URL}{}{}\PrintAsIcon\URLicon{URL}%
\def\URLSearch#1 {\PrintURL@\URLicon{URL}{#1}{}}
\IdTypeDef6{mathnet}{=}{http://mi.mathnet.ru/}\Printmathnet@\MNicon{MathNet}\def\Printmathnet@{\PrintURL@}%
\def\mathnetSearch#1 {\Printmathnet@\MNicon{MathNet}{#1}{}}
\IdTypeDef7{doi}{.org/}{https://doi.org/}\PrintDOI@\DOIicon{DOI}\let\PrintDOI@\PrintURL%
\IdTypeDef5{arxiv}{/abs/}{https://arxiv.org/abs/}\PrintWithId\arXivicon{arXiv}%
\IdTypeDef6{rinc}{=}{https://elibrary.ru/item.asp?id=}\PrintRINC\RSCIicon{\RINC}\let\PrintRINC\PrintAsIcon
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
\def\citnum{\makerefbox@AB@\citnumbox@\empty}
\def\citnumisi{\makerefbox@AB@\citnumisibox@\empty}
\def\citnummsn{\makerefbox@AB@\citnummsnbox@\empty}
\def\citnumelib{\makerefbox@AB@\citnumelibbox@\empty}
\def\edition{\makerefbox@AB@\editionbox@AB@\empty}\newbox\editionbox@AB@
\def\ed{\makerefbox@AB@\edbox@AB@\empty}\newbox\edbox@AB@
\def\eds{\makerefbox@AB@\edsbox@AB@\empty}\newbox\edsbox@AB@
\def\endquotes{\def\refquotes@{''\let\refquotes@\empty}}
\def\finalbookinfo{\makerefbox@AB@\finalbookinfobox@AB@\empty}\newbox\finalbookinfobox@AB@
\def\@@finalinfo{\global\@finalpunct@true\makerefbox@AB@\@@finalinfobox@AB@\empty}\newbox\@@finalinfobox@AB@
\def\finalinfo{\global\@finalpunct@true\makerefbox@AB@\finalinfobox@AB@\empty}\newbox\finalinfobox@AB@
\def\Hrefs#1{}
\def\inbook{\makerefbox@AB@\bookbox@AB@{\it \aftergroup\procpaper@true\aftergroup\book@false}}\let\inbook@text\empty
\def\isi#1{\ignorespaces}
\def\issn{\makerefbox\issnbox@\empty}
\def\issueinfo{\makerefbox@AB@\issueinfobox@AB@\empty}\newbox\issueinfobox@AB@\let\issueinfotext@\empty
\def\issue{\makerefbox@AB@\issuebox@AB@\empty} \newbox\issuebox@AB@
\def\jour{\makerefbox@AB@\jourbox@AB@{\it\aftergroup\jour@true}}\newbox\jourbox@AB@
\def\jour@true{\global\book@false\global\procpaper@false}%
\def\lang{\makerefbox@AB@\langbox@AB@\empty} \newbox\langbox@AB@
\def\misc@{\makerefbox@AB@\misc@box@AB@\empty%\ifx\cyrillicencoding\@undefined\else\select@language{russian}\fi
}\newbox\misc@box@AB@
\def\miscnote{\makerefbox@AB@\miscnotebox@AB@\empty} \newbox\miscnotebox@AB@
\def\monthissue{\makerefbox@AB@\monthissuebox@AB@\empty}\newbox\monthissuebox@AB@\let\monthissuetext@\empty
\def\moreref{\transl@\frenchspacing\foreign@language{english}}\let\transl\moreref
\def\morerref{\transl@\frenchspacing\foreign@language{russian}}\let\rtransl\morerref
\def\@No@Color{\textcolor{black}}
\def\page{\global\let\page@text=\bibpagetext\makerefbox@AB@\pagesbox@AB@\empty}\global\let\page@text=\bibpagestext
\def\pages{\global\let\page@text=\bibpagestext\makerefbox@AB@\pagesbox@AB@\empty}\newbox\pagesbox@AB@
\def\paperinfo{\makerefbox@AB@\paperinfobox@AB@\empty}\newbox\paperinfobox@AB@
\def\paper{\makerefbox@AB@\paperbox@AB@\empty}\newbox\paperbox@AB@
\def\papernumber{\makerefbox@AB@\paperidbox@AB@\empty}\newbox\paperidbox@AB@\def\paperidtext@{}
\def\preprintinfo{\makerefbox@AB@\bookinfobox@AB@{\aftergroup\book@true\rm \let\@my@href=\href\relax\def\href##1##2{\@my@href{##1}{{\tt ##2}}}}}
\def\procinfo{\makerefbox@AB@\procinfobox@AB@\empty}\newbox\procinfobox@AB@\let\proc@text@\empty
\def\proc{\makerefbox@AB@\procbox@AB@\empty}\newbox\procbox@AB@
\def\publaddr{\makerefbox@AB@\publaddrbox@AB@\empty}\newbox\publaddrbox@AB@
\def\publaddrr{\makerefbox@AB@\publaddrrbox@AB@\empty}\newbox\publaddrrbox@AB@
\def\publaddrrr{\makerefbox@AB@\publaddrrrbox@AB@\empty}\newbox\publaddrrrbox@AB@
\def\publll{\makerefbox@AB@\publllbox@AB@\empty}\newbox\publllbox@AB@
\def\publl{\makerefbox@AB@\publlbox@AB@\empty}\newbox\publlbox@AB@
\def\publ{\makerefbox@AB@\publbox@AB@\empty} \newbox\publbox@AB@
\def\raggedref{\par\rightskip 0mmplus7mm\par\rightskip 0mm\par}
\def\scopus#1{\ignorespaces}
\def\serial{\makerefbox@AB@\serialbox@AB@{\rm \aftergroup\procpaper@true\aftergroup\book@false}}\newbox\serialbox@AB@
\def\serissue{\makerefbox@AB@\serissuebox@AB@\empty}\newbox\serissuebox@AB@
\def\sortdate{\makerefbox@AB@\sortdatebox@\empty}\newbox\sortdatebox@
\def\toappear{\miscnote \bibt@appear}%
\def\totalpages{\global\@finalpunct@false\makerefbox@AB@\totalpagesbox@AB@\empty}\newbox\totalpagesbox@AB@\def\totalpagestext@{~\bibpagetext}%
\def\volinfo@AB@{\makerefbox@AB@\volinfobox@AB@\empty}\newbox\volinfobox@AB@
\def\volinfotext@{}
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
\def\psta@if@has@minus#1-#2#3\end@test@minus{\if;#2\expandafter\@secondoftwo\else\expandafter\@firstoftwo\fi}
\def\PageLink#1#2{#2}
%
\def\boldtocpages#1{\subsection*{\Title}\addcontentsline{toc}{subsection}{\Title}\let\Title\@empty}
\long\def\tocpages#1#2{
    \leftskip=1em\parindent-\leftskip 
    \rightskip 14mm \parfillskip-\rightskip
    \parskip 2\parskip
    \def\\{\unskip\space\ignorespaces}\let\ =\\ 
    \nobreak\@@par\@sloppy
    \ifx\Author\@empty \else{{ \footnotesize\textsc{\Author} }}\fi
    \ifx\Title\@empty \else   {%\small
       \itshape{\Title\nobreak}}%
    \@ifempty{#1}{}{\nobreak{ \small\dotfill}\hbox{ \em{\LastPagerange{#1}{#2}}}}\fi\@@par
    \let\Author\@empty\let\Title\@empty}
\let\Title\@empty \let\Author\@empty
%
\def\NonLastPagerange#1#2{\FormatPagerange{}{}{#2}{#1}, }
\def\LastPagerange#1#2{\FormatPagerange{\hbox to 8mm}{\hss}{#2}{#1}}
\def\FormatPagerange#1#2#3#4{\psta@if@has@minus#4-;\end@test@minus{\FormatPagerange@{#1}{#2}{#3}#4\endFormatPagerange@}{\PageLink{#3}{#4}#1{#2}}}
\def\FormatPagerange@#1#2#3#4-#5\endFormatPagerange@{\PageLink{#3}{#4}\textcolor{lightgray}{#1{--\PageLink{#3}{#5}#2}}}
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
     % \vrule width .15pt height  .3pt depth 2ex\hskip10mm}
    }\nobreak\medskip}
%

\def\ell@#1{\strut\nobreak\hskip \z@ plus#1\hsize}
\def\boldfirst#1,{{\small\textsc{#1}},}
\def\AUauthor#1#2#3#4{{%\parskip 2.5mmplus1mm\baselineskip10pt 
   \@sloppy
     \parindent=-1em \leftskip=1em \rightskip14mm
    \boldfirst#1\ell@1\penalty2000\space\ell@8% 
    \lower1pt\hbox{\textcolor{lightgray}{{\tiny${}_{}^<$}}}%
    {\footnotesize\textsf{\href{mailto:#2}{#2}}}%
    \lower1pt\hbox{\textcolor{lightgray}{{\tiny${}_{}^>$}}}
    \ell@1\penalty3000\space\ell@1  
    \hbox {#4\hskip -14mm}\break
    \Small\emph{#3}\@@par\pagebreak[2]}}%
%
\def\tocwrite#1{\def\Title{#1}}%   
\long\def\theabstract#1{\def\Abstract{#1}}%
\def\directiontitle#1#2{\subsection*{#1}\thispagestyle{firstpage}}%
\def\toctitle#1#2{\hypertarget{#2}{\section*{#1}}\thispagestyle{firstpage}\let\Title\@empty\thetitle
    {#1}\pstamarkboth{#1}{#1}}%
\def\thetitle#1{\def\Title{#1}}
\def\theauthor#1{\def\Author{#1}}%
\expandafter\ifx \csname forVolumes\endcsname\relax
\def\forVolumes{\expandafter\forVolumes@\jobname\relax}%
\def\forVolumes@#1#2\relax{\if1#1\expandafter\@firstoftwo\else
    \expandafter\@secondoftwo\fi}\fi
\gdef\psta#1{\if-#1\expandafter\psta@\fi}
\gdef\psta@#1 #2 \psta{\expandafter\xdef\csname psta-#1\endcsname{#2}\psta}
\ifx \No\undefined \DeclareRobustCommand{\No}{\ifmmode{\nfss@text{\textnumero}}\else\textnumero\fi}\fi
\let\wlog\@gobble
\let\wlog\wlogpsta
\if y\hyphenbreaks \g@addto@macro\UrlBreaks{\do-}\fi
\AtBeginDocument{\csname bib@set@\article@lang\endcsname\let \@@thm\@thm 
    \def\@thm{\relax\ifvmode\pagebreak[2]\else\pagebreak[1]\fi \vskip\parskip\@@thm}\expandafter\selectlanguage\expandafter{\article@lang}%
    \ifx\russian@lang\article@lang\@ifpackageloaded {subcaption}{\renewcommand\thesubfigure{\textit{\pstarus\alph{subfigure}}}}{}\fi}
\def\authorid#1{}%
\endinput
% vim:ts=4:expandtab:syn=tex:iskeyword=@,48-58,95,128-255,@-@:
