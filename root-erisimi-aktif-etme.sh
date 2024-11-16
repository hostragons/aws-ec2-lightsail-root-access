#!/bin/bash

# Root kullanıcı şifresi belirleme
echo "Root kullanıcısı için bir şifre belirleyin:"
passwd root

# SSH yapılandırma dosyasını kontrol et ve düzenle
SSHD_CONFIG="/etc/ssh/sshd_config"

echo "SSH yapılandırması düzenleniyor..."

# PermitRootLogin ayarını aktif et
if grep -q "^#*PermitRootLogin" $SSHD_CONFIG; then
    sed -i 's/^#*PermitRootLogin.*/PermitRootLogin yes/' $SSHD_CONFIG
else
    echo "PermitRootLogin yes" >> $SSHD_CONFIG
fi

# PasswordAuthentication ayarını aktif et
if grep -q "^#*PasswordAuthentication" $SSHD_CONFIG; then
    sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication yes/' $SSHD_CONFIG
else
    echo "PasswordAuthentication yes" >> $SSHD_CONFIG
fi

# SSH servisini yeniden başlat
echo "SSH servisi yeniden başlatılıyor..."
systemctl restart sshd

# Firewall kontrolü (SSH bağlantılarına izin ver)
echo "Firewall ayarları düzenleniyor..."
ufw allow 22/tcp
ufw enable
ufw reload

echo "İşlem tamamlandı! Artık root kullanıcıyla SSH üzerinden giriş yapabilirsiniz."
