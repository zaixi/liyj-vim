[TOC]

liyj-vim
=======================


> VERSION: 1.0

> LAST_UPDATE_TIME: 2017-08-01

> 本次更新: 小版本更新, ubuntu14 16支持ycm快速安装


---------------------------------
---------------------------------

## 自动安装
**自动安装目前只支持ubuntu14和ubuntu16版本**
### 1. clone 到本地

```
git clone https://github.com/zaixi/liyj-vim
```

### 2. 安装
```
cd liyj-vim
./install.sh  /* 安装依赖和8.0版本VIM以及VIM插件 */
```
然后等待自动安装完成，安装完成后退出vim
安装vim-airline字体  
* 选择字体
终端单击右键，配置文件，配置文件首选项，自定义字体打勾，选择字体   
推荐   
droid sans mono for powerline regular  
Cousine Powerline  
Inconsolata-dz   
```
./install.sh /* 编译YouCompleteMe自动补全插件 */
```

## 手动安装步骤

### 1. 安装依赖包
```
# ubuntu
sudo apt-get install build-essential xz-utils cmake python-dev  #编译YCM自动补全插件依赖
sudo apt-get install silversearcher-ag                          #grep替代品,比grep更快
sudo apt-get install global                                     #ctags替代品，比ctags更好用
sudo apt-get install aptitude libncurses5-dev ruby-dev lua5.1 lua5.1-dev libperl-dev #编译VIM依赖库
```

### 2. 源代码安装VIM8
```
sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox #卸载原有的VIM
git clone --depth=1 http://github.com/vim/vim
cd vim
./configure --with-features=huge --enable-multibyte --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-rubyinterp --enable-luainterp --enable-perlinterp --enable-cscope
make -j4
sudo make install
```

### 3. 安装vim-airline字体  
```
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
```
* 选择字体
终端单击右键，配置文件，配置文件首选项，自定义字体打勾，选择字体   
推荐   
droid sans mono for powerline regular  
Cousine Powerline  
Inconsolata-dz   

### 4. clone liyj-vim到本地

```
git clone https://github.com/zaixi/liyj-vim
cd liyj-vim
mv $HOME/.vim $HOME/.vimback
mv $HOME/.vimrc $HOME/.vimrcback
rm -rf $HOME/.vimrc
rm -rf $HOME/.vim
cp .vim $HOME/ -a
cp .vimrc $HOME/.vimrc
```

### 5. 安装VIM插件
```
vim
```

### 6. 编译YouCompleteMe自动补全插件
```
cd $HOME/.vim/plug/repos/github.com/Valloric/YouCompleteMe
```
64位系统
```
./install.py --clang-completer
# 64位系统如果编译安装后无法正常运行可以使用32系统的安装方法
```
32位系统
```
sudo apt-get remove clang-3.3 clang-3.4 clang-3.5 clang-3.6 clang-3.8
sudo apt-get install clang-3.9
./install.py --clang-completer --system-libclang
```

## 使用说明
Gstatus 相当于git status  
Gdiff 相当于git diff，  
<leader>lt 相当于taglist  
<leader><space> 去除行尾空格  
<leader>s  查找光标下单词的引用  
<leader>d  查找光标下单词出现的地方  
<leader>cc 注释选中区域或当前行  
<leader>cu 取消注释选中区域或当前行  
<leader>fl 显示文件列表  
<leader>sp 搜索光标下单词  
<leader>a  对齐选中区域(可根据空格，等号，引号等对齐)，vim-easy-align的功能  
eg:<leader>a=  根据"="对齐选中区域  
eg:<leader>a,  根据","对齐选中区域  
ctrl+p 进入文件搜索模式，输入文件名可搜索文件(默认当前目录), 输入..可以把搜索目录向上移动
ctrl+n 选中当前单词，再按ctrl+n选中下一个同样的单词，选完后按c批量修改  

s + {任意字符}  快速移动到指定位置,vim-easymotion的功能  
例子：已有一行数据为  
sudo apt-get install silversearcher-ag global  
光标在行首，输入sia光标跳到indtall的i处  
<leader>ud 撤销分支树，可以回到之前修改或撤销的状态  
<leader>cf 生成Doxygen风格注释  

F4 进入粘贴模式，从其他地方粘贴过来的代码格式不会变化  
F5 在当前目录下异步执行make  
F11 全屏切换  
F12 对齐当前文件  


## FAQ
### 编译YouCompleteMe自动补全插件报错
查看报错提示，可能是g++不支持C++11，需要重新安装
安装g++ 4.9  
`sudo add-apt-repository ppa:ubuntu-toolchain-r/test` 
`sudo apt-get update`  
`sudo apt-get install gcc-4.9`  
`sudo apt-get install g++-4.9`  
`sudo cd /usr/bin`  
`sudo ln -s /usr/bin/g++-4.9 /usr/bin/g++ -f`  
`sudo ln -s /usr/bin/gcc-4.9 /usr/bin/gcc -f`  
  
 ### 下载VIM插件很慢，或者YouCompleteMe下载失败，总是提示重新安装
 插件来源于github，和网速有很大关系，可以采用其他下载方式，再手动放到相应目录
