# 🚢 dockateci

**dockateci** is a Docker-based tool that simplifies the build process for complex open source device stacks like **RDK-B**, **RDK-V/E**, **OpenWRT**, and **prplOS** by creating consistent, reproducible Docker images tailored for these environments.

> ⚠️ Currently supports **RDK-B 2025Q1** only. Support for other stacks, versions, and platforms is planned.

---

## ✅ Features

- 🐳 Containerized build environments for embedded Linux device stacks
- 📦 Minimal host dependencies — requires only Docker
- 🔁 Reproducible builds across different machines
- 🛠 Designed with support for multiple stacks and versions (coming soon)

---

## 💻 Requirements

- **Operating System**: Known to work on **Ubuntu 24.04**, but likely compatible with any OS that supports Docker.
- **Docker**: Must be installed and configured on your system.

---

## 🚀 Getting Started

```bash
# Install docker, and (ideally) set up for non root usage
# Please follow instructions in docker_install.sh

# Clone the repository
git clone https://github.com/your-username/dockateci.git
cd dockateci

# Build the Docker file and host directory for RDK-B 2025Q1
make

# Build the Docker image
make image

# Run the docker image, mounting the host Build folder
make run

*You must now configure the build environment from within the running container.*

# From within the docker shell (currently each time you restart the container)
cd Builds
NAME="<my name>" EMAIL="<my name>" PASSWORD="<my password>" sh ./setup.sh

e.g. NAME="Fred Bloggs" EMAIL="fred.bloggs@fred.com" PASSWORD="Swordfish442" sh ./setup.sh

# The email and password matches your login on code.rdkcentral.com

# This will set up your git config, netrc file, download repo
# You can now run the build.sh file, OR (recommended) use the commands within individually
```

## 📂 Project Structure

```text
dockateci/
├── Makefile
│   Dockerfile.template
├── docker_install.sh
├── build.sh
├── setup.sh
├── README.md
└── LICENSE
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).  
© 2025 Dave Chapman

---

## 🛣 Roadmap

- [ ] Add support for **RDK-V** and **RDK-E**
- [ ] Add support for **OpenWRT** and **prplOS**
- [ ] Expand or confirm version coverage (e.g. RDK-B 2024q4, etc.)

---

## 🤝 Contributing

Contributions are welcome!  
Please open an issue to discuss proposed changes before submitting a pull request.

---

## 🙏 Acknowledgments

- Inspired by the challenges of building device firmware in inconsistent environments.
- Thanks to the open source communities behind RDK, OpenWRT, and prplOS.
