dockerfileFROM debian:bullseye

# Instalar dependências
RUN apt-get update && apt-get install -y \
    curl git docker.io docker-compose nginx nano \
    && rm -rf /var/lib/apt/lists/*

# Clonar Umbrel
RUN git clone https://github.com/getumbrel/umbrel.git /opt/umbrel

# Criar diretório de dados
RUN mkdir -p /data

# Copiar configuração customizada do nginx
COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /opt/umbrel

CMD ["./scripts/start"]
