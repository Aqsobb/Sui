# Pake image VS Code (code-server) yang resmi
FROM codercom/code-server:latest

USER root

# Install Python dan Node.js (Biar bisa jalanin bot apa aja)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    nodejs \
    npm \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set direktori kerja
WORKDIR /home/coder/project

# Copy semua file bot kamu ke dalam server
COPY . .

# Install dependencies bot (Otomatis deteksi Python/Node)
RUN if [ -f "requirements.txt" ]; then pip3 install -r requirements.txt; fi
RUN if [ -f "package.json" ]; then npm install; fi

# Copy script buat jalanin bot + vscode barengan
COPY start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

# Port standar buat web (Northflank bakal baca ini)
EXPOSE 8080

ENTRYPOINT ["/usr/bin/start.sh"]
