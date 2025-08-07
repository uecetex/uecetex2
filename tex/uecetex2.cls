\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{uecetex2}[<CURRENT_DATE> <VERSION> ueceTeX2]

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

% For UTF-8 support
\RequirePackage[utf8]{inputenc}
% For proper font encoding (e.g., accents)
\RequirePackage[T1]{fontenc}

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
\newcommand{\anotacaoname}{Anota\c{c}\~{a}o}

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