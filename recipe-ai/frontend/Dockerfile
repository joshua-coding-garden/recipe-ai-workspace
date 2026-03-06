FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

FROM nginx:alpine

COPY --from=builder /app/dist /usr/share/nginx/html

# SPA fallback：所有路徑回傳 index.html
RUN printf 'server {\n\
    listen 3001;\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
    location / {\n\
        try_files $uri $uri/ /index.html;\n\
    }\n\
    location = /index.html {\n\
        add_header Cache-Control "no-cache, no-store, must-revalidate";\n\
    }\n\
    location /api/ {\n\
        proxy_pass http://localhost:8000/;\n\
        proxy_http_version 1.1;\n\
        proxy_set_header Host $host;\n\
        proxy_set_header X-Real-IP $remote_addr;\n\
        proxy_set_header Connection "";\n\
        proxy_buffering off;\n\
        proxy_cache off;\n\
        chunked_transfer_encoding off;\n\
    }\n\
    location /graphrag-api/ {\n\
        proxy_pass http://localhost:8002/;\n\
        proxy_http_version 1.1;\n\
        proxy_set_header Host $host;\n\
        proxy_set_header X-Real-IP $remote_addr;\n\
        proxy_set_header Connection "";\n\
        proxy_buffering off;\n\
        proxy_cache off;\n\
        chunked_transfer_encoding off;\n\
    }\n\
}\n' > /etc/nginx/conf.d/default.conf

EXPOSE 80
