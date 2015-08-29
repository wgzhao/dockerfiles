FROM centos:base
RUN yum install -y nginx
COPY website.conf /etc/nginx/conf.d/
RUN mkdir -p /var/www/html/{www,static}.erp.com
RUN echo "www.erp.com is running" >/var/www/html/www.erp.com/index.html
RUN echo "static.erp.com is running" >/var/www/html/static.erp.com/index.html
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 22 80
ENTRYPOINT /run.sh