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

if test $version -eq "14";
then
	echo ----------------改变更新源---------------------
    mv /etc/apt/sources.list /etc/apt/sources.listback
	cp ./sources.list /etc/apt/sources.list
	sudo apt-get update
fi

echo --------------------安装vim依赖--------------------
sudo apt-get -y install silversearcher-ag global xz-utils python-dev cmake aptitude libncurses5-dev ruby-dev lua5.1 lua5.1-dev libperl-dev
echo --------------------下载vim源代码------------------
git clone http://github.com/vim/vim
echo --------------------编译安装vim--------------------
cd vim
./configure --with-features=huge --enable-multibyte --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-rubyinterp --enable-luainterp --enable-perlinterp --enable-cscope --disable-gui
make -j4
sudo apt-get -y remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox
sudo make install
mv ~/.vim ~/.vimback
mv ~/.vimrc ~/.vimrcback
cp .vim ~/ -a
cp .vimrc ~/


if test $version -eq "14";
then
	echo ------------------------还原更新源----------------
    mv /etc/apt/sources.listback /etc/apt/sources.list
	#sudo apt-get update
fi
vim
:PlugInstall
















##读取系统位数
#if [ $(getconf WORD_BIT) = '32' ] && [ $(getconf LONG_BIT) = '64' ] ; then
	#echo 64位
	#ycm_flag="--clang-completer"
#else
	#echo 32位
	#ycm_flag="--clang-completer --system-libclang"
#fi



##if test -e $HOME/.vim/plug/repos/github.com
#if test -e $HOME/.vim/plug/repos/github.com/Valloric/YouCompleteMe/
#then
    #echo '文件已存在!'
#else
    #echo '文件不存在!'
#fi
#echo $ycm_flag


#安装字体
#git clone https://github.com/powerline/fonts.git
#cd fonts
#./install.sh
#cd ..
#rm -rf fonts
#选择字体 终端右键，配置文件，配置文件首选项，自定义字体打勾，选择字体   推荐
#droid sans mono for powerline regular
#Cousine Powerline
#Inconsolata-dz

#安装youcompleteme