# liyj-vim
直达目录  
sudo apt install autojump  
  
安装Exuberant-ctags  sudo apt-get install Exuberant-ctags   
  
ycm编译  
sudo apt-get install build-essential cmake   
sudo apt-get install python-dev python3-dev  
install.sh --clang-completer   
cd ~  
mkdir ycm_build  
cd ycm_build  
cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp  
cmake --build . --target ycm_core --config Release  

sudo apt-get install vim-addon-manager  #这应该是一个vim的插件管理器  
sudo apt-get install vim-youcompleteme  #安装YCM  
vim-addons install youcompleteme    #将YCM加入addons管理器中  

## vim-airline 安装字体  
* clone  
`git clone https://github.com/powerline/fonts.git`  
* install  
`cd fonts`  
`./install.sh`  
* clean-up a bit  
`cd ..`  
`rm -rf fonts`  
* 选择字体
终端右键，配置文件，配置文件首选项，自定义字体打勾，选择字体   
推荐   
droid sans mono for powerline regular  
Cousine Powerline  
Inconsolata-dz   
## 安装ag和gtags  
''' 
`apt-get install silversearcher-ag global`
'''  
安装vim依赖  
`sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git`
在Ubuntu 16.04中，将lua5.1-dev换成liblua5.1-dev

* 删除vim，如果你已经有了。  
`sudo apt-get remove vim vim-runtime gvim`  
* 在Ubuntu 12.04.2上，您可能还需要删除这些软件包：  
`sudo apt-get remove vim-tiny vim-common vim-gui-common vim-nox`  
   
`./configure --with-features=huge --enable-multibyte --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-python3interp --with-python3-config-dir=/usr/lib/python3.5/config --enable-rubyinterp --enable-luainterp --enable-perlinterp --enable-gui=gtk2 --enable-cscope --prefix=/usr --with-vim-name=vi --with-compiledby="liyj"`    

```
./configure --with-features=huge --enable-multibyte --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-rubyinterp --enable-luainterp --enable-perlinterp --enable-cscope --prefix=/usr --with-compiledby="liyj"
```
  
make -j4 && make install  
 
安装g++ 4.9  
`sudo add-apt-repository ppa:ubuntu-toolchain-r/test` 
`sudo apt-get update`  
`sudo apt-get install gcc-4.9`  
`sudo apt-get install g++-4.9`  
`sudo cd /usr/bin`  
`sudo ln -s /usr/bin/g++-4.9 /usr/bin/g++ -f`  
`sudo ln -s /usr/bin/gcc-4.9 /usr/bin/gcc -f`  
  
四川中医药高等专科学校：设有中医系、临床医学系、护理系、药学与检验系、针推保健系及基础部6个系  
四川卫生康复职业学院，开设护理、康复治疗技术、医学影像技术、药学、医学检验技术、助产6个专业  
达州职业技术学院，拥有临床医学系，护理系、医学影像检验系等  
	
成都中医药大学  
川北医学院  
四川中医药高等专...  
达州职业技术学院  
  
yun     29.204.231.0  
guoxin  29.250.15.44  
sudo zerotier-cli join 8056c2e21c000001  
sudo zerotier-cli leave 8056c2e21c000001  

au 命令 
http://blog.rongpmcu.com/tag/linuxqu-dong/  
https://github.com/torvalds/linux/blob/v4.4/Documentation/gpio/driver.txt  
http://blog.csdn.net/dlijun/article/details/51547897  
http://www.wowotech.net/gpio_subsystem/pin-controller-driver.html  
http://blog.csdn.net/liwei16611/article/details/51323372  
http://blog.csdn.net/dlijun/article/details/51547897  

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
