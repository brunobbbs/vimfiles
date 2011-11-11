# Vim Files

Aqui armazeno todas as configurações de plugins, snippets e esquema de cores para o Vim:

#### Plugins e Snippets
1. Lusty: https://github.com/sjbach/lusty
3. NERD_Tree: https://github.com/vim-scripts/The-NERD-tree
4. Fontzoom: https://github.com/vim-scripts/fontzoom.vim
5. Fugitive: https://github.com/tpope/vim-fugitive
6. JSON Highlight: https://github.com/vim-scripts/JSON.vim
7. Matchit: https://github.com/vim-scripts/matchit.zip
8. Vim Notes: https://github.com/vim-scripts/notes.vim
9. Pyflakes: https://github.com/kevinw/pyflakes-vim
10. Rest Hightlight (reEstructureText): https://github.com/vim-scripts/rest.vim
11. Session Man: https://github.com/vim-scripts/sessionman.vim
12. Snipmate: https://github.com/msanders/snipmate.vim
13. Snipmate for Django: https://github.com/gilsondev/snipmate_for_django
14. Surround: https://github.com/tpope/vim-surround
15. Vim Git: https://github.com/tpope/vim-git
16. Vim Mercurial: https://github.com/DasIch/vim-mercurial.git
17. Markdown Hightlight: https://github.com/plasticboy/vim-markdown
18. Vim PEP8: https://github.com/jbking/vim-pep8
19. Sparkup: https://github.com/kogakure/vim-sparkup
20. TComment: https://github.com/tomtom/tcomment_vim
21. Vim LaTeX: https://github.com/jcf/vim-latex
22. Vim Virtualenv: https://github.com/jmcantrell/vim-virtualenv

#### Esquema de Cores
1. Github Theme: https://github.com/nono/github_vim_theme
2. Railscasts Theme: https://github.com/jpo/vim-railscasts-theme
3. Underwater: https://github.com/vim-scripts/underwater-mod (recomendado)
4. Solarized: https://github.com/altercation/vim-colors-solarized (recomendado)


## Instalação Automática

Basta somente dar permissão de execução no arquivo ``setup.py`` e rodá-lo:

```bash
$ chmod +x setup.sh
$ ./setup.py
```

## Instalação em Modo Manual

1. Faça o checkout do projeto:

```bash
$ git clone git@github.com:gilsondev/vimfiles.git ~/.vim
```

2. Crie um link simbólico para o arquivo de configuração ``.vimrc``:

```bash
$ ln ~/.vim/.vimrc ~/
```

3. Faça o checkout dos submódulos instalados:

```bash
$ git submodule init
$ git submodule update --init --recursive
```

4. Para usar o plugin pep8.vim terá que seguir as seguintes instruções [aqui](http://www.vim.org/scripts/script.php?script_id=2914)

5. Com o plugin pyflakes também as instruções estão [aqui](https://github.com/kevinw/pyflakes-vim#readme)

E está instalado as suas configurações.

## Como contribuir

1. Fazendo o fork do projeto.
2. Colocando suas sugestões e dicas [aqui](https://github.com/gilsondev/vimfiles/issues).
