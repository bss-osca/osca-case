% $LastChangedDate: 2019-01-07 10:03:48 +0100 (Mon, 07 Jan 2019) $
% $LastChangedRevision: 1970 $


\ProvidesClass{aultrdesign}[2019/01/07 v3.6d Aarhus University letter design class]

% HISTORY
% .. bunch of unrecorded changes
% 20181210: recent enumitem changes requires us to delay loading
%           enumitem until after having setup the font sizes
% 20190107: decided to move all the font size and layout settings up
%           to the start of the document. Also moved fix-cm up as the
%           first loaded package (at least it has to be before
%           fontenc) otherwise it had no effect.



% This class implements a LaTeX version of the letter-like part of the
% general design line from the Aarhus University, Denmark.
% For more information see the user manual.

% This class may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%% 
%% This work has the LPPL maintenance status "maintained".
%% 
%% The Current Maintainer of this work is Lars Madsen (daleif@math.au.dk).
%%
%


\newif\ifALD@DEBUG
\@ifundefined{ALDDEBUG}{}{\typeout{Debug mode on}\ALD@DEBUGtrue}
\newif\ifALD@show@colophon@guides
%\ALD@show@colophon@guidestrue

%
% Packages that we will need, note that some pages are loaded later,
% as some class options remove the need
%

% 20190107: moved here, otherwise it only affects documents if used
% before \documentclass
\RequirePackage{fix-cm}
\RequirePackage[T1]{fontenc} % needs to check TS1
\RequirePackage{xcolor}

% the blue color used by the AU, we use the cmyk version, works best
% in PDF.
\definecolor{austdblue}{cmyk}{1,0.8,0,0.15}

% redefine sizes from size11.clo
\renewcommand\normalsize{%
   \@setfontsize\normalsize{10.5pt}{14pt}%
   \abovedisplayskip 10.5\p@ \@plus3\p@ \@minus6\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newlength\onelineskip
\setlength{\onelineskip}{14pt}

\providecommand\small{}
\renewcommand\small{%
   \@setfontsize\small{9.5pt}\@xiipt
   \abovedisplayskip 9.5\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 6\p@ \@plus2\p@ \@minus2\p@
               \parsep 3\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\providecommand\footnotesize{}
\renewcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{10}%
   \abovedisplayskip 8\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\providecommand\scriptsize{}
\renewcommand\scriptsize{\@setfontsize\scriptsize\@viipt{9.5}}
\providecommand\tiny{}
\renewcommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
\providecommand\large{}
\renewcommand\large{\@setfontsize\large\@xiipt{14}}
\providecommand\Large{}
\renewcommand\Large{\@setfontsize\Large\@xivpt{18}}
\providecommand\LARGE{}
\renewcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\providecommand\huge{}
\renewcommand\huge{\@setfontsize\huge\@xxpt{25}}
\providecommand\Huge{}
\renewcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
%\setlength\headheight{12\p@}
%\setlength\headsep   {25\p@}
\setlength\topskip   {10.5\p@}
\setlength\footskip{30\p@}
\setlength\parskip{1em plus 0.3em minus 0.5em}


% document dimensions
% first tested using geometry
% \geometry{
%    left=62.5mm,
%    right=20mm,
%    top=45mm-2pt,
%    bottom=35mm,
%   verbose=true,
% %pass
% }

% A4
\setlength\paperheight {297mm}
\setlength\paperwidth  {210mm}
\setlength\parindent   {0\p@}
\setlength\labelsep    {5\p@}
\setlength\partopsep{0\p@}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

% now it matches the geometry settings, requires the calc package
%\setlength\oddsidemargin{62.5mm-1in}
\setlength\oddsidemargin{\dimexpr 20mm-1in \relax}
\setlength\evensidemargin{\oddsidemargin}
\setlength\textheight{\dimexpr \paperheight-45mm-35mm-1pt \relax}
%\setlength\textwidth{\paperwidth-82.5mm}
\setlength\textwidth{14cm}
\setlength\headheight{12pt}
\setlength\headsep{25pt}
\setlength\topmargin{\dimexpr 45mm-1in-\headsep-\headheight-3pt \relax}





%#% extract
\RequirePackage{fix-cm}
\RequirePackage{calc}
\RequirePackage{ragged2e}
\RequirePackage{eso-pic}
\RequirePackage{graphicx}
\RequirePackage[export]{adjustbox}
\RequirePackage{url}
\RequirePackage{xkeyval}
\RequirePackage{environ}
\RequirePackage{varwidth} % handy to measure the width of a block
%\RequirePackage{ifmtarg} % check for empty argument
\RequirePackage{multicol}
\RequirePackage{ifpdf,ifxetex,ifluatex}
\ifluatex
  \RequirePackage{luatex85}
\fi
\RequirePackage{etoolbox}
\RequirePackage{picture}
%#% /extract
%
% usefull etoolbox tools, saves a lot of coding!
%
% use a keyword. Emits nothing if the keyword is empty
\newcommand\csusekw[1]{%
  \ifcsvoid{ALDkw@#1name@\ALD@currentlanguage}{}{%
    \mbox{\csuse{ALDkw@#1name@\ALD@currentlanguage}}:~}}
% version without :~, this is used in five places and is not prefixed
% so \mbox are not needed
\newcommand\csusekwx[1]{%
  \ifcsvoid{ALDkw@#1name@\ALD@currentlanguage}{}{%
     \csuse{ALDkw@#1name@\ALD@currentlanguage}}}
% if construction looking for void userdata #1 = name, #2 = true, #3 = false
\newcommand\ifcsvoiduserdata[1]{%
  \ifcsvoid{ALD@userdata@#1@\ALD@currentlanguage}{%
    \@firstoftwo%
  }{%
    \@secondoftwo%
  }}
% if construction looking for void unitdata #1 = name, #2 = true, #3 = false
\newcommand\ifcsvoidunitdata[1]{%
  \ifcsvoid{ALDu@\ALD@currentunit @unit#1@\ALD@currentlanguage}{%
    \@firstoftwo%
  }{%
    \@secondoftwo%
  }}
% use a piece of userdata regardles of it being empty
\newcommand\csuseuserdata[1]{%
  \csuse{ALD@userdata@#1@\ALD@currentlanguage}%
}
% use a piece of unitdata regardles of it being empty
\newcommand\csuseunitdata[1]{\csuse{ALDu@\ALD@currentunit @unit#1@\ALD@currentlanguage}}
% add stuff if language is not danish
\newcommand\ifnotdanish[1]{%
  \ifdefstring{\ALD@currentlanguage}{danish}{}{#1}}
%
\newcommand\ALD@phoneprefix{\ifnotdanish{+45\kern0.3em}}
% test a datatype against a string
\newcommand\ifcsdatatype[2]{%
  \ifcsstring{ALD@datatype@#1}{#2}{%
    \@firstoftwo%
  }{%
    \@secondoftwo%
  }}


% apparently the Word template uses letterspacing in the header, so
% let us do that as well, this may break if the title contains things
% other than letters
\RequirePackage{soul}
% both used in the letter head
\sodef\ALD@letterspacing{}{0.5pt}{2.8pt}{0pt}
\sodef\ALD@letterspacingsmall{}{0.65pt}{2.5pt}{0pt}




% colophon font
\newcommand*\AUpassataFont{\def\rmdefault{ffu}\renewcommand{\bfdefault}{b}\selectfont\rm}
% and including fontsize for the colophon and the footer
\newcommand*\AUpassata{\fontsize{7pt}{9pt}\AUpassataFont}
% both macros above should only be used inside a group

% whether or not to print a logo
\newif\if@au@nologo
\DeclareOptionX{nologo}    {\@au@nologotrue}
\DeclareOptionX{preprinted}{\@au@nologotrue} % i.e. for the use of
                                % preprinted paper
\newif\if@au@nofoldinglines
% this will remove the three folding guide lines
\DeclareOptionX{nofoldinglines}{\@au@nofoldinglinestrue}
\DeclareOptionX{foldinglines}{\@au@nofoldinglinesfalse}

\newtoggle{ignoreaddress}
\newtoggle{ignoreaddresshalf}

\DeclareOptionX{ignoreaddress}{%
  \toggletrue{ignoreaddress}
  \ClassInfo{aultrdesign}{Ignoring address}{}
}
\DeclareOptionX{ignoreaddresshalf}{%
  \toggletrue{ignoreaddresshalf}
  \toggletrue{ignoreaddress}
  \ClassInfo{aultrdesign}{Ignoring address}{}
}


\DeclareOptionX{draft}{\setlength\overfullrule{5pt}\@au@nologotrue}
\DeclareOptionX{final}{\setlength\overfullrule{0pt}}

\newif\ifALD@threecolumnfooter
%\newcommand\UseThreeColumnFooter{\ALD@threecolumnfootertrue}
%\DeclareOptionX{threecolumnfooter}{\ALD@threecolumnfootertrue}
\DeclareOptionX{threecolumnfooter}{
  \ClassWarning{aultrdesign}{The 'threecolumnfooter' option, is no
  longer supported}{}
}

\newif\if@au@ignore@profile
\DeclareOptionX{ignoreprofiles}{\@au@ignore@profiletrue}

\newif\ifALD@hyperref
\DeclareOptionX{hyperref}{\ALD@hyperreftrue}

\newtoggle{ALD@bss}
\DeclareOptionX{bss}{%
  \toggletrue{ALD@bss}
  \ClassInfo{aultrdesign}{Switching to BSS logo and header design}{}
}

% unofficial feature, makes a BSS header with no unit
\newtoggle{ALD@just-bss}
\DeclareOptionX{just-bss}{%
  \toggletrue{ALD@just-bss}
  \toggletrue{ALD@bss}
  \ClassInfo{aultrdesign}{Switching to BSS logo and header design and
    all units are ignored}{}
}




\newcommand\DefineProfile[2]{\@ifdefinable{au@profile@#1}{\@namedef{au@profile@#1}{#2}}}
\newcommand\reDefineProfile[2]{\@namedef{au@profile@#1}{#2}}
% \newcommand*\DefaultProfile[1]{%
%   \@ifundefined{au@profile@#1}{%
%     \ClassError{aultrdesign}{Profile '#1' not found.}{}
%   }{\@nameuse{au@profile@#1}}}

\newcommand*\UseProfile[1]{%
  \@ifundefined{au@profile@#1}{%
    \ClassError{aultrdesign}{Profile '#1' not found.}{Either you
      spelled the profile name wrong, or the profile was not defined
      ^^Jin aultrdesignprofile.cfg}% 
  }{%
    \typeout{Loading profile '#1'}%
    \@nameuse{au@profile@#1}}}


%
% KEYWORD LOCALISATION 
%

% first define a list of keywords
\listadd{\ALD@Keyword@List}{universityname}%
\listadd{\ALD@Keyword@List}{bssname}%
\listadd{\ALD@Keyword@List}{cityname}%
\listadd{\ALD@Keyword@List}{datename}%
\listadd{\ALD@Keyword@List}{enclosingname}%
\listadd{\ALD@Keyword@List}{copytoname}%
\listadd{\ALD@Keyword@List}{senttoname}%
\listadd{\ALD@Keyword@List}{directphonename}%
\listadd{\ALD@Keyword@List}{pagername}%
\listadd{\ALD@Keyword@List}{privatephonename}%
\listadd{\ALD@Keyword@List}{mobilephonename}%
\listadd{\ALD@Keyword@List}{directfaxname}%
\listadd{\ALD@Keyword@List}{contactfaxname}% used in the footer
\listadd{\ALD@Keyword@List}{emailname}%
\listadd{\ALD@Keyword@List}{contactemailname}% used in the footer
\listadd{\ALD@Keyword@List}{journalname}%
\listadd{\ALD@Keyword@List}{studentidname}%
\listadd{\ALD@Keyword@List}{cprnoname}%
\listadd{\ALD@Keyword@List}{receivercvrname}%
\listadd{\ALD@Keyword@List}{sendercvrname}% this is always present
\listadd{\ALD@Keyword@List}{referencename}%
\listadd{\ALD@Keyword@List}{shortreferencename}% used on designs other than letters
\listadd{\ALD@Keyword@List}{contactphonename}% used in the footer
\listadd{\ALD@Keyword@List}{pagename}%
\listadd{\ALD@Keyword@List}{homepagename}%
\listadd{\ALD@Keyword@List}{contacthomepagename}%
\listadd{\ALD@Keyword@List}{letterdesignname}% usually empty
\listadd{\ALD@Keyword@List}{minutesdesignname}% printed at the top right for the minutes design
\listadd{\ALD@Keyword@List}{coveringnotedesignname}% similar
\listadd{\ALD@Keyword@List}{faxdesignname}% similar
\listadd{\ALD@Keyword@List}{agendadesignname}% similar
\listadd{\ALD@Keyword@List}{memodesignname}% similar
\listadd{\ALD@Keyword@List}{casenumbername}% used in a few designs other than letters 
\listadd{\ALD@Keyword@List}{meetingdatename}%
\listadd{\ALD@Keyword@List}{meetingplacename}%
\listadd{\ALD@Keyword@List}{meetingtopicname}%
\listadd{\ALD@Keyword@List}{meetingattendeesname}%
\listadd{\ALD@Keyword@List}{presentatmeetingname}%
\listadd{\ALD@Keyword@List}{absentfrommeetingname}%
%\listadd{\ALD@Keyword@List}{notpresentatmettingname}%
\listadd{\ALD@Keyword@List}{faxreceivername}%
\listadd{\ALD@Keyword@List}{receiverfaxnumbername}%
\listadd{\ALD@Keyword@List}{numberofpagesinfaxname}%
\listadd{\ALD@Keyword@List}{memoreceivername}%


% structual information
%
% UNITS
% holder macros: \ALDu@<unitname>@<keyword>[@<language>]
% macros with @<language> takes precedence
% 
% unit data is stored in \ALDu@<unitname>
%
%
% a localisation is stored in \ALDkw@<language>@keywords


\newcommand\UseLocalisation[1]{%
    \begingroup%
    \def\ALD@language{#1}%
    \def\do##1{%
      \csdef{set##1}####1{%
        \csgdef{ALDkw@##1@\ALD@language}{####1}%
      }%
    }%
    \dolistloop{\ALD@Keyword@List}%
    \csuse{ALDkw@#1@keywords}%
    \AtBeginDocument{\gdef\today{\ALD@dateformater{\the\year}{\the\month}{\the\day}}}%
    \endgroup%
}

\newcommand\LocaliseKeywords[2]{%
  % each localication should corerspond to a class option
  \DeclareOptionX{#1}{%
    \UseLocalisation{#1}%
    \xdef\ALD@currentlanguage{#1}%
  }%
  % register the localised language
  \listadd{\ALD@Available@Languages}{#1}%
  \csgdef{ALDkw@#1@keywords}{#2}%
  % cheating, emulated userdata, but un changable
  \csgdef{ALD@userdata@sendercvr@#1}{31119103}%
  \csgdef{ALD@isfor@sendercvr@colophon}{1}%
}


\newcommand\ShowAvailableLanguages{%
  \begingroup
  \textbf{Available Languages}
  \begin{itemize}
  \def\do##1{\item ##1}
  \dolistloop{\ALD@Available@Languages}
  \end{itemize}
  \endgroup
}


\newcommand\ShowLocalisation[1]{%
  \begingroup
  \textbf{Localisation for language '#1'}\\
  % define what the loop item should do:
  \def\do##1{%
    \csdef{set##1}####1{%
      {\footnotesize \texttt{\textbackslash set##1} $\to$ ####1}\\}
  }%
  % run the loop
  \dolistloop{\ALD@Keyword@List}
  \csuse{ALDkw@#1@keywords}
  \endgroup
}


% date macros, the desing uses DD. Named month YYYY in danish and the
% same buth without the . after DD in English

\newcommand\ALD@month@english[1]{%
  \ifcase#1\or%
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or
  December\else This is NOT a month!\fi}

\newcommand\ALD@month@danish[1]{%
  \ifcase#1\or%
  januar\or februar\or marts\or april\or maj\or juni\or
  juli\or august\or september\or oktober\or november\or
  december\else Dette er ikke en m\aa ned!\fi}

\newcommand\ALD@data@generator[3]{%
  % #1: name of the generated macro
  % #2: postfix to the date
  % #3: month macro
  \newcommand#1[3]{%
%    \@ifmtarg{##3}{\hspace*{5mm}}{##3}%
    \ifblank{##3}{\hspace*{5mm}}{##3}%
    #2~%
    #3{##2}~%
    ##1%
  }}


\ALD@data@generator\DanishDate{.}\ALD@month@danish
\ALD@data@generator\EnglishDate{}\ALD@month@english

\newcommand\NumericDate[3]{%
    \ifblank{#3}{\hspace*{5mm}}{\two@digits{#3}}%
    .\two@digits{#2}%
    .#1%
}


\newcommand\BSSLogoJustification[1]{\gdef\ALD@bsslogojustification{#1}}
\BSSLogoJustification{\raggedleft}


% here one specifies the formatter macro one wants to use.
\newcommand\setdateformater[1]{\gdef\ALD@dateformater{#1}}

\newcommand\UseNumericDate{\setdateformater{\NumericDate}}


\LocaliseKeywords{danish}{
  \setuniversityname{UNIVERSITET}
  \setbssname{SCHOOL OF BUSINESS AND SOCIAL SCIENCES}
  \setcityname{AARHUS}
  \setdatename{Dato}
  \setenclosingname{Bilag}
  \setcopytoname{Kopi~til}
  \setsenttoname{Sent~til}
  \setdirectphonename{Direkte~tlf.}
  \setpagername{Persons\o ger}
  \setprivatephonename{Privat~tlf.}
  \setmobilephonename{Mobiltlf.}
  \setdirectfaxname{Fax}
  \setemailname{E-mail}
  \setjournalname{Journal~nr.}
  \setstudentidname{\AA rskortnr.}
  \setcprnoname{CPR-nr.}
  \setreceivercvrname{Modt.~CVR-nr.}
  \setsendercvrname{Afs.~CVR-nr}
  \setreferencename{Reference}
  \setshortreferencename{Ref}
  \setpagename{Side}
  \sethomepagename{Web}
%  \sethomepagename{}
  \setcontacthomepagename{}
  \setletterdesignname{}
  \setminutesdesignname{Referat}
  \setcoveringnotedesignname{F\O LGESEDDEL} % \MakeUppercase cannot handle \o
  \setfaxdesignname{Fax}
  \setagendadesignname{Dagsorden}
  \setmemodesignname{Notat}
  \setcasenumbername{Sagsnr.}
  \setcontactphonename{Tlf.}
  \setcontactemailname{E-mail}
  \setcontactfaxname{Fax}
  \setcasenumbername{Sagsnr.}
  \setdateformater{\DanishDate}
  \setmeetingdatename{M\o de~den}
  \setmeetingplacename{}
  \setmeetingtopicname{}
  \setmeetingattendeesname{Deltagere}
  \setpresentatmeetingname{Til~stede}
  \setabsentfrommeetingname{Frav\ae rende}
%  \setnotpresentatmettingname{Frav\ae rende}
  \setfaxreceivername{Modtager(e)}
  \setreceiverfaxnumbername{Fax~nr.}
  \setnumberofpagesinfaxname{Antal~sider~(Inkl.~denne)}
  \setmemoreceivername{Modtager(e)}
}

%%##engloc
\LocaliseKeywords{english}{
  \setuniversityname{UNIVERSITY}
  \setbssname{SCHOOL OF BUSINESS AND SOCIAL SCIENCES}
  \setcityname{AARHUS}
  \setdatename{Date}
  \setenclosingname{Encl.}
  \setcopytoname{Copy~to}
  \setsenttoname{Sent~to}
  \setdirectphonename{Direct~Tel.}
  \setpagername{Pager}
  \setprivatephonename{Private~Tel.}
  \setmobilephonename{Mobile~Tel.}
  \setdirectfaxname{Fax}
  \setemailname{Email}
  \setjournalname{Journal~no.}
  \setstudentidname{Annual~card~no.}
  \setcprnoname{CPR~no.}
  \setreceivercvrname{Receiver's~CVR~no.}
  \setsendercvrname{Sender's~CVR~no.}
  \setreferencename{Reference}
  \setshortreferencename{Ref}
  \setpagename{Page}
  \sethomepagename{Web}
%  \sethomepagename{}
  \setcontacthomepagename{}
  \setletterdesignname{}
  \setminutesdesignname{Minutes}
  \setcoveringnotedesignname{Covering~Note}
  \setfaxdesignname{Fax}
  \setagendadesignname{Agenda}
  \setmemodesignname{MEMO}
  \setcasenumbername{Case No}
  \setcontactphonename{Tel.}
  \setcontactemailname{Email}
  \setcontactfaxname{Fax}
  \setdateformater{\EnglishDate}
  \setcasenumbername{Case~no.}
  \setmeetingdatename{Meeting~on}
  \setmeetingplacename{}
  \setmeetingtopicname{}
  \setmeetingattendeesname{Participants}
  \setpresentatmeetingname{Present}
  \setabsentfrommeetingname{Absent}
%  \setnotpresentatmettingname{Absent}
  \setfaxreceivername{Receiver(s)}
  \setreceiverfaxnumbername{Fax~no.}
  \setnumberofpagesinfaxname{Number~of~pages~(incl.~this)}
  \setmemoreceivername{Receiver(s)}
}
%%/##engloc


%
% UNIT Handling
%

% a bit of theory
%
% a unit alias resembles the pagestyle alias in the memoir class, 
% in our implementation an alias will 
% (1) load the real unit
% (2) have a special accociated macro such that we can detect that
% this is an alias (and thus not redefine it or add to it, as that
% would not make sense.
%
% syntax:
% \UnitAlias{new name}{old name}
% 
% behind the scenes, \ALD@unit@<new name> = \ALD@unit@<old name>
%                    \ALD@unit@isalias@<new name> = <new name>


\listadd{\ALD@Unit@Keyword@List}{headertitle}% first line in the letter head
\listadd{\ALD@Unit@Keyword@List}{headerparenttitle}% second line, see doc for algorithm
\listadd{\ALD@Unit@Keyword@List}{branchname}% title in the colophon,  overwritable by the user
\listadd{\ALD@Unit@Keyword@List}{contactname}% unit name in the footer
\listadd{\ALD@Unit@Keyword@List}{contactaddress}% unit address in the footer
\listadd{\ALD@Unit@Keyword@List}{contactphone}% unit contact phone
\listadd{\ALD@Unit@Keyword@List}{contactfax}% unit contact fax
\listadd{\ALD@Unit@Keyword@List}{contactemail}% unit contact email
\listadd{\ALD@Unit@Keyword@List}{contacthomepage}% unit homepage
\listadd{\ALD@Unit@Keyword@List}{logo}% this should fully provide the logo, i.e. \includegraphics





\newcommand\DefineUnit[3]{%
  \ifcsdef{ALD@unit@#1}{%
    \ClassError{aultrdesign}{Unit '#1' already defined, please choose
      a different name}{}%
  }{%
    % we'd like to be able to show all units, so save their names
    \listadd{\ALD@Unit@List}{#1}
    % store the unit definition
    \csgdef{ALD@unit@#1}{#3}%
    % store the description
    \csgdef{ALD@unit@#1@description}{#2}
  }}


\newcommand\reDefineUnit[3]{%
  % first test if the unit is an alias, an alias cannot be changed
  \ifcsundef{ALD@unit@isalias@#1}{%
    \csgdef{ALD@unit@#1}{#3}%
    \csgdef{ALD@unit@#1@description}{#2}%
  }{%
    \ClassError{aultrdesign}{Cannot redefine '#1', this unit is an 
      alias for the ^^J'\csuse{ALD@unit@isalias@#1}', and thus cannot
      be changed. Please change '\csuse{ALD@unit@isalias@#1}'
    }{}
  }}


\newcommand\AddtoUnit[2]{%
  \ifcsundef{ALD@unit@isalias@#1}{%
    \csappto{ALD@unit@#1}{#2}%
  }{%
    \ClassError{aultrdesign}{Cannot add to '#1', this unit is an 
      alias for the ^^J'\csuse{ALD@unit@isalias@#1}' alias, and 
      thus cannot  be changed. Please make your addition to
      '\csuse{ALD@unit@isalias@#1}'^^Jinstead
    }{}
  }}


\newcommand\UnitAlias[2]{%
  % first everify that the name can be used
  \ifcsdef{ALD@unit@#1}{%
    \ClassError{aultrdesign}{The alias '#1' is already defined}{}
  }{
    \listadd{\ALD@Unit@List}{#1}%
    \csgdef{ALD@unit@#1}{\csuse{ALD@unit@#2}}%
    % we mark that it is an alias, with the name of the unit it points to
    \csdef{ALD@unit@isalias@#1}{#2}%
  }}


\newcommand*\UseUnit[1]{%
%  \@ifundefined{ALD@unit@#1}{%
  \ifcsundef{ALD@unit@#1}{
    \ClassError{aultrdesign}{Unit definition for '#1' has not been
      found.}{Check spelling or define the particular unit.}
  }{
    \begingroup
    \def\currentunit{#1}%
    \def\do##1{%
      \expandafter\newcommand\csname  setunit##1\expandafter\endcsname[2][]{
        \begingroup
        \ifblank{####1}{
          % loop over available languages and use the same definition
          % for each language, saves testing later on
          \def\do########1{%
            \ifstrequal{##1}{contactemail}{%
              \ifALD@hyperref%
                \csgdef{ALDu@\currentunit @unit##1@########1}{\href{mailto:####2}{####2}}%
              \else
                \csgdef{ALDu@\currentunit @unit##1@########1}{\url{####2}}%
              \fi
            }{%
              \ifstrequal{##1}{contacthomepage}{%
                \csgdef{ALDu@\currentunit @unit##1@########1}{\url{####2}}%
              }{%
                \csgdef{ALDu@\currentunit @unit##1@########1}{####2}%
              }%
            }%
          }%
          \dolistloop{\ALD@Available@Languages}%
        }{
%          \csgdef{ALDu@\currentunit @unit##1@####1}{####2}
          \ifstrequal{##1}{contactemail}{%
            \ifALD@hyperref%
              \csgdef{ALDu@\currentunit @unit##1@####1}{\href{mailto:####2}{####2}}%
            \else
              \csgdef{ALDu@\currentunit @unit##1@####1}{\url{####2}}%
            \fi
          }{%
            \ifstrequal{##1}{contacthomepage}{%
              \csgdef{ALDu@\currentunit @unit##1@####1}{\url{####2}}%
            }{%
              \csgdef{ALDu@\currentunit @unit##1@####1}{####2}%
            }%
          }%
        }%
        \endgroup
      }
    }
    \dolistloop{\ALD@Unit@Keyword@List}
    \csuse{ALD@unit@#1}
    \csxdef{ALD@currentunit}{#1}
    \endgroup
  }}

\newcommand\SetDefaultUnit[1]{
  \ifcsundef{ALD@unit@#1}{%
    \ClassError{aultrdesign}{Unit definition for '#1' has not been
      found.}{Check spelling or define the particular unit.}
  }{%
    \csxdef{ALD@defaultunit}{#1}
  }
}




% this is the default unit if nothing else have been defined
\DefineUnit{au}{%
  Default Unit configuration for Aarhus University
  }{%
  \setunitcontactaddress[danish]{Nordre~Ringgade~1\\8000~\AA rhus~C}
  \setunitcontactaddress[english]{Nordre~Ringgade~1\\DK-8000~Aarhus~C\\Denmark}
  \setunitcontactname[danish]{Aarhus Universitet}
  \setunitcontactname[english]{Aarhus University}
  \setunitbranchname[danish]{Aarhus Universitet}
  \setunitbranchname[english]{Aarhus University}
  \setunitheadertitle[danish]{AARHUS UNIVERSITET}
  \setunitheadertitle[english]{AARHUS UNIVERSITY}
  \setunitcontactphone{87150000}
  \setunitcontactfax{87150201}
  \setunitcontactemail{au@au.dk}
  \setunitcontacthomepage[danish]{www.au.dk}
  \setunitcontacthomepage[english]{www.au.dk/en}
}




\SetDefaultUnit{au}
\DeclareOptionX{unit}[au]{\UseUnit{#1}}
\DeclareOptionX{profile}{\UseProfile{#1}}
\newif\ifALD@nofooter
\DeclareOptionX{nofooter}{\ALD@nofootertrue}


\newtoggle{resizereceiver}
\newlength\ALD@receiver@height
\setlength\ALD@receiver@height{5cm}
\DeclareOptionX{resize-receiver-to-height}{%
  \toggletrue{resizereceiver}%
  \setlength\ALD@receiver@height{#1}%
}


% very special class option
\newif\ifALD@alternative@footer@algorithm@
\newcounter{ALD@footer@alternative@numlines}
\define@choicekey+{aultrdesign.cls}{footerlinenumber}{4,5,6}{%
%   \ALD@alternative@footer@algorithm@true%
%   \setcounter{ALD@footer@alternative@numlines}{#1}%
  \ClassError{aultrdesign}{The 'footerlinenumber' option has been removed}{}
}{
  \ClassError{aultrdesign}{The 'footerlinenumber' option has been removed}{}
%   \ClassError{aultrdesign}{The possible number of lines in ^^Jthe footer
%     is 4, 5 or 6, which does not include '#1'}{}
}


% used when displying the unit info, which may contain \\ or \newline
\def\ALD@BB{\texttt{\textbackslash\textbackslash}\allowbreak}

\newcommand\ShowUnits{%
  \begingroup
  {\Large\textbf{The available units on this system}:}\par
  \def\do##1{
    \ifcsdef{ALD@unit@isalias@##1}{}{\ShowUnit{##1}}
  }
  \dolistloop{\ALD@Unit@List}
  \par{\Large\textbf{Unit aliases}:}\par
  \@tempcnta=0
  \def\do##1{
    \ifcsdef{ALD@unit@isalias@##1}{%
      \advance\@tempcnta by1%
      \texttt{##1} $\to$\quad\csuse{ALD@unit@isalias@##1}\newline
    }{}
  }
  \dolistloop{\ALD@Unit@List}
  \ifnum\@tempcnta=0
  \textit{no aliases registered}
  \fi
  \endgroup
}

\newcommand\ShowUnit[1]{
  \@ifundefined{ALD@unit@#1}{
    \ClassError{aultrdesign}{Cannot show unit `#1': Unit not found}{}
  }{}
  \textbf{Unit setting for >>\textnormal{\texttt{#1}}<<}\\
  \ifcsdef{ALD@unit@isalias@#1}{
      >>\texttt{#1}<<\quad is alias for \quad>>\texttt{\csuse{ALD@unit@isalias@#1}}<<
  }{
  \begingroup
  \newcommand\showdata[1]{%
    \begingroup
    \let\\=\ALD@BB
    \let\newline=\ALD@BB
    \let\par=\relax
    \ifblank{##1}{\textit{exists, but data is empty}}{\texttt{##1}}
    \endgroup
  }
  \par%
  \textit{Description: }\@nameuse{ALD@unit@#1@description}\par
    \begingroup
    \raggedright
    \expandafter\def\expandafter\currentunit\expandafter{#1}
%    \csedef{currentunit}{#1}
    \def\do##1{%
      \expandafter\newcommand\csname setunit##1\expandafter\endcsname[2][]{
        \ifblank{####1}{
          {\footnotesize 
            \texttt{\textbackslash setunit##1} $\to$
            \showdata{####2}
          }\\
        }{
          {\footnotesize\texttt{\textbackslash setunit##1[####1]}
            $\to$   \showdata{####2}%{\let\\=\ALD@BB ####2} 
          } \\
        }
      }    
    }  
    \dolistloop{\ALD@Unit@Keyword@List}
    \csuse{ALD@unit@#1}
    \endgroup
  \endgroup
}
    \newpage
}



%
% MACRO to access our data
%
% some repitition:
%
% UNITS
% holder macros: \ALDu@<unitname>@<keyword>[@<language>]
% macros with @<language> takes precedence
% 
% unit data is stored in \ALDu@<unitname>
%
% localised keywords are stored as
% \ALDkw@<keyword>@<lang>
%
% and we set a special one the <lang> is ALDdefault, this will be used
% if the current localisation have not specified the requested keyword
%
% a localisation is stored in \ALDkw@<language>@keywords

% we create 2x2 macros for handling localised data and unitary data
%
% Localised keywords
% basic idea: if \ALDkw@<keyword>@<currentlang> is defined use it
% if not issue a warning and use \ALDkw@<keyword>@ALDdefault (fatal
% error if the last one is not found)
% a starred version without the warning and error is also to be made




% 
% COLOPHON MACROS
%
% these can also be called from within a profile, thus they need to
% be defined here.


\newif\ifALD@colophon@is@not@empty@
%\ALD@colophon@is@not@empty@false
%\ALD@colophon@is@not@empty@true


\listadd{\ALD@Colophon@Keyword@List}{directphone}
\listadd{\ALD@Colophon@Keyword@List}{pager}
\listadd{\ALD@Colophon@Keyword@List}{privatephone}
\listadd{\ALD@Colophon@Keyword@List}{mobilephone}
\listadd{\ALD@Colophon@Keyword@List}{directfax}
\listadd{\ALD@Colophon@Keyword@List}{email}
\listadd{\ALD@Colophon@Keyword@List}{homepage}
\listadd{\ALD@Colophon@Keyword@List}{journal}
\listadd{\ALD@Colophon@Keyword@List}{studentid}
\listadd{\ALD@Colophon@Keyword@List}{cprno}
\listadd{\ALD@Colophon@Keyword@List}{receivercvr}
\listadd{\ALD@Colophon@Keyword@List}{sendercvr}
\listadd{\ALD@Colophon@Keyword@List}{reference}



\newtoggle{phonelike}
\newtoggle{web}
\newtoggle{email}
\newtoggle{colophon}
\define@boolkey{ALDMUM}{phonelike}[true]{\toggletrue{phonelike}}
\define@boolkey{ALDMUM}{web}      [true]{\toggletrue{web}}
\define@boolkey{ALDMUM}{email}    [true]{\toggletrue{email}}
\define@boolkey{ALDMUM}{colophon} [true]{\toggletrue{colophon}}
% we need the created macro to be available globally, so we cannot use
% begin/endgroup around the key settings, thus we have to cancel them
% at the end
\newcommand\ALD@MakeUserMacro[2][]{%
  % this needs to be removed later on
  \setkeys{ALDMUM}{#1}%
  % register what this macro is useful for
  \iftoggle{web}{\csgdef{ALD@datatype@#2}{web}}{}%
  \iftoggle{email}{\csgdef{ALD@datatype@#2}{email}}{}%
  \iftoggle{phonelike}{\csgdef{ALD@datatype@#2}{phonelike}}{}%
  \iftoggle{colophon}{%
    \csgdef{ALD@isfor@#2@colophon}{1}%
  }{}%
  \expandafter\newcommand\csname #2\expandafter\endcsname{%
     \@ifstar{%
       \ifcsdatatype{#2}{email}{\csgdef{ALD@allowbreak@#2}{\allowbreak}}{}%
       \csname #2aux\endcsname%
     }{%
       \ifcsdatatype{#2}{email}{\global\csundef{ALD@allowbreak@#2}}{}%
       \csname #2aux\endcsname%
     }%
   }
  \expandafter\newcommand\csname #2aux\expandafter\endcsname[2][]{%
    \begingroup
    \ifblank{##2}{}{\global\ALD@colophon@is@not@empty@true}%
    \ifblank{##1}{%
      % the next line needs to be removed later on
      \csgdef{ALD@colophon@#2}{##2}%
      % no language have been specified, so define for all supported
      % languages
      \def\do####1{%
        % URLs need to be stored in a special manner
        \ifcsdatatype{#2}{web}{%
          \ifALD@hyperref%
           \csgdef{ALD@userdata@#2@####1}{\href{http://##2}{##2}}%
          \else%
            \csgdef{ALD@userdata@#2@####1}{\url{##2}}%
          \fi%
        }{%
         \ifcsdatatype{#2}{email}{%
           \ifALD@hyperref%
            \csgdef{ALD@userdata@#2@####1}{\href{mailto:##2}{##2}}%
           \else%
             \csgdef{ALD@userdata@#2@####1}{\url{##2}}%
           \fi%
           }{%
             \csgdef{ALD@userdata@#2@####1}{##2}%
           }%
        }%
      }%
      \dolistloop{\ALD@Available@Languages}%
    }{%
      % a language have been specified, test to see if it is supported
      \ifinlist{##1}{\ALD@Available@Languages}{}{
        % not in the list, complain
        \ClassError{aultrdesign}{Language '##1' not supported}{}
      }
      % next line needs to be removed later
      \csgdef{ALD@colophon@#2}{##2}
      % \csgdef{ALD@userdata@#2@##1}{##2}
      \ifcsdatatype{#2}{web}{%
        \ifALD@hyperref%
          \csgdef{ALD@userdata@#2@##1}{\href{http://##2}{##2}}%
        \else%
          \csgdef{ALD@userdata@#2@##1}{\url{##2}}%
        \fi%
      }{%
        \ifcsdatatype{#2}{email}{%
          \ifALD@hyperref%
            \csgdef{ALD@userdata@#2@##1}{\href{mailto:##2}{##2}}%
          \else%
            \csgdef{ALD@userdata@#2@##1}{\url{##2}}%
          \fi%
        }{%
          \csgdef{ALD@userdata@#2@##1}{##2}%
        }%
      }%
    }%
    \endgroup
  }%
  % initialise switches
  \togglefalse{phonelike}\togglefalse{web}\togglefalse{email}\togglefalse{colophon}%
}




% this will create a token list of the keywords used for the middle
% part of the colophon, this list determines the order of the items in
% this part and also creates the macros used to add information, at
% the same time each setter macro will test its argument to see if it
% is non-empty and then give notice about this
\ALD@MakeUserMacro[colophon,phonelike]{directphone}
\ALD@MakeUserMacro[colophon,phonelike]{pager}
\ALD@MakeUserMacro[colophon,phonelike]{privatephone}
\ALD@MakeUserMacro[colophon,phonelike]{mobilephone}
\ALD@MakeUserMacro[colophon,phonelike]{directfax}
\ALD@MakeUserMacro[colophon,email]{email}
\ALD@MakeUserMacro[colophon,web]{homepage}
\ALD@MakeUserMacro[colophon]{journal}
\ALD@MakeUserMacro[colophon]{studentid}
\ALD@MakeUserMacro[colophon]{cprno}
\ALD@MakeUserMacro[colophon]{receivercvr}
\ALD@MakeUserMacro[colophon]{reference}
\ALD@MakeUserMacro{firstname}
\ALD@MakeUserMacro{lastname}
\ALD@MakeUserMacro{name}
\ALD@MakeUserMacro{usertitle}
\ALD@MakeUserMacro{branch}
\let\userbranch\branch
\ALD@MakeUserMacro{casenumber}

%#% extract
\def\ALD@graphical@signature{}
\newlength\ALD@graphical@signature@adjustment
\setlength\ALD@graphical@signature@adjustment{0pt}
\newcommand*\graphicalsignature[2][0pt]{%
  \dimgdef\ALDclo@gfxvadjust{#1}%
  \gdef\ALDclo@gfxsignature{#2}}
%#% /extract


% make the signature data global
\def\fromsig{}
\newcommand{\signature}[1]{\gdef\fromsig{#1}}



% site wide configuration file, for unit information etc.
\InputIfFileExists{aultrdesign.cfg}{}{}



% black or blue logo color
\newif\ifALD@color@logo
%\DeclareOptionX{colorlogo}{\colorlet{aultrdesignlogocolor}{austdblue}}
%\DeclareOptionX{blacklogo}{\colorlet{aultrdesignlogocolor}{black}}
\DeclareOptionX{colorlogo}{\ALD@color@logotrue}
\DeclareOptionX{blacklogo}{\ALD@color@logofalse}

\newif\ifALD@nomath
\DeclareOptionX{nomath}{\ALD@nomathtrue}

\newif\ifALD@use@charter
\DeclareOptionX{charter}{\ALD@use@chartertrue}

%#% extract
%\newif\ifALD@no@written@signature
\newtoggle{nowrittensignature}
%#% /extract
\DeclareOptionX{nowrittensignature}{\toggletrue{nowrittensignature}}

% we want to load the profile before the class such that the profiles
% can be loaded using class options
% profiles as personal
\if@au@ignore@profile\else\InputIfFileExists{aultrdesignprofile.cfg}{}{}\fi


% execute default options
\ExecuteOptionsX{blacklogo,danish,unit=\ALD@defaultunit,nofoldinglines}%\au@extra@default@options}



\ProcessOptionsX*

% % a bit of cheating, letter also defines \signature
% \def\ALD@@fromsig{}
% \expandafter\@ifnotmtarg\expandafter{\fromsig}{\xdef\ALD@@fromsig{\fromsig}}
% \let\signature\relax 
% \let\name\relax 





\providecommand\signature{}
% we need to make \signature global again
\renewcommand{\signature}[1]{\gdef\fromsig{#1}}

% \expandafter\@ifnotmtarg\expandafter{\ALD@@fromsig}{%
%   \ifALD@DEBUG\typeout{resetting the \string\signature}\fi%
%   \signature{\ALD@@fromsig}}

% daleif 2017: legacy from when we use the letter class as basis
% bring our \name definition back
% if it was used before, the data is already stored in \ALD@colophon@name
%\renewcommand\name[1]{\gdef\ALD@colophon@name{#1}}
%\csundef{name}
%\ALD@MakeUserMacro{name}



\ifALD@color@logo
  \colorlet{aultrdesignlogocolor}{austdblue}
\else
  \colorlet{aultrdesignlogocolor}{black}
\fi

\if@au@nologo\else
%  \RequirePackage{aarhunilogo}
  \RequirePackage{audklogos}
\fi



\ifALD@nomath\else
\IfFileExists{mathdesign.sty}{%
  \IfFileExists{mdbch.sty}{%
    \RequirePackage[charter]{mathdesign}
  }{\ClassWarning{aultrdesign}{Charter support for the mathdesign
      package has not been found. We will therefore use Computer
      Modern for any matematics (this may look odd).}
  }}{\ClassWarning{aultrdesign}{The mathdesign package was not found,
    thus we will use Computer Modern for matematics (this may look odd).}}
\fi

\ifALD@use@charter
  \ifALD@nomath
    \ClassError{aultrdesign}{Class options 'nomath' and 'charter'
      cannot be used together}
  \fi
\else
  \RequirePackage{bera} % overwrites charter as the text font
\fi

% 20190107 moved font sizes and layout up to the start of the document



\pagenumbering{arabic}


% stolen from memoir
\newcommand*{\fixpdflayout}{%
  \pdfpageheight=\the\paperheight
  \pdfpagewidth=\the\paperwidth
  \ifxetex\else
  \ifdim\pdfvorigin=0pt\pdfvorigin=1in\fi
  \ifdim\pdfhorigin=0pt\pdfhorigin=1in\fi
  \fi}
\newcommand*{\fixdvipslayout}{%
  \AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}}
\AtBeginDocument{%
  \ifxetex
    \fixpdflayout
  \else
    \ifpdf
      \ifnum\pdfoutput<\@ne
        \fixdvipslayout
      \else
        \fixpdflayout
      \fi
    \else
      \fixdvipslayout
    \fi
  \fi
}

% 20181210: due to a recent update to enumitem, we need to load
% enumitem *after* we have defined the font sizes.

%%% lists start

\providecommand\enumerate{}
\providecommand\endenumerate{}
\providecommand\itemize{}
\providecommand\enditemize{}
\providecommand\description{}
%\providecommand\enddescription{}
\RequirePackage[shortlabels,inline]{enumitem}

\setlist{leftmargin=*,}
\setitemize[1]{label=\normalfont\bfseries\textendash}
\setitemize[2]{label=\textbullet}
\setitemize[3]{label=\textperiodcentered}
\setitemize[4]{label=\textasteriskcentered}

\setenumerate[1]{label=\arabic*.}
\setenumerate[2]{label=(\alph*)}
\setenumerate[3]{label=\roman*.}
\setenumerate[4]{label=\Alph*.}

\providecommand*{\descriptionlabel}[1]{\hspace\labelsep
                                \normalfont\bfseries #1}


% disable loading the enumerate package
% stolen from the memoir class
\def\ALD@emulated@package#1[#2]{%
  \expandafter\xdef\csname ver@#1.\@pkgextension\endcsname{#2}%
  \@ifundefined{opt@#1.\@pkgextension}%
    {\@namedef{opt@#1.\@pkgextension}{}}{}%
  \wlog{Package #1 \ifx\@empty#2\else[#2] \fi
        \if,\csname opt@#1.\@pkgextension\endcsname,\else
        (with options \csname opt@#1.\@pkgextension\endcsname) \fi
        emulated by \@currname.}%
}

\ALD@emulated@package{enumerate}[\@empty]

%%%% lists end




%
% TOOLS
%

% alternative \addvspace that takes the minimum instead of the maximum
% used inside the colophon
\def\ALD@xaddvskip{%
  \ifdim\lastskip>\@tempskipb
    \vskip-\lastskip
    \vskip\@tempskipb
  \else
    \ifdim\@tempskipb<\z@
      \ifdim\lastskip<\z@
      \else
        \advance\@tempskipb\lastskip
        \vskip-\lastskip
        \vskip \@tempskipb
      \fi
    \fi
  \fi}

\def\ALD@addvspacemin#1{%
  \ifvmode
%     \if@minipage\else
       \ifdim \lastskip =\z@
         \vskip #1\relax
       \else
       \@tempskipb#1\relax
         \ALD@xaddvskip
       \fi
%     \fi
  \else
    \@noitemerr
  \fi}

% this is not a good idea, if one writes several letters in the same
% document

% writing a bit in the background

\newlength\ALD@shortlinethickness
\setlength\ALD@shortlinethickness{0.5pt}

\AddToShipoutPicture{
  \if@au@nofoldinglines\else
    \put(5mm,\dimexpr\paperheight-100mm+0.25mm){\rule{5mm}{\ALD@shortlinethickness}}
    \put(5mm,\dimexpr\paperheight-150mm+0.25mm){\rule{5mm}{\ALD@shortlinethickness}}
    \put(5mm,\dimexpr\paperheight-200mm+0.25mm){\rule{5mm}{\ALD@shortlinethickness}}
  \fi
  \if@au@nologo\else
    \iftoggle{ALD@bss}{
      \put(20mm,\dimexpr\paperheight-78.9pt){\ALD@logo@bss}
      \put(\dimexpr20mm+48pt+4mm,\dimexpr\paperheight-10mm-47.5pt){\ALD@logo@text@bss}%\fboxsep=0pt\fbox{\ALD@logo@text@bss}}
    }{
      \put(20mm,\dimexpr\paperheight-10mm){\ALD@logo}
      \put(\dimexpr20mm+48pt+4mm,\dimexpr\paperheight-10mm-11pt){\ALD@logo@text}
    }
  \fi
}

  
\newcommand\ALD@logo{%
  \begingroup
  \raisebox{-24pt}{%
    \parbox[t][67pt][t]{\paperwidth-40mm}{%
      \AUDKLogo[24pt]{aultrdesignlogocolor}%
    }%
  }%
  \endgroup
}

\newcommand\ALD@logo@bss{%
  \begingroup
      \AUDKBSSInverted[50.4pt]{aultrdesignlogocolor}%
  \endgroup
}

\newcommand\ALD@logo@text{%
  \begingroup
  \parbox[t]{\paperwidth-50mm-20mm-4mm-48pt}{%
    \leavevmode% otherwise the \color makes everything drop because of
               % the build-in watsit
    \AUpassataFont%
    \raggedright%
    \color{aultrdesignlogocolor}%
    \parindent=0pt%
    \fontsize{11pt}{12pt}\selectfont%
    \edef\xxx{\csusekwx{city}}%
    \ALD@letterspacing\xxx%
    \par%
    \edef\xxx{\csusekwx{university}}%
    \ALD@letterspacing\xxx%
    \par%
    \vskip4pt%
    \fontsize{7pt}{8pt}\selectfont%
    \def\xxx{\csuseunitdata{headertitle}}%
    \ALD@letterspacing\xxx% % no idea why we shouldn't use {}
  }
  \endgroup
}

\newcommand\ALD@logo@text@bss{%
  \begingroup
  \parbox[b]{\paperwidth-50mm-20mm-4mm-48pt}{%
    \leavevmode% otherwise the \color makes everything drop because of
               % the build-in watsit
    \AUpassataFont%
    \raggedright%
    \color{aultrdesignlogocolor}%
    \parindent=0pt%
    \fontsize{11pt}{11pt}\selectfont\bfseries%
    \def\xxx{\csuseunitdata{headertitle}}%
    \iftoggle{ALD@just-bss}{}{%
      \ALD@letterspacing\xxx%
      \par%
      \vskip0.9pt%
      \normalfont%\bfseries%
    }%
    \edef\xxx{\csusekwx{bss}}%
    \ALD@letterspacing\xxx%
    \par%
    \vskip0pt\normalfont%
    \edef\xxx{\csusekwx{city}\space\csusekwx{university}}%
    \ALD@letterspacing\xxx% % no idea why we shouldn't use {}
  }
  \endgroup
}



% the column width inside the footer area on the first page
\newlength\ALD@footercolwidth
\setlength\ALD@footercolwidth{43.5mm}





\newsavebox\ALD@footerboxA
\newsavebox\ALD@footerboxB
\newsavebox\ALD@footerboxLogo
\newsavebox\ALD@footerbox
%#% extract
\newsavebox\ALD@tmpbox
%#% /extract
\newlength\ALD@tmplength

% this can be used to control the vertical alignment of the footer
% boxes. Note that using 'bottom' and a three column footer, leads to
% undesirable results
% \newcommand*\setFooterAlignment[1]{%
%   \ALD@nametest{#1}{top}%
%   \ifALD@samename
%     \def\ALD@footervalign{t}
%   \else 
%     \ALD@nametest{#1}{bottom}%
%     \ifALD@samename
%       \def\ALD@footervalign{b}
%     \else
%       \ClassError{aulterdesign}{Unrecognized footer alignment, pleasse
%       specify 'top' or 'bottom'}{}
%     \fi
%   \fi
% }
% \setFooterAlignment{top}

\newcommand\setFooterAlignment{%
  \ClassWarning{aultrdesign}{Setting the footer alignment, is no
    longer supported}{}%
}
 
\def\ALD@phonespacerspacer{\nobreakspace}
\def\ALD@phonespacer#1{%
  \edef\xxx{#1}%
  \edef\temp##1##2##3##4##5##6##7##8\END{##1##2##3##4\ALD@phonespacerspacer##5##6##7##8}%
  \expandafter\temp\xxx\END%
}


\newcommand\ALD@coladjustmentA{\raggedright}
\newcommand\ALD@coladjustmentB{\raggedleft}

\newlength\ALD@footerheight
\newlength\UnitLogoWidth
\newlength\UnitLogoHeight
\newcommand\ALD@footerfirstpage{%
  \def\ALD@footerplace{\textbf{\csuseunitdata{contactname}}}%
  \def\ALD@footeraddress{\csuseunitdata{contactaddress}}%
  \def\ALD@footerotherinfo{%
    \begingroup%
    \ALD@black@links%
    \ifcsvoidunitdata{contactphone}{}{%
      \csusekw{contactphone}%
      \ALD@phoneprefix%
%      \ALD@phonespacer{\csuseunitdata{contactphone}}%
      \csuseunitdata{contactphone}%
      \par%
    }%
    \ifcsvoidunitdata{contactfax}{}{%
      \csusekw{contactfax}%
      \ALD@phoneprefix%
      \csuseunitdata{contactfax}%
      \par%
    }%
    \ifcsvoidunitdata{contactemail}{}{%
      \csusekw{contactemail}%
      \urlstyle{rm}%
      \csuseunitdata{contactemail}
      \par%
    }%
    \ifcsvoidunitdata{contacthomepage}{}{%
      \csusekw{contacthomepage}%
      \urlstyle{rm}%
      \csuseunitdata{contacthomepage}
      \par%
    }
    \endgroup%
   }%
   % in order to know the height of materials
  \savebox\ALD@footerboxA{{\parbox[t]{\dimexpr\ALD@footercolwidth-1em}{\AUpassata\ALD@coladjustmentA\ALD@footerotherinfo}}}%
  \savebox\ALD@footerboxB{{\parbox[t]{\dimexpr\ALD@footercolwidth-1em}{\AUpassata\ALD@coladjustmentB\ALD@footerplace\par\ALD@footeraddress}}}%
    \begin{lrbox}{\ALD@footerbox}%
    %\fboxsep=0pt%
    %\fbox  
    {%
      \begin{minipage}[t]{\dimexpr\paperwidth-20mm-10mm}%
        \raggedright\AUpassata%
        \setlength\@tempdimc{\dimexpr\ht\ALD@footerboxA+\dp\ALD@footerboxA}%
        \setlength\@tempdimb{\dimexpr\ht\ALD@footerboxB+\dp\ALD@footerboxB}%
        % find the proper height of the footer as given by the two
        % footer columns
        \ifdim\@tempdimc>\@tempdimb%
          \global\ALD@footerheight=\@tempdimc%
        \else%
          \global\ALD@footerheight=\@tempdimb%
        \fi%
        \iftoggle{ALD@bss}{%
          \setlength\UnitLogoWidth{\dimexpr\paperwidth-20mm-20mm-2\ALD@footercolwidth-1pt}%
          \global\UnitLogoWidth=\UnitLogoWidth%
          \setlength\UnitLogoHeight{\dimexpr\ALD@footerheight-1em}%
          \global\UnitLogoHeight=\UnitLogoHeight%
        }{%
          \setlength\UnitLogoWidth{35mm-1em}%
          \global\UnitLogoWidth=\UnitLogoWidth%
          \setlength\UnitLogoHeight{\ALD@footerheight-1em}%
          \global\UnitLogoHeight=\UnitLogoHeight%
        }%
        \savebox\ALD@footerboxLogo{\csuseunitdata{logo}}%
        % Normal setup (not BSS)
        \iftoggle{ALD@bss}{}{%
          % if logo is specified use it, otherwise use the AU seal
          \ifdim\wd\ALD@footerboxLogo>0pt%
            \parbox[t]{35mm}{\raisebox{-\ht\ALD@footerboxLogo+\heightof{B}}{\usebox{\ALD@footerboxLogo}}}%
            \hspace{12pt}%
          \else%
            \savebox\ALD@footerboxLogo{\AUDKSeal[18mm]{}}%
            \parbox[t]{35mm}{\raisebox{-\ALD@footerheight+\heightof{B}}{\usebox{\ALD@footerboxLogo}}}%
            \hspace{12pt}%
          \fi%
        }%
        {%
          \parbox[t]{\dimexpr\ALD@footercolwidth-12pt}{\ALD@coladjustmentA\ALD@footerplace\par\ALD@footeraddress}%
        }%
        \hspace{12pt}%
        {%
          \parbox[t]{\dimexpr\ALD@footercolwidth-12pt}{\ALD@coladjustmentB\ALD@footerotherinfo}%
        }%
        \iftoggle{ALD@bss}{%
          \ifdim\wd\ALD@footerboxLogo>0pt%
            \hspace{12pt}%
            {%
              \parbox[t]{\dimexpr
                \paperwidth
                -20mm
                -10mm
                -10mm
                -2\ALD@footercolwidth
                -1pt
              }{%
                \ALD@bsslogojustification%
                \raisebox{-\ht\ALD@footerboxLogo+\heightof{B}}{%
                  \usebox{\ALD@footerboxLogo}%
                }%
              }%
            }%
          \fi%
        }{}%
      \end{minipage}%
    }%
  \end{lrbox}%
  \raisebox{\dp\ALD@footerbox}{\usebox{\ALD@footerbox}}%
}

% \newcommand\ALD@footerrest{%
%   \begin{lrbox}{\ALD@footerbox}%
%   \begin{minipage}[t]{3\ALD@footercolwidth}%
%     \raggedright\AUpassata
%     \savebox\ALD@footerboxLogo{\csuseunitdata{logo}}%
%     \ifdim\wd\ALD@footerboxLogo>0pt
%       \parbox[t]{35mm}{\raisebox{-\ht\ALD@footerboxLogo+\heightof{B}}{\usebox{\ALD@footerboxLogo}}}%
%     \fi
%     \parbox[t][\ALD@footerheight][t]{1cm}{\phantom{B}}
%     \end{minipage}
%   \end{lrbox}%
%   \raisebox{\dp\ALD@footerbox}{\usebox{\ALD@footerbox}}
% }

% as of 2017, the footer is empty on all other pages
\newcommand\ALD@footerrest{}




\newcounter{ALD@Doc@No}
\newcommand\ALD@Mark@Start@Doc{%
  \stepcounter{ALD@Doc@No}}
\newcommand\ALD@Mark@End@Doc{%
  \phantomsection%
  \label{lastpage-\theALD@Doc@No}}

\newcommand\ALD@colophon@page{%
  \begingroup%
  \ALD@black@links%
  \csuse{ALDkw@pagename@\ALD@currentlanguage}~\thepage/%
  \ifALD@hyperref\pageref*{lastpage-\theALD@Doc@No}\else\pageref{lastpage-\theALD@Doc@No}\fi%
  \endgroup%
  }
 
% used for debugging the colophon
\newcommand\ALD@debugging@guide{\makebox[0pt][l]{\rule{37.5mm}{0.4pt}}}

\newcommand\ALD@c@colophon@branch{
  \ifcsvoiduserdata{branch}{%
    % user did not set anything, look in the current unit data
    \ifcsvoidunitdata{branchname}{}{%
      \textbf{\csuseunitdata{branchname}}%
      \par\vskip\baselineskip%
    }}{%
    \textbf{\csuseuserdata{branch}}%
    \par\vskip\baselineskip%
  }%
}


% \newcommand\ALD@usecolophondata[3][]{%
%   % #1 formatting macro
%   % #2 keyword
%   % #3 postfix
%   \@ifundefined{ALD@colophon@#2}{}{%
%     \@ifnotmtarg{ALD@colophon@#2}{%
%       #1{\@nameuse{ALD@colophon@#2}}#3%
%     }%
%   }%
% }

\newcommand\ALD@letter@colophon@user{%
  \ifcsvoiduserdata{name}{%
    \ifcsvoiduserdata{firstname}{}{%
      \ifcsvoiduserdata{lastname}{}{%
        \textbf{\csuseuserdata{firstname} \csuseuserdata{lastname}}%
        \par\ALD@addvspacemin{\baselineskip}%
      }%
    }%
  }{%
    \ifcsvoiduserdata{name}{}{
      \textbf{\csuseuserdata{name}}%
      \par\ALD@addvspacemin{\baselineskip}%
    }%
  }%
}

\newcommand\ALD@letter@colophon@usertitle{%
  \ifcsvoiduserdata{usertitle}{}{%
    \csuseuserdata{usertitle}%
    \par\ALD@addvspacemin{\baselineskip}%
  }%
}

\def\@date{aqwsde}
\newcommand\MonthAndYear{%
  \gdef\@date{\ALD@dateformater{\the\year}{\the\month}{}}}

\newcommand\BlankDate{%
  \gdef\@date{\qquad}}


\newcommand\ALD@colophon@date{%
  \ifdefvoid{\@date}{}{%
    \csusekw{date}%
    \ifdefstring{\@date}{aqwsde}{%
      \ALD@dateformater{\the\year}{\the\month}{\the\day}%
    }{\@date}\par}}

\newcommand\ALD@letter@colophon@top{%
  \ALD@c@colophon@branch
  \ALD@letter@colophon@user
  \ALD@letter@colophon@usertitle 
  \ALD@colophon@date
}

\newcommand\ALD@colophon@pagebeyondfirst{%
  \ifALD@show@colophon@guides%
    \ALD@debugging@guide%
    \raisebox{-3.8mm}[0pt][0pt]{\ALD@debugging@guide}%
    \raisebox{-7.6mm}[0pt][0pt]{\ALD@debugging@guide}%
  \fi%
  \ALD@colophon@page
  \par\vskip0.1mm%
  \rule{5mm}{\ALD@shortlinethickness}%
} 


\newcommand\ALD@letter@colophon@formatter[1]{%
  \begingroup
  \ALD@black@links%
  \urlstyle{rm}%
  \ifcsvoid{ALD@isfor@#1@colophon}{}{%
    \ifcsvoiduserdata{#1}{}{%
      % web like stuff
      \ifcsdatatype{#1}{web}{%
        \vskip\baselineskip%
        % if the url is longer than the reminder of the line, we add a
        % line break after the keyword (of course only if there is a keyword)
        \settowidth\@tempdima{\csusekw{#1}}%
        \ifdim\@tempdima>0pt%
          \settowidth\@tempdimb{\csuseuserdata{#1}}%
          \addtolength\@tempdima{\@tempdimb}%
          \ifdim\@tempdima>\linewidth%
            \csusekw{#1}\\%
          \else\csusekw{#1}\fi%
        \fi
        \csuseuserdata{#1}%
        \vskip\baselineskip%
      }{%
        % email like stuff
        \ifcsdatatype{#1}{email}{%
          \csusekw{#1}%
          % add breakable if needed
          \ifcsvoid{ALD@allowbreak@#1}{}{\csuse{ALD@allowbreak@#1}}%
          \csuseuserdata{#1}%
        }{%
          % phone like 
          \ifcsdatatype{#1}{phonelike}{%
            \csusekw{#1}%
            \ALD@phoneprefix%
            \csuseuserdata{#1}%
          }{%
            % else
            \csusekw{#1}%
            \csuseuserdata{#1}%
          }%
        }%
      }%
      \par
    }%
  }
  \endgroup%
}

\newcommand\ALD@letter@colophon@middle{
  \ifALD@colophon@is@not@empty@
  \par%
  \ALD@addvspacemin{0.49mm}%
  \rule{5mm}{\ALD@shortlinethickness}
  \vskip2.17mm%
  \begingroup%
  \let\do\ALD@letter@colophon@formatter
  \dolistloop{\ALD@Colophon@Keyword@List}
  \endgroup%
  \fi
}




% provides the contents of the letter colophon
\newcommand\ALD@letter@colophon{%
  \ALD@letter@colophon@top% top of the colophon
  \ifALD@show@colophon@guides% debugging
    \vskip-\baselineskip\ALD@debugging@guide%            
    \raisebox{-3.8mm}[0pt][0pt]{\ALD@debugging@guide}%
    \raisebox{-7.6mm}[0pt][0pt]{\ALD@debugging@guide}%
  \fi%
  \par%\vskip0.75mm
  \ALD@letter@colophon@middle%
  \ifALD@show@colophon@guides% debugging
    \vskip-\baselineskip\ALD@debugging@guide%            
    \raisebox{-3.8mm}[0pt][0pt]{\ALD@debugging@guide}%
    \raisebox{-7.6mm}[0pt][0pt]{\ALD@debugging@guide}%
  \fi%
  \par%
  \ALD@addvspacemin{0.49mm}%
  \rule{5mm}{\ALD@shortlinethickness}%
  \par\vskip2.17mm%
  \ALD@colophon@page%
}



\newcommand\ALD@regular@formatter[2]{
  % #1 name of data
  % #2 alternate keyword basename
  \begingroup
  \ifcsvoiduserdata{#1}{}{%
    \ifblank{#2}{%
      \csusekw{#1}%
    }{%
      \csusekw{#2}%
    }
    \csuseuserdata{#1}%
    \par}
  \endgroup
}

% colophon for fax'
\newcommand\ALD@fax@colophon{%
  \ALD@c@colophon@branch  
  \ALD@colophon@date
  \ALD@regular@formatter{casenumber}{}
  \ALD@regular@formatter{reference}{shortreference}
  \ifALD@show@colophon@guides% debugging
    \vskip-\baselineskip\ALD@debugging@guide%            
    \raisebox{-3.8mm}[0pt][0pt]{\ALD@debugging@guide}%
    \raisebox{-7.6mm}[0pt][0pt]{\ALD@debugging@guide}%
  \fi%
  \par%
  \ALD@addvspacemin{0.49mm}%
  \rule{5mm}{\ALD@shortlinethickness}%
}

% colophon for delivery notes
\newcommand\ALD@coveringnote@colophon{%
  \ALD@c@colophon@branch  
  \ifALD@show@colophon@guides% debugging
    \vskip-\baselineskip\ALD@debugging@guide%            
    \raisebox{-3.8mm}[0pt][0pt]{\ALD@debugging@guide}%
    \raisebox{-7.6mm}[0pt][0pt]{\ALD@debugging@guide}%
  \fi%
  \par%
  \ALD@addvspacemin{0.49mm}%
  \rule{5mm}{\ALD@shortlinethickness}%
  \par\vskip2.17mm%
  \ALD@colophon@date%
}

% colophon for notes
\newcommand\ALD@memo@colophon{%
  \ALD@c@colophon@branch  
  \ALD@letter@colophon@user
  \ALD@letter@colophon@usertitle
  \ALD@colophon@date
  \ALD@regular@formatter{casenumber}{}
  \ALD@regular@formatter{reference}{shortreference}
  \ifALD@show@colophon@guides% debugging
    \vskip-\baselineskip\ALD@debugging@guide%            
    \raisebox{-3.8mm}[0pt][0pt]{\ALD@debugging@guide}%
    \raisebox{-7.6mm}[0pt][0pt]{\ALD@debugging@guide}%
  \fi%
  \par%
  \ALD@addvspacemin{0.49mm}%
  \rule{5mm}{\ALD@shortlinethickness}%
  \par\vskip2.17mm%
  \ALD@colophon@page%
}

% colophon for minutes are the same as for notes
\let\ALD@minutes@colophon\ALD@memo@colophon

% colophon for agendas
\newcommand\ALD@agenda@colophon{%
  \ALD@colophon@date
  \ALD@regular@formatter{casenumber}{}
  \ALD@regular@formatter{reference}{shortreference}
  \ifALD@show@colophon@guides% debugging
    \vskip-\baselineskip\ALD@debugging@guide%            
    \raisebox{-3.8mm}[0pt][0pt]{\ALD@debugging@guide}%
    \raisebox{-7.6mm}[0pt][0pt]{\ALD@debugging@guide}%
  \fi%
  \par%
  \ALD@addvspacemin{0.49mm}%
  \rule{5mm}{\ALD@shortlinethickness}%
  \par\vskip2.17mm%
  \ALD@colophon@page%
}


% the colophon used by Word for agandas is just wrong, it does not
% line up properly, we use the one used for notes instead
\let\ALD@agenda@colophon\ALD@memo@colophon

\def\ps@empty{%
      \let\@oddfoot\@empty\let\@oddhead\@empty
      \let\@evenfoot\@empty\let\@evenhead\@empty}
\def\ps@plain{%
      \let\@oddhead\@empty
      \def\@oddfoot{\normalfont\hfil\thepage\hfil}%
      \def\@evenfoot{\normalfont\hfil\thepage\hfil}}


\providecommand\ps@firstpage{}
\providecommand\ps@headings{}

% generig macro to typeset the contents of the colophon. It is
% redefined inside the various design environments
\let\ALD@colophon\relax
\renewcommand\ps@firstpage{%
  \renewcommand\@oddhead{%
    \AddToShipoutPicture*{%
      \normalfont\normalsize%
      \setlength\unitlength{1mm}%
%      \setlength\@tempdima{\paperheight-108mm-1em+4pt}%
      \setlength\@tempdima{\paperwidth-10mm-35mm}%
      \setlength\@tempdimb{\paperheight-108mm-\heightof{B}+1pt}%
%      \put(20,\LenToUnit{\@tempdimb})%
      \put(\LenToUnit{\@tempdima},\LenToUnit{\@tempdimb}){%
        \begin{minipage}[t]{35mm}%
          \raggedright\AUpassata%
          \ALD@colophon
        \end{minipage}%
      }%
    }%
  }
  \renewcommand\@oddfoot{%
    \AddToShipoutPicture*{%
      \setlength\unitlength{1mm}%
      \put(20,10){\ifALD@nofooter\else\ALD@footerfirstpage\fi}%
%       \put(20,10){%
%         \settowidth\@tempdima{\ALD@useunitkeyword*{logo}}%
%         \ifdim\@tempdima>37.5mm%
%           \resizebox{37.5mm}{!}{\ALD@useunitkeyword*{logo}}%
%         \else%
%           \ALD@useunitkeyword*{logo}%
%         \fi%
%       }%
    }%
  }%
}

\renewcommand\ps@headings{%
  \renewcommand\@oddhead{%
    \AddToShipoutPicture*{%
      \normalfont\normalsize%
      \setlength\unitlength{1mm}%
      \setlength\@tempdima{\paperwidth-10mm-35mm}%
      \setlength\@tempdimb{\paperheight-45mm-\heightof{B}+1pt}%
%      \setlength\@tempdima{\paperheight-45mm-0.5em-1pt}%
%      \put(20,\LenToUnit{\@tempdima})%
      \put(\LenToUnit{\@tempdima},\LenToUnit{\@tempdimb}){%
        \begin{minipage}[t]{35mm}%
          \raggedright\AUpassata%
          \ALD@colophon@pagebeyondfirst%
        \end{minipage}%
      }%
    }%
  }
  \let\@evenhead\@oddhead%
  \renewcommand\@oddfoot{%
    \AddToShipoutPicture*{%
      \setlength\unitlength{1mm}%
      \put(20,10){\ifALD@nofooter\else\ALD@footerrest\fi}%
    }%
  }%
  \let\@evenfoot\@oddfoot%
}

\pagestyle{headings}



% wrapper environment that only provide a better structure to the
% document, does nothing in it self
\newenvironment{ColophonData}{}{}


\let\ALD@oldletter\letter
\let\ALD@oldendletter\endletter
\newcommand\ALD@initialize@counters{%
%  \c@page\@ne%
  \setcounter{page}{1}
  \c@footnote\z@%
  \setcounter{section}{0}
  \setcounter{subsection}{0}
%  \setcounter{subsubsection}{0}
}


\renewcommand\theequation{\@arabic\c@equation}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\relax}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\relax}
\DeclareRobustCommand*{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand*{\mit}{\@fontswitch{\relax}{\mathnormal}}
\renewcommand\footnoterule{%
  \kern-\p@
  \hrule \@width .4\columnwidth
  \kern .6\p@}
\long\def\@makefntext#1{%
    \noindent
    \hangindent 5\p@
    \hb@xt@5\p@{\hss\@makefnmark}#1}


%#% extract
\providecommand\letter{}
\providecommand\closing{}
%#% /extract

\newcommand\ALD@start@drop{%
  \iftoggle{ignoreaddress}{%
    \iftoggle{ignoreaddresshalf}{%
      \strut\vskip25mm
      \vskip-\baselineskip
      \vskip-\parskip
    }{}%
  }{%
    \strut\vskip50mm
    \vskip-\baselineskip
    \vskip-\parskip
  }%
}

\newsavebox\ALD@Receiver@Box
\newcommand\ALD@receiver@box{%
  \sbox\ALD@Receiver@Box{%
    \begin{minipage}[t]{85mm}%
      \raggedright%
      \ALD@letter@receiver%
    \end{minipage}%
  }%
  \iftoggle{resizereceiver}{%
    \ifdim\dimexpr\ht\ALD@Receiver@Box+\dp\ALD@Receiver@Box\relax>\ALD@receiver@height%
      \ClassInfo{aultrdesign}{Resizing receiver address}%
      \resizebox*{!}{\ALD@receiver@height}{\usebox\ALD@Receiver@Box}%
    \else%
      \usebox\ALD@Receiver@Box%
    \fi%
  }{%
    \usebox\ALD@Receiver@Box%
  }%
}



% basically we do not care about the parsing the regular letter env does
\renewenvironment{letter}[1]{%
  \newpage
  \thispagestyle{firstpage}%
  \iftoggle{ignoreaddress}{}{%
    \AddToShipoutPicture*{%
      \normalfont
      % address
      \setlength\@tempdima{\paperheight-45mm-1em+2pt}%
      \put(\LenToUnit{20mm},\LenToUnit{\@tempdima}){%
        % \begin{minipage}[t]{85mm}%
        %   \raggedright
        %   \ALD@letter@receiver
        % \end{minipage}%
        \ALD@receiver@box%
      }%
    }}%
  \normalfont\normalsize%
  \let\opening\ALD@general@opening%
  \let\ALD@colophon\ALD@letter@colophon%
  % globally save the receiver address such that the \opening macro
  % can use it to typeset the receiver address
  \gdef\ALD@letter@receiver{#1}%
  % reset page and footnote counters to 1 and 0
  \phantomsection%
  \ALD@initialize@counters%
  \interlinepenalty=200%
  \ALD@start@drop%
  \ALD@Mark@Start@Doc%
}{\@@par\ALD@Mark@End@Doc\pagebreak\@@par}



\def\receiveraddress{}
\long\def\ALD@ReceiverAddress#1{\long\gdef\receiveraddress{#1}} 
\newenvironment{ReceiverAddress}{\Collect@Body\ALD@ReceiverAddress}{}
%\newenvironment{ReceiverAddress*}{\obeylines\Collect@Body\ALD@ReceiverAddress}{}

% alternative letter environment that does not specify the receiver
% address via an argument, instead we use the address provided through
% the ReceiverAddress environment
\newenvironment{Letter}{\begin{letter}{\receiveraddress}}{\end{letter}}


%
% HANDLING END OF LETTER STUFF
%


%#% extract

% we support three keywords:
% inline: \item does not cause a line break
% singleline: write everything on the same line as the header, emplies
% inline
% interspace=<length>: sets the space between the header and the
% contents, default 1ex
%
% key family: ALDEndEnv  (ALD ending environments)
%
\define@boolkey{ALDEndEnv}{inline}[true]{}
\define@boolkey{ALDEndEnv}{singleline}[true]{%
  \setkeys{ALDEndEnv}{inline=true}%
}
\newlength\ALD@postsig@interspace
\setlength\ALD@postsig@interspace{1ex}
\define@key{ALDEndEnv}{interspace}{\setlength\ALD@postsig@interspace{#1}}

% creator macro
\newcommand\MakeEndingEnvironments[2]{%
  \newenvironment{#1}[1][]{%
    \setkeys{ALDEndEnv}{##1}%
    \par\vskip1em\noindent%
    \begin{minipage}[t]{1.0\linewidth}%
      \raggedright%
      \ifKV@ALDEndEnv@singleline\else{#2}\par\vskip\ALD@postsig@interspace\fi%
      \ifKV@ALDEndEnv@singleline
        % in singleline mode it looks best to have a single item list
        % with the title as the item
        \begin{list}{{#2}\hfill}{%
            \settowidth\labelwidth{{#2}}%
            \setlength\leftmargin{\labelwidth+\labelsep}
            \parskip=0pt%
            \topsep=0pt%
            \partopsep=0pt%
            \parsep=0pt%
            \itemsep=0pt%
            \itemindent=0pt%
          }%
        \item
        \renewcommand\item[1][]{}
      \else%
        \ifKV@ALDEndEnv@inline%
        \renewcommand\item[1][]{}
        \else
          \begin{list}{}{%
              \leftmargin=0pt%
              \parskip=0pt%
              \topsep=0pt%
              \partopsep=0pt%
              \parsep=0pt%
              \itemsep=0pt%
            }%
        \fi
      \fi%  
      }{%
      \ifKV@ALDEndEnv@singleline\end{list}\else
      \ifKV@ALDEndEnv@inline\else\end{list}\fi\fi
    \end{minipage}%
  }%
}

\MakeEndingEnvironments{CopyTo}{\csusekw{copyto}}
\MakeEndingEnvironments{Enclosed}{\csusekw{enclosing}}
\MakeEndingEnvironments{SentTo}{\csusekw{sentto}}

% creating macro versions as vell, these imply singleline
\newcommand\copyto[2][singleline]{\begin{CopyTo}[#1] #2\end{CopyTo}}
\newcommand\enclosed[2][singleline]{\begin{Enclosed}[#1] #2\end{Enclosed}}
\newcommand\sentto[2][singleline]{\begin{SentTo}[#1] #2\end{SentTo}}

%#% /extract



% \myname provides 
% \fromsig if \fromsig is non empty
% else 
% non-starred: First Name Last name\\ User title
% starred: First Name Last Name

\newcommand\myname{\@ifstar{\ALD@myname{01}}{\ALD@myname{00}}}


\newcommand\ALD@myname[1]{%
  \begingroup%
  \ifdefvoid{\fromsig}{%
    \ifcsvoiduserdata{name}{%
      \ifcsvoiduserdata{firstname}{%
        \ALD@myname@error%
      }{%
        \ifcsvoiduserdata{lastname}{%
          \ALD@myname@error%
        }{%
          \csuseuserdata{firstname} \csuseuserdata{lastname}
          \if#1\ifcsvoiduserdata{usertitle}{}{\\\csuseuserdata{usertitle}}\fi%
        }}%
    }{%
      \csuseuserdata{name}%
       \if#1\ifcsvoiduserdata{usertitle}{}{\\\csuseuserdata{usertitle}}\fi%
    }%
  }{\fromsig}%
  \endgroup%
}

\newcommand\ALD@myname@error{%
   \ClassError{aultrdesign}{%
      You have used \string\closing\space but no data was available 
      for the signature. Please either use \string\signature{...},
      ^^J \string\name{...}  or fill in \string\firstname\space^^Jand \string\lastname\space
      or use the alternative interface}{}}


%\def\ALD@signature@user@titlefont{}

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% SIGNATURES
%%%%%%%%%%%%%%%%%%%%%%%%%
%#% extract

% \newlength\ALD@signerpadding
% \newlength\ALD@signerpaddingleft
% \newlength\ALD@signerpaddingright
% \newlength\ALD@sigdrop
% \newlength\ALD@nsig@sigleftindent
% \newlength\ALD@sig@sigtitleleftindent

% key family ALDclo (lower case clo to indicate \closing)

% overall alignment
% alignment is depreciated
\define@key{ALDclo}{alignment}{%
  \ClassWarning{aultrdesign}{\string\closing option 'alignment' is
    depreciated,\MessageBreak use 'outeralign=left' or
    'outeralign=center' instead}
  \def\ALDclo@outeralign{#1}
}
% alignment of the signature block in relation to the text block
\define@choicekey{ALDclo}{outeralign}[\val\nr]{center,left}{
  \ifcase\nr\relax
  \def\ALDclo@outeralign{\centering}
  \or
  \def\ALDclo@outeralign{\raggedright}
  \fi
}

% alignment inside signature box
% inneralignment is depreciated
\define@key{ALDclo}{inneralignment}{
  \ClassWarning{aultrdesign}{\string\closing option 'inneralignment' is
    depreciated,\MessageBreak use 'inneralign=left' or
    'inneralign=center' instead}
  \def\ALDclo@inneralign{#1}
}
% alignment of the signature block in relation to the text block
\define@choicekey{ALDclo}{inneralign}[\val\nr]{center,left}{
  \ifcase\nr\relax
  \def\ALDclo@inneralign{\centering}
  \or
  \def\ALDclo@inneralign{\raggedright}
  \fi
}
% fast access
\define@key{ALDclo}{centerall}[true]{%
  \def\ALDclo@outeralign{\centering}%
  \def\ALDclo@inneralign{\centering}%
}
% fast access
\define@key{ALDclo}{leftifyall}[true]{%
  \def\ALDclo@outeralign{\raggedright}%
  \def\ALDclo@inneralign{\raggedright}%
}
% indentation for the signature block
% signatureleftindent is depreciated
\define@key{ALDclo}{signatureleftindent}{
  \ClassWarning{aultrdesign}{\string\closing option 'signatureleftindent' is
    depreciated,\MessageBreak use 'signatureindent' instead}
  \setlength\ALDclo@signatureindent{#1}
}
\define@key{ALDclo}{signatureindent}{\dimdef\ALDclo@signatureindent{#1}}
% indentation for closing
% titleleftindent is depreciated
\define@key{ALDclo}{titleleftindent}{
  \ClassWarning{aultrdesign}{\string\closing option 'titleleftindent' is
    depreciated,\MessageBreak use 'closingindent' instead}
  \dimdef\ALDclo@closingindent{#1}
}
\define@key{ALDclo}{closingindent}{\dimdef\ALDclo@closingindent{#1}}
% fast access
\define@key{ALDclo}{leftindent}{%
  \dimdef\ALDclo@closingindent{#1}%
  \dimdef\ALDclo@signatureindent{#1}%
}
\define@key{ALDclo}{signaturedrop}{\dimdef\ALDclo@signaturedrop{#1}}
% closing font
% signaturetitlefont is depreciated
\define@key{ALDclo}{signaturetitlefont}{%
  \ClassWarning{aultrdesign}{\string\closing option 'signaturetitlefont' is
    depreciated,\MessageBreak use 'closingfont' instead}
  \def\ALDclo@closingfont{#1}
}
\define@key{ALDclo}{closingfont}{\def\ALDclo@closingfont{#1}}
% signature font
% signatureusertitlefont is depreciated
\define@key{ALDclo}{signatureusertitlefont}{
  \ClassWarning{aultrdesign}{\string\closing option 'signatureusertitlefont' is
    depreciated,\MessageBreak use 'signaturefont' instead}
  \def\ALDclo@signaturefont{#1}
}
\define@key{ALDclo}{signaturefont}{\def\ALDclo@signaturefont{#1}}
% gfxinneralignment is not uses anymore
\define@key{ALDclo}{gfxinneralignment}{
  \ClassWarning{aultrdesign}{\string\closing option 'gfxinneralignment' is
  not used anymore, silently ignored.}
}

\define@key{ALDclo}{gfxsigvadjust}{
  \ClassWarning{aultrdesign}{\string\closing option 'gfxsigvafjust' is
    depreciated,\MessageBreak use 'gfxvadjust' instead}
  \dimdef\ALDclo@gfxvadjust{#1}
}

\define@key{ALDclo}{gfxvadjust}{\dimdef\ALDclo@gfxvadjust{#1}}
\define@key{ALDclo}{gfxsignature}{\def\ALDclo@gfxsignature{#1}}

% length added above scanned signatures 
\define@key{ALDclo}{gfxvpad}{\dimdef\ALDclo@gfxvpad{#1}}

\newtoggle{ignoregfxsignature}
\define@boolkey{ALDclo}{ignoregraphicalsignature}[true]{
  \ifKV@ALDclo@ignoregraphicalsignature
    \toggletrue{ignoregfxsignature}
  \else
    \togglefalse{ignoregfxsignature}
  \fi
}



% default values
\setkeys{ALDclo}{
  signaturedrop=4\baselineskip,
  leftifyall,
  leftindent=0em, 
  closingfont=,
  signaturefont=,
  gfxvadjust=0pt,
  gfxsignature=,
  gfxvpad=0.5\baselineskip,
  ignoregraphicalsignature=false,
}

\providecommand\stopbreaks{}
% no idea what this does, it was in the letter.cls file, so we just
% bring it along
\renewcommand*{\stopbreaks}{%
  \interlinepenalty\@M
  \def\par{\@@par\nobreak}%
  \let\\\@nobreakcr
  \let\vspace\@nobreakvspace}

\newcommand\ALD@blank@above@sig{\vspace{\baselineskip}}

% we add a starred \closing as well, if \fromsig is empty then \myname
% or \myname* will be used
\renewcommand\closing{\@ifstar\ALD@closingS\ALD@closingN}
\DeclareRobustCommand\ALD@closing[2][\myname]{%
  \par\nobreak%\ALD@blank@above@sig%\vspace{\parskip}%
  \stopbreaks\noindent%
  \begin{minipage}[t]{\textwidth}%
    \ignorespaces%
    \hspace*{\ALDclo@closingindent}%
    \begin{varwidth}{\linewidth-\ALDclo@closingindent}%
      \raggedright\ALDclo@closingfont\strut #2
    \end{varwidth}%
    \par%
    % setup outer alignment
    \ALDclo@outeralign%
    % next we copy the structure from the env based solution
    % we need to fill out \gfx (the scanned signature if there is one)
    % \gfxvadjust (if there is anything given)
    % \signaturestrutheight
    % if there is to be no written signature, disable scanned
    % signature, and reduce drop
    \iftoggle{nowrittensignature}{%
      \dimdef\signaturestrutheight{\baselineskip}%
      \def\gfx{}%
    }{% there is to be a signature
      % 
      % if there is not a graphical signature
      \ifdefvoid\ALDclo@gfxsignature{%
        % use the specified drop
        \dimdef\signaturestrutheight{\ALDclo@signaturedrop}
        % make sure \gfx is defined (used by \addgfx)
        \def\gfx{}
      }{% there is a scanned signature
        % save in box so we can measure
        \sbox\ALD@tmpbox{\ALDclo@gfxsignature}%
        \dimdef\gfxht{\ht\ALD@tmpbox}%
        \dimdef\gfxdp{\dp\ALD@tmpbox}%
        % make sure \gfx and \gfxvadjust are set
        \let\gfx\ALDclo@gfxsignature
        \let\gfxvadjust\ALDclo@gfxvadjust% it exist, zero by default
        % set the strut height to be adjusted height of scan plus gfxvpad
        \dimdef\signaturestrutheight{\gfxht+\gfxdp+\ALDclo@gfxvpad+\ALDclo@gfxvadjust}%
      }%
    }%
    % implement ignoregfxsignature:
    \iftoggle{ignoregfxsignature}{%
      \def\gfx{}%
      \dimdef\signaturestrutheight{\ALDclo@signaturedrop}%
    }{}%
    % add any indent (not wite sure what happens if outeralign=center,
    % need testing)
    \hspace*{\ALDclo@signatureindent}%
    % box to hold the typeset signature, remember to adjust the width
    \begin{varwidth}[t]{\linewidth-\ALDclo@signatureindent}%
      \ALDclo@inneralign%
      % add the strut and scanned signature
      \ALD@addgfx%
      \par%
      \strut\ifdefvoid{\fromsig}{#1}{\fromsig}\strut\par%
    \end{varwidth}%
    % 
%     \ifALD@no@written@signature
%        \ALD@sigdrop=\baselineskip
%        \ALD@graphical@signature@adjustment=0pt
%        \def\ALD@graphical@signature{}
%     \fi
% %    \vskip4\baselineskip%
%     \expandafter\@ifmtarg\expandafter{\ALD@graphical@signature}{%
%       % there is no gfx signature
%       \vskip\ALD@sigdrop%
%       \hspace*{\ALD@nsig@sigleftindent}%
%       \begin{varwidth}{\linewidth-\ALD@nsig@sigleftindent}%
%         \ALD@nsig@inneralignment%
% %         \expandafter\@ifmtarg\expandafter{\fromsig}{%
% %           #1 }{\fromsig}%
%         \ifdefvoid{\fromsig}{#1}{\fromsig}%
%       \end{varwidth}%
%     }{%
%       % there is a gfx signature
%       \vskip10pt
%       \hspace*{\ALD@nsig@sigleftindent}%
%       \begin{varwidth}{\linewidth-\ALD@nsig@sigleftindent}%
%         \ALD@nsig@gfxinneralignment%
%         \ALD@graphical@signature%
%         \vskip\ALD@graphical@signature@adjustment%
%         \ifdefvoid{\fromsig}{#1}{\fromsig}%
% %         \expandafter\@ifmtarg\expandafter{\fromsig}{%
% %           #1 }{\fromsig}%
%       \end{varwidth}%
%     }%
  \end{minipage}%
}

\newcommand\ALD@closingS[2][]{\begingroup\setkeys{ALDclo}{#1}\ALD@closing[\myname*]{#2}\endgroup}
\newcommand\ALD@closingN[2][]{\begingroup\setkeys{ALDclo}{#1}\ALD@closing{#2}\endgroup}

\newcommand\SetGlobalClosingOptionsTraditional[1]{
  \ClassWarning{aultrdesign}{\string\SetGlobalClosingOptionsTraditional\space
    is depreciated,\MessageBreak
    use \string\SetGlobalOptionsClosingMacro\space instead.}
  \setkeys{ALDclo}{#1}}

\newcommand\SetGlobalOptionsOptionsMacro[1]{\setkeys{ALDclo}{#1}}


% some macros that users might be using from auletter that are not
% supported here because we have better ideas

\newcommand\threesignatures{%
  \ClassError{aultrdesign}{%
    \string\threesignatures\space is no longer
    supported. \MessageBreak
    Use the 'Closing' environment and its sub-environment 'signer' instead.
  }{}
}
\newcommand\twosignatures{%
  \ClassError{aultrdesign}{%
    \string\twosignatures\space is no longer supported. \MessageBreak
    Use the 'Closing' environment and its sub-environment 'signer' instead.
  }{}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ENV BASED SIGNATURES
%%%%%%%%%%%%%%%%%%%%%%%%%%%


% specify options:
% families: 
%   ALDCLO: Closing environment
%   ALDsig: signer plus primarysignature, secondarysignature

% this option may have been used by old documents, still works but is depreciated
\define@choicekey{ALDCLO}{alignment}[\val\nr]{center,left}{
  \ClassWarning{aultrdesign}{Closing option 'alignment' is depreciated,\MessageBreak
    use 'outeralign' instead'}
  \ifcase\nr\relax
    \def\ALDCLO@outeralign{\centering}
  \or
    \def\ALDCLO@outeralign{\raggedright}
  \fi
}
\define@choicekey{ALDCLO}{signaturealignment}[\val\nr]{center,left}{
  \ClassWarning{aultrdesign}{Closing option 'signaturealignment' is depreciated,\MessageBreak
    use 'outeralign' instead'}
  \ifcase\nr\relax
    \def\ALDCLO@outeralign{\centering}
  \or
    \def\ALDCLO@outeralign{\raggedright}
  \fi
}
% alignment of the siguature blocks relativ to the text block
\define@choicekey{ALDCLO}{outeralign}[\val\nr]{center,left}{
  \ifcase\nr\relax
  \def\ALDCLO@outeralign{\centering}
  \or
  \def\ALDCLO@outeralign{\raggedright}
  \fi
}
% mode option. For now we only have two modes, so a simple toggle is enough
\newtoggle{grid}
\define@choicekey{ALDCLO}{mode}[\val\nr]{default,grid}{%
  \ifcase\nr\relax%
  \togglefalse{grid}%
  \or%
  \toggletrue{grid}%
  \fi%
}
\define@boolkey{ALDCLO}{grid}[true]{
  \ifKV@ALDCLO@grid
    \toggletrue{grid}
  \else
    \togglefalse{grid}
  \fi
}


% auto adjust grid columns, i.e. #signers < num cols => num cols = #signers
\newtoggle{autoadjustgrid}
\define@boolkey{ALDCLO}{autoadjustgrid}[true]{
  \ifKV@ALDCLO@autoadjustgrid
    \toggletrue{autoadjustgrid}
  \else
    \togglefalse{autoadjustgrid}
  \fi
} 
% grid columns, choice key, onle 1-4 available
\define@choicekey{ALDCLO}{gridcols}[\val\nr]{1,2,3,4}{
  \def\ALDCLO@numgridcolumns{#1}
}
% inneralignment is depreciated
\define@choicekey{ALDCLO}{inneralignment}[\val\nr]{center,left}{
  \ClassWarning{aultrdesign}{Closing option 'inneralignment' is depreciated,\MessageBreak
    use 'inneralign' instead'}
  \ifcase\nr\relax
  \def\ALDCLO@inneralignment{\centering}
  \or
  \def\ALDCLO@inneralignment{\raggedright}
  \fi
}
% inneralign better follow the outer version
\define@choicekey{ALDCLO}{inneralign}[\val\nr]{center,left}{
  \ifcase\nr\relax
  \def\ALDCLO@inneralignment{\centering}
  \or
  \def\ALDCLO@inneralignment{\raggedright}
  \fi
}
% fast center all or leftify all
\define@boolkey{ALDCLO}{centerall}[true]{
  \ifKV@ALDCLO@centerall
    \def\ALDCLO@inneralignment{\centering}
    \def\ALDCLO@outeralign{\centering}
  \fi
}
\define@boolkey{ALDCLO}{leftifyall}[true]{
  \ifKV@ALDCLO@leftifyall
    \def\ALDCLO@inneralignment{\raggedright}
    \def\ALDCLO@outeralign{\raggedright}
  \fi
}
% signature drop
\define@key{ALDCLO}{signaturedrop}{\def\ALDCLO@signaturedrop{#1}}
% closing indent
\define@key{ALDCLO}{closingindent}{\dimdef\ALDCLO@closingindent{#1}}
% extra padding for default plocks without scanned signature (written
% signature is wider than typeset text)
\define@key{ALDCLO}{signerpadding}{\dimdef\ALDCLO@signerpadding{#1}}
% padding added on the right of default blocks
\define@key{ALDCLO}{outersignerpadding}{\gluedef\ALDCLO@outersignerpadding{#1}}
% font for closing remark
\define@key{ALDCLO}{closingfont}{\def\ALDCLO@closingfont{#1}}
% depreciated
\define@key{ALDCLO}{signaturetitlefont}{%
  \ClassWarning{aultrdesign}{Closing option 'signaturetitlefont' is
    depreciated,\MessageBreakuse 'closingfont' instead'}
  \def\ALDCLO@closingfont{#1}
}
% font for typeset signature
\define@key{ALDCLO}{signaturefont}{\def\ALDCLO@signaturefont{#1}}
% depreciated
\define@key{ALDCLO}{signaturetitlefont}{
  \ClassWarning{aultrdesign}{Option 'signaturetitlefont' is
    depreciated,\MessageBreak use 'closingfont' instead}
  \def\ALDCLO@closingfont{#1}
}
% length added above scanned signatures if all scanned signatures
\define@key{ALDCLO}{allgfxvpad}{\dimdef\ALDCLO@allgfxvpad{#1}}
% user can provide a typesetting callback of their own
\define@key{ALDCLO}{callback}{\def\ALDCLO@usercallback{#1}}
%
% key family for signer, primarysignature and secondarysignature envs

\define@key{ALDsig}{localsignerpadding}{\dimdef\ALDsig@localsignerpadding{#1}}
\define@key{ALDsig}{gfxsignature}{\def\ALDsig@gfx{#1}}
\define@key{ALDsig}{gfxvadjust}{\def\ALDsig@gfxvadjust{#1}}
% depreciated
\define@key{ALDsig}{gfxinneralignment}{
%\def\ALDsig@gfxvadjust{#1}
  \ClassWarning{aultrdesign}{Option 'gfxinneralignment' is
    depreciated,\MessageBreak and now silently ignored. Alignment of a
    single signature is no longer available.
  }
}


% default ALDCLO values
\setkeys{ALDCLO}{
  mode=default,
  autoadjustgrid=false,
  gridcols=2,
  leftifyall,
  signaturedrop=4\baselineskip,
  closingfont=,
  signaturefont=,
  allgfxvpad=0.5\baselineskip,
  outersignerpadding=2em plus 1em minus 1.5em,
  signerpadding=5em,
  closingindent=0em,
  callback=,
}

% no defaults for ALDsig


% Enable users to adjust default settings, e.g. in profiles
\newcommand\SetGlobalClosingOptionsModern[1]{
  \ClassWarning{aultrdesign}{Macro
    \string\SetGlobalClosingOptionsModern\space is
    depreciated,\MessageBreak 
    use \string\SetGlobalOptionsClosingEnvironment.}
  \setkeys{ALDCLO}{#1}
}
\newcommand\SetGlobalOptionsClosingEnvironment[1]{\setkeys{ALDCLO}{#1}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ENV IMPLEMENTATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The idea is the following. Collect all signer (and friends) env data
% including options in a data list. Then use a callback function for
% format each item from that list.

% Some helpers

% This is the width of the strut performing the signature drop. zero
% means don't show.
\dimdef\vstrutwidth{0pt}
% the macro that adds the strut and the gfx signature if present. Note
% that the data macros refered to are only defined locally where the
% macro is called.
\newcommand\ALD@addgfx{%
  \rule{\vstrutwidth}{\signaturestrutheight}%
  \iftoggle{nowrittensignature}{}{%
    % we do this in a way that does not take up any vertical space
    \ifdefvoid{\gfx}{}{%
      \raisebox{\gfxvadjust}[0pt][0pt]{%
        {\gfx}%
      }}%
  }%
}
%


% Collector macro. The macro is given the contents of the signer (and
% friends) env as #1. If present the options given to the envs are
% available in \gfx (scanned signature), \gfxvadjust and
% \localsignerpadding
\newsavebox\ALDCLO@tmpbox
\newcommand\ALDCLO@collector[1]{%
  \begingroup%
  % count the number of signers, because of grid features, we need to
  % have two counts, the real number of signer environments, and the
  % number of virtual blocks (so we can know where we are in a grid
  % even when adding manual row breaks)
  \numgdef\numberofsigners{\numberofsigners+1}%
  \numgdef\numberofblocks{\numberofblocks+1}%
  % first see if there is a scanned signature
  \ifdefvoid{\ALDsig@gfx}%
  % there is none, make sure macros are defined plus set
  % dimensions to zero, also set vadjust to zero no matter what the
  % user did
  {%
    \def\ALDsig@gfx{}%
    \dimdef\gfxvadjust{0pt}%
    \dimdef\gfxwd{0pt}%
    \dimdef\gfxht{0pt}%
    \dimdef\gfxdp{0pt}%
  }%
  % there is a scanned signature (or something)
  {%
    % step up the number of scanned signatures, this has to be global
    \numgdef\numberofgfx{\numberofgfx+1}%
    % store gfx in a box, so we can measure
    \sbox\ALDCLO@tmpbox{\ALDsig@gfx}%
    % we need to store the max effective height of the scanned
    % signature, thus we need to see if there is an added adjustment
    % if not set it to zero, do nothing otherwise
    \ifdefvoid{\ALDsig@gfxvadjust}{\dimdef\gfxvadjust{0pt}}{%
      \dimdef\gfxvadjust{\ALDsig@gfxvadjust}}%
    % store the maximal total height (\gfxvadjust is expected to be <=0)
    \ifdimless{\maxgfxh}{\ht\ALDCLO@tmpbox+\dp\ALDCLO@tmpbox+\gfxvadjust}{%
      \dimgdef\maxgfxh{\ht\ALDCLO@tmpbox+\dp\ALDCLO@tmpbox+\gfxvadjust}%
    }{}%
    % might as well store the wd, ht and dp of the gfx while we are at
    % it, might be useful later
    \dimdef\gfxwd{\wd\ALDCLO@tmpbox}%
    \dimdef\gfxht{\ht\ALDCLO@tmpbox}%
    \dimdef\gfxdp{\dp\ALDCLO@tmpbox}%
  }%
  % see if the localsignerpadding have been given, we test this for 'emptyness'
  \ifdefvoid\ALDsig@localsignerpadding{\def\ALDsig@localsignerpadding{}}{}%
  % store the content in a macro (helps with expansion later)
  \def\content{#1}%
  % we might as well measure the with of the contents right away:
  \sbox\ALDCLO@tmpbox{\begin{varwidth}{\textwidth}\content\end{varwidth}}%
  \dimdef\contentwd{\wd\ALDCLO@tmpbox}%
  % globally add the data to an item in a list structure. To extract
  % the data, just execute the item.
  \listxadd\ALDCLO@signerlist{%
    % the \expandonce helps us store stuff without expanding too deep
    \unexpanded{\def\contents}{\expandonce\content}%
    \unexpanded{\def\gfx}{\expandonce\ALDsig@gfx}%
    \unexpanded{\def\gfxvadjust}{\gfxvadjust}%
    \unexpanded{\def\gfxwd}{\gfxwd}%
    \unexpanded{\def\gfxht}{\gfxht}%
    \unexpanded{\def\gfxdp}{\gfxdp}%
    \unexpanded{\def\contentwd}{\contentwd}%
    \unexpanded{\def\localsignerpadding}{\ALDsig@localsignerpadding}%
    \unexpanded{\def\collectortype}{\collectortype}%
  }%
  \endgroup%
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Default mode
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% macro behind \newrow and \newrow* in default-mode, the actual
% \newrow macro is defined inside the Closing env
\newcommand\ALDCLO@newrowdefault{%
  \listgadd\ALDCLO@signerlist{\unexpanded{\def\forcedrowbreak}{}}%
}

% default typesetting handler
% #1 is a list item, execute it to get data, remember to execute
% within a group to hold data macros local
\newcommand\ALDCLO@defaulthandler[1]{%
  % use a group to keep that list data containers local
  \begingroup%
  % get the data
  #1%
  % first implement \newrow
  \ifdef\forcedrowbreak{\par}{%
    % otherwise typeset a block
    % width of the block calculated as:
    % if gfx:  max(width(gfx),width(txt))
    % else:    w(txt) + if localsignerpadding ? localsignerpadding : signerpadding
    \ifdefvoid{\localsignerpadding}{% not not defined or empty
      \dimdef\blockwd{\contentwd+\ALDCLO@signerpadding}%
    }{% % defined
      \dimdef\blockwd{\contentwd+\localsignerpadding}%
    }%
    \ifdefvoid{\gfx}{}{% there is a gfx:
      \ifdimless{\gfxwd}{\contentwd}%
      {\dimdef\blockwd{\contentwd}}{\dimdef\blockwd{\gfxwd}}%
    }%
    % now typeset
    {\begin{minipage}[t]{\blockwd}%
      \ALDCLO@inneralignment%
      \ALD@addgfx%
      \par\noindent%
      \ALDCLO@signaturefont\ignorespaces\contents%
    \end{minipage}}%
  % remember to add the outer signer padding. We use \hskip because
  % then it automatically disapear at the start of a line
  \hskip\ALDCLO@outersignerpadding%
  }%
  \endgroup%
  \ignorespaces% probably not needed
  % add a break point after the minipage
  \allowbreak%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Handler for special signatures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% this is a special version of the default handler
%
% Any manual breaks are ignored as each block is on a linie of its
% own.
% 
% \collectortype 1: primary, 2: secondary, we will completly ignore
% typo 0 (signer envs)
%
% #1 is a list item, execute it to get data, remember to execute
% within a group to hold data macros local
\newcommand\ALDCLO@specialsignaturehandler[1]{%
  % use a group to keep that list data containers local
  \begingroup%
  % get the data
  #1%
  \ifdefstring{\collectortype}{0}{% do nothing, ignoring signer
    \ClassWarning{aultrdesign}{Spcecial signature environments in
      use,\MessageBreak any signer environments will be ignored.\MessageBreak}
  }{%
    % the spacing on either side differ according to the type
    \ifdefstring{\collectortype}{1}{% primary
      \def\ALD@SS@left{\hspace{\stretch{1}}}%
      \def\ALD@SS@right{\hspace{\stretch{2}}}%
    }{% secondary
      \def\ALD@SS@left{\hspace{\stretch{4}}}%
      \def\ALD@SS@right{\hspace{\stretch{1}}}%
    }%
    \par\strut\ALD@SS@left%
    \begin{varwidth}[t]{\linewidth}%
      \ALDCLO@inneralignment%
      \ALD@addgfx%
      \par\noindent%
      \ALDCLO@signaturefont\ignorespaces\contents%
    \end{varwidth}%
    \strut\ALD@SS@right\strut%
  }%
  \endgroup%
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Grid mode
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% macros behind \newrow and \newrow* in grid-mode, where we need to
% keep track of the virtual blocks
\newcommand\ALDCLO@newrowgrid{%
  % we need fill adder to keep track of the number of virtual blocks
  % used, otherwise we cannot get \newrow* to work
  \ALDCLO@filladder{}%
  \listgadd\ALDCLO@signerlist{\unexpanded{\def\forcedrowbreak}{}}%
}
% utility macro to keep track of virtual blocks. Using the call back
% real blocks can also be added to the list.
\newcommand\ALDCLO@filladder[1]{
  % #1 is a callback executed in the body
  % get \numberofblocks mod \numcolumns
  \pgfmathparse{mod(\numberofblocks,\ALDCLO@numgridcolumns)}%
  % unless we are in the last column (mod = 0) we execute the body
  \unlessboolexpr{%
    test{ \ifdimequal{\pgfmathresult pt}{0pt} }%
  }{%
    #1% callback
    % step block number up
    \numgdef\numberofblocks{\numberofblocks+1}%
    % next mod calculation
    \pgfmathparse{mod(\numberofblocks,\ALDCLO@numgridcolumns)}%
  }%
}

\newcommand\ALDCLO@addblankcell[1][01]{
  \listxadd\ALDCLO@signerlist{%
    \unexpanded{\def\contents}{}%
    \unexpanded{\def\gfx}{}%
    \unexpanded{\def\gfxvadjust}{}%
    \unexpanded{\def\gfxwd}{}%
    \unexpanded{\def\gfxht}{}%
    \unexpanded{\def\gfxdp}{}%
  }%
  % need to keep track of the virtual blocks
  \ifx#1\relax\numgdef\numberofblocks{\numberofblocks+1}\fi%
}

% the filled row break, it adds empty blocks to the list
\newcommand\ALDCLO@newfilledrowgrid{%
  % we pack extra 'signers' until we have filled a line
  % we provide a callback to the loop function
  \ALDCLO@filladder{\ALDCLO@addblankcell}}



% The typesetting handler for grid-mode.  At the time it is executed
% \ALDCLO@gridcellwidth will be calculated to the appropriate cell
% width
\newcommand\ALDCLO@gridhandler[1]{%
  % #1 = list item, execute it to get data in containers
  \begingroup%
  % get the data
  #1%
  % if \forcedrowbreak exist, add a \par, 
  \ifdef\forcedrowbreak{\par}{%
    % otherwise typeset a block
    {\begin{minipage}[t]{\ALDCLO@gridcellwidth}%
      % set the alignment inside the signature box, it will be
      % \centering or \raggedright
      \ALDCLO@inneralignment%
      % a strut is added to control the space above the typeset
      % signature no matter if a scanned signature is added or not
      \ALD@addgfx%
      \par\noindent%
      \ALDCLO@signaturefont\ignorespaces\contents%
    \end{minipage}%
  }}%
  \endgroup%
  \ignorespaces%
  % add a break point after the minipage
  \allowbreak%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The Closing env
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newtoggle{specialsignatureinuse}

% the closing env has several jobs
\newenvironment{Closing}[2][]{
  % inside env we are inside a group, so no need to add more groups
  % execute the env options
  \setkeys{ALDCLO}{#1}
  % nullifying, we actualy do not need to define these outside the
  % Closing env
  \numdef\numberofsigners{0}%
  \numdef\numberofblocks{0}%
  \numdef\numberofgfx{0}%
  \dimdef\maxgfxh{0pt}%
  % #2 is not carried on for the end part of the env, store this for
  % later
  \def\ALDCLO@closingremark{#2}%
  % define the signer env, such that it is not defined outside the
  % Closing env
  \newenvironment{signer}[1][]{\setkeys{ALDsig}{##1}\def\collectortype{0}\Collect@Body\ALDCLO@collector}{}%
  \newenvironment{primarysignature}[1][]{\setkeys{ALDsig}{##1}%
    \global\toggletrue{specialsignatureinuse}\def\collectortype{1}\Collect@Body\ALDCLO@collector}{}%
  \newenvironment{secondarysignature}[1][]{\setkeys{ALDsig}{##1}%
    \global\toggletrue{specialsignatureinuse}\def\collectortype{2}\Collect@Body\ALDCLO@collector}{}%
  % setup some stuff depending on the mode we are using
  \newcommand\newrow{\@ifstar{\ALDCLO@newrowS}{\ALDCLO@newrowN}}%
  \let\addblankcell\relax%
  \iftoggle{grid}{%
    % grid mode, internal macros for \newrow
    \let\ALDCLO@newrowS\ALDCLO@newfilledrowgrid%
    \let\ALDCLO@newrowN\ALDCLO@newrowgrid%
    \def\addblankcell{\ALDCLO@addblankcell[00]}%
  }{% % default mode, , internal macros for \newrow
    \let\ALDCLO@newrowS\ALDCLO@newrowdefault%
    \let\ALDCLO@newrowN\ALDCLO@newrowdefault%
  }%
  % end of \begin{Closing}
}{%
  % Start of \end{Closing}
  % we know several things at this point:
  % \maxgfxh = max adjusted height of scanned signatures 
  % \numberofsigners = total number of signer envs
  % \numberofgfx     = number of signers with scanned sigs
%  \par%\vskip\baselineskip\noindent%
  \par\nobreak%\ALD@blank@above@sig%\vspace{\parskip}%
  \stopbreaks\noindent%
  \begin{minipage}[t]{\textwidth}%
    \noindent%
    \hspace*{\ALDCLO@closingindent}%
    \begin{varwidth}[t]{\linewidth-\ALDCLO@closingindent}%
      \ALDCLO@closingfont{\strut\ALDCLO@closingremark}%
    \end{varwidth}%
    \par%
    % add alignment
    \ALDCLO@outeralign%
    % adjust the signature drop, 
    % if no written signature, then a single blank line
    \iftoggle{nowrittensignature}{%
      \dimdef\signaturestrutheight{\baselineskip}%
    }{%
      % other wise, if only scanned signatures: \maxgfxh +allgfxvpad, 
      % else max(\maxgfxh+allgfxvpad, signaturedrop)
      \ifnumequal{\numberofsigners}{\numberofgfx}{%
        \dimdef\signaturestrutheight{\maxgfxh+\ALDCLO@allgfxvpad}%
      }{%
        \dimdef\maxgfxh{\maxgfxh+\ALDCLO@allgfxvpad}%
        \ifdimless{\maxgfxh}{\ALDCLO@signaturedrop}{%
          \dimdef\signaturestrutheight{\ALDCLO@signaturedrop}%
        }{%
          \dimdef\signaturestrutheight{\maxgfxh}%
        }%
      }% end if \numberofsigners = \numberofgfx
    }% end if nowrittensignature
    % use the appropriate handler, and set mode specific stuff
    \iftoggle{grid}{% grid-mode and no special signatures in use
      \iftoggle{autoadjustgrid}{%
        % adjust number of gridcols to a lower number:
        \ifnumless{\numberofsigners}{\ALDCLO@numgridcolumns}{%
          \numdef\ALDCLO@numgridcolumns{\numberofsigners}%
        }{%
          \ClassWarning{aultrdesign}{Number of signers
            (\numberofsigners) is not strictly less than the number of grid
            columns (\ALDCLO@numgridcolumns), 'autoadjustgrid'
            ignored.}
        }%
      }{}%
      % determine the cell width
      \dimdef\ALDCLO@gridcellwidth{\textwidth/\ALDCLO@numgridcolumns-1sp}%
      % specify the grid handler
      \let\listhandler\ALDCLO@gridhandler%
    }{% else: 
      % set pointer for default handler
      \let\listhandler\ALDCLO@defaulthandler%
    }%
    % if special signatures are in use, switch handler
    \iftoggle{specialsignatureinuse}{%
      \let\listhandler\ALDCLO@specialsignaturehandler%
    }{}%
    % if the user has provided a callback, use that regardless
    \ifdefvoid\ALDCLO@usercallback{}{\let\listhandler\ALDCLO@usercallback}%
    % don't do anything unless there actually is data
    \ifdefvoid\ALDCLO@signerlist{}{%
      \forlistloop\listhandler\ALDCLO@signerlist%
    }%
  \end{minipage}%
  \global\togglefalse{specialsignatureinuse}%
  % remember to nullify the signature list
  \gdef\ALDCLO@signerlist{}%
}

%#% /extract


%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% END OF SIGNATURES
%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%

\def\ALD@general@infoarea@data{}

\long\def\ALD@Collect@informationAreas#1{\long\gdef\ALD@general@infoarea@data{#1}} 
\newenvironment{InformationArea}{\Collect@Body\ALD@Collect@informationAreas}{}

\newif\ifALD@envactive


\newcommand\ALD@design@env@creator[6]{%
  % #1: env name
  % #2: opening macro
  % #3: colophon macro
  % #4: type string
  % #5: things to disable in the info area
  % #6: extra code for the start of the environment
  \newenvironment{#1}{%
    \newpage%
    \thispagestyle{firstpage}%
    \AddToShipoutPicture*{%
      \normalfont
      \setlength\@tempdima{\paperheight-45mm-1em+2pt}%
      \put(\LenToUnit{20mm},\LenToUnit{\@tempdima}){%
        \begin{lrbox}{\ALD@tmpbox}%
        \begin{minipage}[t]{\paperwidth-40mm-4cm}%
          \raggedright% 
%          \parskip=1em%
          #5%
          \ALD@general@infoarea@data%
        \end{minipage}%
      \end{lrbox}%
      \setlength\@tempdima{\ht\ALD@tmpbox+\dp\ALD@tmpbox}%
      \ifdim\@tempdima>50mm%
        \ClassError{alltrdesign}{Information area/Reviecer area is too
          high for the ^^Jletter design, please reduce the text}{}
      \else%
        \usebox{\ALD@tmpbox}%
      \fi%
    }%
      \setlength\@tempdima{\paperwidth-45mm}
      \setlength\@tempdimb{\paperheight-45mm-\heightof{B}}
      \put(\LenToUnit{\@tempdima},\LenToUnit{\@tempdimb}){%
        \textbf{\MakeUppercase{\csusekwx{#4}}}
      }%
    }
    \let\opening=#2%
    \let\ALD@colophon=#3%
    \ALD@initialize@counters%
    \interlinepenalty=200%
    \rule{0pt}{50mm-\parskip+\baselineskip-3.5pt}\par
    \vskip-\parskip%
    \vskip-\baselineskip%
    \setlength\@tempdima{\heightof{B}}%
    \vskip\@tempdima%
    \ALD@Mark@Start@Doc%
    #6%
  }{\global\ALD@envactivefalse\@@par\ALD@Mark@End@Doc\pagebreak\@@par}
}

\newcommand\ALD@general@opening[1]{%
  \savebox\ALD@footerboxA{\parbox{\linewidth}{\strut\textbf{#1}}}%
  \savebox\ALD@tmpbox{\parbox{\linewidth}{\textbf{Fg\\Fg}}}%
  \setlength\@tempdima{\ht\ALD@footerboxA+\dp\ALD@footerboxA}%
  \setlength\@tempdimb{\baselineskip+\topskip}%
  \ifdim\@tempdima>\@tempdimb\relax%
    \textbf{#1}\par%
    \ClassWarning{aultrdesign}{Long opening statement, ^^Jpushing the following text down}
  \else%
    \begingroup
    %\fboxsep=0pt
    {\begin{minipage}[t][13.7mm][t]{\linewidth}%
        \normalfont\strut\textbf{#1}%
    \end{minipage}}%
    \endgroup
  \par%
  \setlength\@tempdima{-1em+2pt}
  \vspace*{\@tempdima}%
  \fi%
}


\ALD@design@env@creator{agenda}      {\ALD@general@opening}{\ALD@agenda@colophon}{agendadesign}{}{}
\ALD@design@env@creator{minutes}     {\ALD@general@opening}{\ALD@minutes@colophon}{minutesdesign}{}{}
\ALD@design@env@creator{coveringnote}{\ALD@general@opening}{\ALD@coveringnote@colophon}{coveringnotedesign}{}{}
\ALD@design@env@creator{memo}        {\ALD@general@opening}{\ALD@memo@colophon}{memodesign}{}{}
\ALD@design@env@creator{fax}         {\ALD@general@opening}{\ALD@fax@colophon}{faxdesign}{}{}


\newcommand\ALD@make@infoarea@macro[4]{%
  % #1: base macro name
  % #2: base keyword name, if empty we use #1
  % #3: formatting of the macro contents
  % #4: seperator sequence between the keyword and the data
  \expandafter\newcommand\csname #1\endcsname[2][]{%
    \begingroup%
    \parskip=0pt%
    \ifblank{##1}{%
      \textbf{\csusekw{#1}}%
    }{%
      \textbf{##1#4}%
    }%
    #3{##2}%
    \par%
    \endgroup%
  }%
}

\newcommand\ALD@make@infoarea@env[2]{%
  % #1: base macro name
  % #2: base keyword name, if empty we use #1
  % #3: formatting of the macro contents
  % #4: seperator sequence between the keyword and the data
  \newenvironment{#1}{%
    \ifALD@envactive\else%
    \global\ALD@envactivetrue%
    \par\vskip1em%
    \fi%
    \textbf{\csusekw{#2}}%
  }{\par}
}


\ALD@make@infoarea@macro{meetingdate}       {}{\textbf}{:~}
\ALD@make@infoarea@macro{meetingplace}      {}{\textbf}{:~}
\ALD@make@infoarea@macro{meetingtopic}      {}{\textbf}{:~}
\ALD@make@infoarea@macro{numberofpagesinfax}{}{}{:~}
\ALD@make@infoarea@macro{receiverfaxnumber} {}{}{:~}
\ALD@make@infoarea@macro{faxreceiver}       {}{}{:~}
\ALD@make@infoarea@macro{memoreceiver}      {}{}{:~}
 
\ALD@make@infoarea@env{participants}{meetingattendees}
\ALD@make@infoarea@env{present}     {presentatmeeting}
\ALD@make@infoarea@env{absent}      {absentfrommeeting}


\newenvironment{coveringnotelist}[1][3]{%
  % #1: number of columns
  \par\vskip16pt%
  \begin{multicols}{#1}%
    \raggedcolumns
    \begin{list}{\ensuremath{\square}}{%
        \renewcommand\makelabel[1]{%
          \phantomsection%
          \ifstrequal{##1}{x}{%
            {\normalsize\ensuremath{\boxtimes}}%
          }{%
            {\normalsize ##1}%
          }%
        }%
        \setlength\labelwidth{0.8em}%
        \setlength\leftmargin{\labelwidth+\labelsep}%
      }%
      \small\raggedright
    }{%
    \end{list}%
    \vfill
  \end{multicols}%
}

\setcounter{secnumdepth}{2}

\newcounter {section}
\newcounter {subsection}[section]

\renewcommand \thesection {\arabic{section}.}
\renewcommand\thesubsection   {\arabic{section}\alph{subsection}.}




% In the word design there is no space below headings. This is a bit
% hard to do in LaTeX since we here have a non-zero \parskip. Thus we
% patch \@xsect such that we add \vskip-\parskip
\ifpatchable{\@xsect}{\vskip\@tempskipa}{
  \patchcmd\@xsect{\vskip\@tempskipa}{\vskip-\parskip\vskip\@tempskipa}{}{}
}{
  \ClassWarning{aultrdesign}{Unable to patch \string\@xsect, ignoring}
}



\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-0.0001em \@plus -1ex \@minus -.2ex}%
                                   {0.0001em \@plus.2ex}%
                                   {\normalfont\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-0.0001em\@plus -1ex \@minus -.2ex}%
                                     {0.0001em \@plus .2ex}%
                                     {\normalfont\bfseries\itshape}}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{1}
\newcommand\disablesectionnumbers{\setcounter{secnumdepth}{0}}
\newcommand\tableofcontents{%
  \begingroup
  \raggedright
  \@starttoc{toc}%
  \par
  \endgroup
  \bigskip
    }

\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
%    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \renewcommand\numberline[1]{##1\quad}
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \phantomsection{}%
      #1\nobreak\hfil \nobreak%\hb@xt@\@pnumwidth{\hss #2}
      \par\vskip-\parskip
    \endgroup
  \fi}
\newcommand*\l@subsection[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
%    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \renewcommand\numberline[1]{##1\quad}
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode %\bfseries
%      \advance\leftskip\@tempdima
%      \hskip -\leftskip
      \leftskip=2em
      \phantomsection{}%
      #1\nobreak\hfil \nobreak%\hb@xt@\@pnumwidth{\hss #2}
      \par\vskip-\parskip
    \endgroup
  \fi}

% stolen from article.cls as some might want to have a bibliography
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{\refname}%
%      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

\providecommand\phantomsection{}
\providecommand\ALD@black@links{}

\ifALD@hyperref
\AtBeginDocument{
  \RequirePackage[colorlinks,
  breaklinks,
  plainpages=false,
  pdfpagelabels,
  bookmarks=false,
  hypertexnames=false
  ]{hyperref}
  \ifpdf\else\RequirePackage{breakurl}\fi
  \hypersetup{
    linkcolor=aultrdesignlogocolor,
    citecolor=aultrdesignlogocolor,
    filecolor=aultrdesignlogocolor,
    urlcolor=aultrdesignlogocolor,
  }
  \renewcommand\ALD@black@links{%
    \hypersetup{
      linkcolor=black,
      citecolor=black,
      filecolor=black,
      urlcolor=black,
    }
  }
}
\fi

% we need a ragged bottom
\raggedbottom
\normalsize\normalfont
