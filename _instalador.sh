echo "INSTALANDO BLOQUE CURL"
echo ""
echo ""
echo ""
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
echo "FIN DE INSTALACION BLOQUE CURL"
echo ""
echo ""
echo ""

echo "INSTALAR RUBY USANDO RBENV"
echo ""
echo ""
echo ""
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
rbenv install 2.6.5
rbenv global 2.6.5
ruby -v
echo "FIN INSTALACIÓN RUBY"
echo ""
echo ""
echo ""


echo "INSTALACION DE BUNDLER"
echo ""
echo ""
echo ""
gem install bundler
rbenv rehash
echo "FIN INSTALACION DE BUNDLER"
echo ""
echo ""
echo ""


echo "INSTALACIÓN DE RAILS 6.0.0"
echo ""
echo ""
echo ""
gem install rails -v 6.0.0
rbenv rehash
rails -v
echo "FIN INSTALACIÓN DE RAILS"
echo ""
echo ""
echo ""

echo "INSTALACIÓN DE MYSQL"
echo ""
echo ""
echo ""
sudo apt-get install mysql-server mysql-client libmysqlclient-dev
sudo service mysql restart
sudo mysql -u root -p --execute="CREATE USER 'tdp2'@'localhost' IDENTIFIED BY 'Culosucio'; GRANT ALL PRIVILEGES ON *.* TO 'tdp2'@'localhost';"
sudo service mysql restart
echo "FIN INSTALACION MYSQL"
echo ""
echo ""
echo ""

echo "INSTALACION DE APACHE"
sudo apt-get install apache2

echo "FIN INSTALACION APACHE"
echo ""
echo ""
echo ""
echo ""
echo ""
echo "FIN"
