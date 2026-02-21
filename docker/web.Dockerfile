FROM node:20-alpine AS build

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --workspace=apps/web

FROM nginx:alpine
COPY --from=build /app/apps/web/dist /usr/share/nginx/html
COPY nginx/web.conf /etc/nginx/conf.d/default.conf