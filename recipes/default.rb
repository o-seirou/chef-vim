#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if platform_family?('debian')
	%w{exuberant-ctags libncurses5-dev libacl1-dev libgpm-dev libperl-dev python-dev python3-dev ruby-dev lua5.2 liblua5.2-dev luajit libluajit-5.1-dev mercurial autoconf automake cproto unzip}.each do |p|
		package p do
			action :install
		end
	end
end

script "build_vim" do
	interpreter "bash"
	user        "root"
	group       "root"
	code <<-EOH
	cd /usr/local/src
	if [ ! -d vim ]; then
		LANG=C hg clone https://vim.googlecode.com/hg/ vim
	fi
	cd vim/src
	LANG=C hg pull
	LANG=C ./configure --with-features=huge --enable-perlinterp --enable-pythoninterp --enable-python3interp --enable-rubyinterp --enable-luainterp --with-luajit --enable-fail-if-missing
	LANG=C make
	LANG=C make install
	EOH
	not_if "which vim > /dev/null"
end
