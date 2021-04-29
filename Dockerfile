#FROM java:8
FROM nginx
COPY vue.conf /usr/local/nginx/conf/conf.d/
COPY dist /usr/local/nginx/
