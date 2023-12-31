
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
COPY --from=build /app/dist/iccng /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]