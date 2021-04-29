#FROM java:8
FROM nginx
COPY nginx.conf /usr/local/nginx/conf/conf.d/
COPY dist/ /usr/local/nginx/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
