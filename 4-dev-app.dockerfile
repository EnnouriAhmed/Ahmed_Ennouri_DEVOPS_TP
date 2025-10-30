FROM node:20-alpine
ENV NODE_ENV=production
ENV PORT=3000
WORKDIR /app
COPY broken-app/package*.json ./
RUN npm ci --omit=dev || npm install --production
COPY broken-app/. .
RUN addgroup -S ahmedex4group && adduser -S ahmedex4 -G ahmedex4group \
    && chown -R ahmedex4:ahmedex4group /app

USER ahmedex4
EXPOSE 3000
CMD ["node", "server.js"]
