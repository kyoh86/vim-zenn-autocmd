 vim-zenn-autocmd

zennのディレクトリに出入りした際にautocmdを実行します。

## Usage

```vim
call zenn_autocmd#enable()
augroup my-zenn
  autocmd!
  autocmd User ZennEnter echo 'this is a zenn dir!'
  autocmd User ZennLeave echo 'this is not a zenn dir!'
augroup end
```

# LICENSE

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg)](http://www.opensource.org/licenses/MIT)

This software is released under the [MIT License](http://www.opensource.org/licenses/MIT), see LICENSE.
