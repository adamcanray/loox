# Loox

Investigate the port for each host on your current network.

## Pre-requisites

Before running the `loox.sh` file, you must have [Nmap](https://nmap.org/) installed on your machine. Nmap is a free and open-source utility used for network exploration and security auditing.

To install Nmap on Linux, you can use your distribution's package manager:

Ubuntu/Debian

```
sudo apt-get install nmap
```

Fedora

```
sudo dnf install nmap
```

Arch Linux

```
sudo pacman -S nmap
```

To install Nmap on macOS, you can use [Homebrew](https://brew.sh/):

```
brew install nmap
```

To install Nmap on Windows, you can download the installer from the official Nmap website:

> https://nmap.org/download.html#windows

## Getting Started

To run the `loox.sh` file, follow these steps:

1. Clone the repository to your local machine using `git clone https://github.com/adamcanray/loox.git`.

2. Navigate to the root directory of the repository using `cd loox`.

3. Run the `loox.sh` file with the `-tlip` option and the IP range you want to scan. For example, to scan the `192.168.1.100/24` network, run:

   ```
   ./loox.sh -tlip=192.168.1.100/24
   ```

   This will scan all hosts on the `192.168.1` network.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Code of Conduct

Please read our [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details on our code of conduct.

## Contributing

We welcome contributions from the community! Please read our [CONTRIBUTING.md](CONTRIBUTING.md) for more information on how to get started.
