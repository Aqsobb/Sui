#!/bin/bash

# 1. Jalankan Bot kamu di background
# Edit bagian bawah ini sesuai file utama bot kamu (main.py atau index.js)
if [ -f "main.py" ]; then
    python3 main.py &
elif [ -f "index.js" ]; then
    node index.js &
fi

# 2. Jalankan VS Code (code-server)
# --auth password bakal minta password yang kamu set di Environment Variable nanti
code-server --bind-addr 0.0.0.0:8080 --auth password /home/coder/project
