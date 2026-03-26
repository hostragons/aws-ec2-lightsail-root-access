#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
NC='\033[0m'

line() {
    echo -e "${CYAN}============================================================${NC}"
}

info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

clear

line
echo -e "${BOLD}${WHITE}AWS EC2 & Lightsail Root Access Tool${NC}"
echo -e "${CYAN}Powered by Hostragons${NC}"
line
echo

info "Root SSH access is being enabled..."

# Root için authorized_keys dosyasını düzenle
if [ -f /root/.ssh/authorized_keys ]; then
    info "Editing authorized_keys file..."
    sudo sed -i '/command="echo/d' /root/.ssh/authorized_keys
    success "authorized_keys updated successfully."
else
    error "authorized_keys file not found. SSH key file is required for connection."
    exit 1
fi

# SSH yapılandırma dosyasını düzenle
info "Updating SSH configuration file..."
sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i '/^PubkeyAuthentication/d' /etc/ssh/sshd_config
sudo sed -i 's/^#KbdInteractiveAuthentication.*/KbdInteractiveAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^KbdInteractiveAuthentication.*/KbdInteractiveAuthentication yes/' /etc/ssh/sshd_config
success "SSH configuration updated."

# SSH servisini yeniden başlat
info "Restarting SSH service..."
if systemctl restart sshd 2>/dev/null; then
    success "sshd service restarted successfully."
elif systemctl restart ssh 2>/dev/null; then
    success "ssh service restarted successfully."
else
    error "SSH service could not be restarted. Service name may be different."
    exit 1
fi

# Root şifresini ayarla
echo
warn "Please set the root user password:"
sudo passwd root

echo
line
echo -e "${GREEN}${BOLD}Process completed successfully!${NC}"
echo -e "${WHITE}You can now connect directly using the root user via SSH.${NC}"
line
echo
