#FROM java:8
FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
ADD default.conf /etc/nginx/conf.d/
COPY dist/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
