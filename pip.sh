#!/bin/bash

# Sanal ortam adı
VENV_DIR="myenv"

# Python ve venv modülünü kontrol et
if ! command -v python3 &> /dev/null; then
    echo "Python3 bulunamadı. Lütfen yükleyin!"
    exit 1
fi

if ! python3 -m venv --help &> /dev/null; then
    echo "python3-venv paketi eksik. Yükleniyor..."
    sudo apt update && sudo apt install -y python3-venv
fi

# Sanal ortam oluştur
if [ ! -d "$VENV_DIR" ]; then
    echo "Sanal ortam oluşturuluyor..."
    python3 -m venv "$VENV_DIR"
else
    echo "Sanal ortam zaten var: $VENV_DIR"
fi

# Sanal ortamı etkinleştir
echo "Sanal ortam etkinleştiriliyor..."
source "$VENV_DIR/bin/activate"

# Pip güncelle
echo "pip güncelleniyor..."
pip install --upgrade pip

echo "Sanal ortam başarıyla oluşturuldu ve etkinleştirildi!"
