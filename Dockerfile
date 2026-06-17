FROM nginx:alpine
COPY *.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
# Copy images folder if it exists (optional real images)
COPY images/ /usr/share/nginx/html/images/
EXPOSE 80
