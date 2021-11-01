# Jadwal-Sholat-CLI
Show Sholat Schedule on terminal (Linux/Mac/BSD)
<p align="center"><img src="https://raw.githubusercontent.com/Faroid-id/jadwal-sholat-cli/main/Screenshot_2021-11-01_10-40-49.png" alt="Oh My Zsh"></p>

### Prerequisites

- A Unix-like operating system: macOS, Linux, BSD.
- `wget` should be installed
- `jq` should be installed 
- `curl` should be installed

### Wget and Jq Installation

Wget and jq aren't installed by default on most editions of Linux/Mac/BSD, but you can install them by using this following command.

| Operating System    | Wget | Jq  | Curl                                                                                         |
|:--------------------|:-----------------------------------|:-------------|:--------------------------------------|
| **Debian Based**  | `sudo apt install wget` | `sudo apt install jq` |`sudo apt install curl`
| **Arch Based**  | `sudo pacman -S wget`   | `sudo pacman -S jq` | `sudo pacman -S curl`
| **Void Based**  | `sudo xbps-install wget`   | `sudo xbps-install jq` | `sudo xbps-install curl`
| **Redhat Based** | `sudo yum install wget` | `sudo yum install jq` |`sudo yum install culr`
| **Mac** | `brew install wget` | `sudo brew install jq` |`sudo brew install curl`
| **FreeBSD** | `sudo pkg install wget` | `sudo pkg install jq` |`sudo pkg install curl`

### Usage
- Download jadwalSholat.sh and install.sh
- Open terminal then type `./install.sh` and type your city name
