# liyj-vim
直达目录  
sudo apt install autojump  
  
安装vim  
 sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial  
  
安装Exuberant-ctags  sudo apt-get install Exuberant-ctags   
安装ag和gtags apt-get install silversearcher-ag global  
安装g++ 4.9  
sudo add-apt-repository ppa:ubuntu-toolchain-r/test  
sudo apt-get update  
sudo apt-get install gcc-4.9  
sudo apt-get install g++-4.9  
sudo cd /usr/bin  
sudo ln -s /usr/bin/g++-4.9 /usr/bin/g++ -f  
sudo ln -s /usr/bin/gcc-4.9 /usr/bin/gcc -f  
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

vim-airline 安装字体  
# clone  
git clone https://github.com/powerline/fonts.git  
# install  
cd fonts  
./install.sh  
# clean-up a bit  
cd ..  
rm -rf fonts  
终端右键，配置文件，配置文件首选项，自定义字体打勾，选择字体  
  
错位  
DejaVu Sans Mono for powerline book  
ubuntu mono derivative  
字体  
Source Code Pro  
推荐  
droid sans mono for powerline regular  
Consolas  
Cousine Powerline  
Inconsolata  
     
gui慢  
  
make && make install  
  
./configure --with-features=huge --enable-pythoninterp --enable-python3interp --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr --with-vim-name=vi --with-compiledby="liyj"  
  
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
