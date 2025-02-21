#!/bin/bash

# Renk kodları (Opsiyonel)
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Sistem yöneticisi tarafından yönetilen bir Python ortamındasınız.${NC}"
echo -e "${YELLOW}Güvenli bir şekilde pip'i güncellemek için bir sanal ortam oluşturulacak.${NC}\n"

# python3-venv yüklü mü?
if ! dpkg -s python3-venv &> /dev/null; then
    echo -e "${GREEN}python3-venv paketi eksik. Yükleniyor...${NC}"
    sudo apt update && sudo apt install -y python3-venv
fi

# Sanal ortam oluşturma
VENV_DIR="$HOME/my_python_env"
if [ ! -d "$VENV_DIR" ]; then
    echo -e "${GREEN}Sanal Python ortamı oluşturuluyor...${NC}"
    python3 -m venv "$VENV_DIR"
fi

# Sanal ortamı aktive etme ve pip güncelleme
source "$VENV_DIR/bin/activate"
echo -e "${GREEN}Sanal ortam aktifleştirildi! Pip güncelleniyor...${NC}"
pip install --upgrade pip setuptools

echo -e "${GREEN}İşlem tamamlandı!${NC}"
echo -e "Sanal ortamı kullanmak için şunu çalıştırın:\n"
echo -e "${YELLOW}source $VENV_DIR/bin/activate${NC}"
#echo -e "Çıkış yapmak için: ${YELLOW}deactivate${NC}\n"

