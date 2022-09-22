FROM centos:7.9.2009

ENV TZ=Asia/Shanghai
ENV LANG=en_US.UTF-8

COPY sys/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
COPY sys/epel-7.repo /etc/yum.repos.d/epel-7.repo

RUN yum -y update && yum install -y wget vim curl ping net-tools supervisor nginx \
	&& yum install -y epel-release https://packages.endpoint.com/rhel/7/os/x86_64/endpoint-repo-1.7-1.x86_64.rpm \
	&& rpm -i https://mirrors.aliyun.com/remi/enterprise/remi-release-7.rpm --nodeps \
	&& groupadd www \
  && useradd -g www -s /sbin/nologin www

RUN yum -y install nc

RUN yum -y install php php-cli php-devel php-pdo php-exif php-imagick php-pgsql php-sqlite3 php-gd php-curl php-memcached php-imap php-mysqlnd php-mysql php-mbstring php-xml php-zip php-bcmath php-soap php-intl php-readline php-pcov php-msgpack php-igbinary php-ldap php-redis php-pear php-dom php-mcrypt php-odbc php-mssql php-mysqli php-pecl-swoole php-pecl-yaf php-pecl-redis php-fpm --enablerepo=remi-php74

RUN yum clean all

RUN wget https://getcomposer.org/download/2.0.12/composer.phar -O /usr/local/bin/composer && chmod +x /usr/local/bin/composer && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

RUN mkdir -p /data/supervisor/tmp /data/supervisor/conf.d /data/supervisor/logs /data/nginx/conf.d /data/nginx/log /data/php-fpm/logs /data/www

COPY ./sys/supervisord.conf /etc/supervisor/supervisord.conf
COPY ./nginx/site.conf /data/nginx/conf.d/site.conf
COPY ./supervisor/server.conf /data/supervisor/conf.d/server.conf

VOLUME /data/www

EXPOSE 80

WORKDIR /data/www

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]