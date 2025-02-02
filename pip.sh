#!/bin/bash

# Sanal ortam adı
VENV_DIR="$HOME/myenv"

# Kullanıcı shell'ini belirle
SHELL_RC=""
if [[ $SHELL == */bash ]]; then
    if [[ -f "$HOME/.bashrc" ]]; then
        SHELL_RC="$HOME/.bashrc"
    else
        SHELL_RC="$HOME/.bash_profile"
    fi
elif [[ $SHELL == */zsh ]]; then
    SHELL_RC="$HOME/.zshrc"
else
    echo "Bu script sadece Bash veya Zsh shell'leri için geçerlidir!"
    exit 1
fi

# Sanal ortamı kontrol et, yoksa oluştur
if [ ! -d "$VENV_DIR" ]; then
    echo "Sanal ortam bulunamadı, oluşturuluyor..."
    python3 -m venv "$VENV_DIR"
fi

# Başlangıç dosyasına gerekli satırı ekle
if ! grep -q "source $VENV_DIR/bin/activate" "$SHELL_RC"; then
    echo "Sanal ortamın her terminal açılışında otomatik etkinleştirilmesi ayarlanıyor..."
    echo "source $VENV_DIR/bin/activate" >> "$SHELL_RC"
    echo "Tamamlandı! Değişikliklerin etkili olması için terminali kapatıp yeniden açın veya aşağıdaki komutu çalıştırın:"
    echo "source $SHELL_RC"
else
    echo "Sanal ortam zaten otomatik etkinleştiriliyor. Ekstra bir işlem gerekmez."
fi
