#!/bin/bash

# Sanal ortam adı ve yolu
VENV_DIR="$HOME/myenv"

# Otomatik etkinleştirme scripti yolu
ACTIVATE_SCRIPT="$HOME/.bash_profile"  # veya .bashrc, .zshrc vs.

# Kullanıcı shell'ini belirle
SHELL_RC=""
if [[ $SHELL == */bash ]]; then
    SHELL_RC="$HOME/.bashrc"  # Bash için .bashrc kullanılır
elif [[ $SHELL == */zsh ]]; then
    SHELL_RC="$HOME/.zshrc"   # Zsh için .zshrc kullanılır
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
    echo "Başarıyla ayarlandı! Değişikliklerin etkili olması için terminali kapatıp yeniden açın veya şu komutu çalıştırın:"
    echo "source $SHELL_RC"
else
    echo "Sanal ortam zaten otomatik etkinleştiriliyor. Ekstra bir işlem gerekmez."
fi
