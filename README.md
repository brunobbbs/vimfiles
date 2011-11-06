# Vim Files

Aqui armazeno todas as configurações do meu Vim de cada dia.

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
$ git submodule update
```

4. Para usar o plugin pep8.vim terá que seguir as seguintes instruções [aqui](http://www.vim.org/scripts/script.php?script_id=2914)

5. Com o plugin pyflakes também as instruções estão [aqui](https://github.com/kevinw/pyflakes-vim#readme)

E está instalado as suas configurações.

## Como contribuir

1. Fazendo o fork do projeto.
2. Colocando suas sugestões e dicas [aqui](https://github.com/gilsondev/vimfiles/issues).
