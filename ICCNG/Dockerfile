
# Stage 1: Build stage
FROM node:lts-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --configuration=production

# Stage 2: Production stage
FROM nginx:alpine
ENV mla_service_url=value1
COPY --from=build /app/dist/iccng/browser /usr/share/nginx/html

RUN apk add --no-cache nodejs npm
RUN npm install -g http-server
EXPOSE 80
CMD ["http-server", "-c-1", "/usr/share/nginx/html"]
# CMD ["nginx", "-g", "daemon off;"]