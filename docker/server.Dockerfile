FROM node:20-slim

# Устанавливаем bun поверх Node 20
RUN npm install -g bun

WORKDIR /app

# Копируем весь monorepo
COPY . .

# Переходим в server
WORKDIR /app/apps/server

# Устанавливаем зависимости
RUN bun install

# (опционально) билд
RUN bun run build || true

EXPOSE 3000

CMD ["bun", "run", "dev"]