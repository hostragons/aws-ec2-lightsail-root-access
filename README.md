## AWS Root Access Script (SSH Key Remove)

This script is designed to enable root access on AWS EC2 and Lightsail servers by modifying the SSH configuration and setting a password for the root user. It configures SSH to permit direct root logins.

**Important Notice:**  
- The script modifies your server’s SSH configuration. It is recommended to back up your server settings before using the script to avoid any unintended issues.  
- Enabling root access can pose security risks. Therefore, **use a strong password** for the root account and enable root access only when absolutely necessary.  
- Always ensure that proper backups are in place for your system and data before running the script.

### Usage

1. Upload the script to your server:
   ```
   nano enable_root_access.sh
   ```
2. Grant the script execution permissions:
   ```
   chmod +x enable_root_access.sh
   ```
3. Run the script with superuser privileges:
   ```
   sudo ./enable_root_access.sh
   ```
4. When prompted, set a strong password for the root user.

### License

This project is licensed under the MIT License.
