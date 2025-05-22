# 🚢 dockateci

**dockateci** is a Docker-based tool that simplifies the build process for complex open source device stacks like **RDK-B**, **RDK-V/E**, **OpenWRT**, and **prplOS** by creating consistent, reproducible Docker images tailored for these environments.

> ⚠️ Currently supports:
RDK-B (2501q1 Banana Pi R4 - confirmed),
OpenWRT (24.10 Banana Pi R4 - confirmed, 23.05 should work BPi R3),
prplOS (3.2.0 Banana Pi R3 - confirmed),
RDV (6.1 Raspberry Pi R4 - confirmed),

Support for other stacks, versions, and platforms is planned.

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
# Please follow instructions in install_docker.sh

# Clone the repository
git clone https://github.com/davechapman442/dockateci.git
cd dockateci

# Build the Docker file and host directory for supported Targets
make

# Build the Docker image (dockateci-ubuntu-20-04)
make image

# Run the docker image, mounting the host Build folder
make run

*You must now configure the build environment from within the running container.*

# From within the docker shell (currently each time you restart the container)
cd Builds
NAME="<my name>" EMAIL="<my name>" PASSWORD="<my password>" source ./setup.sh
# Note password may also be a PAT, Personal Access Token

e.g. NAME="Fred Bloggs" EMAIL="fred.bloggs@fred.com" PASSWORD="Swordfish442" source ./setup.sh

# The email and password matches your login on code.rdkcentral.com, password only relevant for RDKx builds

# This will set up your git config, netrc file, download repo etc
# You can now run the a build.<target>.sh file, OR (recommended) use the commands within individually

# cd RDKB or
# cd RDKV or
# cd PrplOS or
# cd OpenWRT

# For example (RDKB)

cd RDKB
cat ./build.rdkb.sh # Contains>

# Grab the manifest
repo init -u https://code.rdkcentral.com/r/rdkcmf/manifests -b rdkb-2025q1-kirkstone -m rdkb-bpi-extsrc.xml
# Checkout build essentials (Yocto 4.0 from OpenEmbedded) and bitbake recipes for everything else
repo sync -j`nproc` --no-clone-bundle
# Set the build config & build with bitbake
MACHINE=bananapi4-rdk-broadband BPI_IMG_TYPE=nand source meta-cmf-bananapi/setup-environment-refboard-rdkb
# Rut bitbake to build the image
bitbake rdk-generic-broadband-image

```

## 📂 Project Structure

```text
dockateci/
├── README.md
├── Makefile
├── Dockerfile.template
├── install_docker.sh
├── scripts/
    ├── setup.sh
    ├── rdk/
    	├── build.rdkb.sh
	└── build.rdkv.sh
    ├── openwrt/
	└── build.openwrt.sh
    └── prplos/
        ├── yml/
	    ├── bpi_r3.yml
	    └── bpi_r4.yml
	└── build.prplos.sh
└── LICENSE
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).  
© 2025 Dave Chapman

---

## 🛣 Roadmap

- [ ] Add support RDK-E (RDK 7) when available
- [ ] Add support for prpl 4.1.0 on Banana Pi R4 when available
- [ ] Add developer help files/guidelines including rebuild/dev cycle, VS Code integration etc
- [ ] Expand or confirm version coverage (e.g. RDK-B 2024q4, etc.)

---

## 🤝 Contributing

Contributions are welcome!  
Please open an issue to discuss proposed changes before submitting a pull request.

---

## 🙏 Acknowledgments

- Inspired by the challenges of building device firmware in inconsistent environments.
- Thanks to the open source communities behind RDK, OpenWRT, and prplOS.
