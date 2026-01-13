FROM php:8.2-apache
# পোর্ট সেট করা
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf
# ফাইল কপি করা
COPY . /var/www/html/
# পারমিশন দেওয়া
RUN chmod -R 777 /var/www/html/
