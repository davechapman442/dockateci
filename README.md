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
# Clone the repository
git clone https://github.com/your-username/dockateci.git
cd dockateci

# Build the Docker image for RDK-B 2025Q1
./build.sh rdkb-2025q1

# Enter the container environment
./enter.sh rdkb-2025q1
```

*You can now build RDK-B from inside the containerized environment.*

---

## 📂 Project Structure

```text
dockateci/
├── Dockerfiles/
│   └── rdkb-2025q1.Dockerfile
├── build.sh
├── enter.sh
├── README.md
└── LICENSE
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).  
© 2025 Your Name

---

## 🛣 Roadmap

- [ ] Add support for **RDK-V** and **RDK-E**
- [ ] Add support for **OpenWRT** and **prplOS**
- [ ] Expand version coverage (e.g. RDK-B 2025Q2, etc.)
- [ ] Improve portability and CI integration

---

## 🤝 Contributing

Contributions are welcome!  
Please open an issue to discuss proposed changes before submitting a pull request.

---

## 🙏 Acknowledgments

- Inspired by the challenges of building device firmware in inconsistent environments.
- Thanks to the open source communities behind RDK, OpenWRT, and prplOS.
