FROM node:slim
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

RUN apt-get update -y && apt-get install -y openssl

WORKDIR /app
COPY package.json .
RUN pnpm i
COPY . .
EXPOSE 3000
RUN npx prisma generate
CMD pnpm dev