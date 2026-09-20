#!/bin/bash

# Hata durumunda scriptin durmasını sağla
set -e

echo "🔍 Adım 1: python3-venv paketi kontrol ediliyor..."
# python3-venv kurulu mu diye bak, kurulu değilse indir
if ! dpkg -s python3-venv >/dev/null 2>&1; then
    echo "📌 python3-venv bulunamadı. Önce kurulum yapılıyor (şifre istenebilir)..."
    sudo apt update && sudo apt install -y python3-venv
    echo "✅ python3-venv başarıyla indirildi ve kuruldu."
else
    echo "ℹ️ python3-venv zaten sisteminizde kurulu."
fi

echo "📦 Adım 2: Sanal ortam (venv) oluşturuluyor..."
VENV_DIR="venv"
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv $VENV_DIR
    echo "✅ '$VENV_DIR' klasörü oluşturuldu."
else
    echo "ℹ️ '$VENV_DIR' klasörü zaten mevcut."
fi

echo "🚀 Adım 3: Sanal ortam aktif ediliyor..."
source $VENV_DIR/bin/activate

# Pip'i en son sürüme güncelle
pip install --upgrade pip

echo -n "📝 Adım 4: Yüklemek istediğiniz Python paketlerini yazın (örn: requests numpy): "
read PAKETLER

if [ ! -z "$PAKETLER" ]; then
    echo "📥 Paketler hata almadan güvenli bir şekilde yükleniyor..."
    pip install $PAKETLER
    echo "🎉 İşlem tamamlandı! Paketleriniz hazır."
else
    echo "⚠️ Paket adı girilmediği için yükleme yapılmadı."
fi

echo "💡 Bu sanal ortamı kullanmak için terminalde şu komutu çalıştırabilirsiniz: source venv/bin/activate"
