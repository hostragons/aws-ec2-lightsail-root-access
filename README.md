# aws-root-girisi
Bu, AWS EC2/Lightsail sunucularında root erişimini açmak için bir betiktir.

# AWS Root Erişim Betiği

Bu betik, AWS EC2 ve Lightsail sunucularında SSH yapılandırmasını düzenleyerek ve root kullanıcı için parola belirleyerek root erişimini açar.

## Kullanım

1. Betiği sunucunuza yükleyin.
2. Çalıştırma izni vermek için `chmod +x enable_root_access.sh` komutunu kullanın.
3. Betiği `sudo ./enable_root_access.sh` komutuyla çalıştırın.
4. İstendiğinde root kullanıcısı için bir parola belirleyin.

**Uyarı**: Root erişimini açmak güvenlik riskleri doğurabilir. Sorumlu bir şekilde kullanın ve gerekli güvenlik önlemlerini aldığınızdan emin olun.

## Lisans

Bu proje MIT Lisansı altında lisanslanmıştır.
