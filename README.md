# 🔓 Universal Root SSH Access Tool

Professional Linux root SSH access automation tool by Hostragons Global Limited.

Enable direct root login on Linux servers that initially enforce SSH key authentication or restrict root access.

Designed for cloud environments, VPS platforms, dedicated servers, virtual machines, and hosting providers.

Supports AWS, Azure, Google Cloud, Lightsail, Contabo, Hetzner, DigitalOcean, Oracle Cloud, Vultr and most Linux distributions.

---

# 🚀 Quick Installation

Run instantly:

```bash
bash <(curl -fsSL https://cdn.hostragons.com/storage/bash/hostragons_enable_root_access.sh)
```

or:

```bash
sudo bash <(curl -fsSL https://cdn.hostragons.com/storage/bash/hostragons_enable_root_access.sh)
```

---

# 📌 What Does This Tool Do?

This script automatically:

✔ Enables direct root SSH login

✔ Configures SSH daemon settings

✔ Enables password authentication

✔ Removes login restrictions that prevent root access

✔ Updates SSH configuration safely

✔ Restarts SSH service automatically

✔ Works across multiple Linux distributions

✔ Creates configuration backups

✔ Supports cloud providers with SSH key-only login environments

✔ Allows easier root administration

---

# 🔥 Features

## Enable Root SSH Login

Automatically updates:

```text
/etc/ssh/sshd_config
```

Settings modified:

```text
PermitRootLogin yes
PasswordAuthentication yes
KbdInteractiveAuthentication yes
```

---

## SSH Configuration Backup

Before modifications:

```text
/etc/ssh/sshd_config.bak
```

is automatically created.

This allows easy rollback if needed.

---

## Automatic SSH Service Detection

Different Linux distributions use different SSH service names.

Supported:

```text
sshd
ssh
```

Automatically detects and restarts the correct service.

---

## Cross Distribution Support

Fully compatible with:

- Ubuntu
- Debian
- AlmaLinux
- Rocky Linux
- CentOS
- RHEL
- CloudLinux
- Oracle Linux
- Fedora
- Other systemd based Linux systems

---

# ☁ Cloud Platform Compatibility

Optimized for cloud providers that commonly deploy SSH key-only access:

- AWS EC2
- AWS Lightsail
- Microsoft Azure
- Google Cloud Platform (GCP)
- Oracle Cloud
- DigitalOcean
- Vultr
- Hetzner Cloud
- Contabo
- Linode
- OVH
- Hostinger VPS
- Dedicated servers
- Virtual machines
- KVM servers
- Proxmox environments

---

# 🖥 How It Works

Step 1:

Checks system requirements.

Step 2:

Verifies root permissions.

Step 3:

Checks SSH configuration.

Step 4:

Updates root login settings.

Step 5:

Enables password authentication.

Step 6:

Restarts SSH service.

Step 7:

Prompts user to create or update root password.

Step 8:

Displays success information.

---

# 🔧 Requirements

Minimum requirements:

- Linux server
- Root access or sudo privileges
- OpenSSH server installed
- systemctl support

---

# ⚠ Security Notice

Enabling root login with password authentication may reduce security if strong passwords are not used.

Recommended:

✔ Use strong passwords

✔ Restrict SSH using firewall rules

✔ Change default SSH port if needed

✔ Enable Fail2Ban

✔ Restrict access by IP

---

# 📈 Common Use Cases

- Enable root login on AWS EC2
- Enable root login on Lightsail
- Remove SSH key-only restrictions
- Root access for Azure Linux VM
- Enable root SSH on Ubuntu server
- Enable root access on AlmaLinux
- Enable root access on CentOS
- Enable root login on cloud VPS
- SSH password login configuration
- Dedicated server administration
- Server migration
- Hosting server management

---

# 🏢 About Hostragons

Hostragons Global Limited

Company Number:

14320956

Headquarters:

London, United Kingdom

Address:

71–75 Shelton Street  
Covent Garden  
London WC2H 9JQ  
United Kingdom

Website:

https://www.hostragons.com/en/

Contact:

https://www.hostragons.com/en/contact

Client Area:

https://my.hostragons.com/

WhatsApp:

+44 7367 063425

Telegram:

https://t.me/hostragons

---

# 📜 License

MIT License

---

Made with ❤️ by Hostragons Global Limited
