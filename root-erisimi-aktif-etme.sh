#!/bin/bash

# Root erişimini açmak için SSH yapılandırma dosyasını düzenle
echo "Düzenlemeler yapılıyor: /etc/ssh/sshd_config"

# PermitRootLogin ayarını 'yes' olarak değiştir
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# PasswordAuthentication ayarını 'yes' olarak değiştir
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# SSH servisini yeniden başlat
echo "SSH servisi yeniden başlatılıyor..."
systemctl restart sshd

# Root kullanıcısı için parola belirle
echo "Root kullanıcısı için yeni bir parola belirleyin:"
passwd root

echo "Root erişimi başarıyla açıldı. Artık root olarak SSH bağlantısı yapabilirsiniz."
