#!/bin/bash

echo "Root SSH erişimini aktif hale getiriliyor..."

# Root için authorized_keys dosyasını düzenle
if [ -f /root/.ssh/authorized_keys ]; then
    echo "authorized_keys dosyası düzenleniyor..."
    sudo sed -i '/command="echo/d' /root/.ssh/authorized_keys
else
    echo "authorized_keys dosyası bulunamadı. SSH bağlantısı için anahtar dosyası gerekli!"
    exit 1
fi

# SSH yapılandırma dosyasını düzenle
echo "SSH yapılandırma dosyası düzenleniyor..."
sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i '/^PubkeyAuthentication/d' /etc/ssh/sshd_config  # PubkeyAuthentication kısmını sil
sudo sed -i 's/^#KbdInteractiveAuthentication.*/KbdInteractiveAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^KbdInteractiveAuthentication.*/KbdInteractiveAuthentication yes/' /etc/ssh/sshd_config

# SSH servisini yeniden başlat
echo "SSH servisi yeniden başlatılıyor..."
if systemctl restart sshd 2>/dev/null; then
    echo "sshd servisi başarıyla yeniden başlatıldı."
elif systemctl restart ssh 2>/dev/null; then
    echo "ssh servisi başarıyla yeniden başlatıldı."
else
    echo "SSH servisi yeniden başlatılamadı! Servis adı farklı olabilir."
    exit 1
fi

# Root şifresini ayarla
echo "Root kullanıcısının şifresini belirleyin:"
sudo passwd root

echo "İşlem tamamlandı! Artık root kullanıcısı ile doğrudan SSH bağlantısı yapabilirsiniz."
