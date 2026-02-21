FROM oven/bun:1.2.13

WORKDIR /app

COPY apps/server ./apps/server
COPY package.json bun.lockb turbo.json ./

RUN bun install
RUN bun run build --filter=server

WORKDIR /app/apps/server

EXPOSE 3000
CMD ["bun", "run", "start"]