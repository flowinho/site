---
title: Pandoc 
subtitle: Format-agnostisch Dokumente schreiben und im Wunschformat ausgeben. Ein kleines "Träumle" meinerseits wird durch pandoc wahr.
toc: true
---

# Markdown zu Latex

Pandoc ist sehr mächtig, und der `pandoc`-Befehl kann sehr lang werden. Es ist daher *best-practice* diesen Befehl in einem eigens dafür angelegten Shellscript abzulegen.

```bash
 pandoc "$1" \
  	-H ~/pandoc/chapter_break.tex \
  	-H ~/pandoc/bullet_styling.tex \
  	-H ~/pandoc/language.tex \
  	-H ~/pandoc/fancyheaders.tex \
  	-H ~/pandoc/inline_codehighlight.tex \
  	-H ~/pandoc/blockquote.tex \
 	-H ~/pandoc/tables.tex \
 	-V linkcolor:blue \
 	-V geometry:a4paper \
 	-V documentclass:report \
 	-V classoption:twoside \
 	-V geometry:margin=2cm \
 	-V toc-title:"Inhaltsverzeichnis" \
	--highlight-style ~/pandoc/pygments.theme \
 	--toc \
 	--pdf-engine=xelatex \
 	-o "$2"
```

# Das LaTeX-Shellscript im Detail

Auszug aus der `man page` von pandoc: 

```bash
-H FILE, --include-in-header=FILE|URL
Include  contents  of  FILE,  verbatim,  at the end of the header.  This can be used, for example, to include special CSS or JavaScript in HTML documents.  This option can be used repeatedly to include multiple files in the header.  They will be included in the order specified.  Implies --standalone.
```

Mit dem Switch `-H` werden im Header der zu erzeugenden LaTeX-Datei die Inhalte der angehängten LaTeX Datei hinzugefügt.

## chapter_break.tex

```latex
\usepackage{sectsty}
\sectionfont{\clearpage}
```

## bullet_styling.tex

```latex
\usepackage{enumitem}
\usepackage{amsfonts}
\setlist[itemize,1]{label=$\bullet$}
\setlist[itemize,2]{label=$\circ$}
\setlist[itemize,3]{label=$\star$}
\usepackage{enumitem}
\usepackage{amsfonts}
\setlist[itemize,1]{label=$\bullet$}
\setlist[itemize,2]{label=$\circ$}
\setlist[itemize,3]{label=$\star$}
```

## language.tex

```latex
\usepackage[english]{babel}
```

## fancyheaders.tex

```latex
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[CO,CE]{}
\fancyfoot[CO,CE]{}
\renewcommand{\footrulewidth}{0.4pt}
\fancyfoot[LE,RO]{\thepage}
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyfoot[LE,RO]{\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0.4pt}
}
```

## inline_codehighlight.tex

```latex
\definecolor{bgcolor}{HTML}{F2F2F2}
\let\oldtexttt\texttt
\renewcommand{\texttt}[1]{
    \colorbox{bgcolor}{\oldtexttt{#1}}
}
```
