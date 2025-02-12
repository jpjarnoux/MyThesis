\definecolor{Prune}{RGB}{99,0,60} % l14-33 : couleurs de la charte graphique upsaclay
\definecolor{B1}{RGB}{49,62,72} 
\definecolor{C1}{RGB}{124,135,143}
\definecolor{D1}{RGB}{213,218,223}
\definecolor{A2}{RGB}{198,11,70}
\definecolor{B2}{RGB}{237,20,91}
\definecolor{C2}{RGB}{238,52,35}
\definecolor{D2}{RGB}{243,115,32}
\definecolor{A3}{RGB}{124,42,144}
\definecolor{B3}{RGB}{125,106,175}
\definecolor{C3}{RGB}{198,103,29}
\definecolor{D3}{RGB}{254,188,24}
\definecolor{A4}{RGB}{0,78,125}
\definecolor{B4}{RGB}{14,135,201}
\definecolor{C4}{RGB}{0,148,181}
\definecolor{D4}{RGB}{70,195,210}
\definecolor{A5}{RGB}{0,128,122}
\definecolor{B5}{RGB}{64,183,105}
\definecolor{C5}{RGB}{140,198,62}
\definecolor{D5}{RGB}{213,223,61}

\renewcommand{\FrenchLabelItem}{\textbullet}

\pagestyle{plain} % pour ne garder que les n°de page en milieu-bas et supprimer les indications de chapitre en marge haute

\titleformat{\part}[block]
  {\centering\bfseries\huge\color{Prune}}
  {\MakeUppercase{Chapitre \thepart}}
  {1em}
  {\MakeUppercase}
  [\vspace{1ex}]
  
\titlespacing*{\part}
  {0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\renewcommand{\partautorefname}{chapitre} % Personnalise l'étiquette pour les parties

\titleformat{\chapter}[hang]{\bfseries\Large\color{Prune}}{\thechapter\ -}{.1ex}
{\vspace{0.1ex}
}
[\vspace{1ex}]
\titlespacing{\chapter}{0pc}{0ex}{0.5pc}

\makeatletter
\@addtoreset{chapter}{part} % Réinitialise le compteur de chapitres à chaque nouvelle part
\renewcommand\thechapter{\arabic{chapter}} % Supprime la numérotation de la part devant les chapitres
\makeatother

\renewcommand{\chapterautorefname}{partie} % Personnalise l'étiquette pour les chapitres

\makeatletter
% Ajoute le numéro de la part dans les références automatiques
\patchcmd{\autoref}
  {\thechapter} % Rechercher l'utilisation directe de \thechapter
  {\thepart.\thechapter} % Inclure le numéro de la part avant le chapitre
  {}{}
\makeatother

\titleformat{\section}[hang]{\bfseries\normalsize}{\thesection\ .}{0.5pt}
{\vspace{0.1ex}
}
[\vspace{0.1ex}]
\titlespacing{\section}{1.5pc}{4ex plus .1ex minus .2ex}{.8pc}

\renewcommand{\sectionautorefname}{partie} % Personnalise l'étiquette pour les chapitres

\makeatletter
% Ajoute le numéro de la part dans les références automatiques
\patchcmd{\autoref}
  {\thesection} % Rechercher l'utilisation directe de \thechapter
  {\thechapter.\thesection} % Inclure le numéro de la part avant le chapitre
  {}{}
\makeatother

\titleformat{\subsection}[hang]{\bfseries\small}{\thesubsection\ .}{1pt}
{\vspace{0.1ex}
}
[\vspace{0.1ex}]
\titlespacing{\subsection}{3pc}{2ex plus .1ex minus .2ex}{.1pc}

% Format de la subsubsection (subsection.1)
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}  % Subsection.1

\renewcommand{\subsectionautorefname}{sous-partie} % Personnalise l'étiquette pour les chapitres

\makeatletter
% Ajoute le numéro de la part dans les références automatiques
\patchcmd{\autoref}
  {\thesubsection} % Rechercher l'utilisation directe de \thechapter
  {\thesection.\thesubsection} % Inclure le numéro de la part avant le chapitre
  {}{}
\makeatother

\titleformat{\subsubsection}[hang]{\bfseries\small}{\thesubsubsection\ .}{1pt}
{\vspace{0.1ex}
}
[\vspace{0.1ex}]
\titlespacing{\subsubsection}{3pc}{2ex plus .1ex minus .2ex}{.1pc}

% Format des paragraphes (a.)
\renewcommand{\theparagraph}{\footnotesize \alph{paragraph}.}  % Paragraphes numérotés avec des lettres
\setcounter{secnumdepth}{4} % Inclure la numérotation des paragraphes
\titleformat{\paragraph}[hang]{\bfseries\small}{\theparagraph}{1pt}
{\vspace{0.1ex}
}
[\vspace{0.1ex}]
\titlespacing{\paragraph}{4pc}{1.5ex plus .1ex minus .2ex}{.1pc}

\newcommand{\nameBib}{Bibliographie}

\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000
\raggedbottom


% Commande personnalisée pour images pleine page
\newcommand{\fullpageimage}[4]{
    \afterpage{%
        \clearpage
        \ifodd\value{page} % Vérifie si la page est impaire
            \hbox{} % Ajoute une page vide pour forcer à gauche
            \clearpage
        \fi
        \begin{figure}[htbp]
            \centering
            \includegraphics[width=\textwidth,height=\textheight,keepaspectratio]{#1}
            \caption[#3]{#2} % Légende courte (#3) et complète (#2)
        \label{#4}
        \end{figure}
        \clearpage
    }
}