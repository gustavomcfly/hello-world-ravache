# Imagem base leve do Node
FROM node:20-alpine

# Pasta de trabalho dentro do container
WORKDIR /app

# Copia só os arquivos de dependências primeiro (aproveita cache de camadas)
COPY package*.json ./

# Instala dependências de produção
RUN npm install --omit=dev

# Copia o restante do código
COPY . .

# Documenta a porta usada pela aplicação
EXPOSE 3000

# Comando que inicia o app
CMD ["npm", "start"]