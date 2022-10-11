FROM nginx:latest

# start with original html from nginx
RUN rm /usr/share/nginx/html/index.html

# mod to create my own custom html
COPY site-content/index.html /usr/share/nginx/html/index.html