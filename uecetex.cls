
% !TeX root = documento.tex
% !TeX spellcheck = pt_BR

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{uecetex}[2.0]

% Repassa demais opcoes para o abntex

\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax
\LoadClass[        
	a4paper,          % Tamanho da folha A4
	12pt,             % Tamanho da fonte 12pt
	chapter=TITLE,    % Todos os capitulos devem ter caixa alta
	section=TITLE,    % Todas as secoes devem ter caixa alta
	oneside,          % Usada para impressao em apenas uma face do papel
	english,          % Hifenizacoes em ingles
	spanish,          % Hifenizacoes em espanhol
	brazil            % Ultimo idioma eh o idioma padrao do documento
]{abntex2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%             Constantes              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ilustracaoname}{Ilustra\c{c}\~ao}
\newcommand{\desenhoname}{Desenho}
\newcommand{\esquemaname}{Esquema}
\newcommand{\fluxogramaname}{Fluxograma}
\newcommand{\fotografianame}{Fotografia}
\newcommand{\graficoname}{Gr\'afico}
\newcommand{\mapaname}{Mapa}
\newcommand{\organogramaname}{Organograma}
\newcommand{\plantaname}{Planta}
\newcommand{\retratoname}{Retrato}
\newcommand{\figuraname}{Figura}
\newcommand{\imagemname}{Imagem}
\newcommand{\fotoname}{Foto}
\newcommand{\quadroname}{Quadro}

\newcommand{\ilustracaolistname}{Lista de Ilustra\c{c}\~oes}
\newcommand{\desenholistname}{Lista de Desenhos}
\newcommand{\esquemalistname}{Lista de Esquemas}
\newcommand{\fluxogramalistname}{Lista de Fluxogramas}
\newcommand{\fotografialistname}{Lista de Fotografias}
\newcommand{\graficolistname}{Lista de Gr\'aficos}
\newcommand{\mapalistname}{Lista de Mapas}
\newcommand{\organogramalistname}{Lista de Organogramas}
\newcommand{\plantalistname}{Lista de Plantas}
\newcommand{\retratolistname}{Lista de Retratos}
\newcommand{\figuralistname}{Lista de Figuras}
\newcommand{\imagemlistname}{Lista de Imagens}
\newcommand{\fotolistname}{Lista de Fotos}
\newcommand{\quadrolistname}{Lista de Quadros}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Pacotes Obrigatórios         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{mathptmx} % Define Times New Roman como fonte padrão do documento
\RequirePackage{mwe}      % Prover varias imagens como exemplo
\RequirePackage{caption}  % Altera os captions de figuras, gráficos, tabelas, etc.

% Define o espaço entre linhas para 1.5 cm
%\OnehalfSpacing	Bug no ABNTEX2?
\renewcommand{\baselinestretch}{1.5}

% Define as margens do documento
\setlrmarginsandblock{3cm}{2cm}{*} % externa / interna
\setulmarginsandblock{3cm}{2cm}{*} % superior / inferior
\checkandfixthelayout

% Define a distância da margem esquerda do parágrafo
\setlength{\parindent}{2cm}


% Distance between floats on the top or the bottom and the text;
\setlength{\textfloatsep}{18pt plus 2pt minus 2pt}

% Distance between floats inserted inside the page text (using h) and the text proper.
\setlength{\intextsep}{18pt plus 2pt minus 2pt}

\hypersetup{%
	pdfborder = {0 0 0}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Espacamentos dos titulos     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Chapter ou Capítulo (Capítulo 1)
\setlength{\beforechapskip}{\onelineskip} %com 0 nao funcionou
\setlength{\afterchapskip}{\onelineskip} % antes do titulo de capitulo
% Section ou Seção Secundária (Seção 1.1)
\setbeforesecskip{\onelineskip}
\setaftersecskip{\onelineskip}
% Subsection ou Seção Terciária (Seção 1.1.1)
\setbeforesubsecskip{\onelineskip}
\setaftersubsecskip{\onelineskip}
% Subsubsection ou Seção Quaternária (Seção 1.1.1.1)
\setbeforesubsubsecskip{\onelineskip}
\setaftersubsubsecskip{\onelineskip}
% Subsubsubsection ou Seção Quinária (Seção 1.1.1.1.1)
\setbeforeparaskip{\onelineskip}
\setafterparaskip{\onelineskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Estilos dos titulos          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Chapter ou Capítulo (Capítulo 1)
\renewcommand{\ABNTEXchapterfont}{\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize}
% Section ou Seção Secundária (Seção 1.1)
\renewcommand{\ABNTEXsectionfont}{\normalfont}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}
% Subsection ou Seção Terciária (Seção 1.1.1)
\renewcommand{\ABNTEXsubsectionfont}{\bfseries}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}
% Subsubsection ou Seção Quaternária (Seção 1.1.1.1)
\renewcommand{\ABNTEXsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}
% Subsubsubsection ou Seção Quinária (Seção 1.1.1.1.1)
\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont\itshape}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Alínea e Subalíneas          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlist[alineas,1]{label={\alph*)},topsep=0pt,itemsep=0pt,leftmargin=0.5cm+2cm}%
\setlist[subalineas,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=0.45cm}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%               Equações              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Espaço debaixo da equação
\AtBeginDocument{\addtolength\belowdisplayshortskip{\onelineskip}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%       Captions (ou Legendas)        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\captionsetup{
	justification=centering,% Centraliza o caption
	belowskip=0.3cm,
	%belowskip=\onelineskip,
	labelfont=bf, % A palavra 'Figure 1' agora eh negrito
	font=bf	% O texto depois de 'Figure 1' agora eh negrito
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                 Fontes              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define o comando \fonte que respeita as configurações de caption do memoir ou do caption
\makeatletter
\renewcommand{\fonte}[2][\fontename]{%
	\M@gettitle{#2}%
	\memlegendinfo{#2}%
	\par
	\begingroup
	\@parboxrestore
	\if@minipage
		\@setminipage
	\fi
	\ABNTEXfontereduzida
	\vspace{0.1cm}
	\captiondelim{\ABNTEXcaptionfontedelim}
	\ABNTEXfontereduzida #1\ABNTEXcaptionfontedelim \ignorespaces\ABNTEXfontereduzida #2\par
	\endgroup}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%       	    Ilustrações            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% São consideradas figuras: desenho, esquema, fluxograma, fotografia, 
% gráfico, mapa, organograma, planta, quadro, retrato, figura, 
% imagem, entre outros;

% Para isso, foi criado um camando genérico para criar 
% as mais variadas ilustrações

\newcommand{\addnovailustracao}[3]{
	
	\newfloat[chapter]{#1}{lo#1}{#2}
	\newlistof{listof#1s}{lo#1}{#3}
	\newlistentry{#1}{lo#1}{0}
	
	% configurações para atender às regras da ABNT
	\counterwithout{#1}{chapter}
	\expandafter\renewcommand\csname cft#1name\endcsname{#2\space}
	\expandafter\renewcommand\csname cft#1aftersnum\endcsname{\hfill--\hfill}
	% agora a lista eh negrito
	\expandafter\renewcommand\csname cft#1font\endcsname{\bfseries}	
}

% Adiciona as possíveis ilustrações do template

\addnovailustracao{ilustracao}{\ilustracaoname}{\ilustracaolistname}
\addnovailustracao{desenho}{\desenhoname}{\desenholistname}
\addnovailustracao{esquema}{\esquemaname}{\esquemalistname}
\addnovailustracao{fluxograma}{\fluxogramaname}{\fluxogramalistname}
\addnovailustracao{fotografia}{\fotografianame}{\fotografialistname}
\addnovailustracao{grafico}{\graficoname}{\graficolistname}
\addnovailustracao{mapa}{\mapaname}{\mapalistname}
\addnovailustracao{organograma}{\organogramaname}{\organogramalistname}
\addnovailustracao{planta}{\plantaname}{\plantalistname}
\addnovailustracao{retrato}{\retratoname}{\retratolistname}
\addnovailustracao{figura}{\figuraname}{\figuralistname}
\addnovailustracao{imagem}{\imagemname}{\imagemlistname}
\addnovailustracao{foto}{\fotoname}{\fotolistname}
\addnovailustracao{quadro}{\quadroname}{\quadrolistname}

\newcommand{\imprimirlistadedesenhos}{\listofdesenhos* \pagebreak}
\newcommand{\imprimirlistadeesquemas}{\listofesquemas* \pagebreak}
\newcommand{\imprimirlistadefluxogramas}{\listoffluxogramas* \pagebreak}
\newcommand{\imprimirlistadefotografias}{\listoffotografias* \pagebreak}
\newcommand{\imprimirlistadegraficos}{\listofgraficos* \pagebreak}
\newcommand{\imprimirlistademapas}{\listofmapas* \pagebreak}
\newcommand{\imprimirlistadeorganogramas}{\listoforganogramas* \pagebreak}
\newcommand{\imprimirlistadeplantas}{\listofplantas* \pagebreak}
\newcommand{\imprimirlistaderetratos}{\listofretratos* \pagebreak}
\newcommand{\imprimirlistadefiguras}{\listoffiguras* \pagebreak}
\newcommand{\imprimirlistadeimagens}{\listofimagems* \pagebreak}
\newcommand{\imprimirlistadefotos}{\listoffotos* \pagebreak}
\newcommand{\imprimirlistadequadros}{\listofquadros* \pagebreak}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%       	      Tabelas              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A lista de tabela não deve aparecer no sumário
\newcommand{\imprimirlistadetabelas}{ %
	\begin{KeepFromToc} %
		\listoftables \pagebreak%
	\end{KeepFromToc} %
}

% Os items da lista de tabela e quadro agora sao negritos
\renewcommand{\cfttablefont}{\bfseries}