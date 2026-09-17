FROM node:20-slim
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends unzip && rm -rf /var/lib/apt/lists/*
COPY app.zip /tmp/app.zip
RUN unzip -q /tmp/app.zip -d /app && rm /tmp/app.zip && npm install --omit=dev
ENV NODE_ENV=production
CMD ["npm","start"]
