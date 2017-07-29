#读取系统类型
Get_Dist_Name()
{
    if grep -Eqii "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        DISTRO='CentOS'
        PM='yum'
    elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
        DISTRO='RHEL'
        PM='yum'
    elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
        DISTRO='Aliyun'
        PM='yum'
    elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
        DISTRO='Fedora'
        PM='yum'
    elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        DISTRO='Debian'
        PM='apt'
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
		DISTRO='Ubuntu'
        PM='apt'
    elif grep -Eqi "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
        DISTRO='Raspbian'
        PM='apt'
    else
        DISTRO='unknow'
    fi
}
Get_Dist_Name
if [ $DISTRO = "Ubuntu" ]
then
    echo ----------------开始安装-----------------------
else
    echo 当前系统不支持自动安装
	exit
fi

#读取版本
version=`lsb_release -rs`
version=${version%%.*}

path=`pwd`
if test $version -eq "14";
then
	echo ----------------改变更新源---------------------
    sudo mv /etc/apt/sources.list /etc/apt/sources.listback
	sudo cp ./sources.list /etc/apt/sources.list
	sudo apt-get update
fi

echo --------------------安装vim依赖--------------------
sudo apt-get -y install silversearcher-ag global xz-utils python-dev cmake aptitude libncurses5-dev ruby-dev lua5.1 lua5.1-dev libperl-dev
echo --------------------下载vim源代码------------------
git clone --depth=1 http://github.com/vim/vim
echo --------------------编译安装vim--------------------
cd vim
./configure --with-features=huge --enable-multibyte --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-rubyinterp --enable-luainterp --enable-perlinterp --enable-cscope --disable-gui
make -j4
sudo apt-get -y remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox
sudo make install
cd $path
mv $HOME/.vim $HOME/.vimback
mv $HOME/.vimrc $HOME/.vimrcback
cp .vim $HOME/ -a
cp .vimrc $HOME/.vimrc
echo --------------------安装字体--------------------
git clone --depth=1 http://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..

##读取系统位数
if [ $(getconf WORD_BIT) = '32' ] && [ $(getconf LONG_BIT) = '64' ] ; then
	echo 64位
	ycm_flag="--clang-completer"
else
	echo 32位
	ycm_flag="--clang-completer --system-libclang"
	sudo apt-get -y remove clang-3.3 clang-3.4 clang-3.5 clang-3.6 clang-3.8
	sudo apt-get -y install clang-3.9
fi

if test $version -eq "14";
then
	echo ------------------------还原更新源----------------
    sudo mv /etc/apt/sources.listback /etc/apt/sources.list
	sudo apt-get update
fi
vim

if test -e $HOME/.vim/plug/repos/github.com/Valloric/YouCompleteMe/
then
	cd $HOME/.vim/plug/repos/github.com/Valloric/YouCompleteMe
	git submodule update --init --recursive
	./install.py $ycm_flag
else
	echo '请重新下载YouCompleteMe插件'
fi


#选择字体 终端右键，配置文件，配置文件首选项，自定义字体打勾，选择字体   推荐
#droid sans mono for powerline regular
#Cousine Powerline
#Inconsolata-dz

#安装youcompleteme
#sudo apt-get install software-properties-common
#sudo add-apt-repository ppa:ubuntu-toolchain-r/test
#sudo apt-get update
#sudo apt-get install g++-5
#ln -s /usr/bin/g++-5 /usr/bin/g++ -f
