call plug#begin('~/.config/nvim/autoload/plugged')

  Plug 'scrooloose/nerdtree' " 文件树
  Plug 'tpope/vim-surround' " 编辑包裹的符号
  Plug 'vim-scripts/ReplaceWithRegister' " 替换
  Plug 'jiangmiao/auto-pairs' " 括号自动补全
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf'
  Plug 'tpope/vim-commentary' " gc 注释代码

call plug#end()
