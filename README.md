# WordPress Installation via Ansible

This playbook automates the installation of WordPress on an Ubuntu 24.04 VM using Ansible.

---

## Requirements

- Ubuntu 24.04 VM with root SSH access  
- A public IP address  
- Ansible installed on your local machine  
- A Cloudflare account for DNS management

---

## Preparation

### 1. Create a DNS Record

- Create an **A record** in Cloudflare pointing to your VM's **public IP address**
- Enable **HTTP(S) proxying** (orange cloud icon) in Cloudflare

### 2. Configure the Domain in the Playbook

Edit `install.yml` and set the domain variable to your Cloudflare DNS name:

```yaml
domain: your-domain.com
```

### 3. Add Your Vault Password

Create a file containing your vault password:

```bash
echo YOUR_VAULT_PASSWORD >> ~/.vaultpass
```

### 4. Create the Vault File

Create an encrypted vault file to store sensitive variables:

```bash
ansible-vault create vault.yml
```

### 5. Add MySQL Credentials to the Vault

Insert the following into `vault.yml`:

```yaml
mysqluser: MYSQL_USERNAME
mysqlpass: MYSQL_USER_PASSWORD
database: DATABASE_NAME
```

---

## Run the Playbook

Execute the playbook using your server’s **IP address**, not the domain name:

```bash
ansible-playbook -i YOUR_VM_IP, install.yml
```

> ⚠️ **Important:** Do **not** use the domain name if Cloudflare proxying is enabled – the connection will fail. Use the **IP address** instead.

---

## WordPress Setup

1. Open your browser  
2. Visit: `https://your-domain.com`  
3. Follow the WordPress setup wizard

---

## Optional: Improve Performance

Install and activate the **"Redis Object Cache"** plugin in WordPress for better caching and speed.

---

## Done!

That’s it — your WordPress site is ready! 🎉  
Enjoy your new setup 🚀

