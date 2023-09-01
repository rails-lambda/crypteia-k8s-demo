# My K8s image
FROM node:18-bookworm
RUN mkdir -p /app && \
    chmod u+rwx /app && \
    chown node /app
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install -y cmake
USER node
CMD ["node", "/app/app.js"]

# Lambda Compatibility
COPY --from=ghcr.io/rails-lambda/crypteia-extension-debian:1.1.2 /opt /opt
COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.7.0 /lambda-adapter /opt/extensions/lambda-adapter
ENV LAMBDA_TASK_ROOT=/app
