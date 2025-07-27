
nix.conf - Nix 2.28.5 Reference Manual - https://nix.dev/manual/nix/2.28/command-ref/conf-file.html#conf-use-xdg-base-directories
Common Environment Variables - Nix 2.28.5 Reference Manual - https://nix.dev/manual/nix/2.28/command-ref/env-common
XDG Base Directory Specification - https://specifications.freedesktop.org/basedir-spec/latest/
update sops secrets.yaml - Google Search - https://www.google.com/search?client=firefox-b-1-d&channel=entpr&q=update+sops+secrets.yaml
GitHub - getsops/sops: Simple and flexible tool for managing secrets - https://github.com/getsops/sops?tab=readme-ov-file#usage
nixos-config/server-modules at main · NullAndVoid347/nixos-config · GitHub - https://github.com/NullAndVoid347/nixos-config/tree/main/server-modules



XDG
updated readme about "after definiing a user acount, dont forget to set a password with passwd"
Update main README, clean it up, and add anything from to-do/README
Organize, dedup, and cleanup to-do/to-do.md
Setup luks tpm autoencrypt
re go through home and configuration pkgs and better organize between system and user apps
test udev rules
nvidia override for egpu
openrgb
resizable bar
secure boot
ssh keys injected
virtualizaton
consider breaking out "shellAliases" into its own nix
Get working properly
	egpu
	bluetooth kde notification status
	fingerprint sensor and unlock
Look more into configuring apps in .nix files instead, for example zen extensions etc.
See if you can manually make changes in NixOS and do a compare with configuration.nix
Investigate incus for nix instead of proxmox
Setup fw16 with nixos
setup nerdrack server with nixos
see if you can save cookies for zen browser on nixos, along with all other proper setup, reconfige history and cookies in zen afterwards
set up backgrounds
fix kde menu favorites
zen sync to ironfox
luks auto unecrypt
secure boot/safe boot
whether to leave password to unencrypt and autologin, or to auto-unencrypt and then need password to login
Think about source controlling "Home" -> "Containers"
Clean up "Home" -> "Emulation", along with adding emulation to NixOS
Try out cosmic
wake-on-lan
Kernel patches?


## Install Apps
all-ways-egpu
ark
AppImage
DistroShelf
gamescope
PodmanDesktop
Pods
virt-manager
libvirt
wireplumber
wl-clipboard (cli)
xdg-user-dirs-gtk
xdg-utils
xinput
xivlauncher
XIVLauncher
xlcore
xlm - for ffxiv
xpad
xpadneo-dkms
xwaylandvideobridge

###############

baobab
barrier
bazaar
binutils
bison
btop
btrfs assistant
calibre
cheese
Clapgrep
cpu-x
DejaDup
deskflow
deskreen
dinput
discover
disks
dnsmasq
DXVK
Easy Effects
edk2-ovmf
emudeck
FFmpeg
Filelight
file-roller
Flatseal
flex
fractal
gawk
gcc
gearlever
goplay2
gpu-viewer
Gradience
grilo-plugins
groff
gst-plugin-pipewire
Gstreamer
GStreamer VA-API
gvfs
Gwenview
gzip
halloy
handheld daemon
headset-charge-indicator-git
headsetcontrol
i2c-tools
info center
iptables-nft
KCalc
kdeconnect
kdenlive
KiCad
KolourPaint
konsole
krfb
kwalletmanager
libtool
LinuxAudio.Plugins.Calf
LinuxAudio.Plugins.LSP
LinuxAudio.Plugins.MDA
LinuxAudio.Plugins.swh
LinuxAudio.Plugins.TAP
LinuxAudio.Plugins.ZamPlugins
luks unencrypt
mango juice
Mesa
mission control
mono
moonlight
OBS VkCapture
Okular
openh264
OpenMW
OTPClient
pangolin
peergos
Pika Backup
Pinta
qBittorrent
Raspberry Pi Imager
rustdesk
rygel
scopebuddy gui
simple-scan
smartmontools
spectacle
sunshine
sushi
syncthing
syncthingtk
SyncThingy
system monitor
system settings
Transmission
transmission-gtk
ventoy
vesktop
visualstudio.code
vkBasalt
Vulkan
Warehouse
waydroid






# investigate/consider

```
  boot = {
    initrd = {
      availableKernelModules = [
        "ahci"
        "nvme"
        "sd_mod"
        "usb_storage"
        "usbhid"
        "xhci_pci"
      ];
      luks.devices."root" = {
        allowDiscards = true;
        device = "/dev/disk/by-uuid/21cd166c-1528-49a4-b31b-0d408d48aa80";
        preLVM = true;
        keyFile = "./keyfile0.bin";
      };
      secrets = {
        "keyfile0.bin" = "/etc/secrets/initrd/keyfile0.bin";
      };
    };
  };
```
```

  # Enable automatic login for the user.
  services.getty.autologinUser = "$User";


# oh-my-zsh
#    oh-my-posh
### Possible Term apps
#     # jq # A lightweight and flexible command-line JSON processor
# yq-go # yaml processor https://github.com/mikefarah/yq
# eza # A modern replacement for ‘ls’
#     cowsay
#     file
#     which
#     tree
#     gnused
#     gnutar
#     gawk
#     zstd


# productivity
#     hugo # static site generator
#     glow # markdown previewer in terminal
#
#     btop  # replacement of htop/nmon
#     iotop # io monitoring
#     iftop # network monitoring

# system call monitoring
#     strace # system call monitoring
#     ltrace # library call monitoring
#     lsof # list open files

# system tools
#     sysstat
#     lm_sensors # for `sensors` command
#     ethtool
#     pciutils # lspci
#     usbutils # lsusb



#   # starship - an customizable prompt for any shell
#   programs.starship = {
#     enable = true;
#     # custom settings
#     settings = {
#       add_newline = false;
#       aws.disabled = true;
#       gcloud.disabled = true;
#       line_break.disabled = true;
#     };
#   };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
#   programs.alacritty = {
#     enable = true;
#     # custom settings
#     settings = {
#       env.TERM = "xterm-256color";
#       font = {
#         size = 12;
#         draw_bold_text_with_bright_colors = true;
#       };
#       scrolling.multiplier = 5;
#       selection.save_to_clipboard = true;
#     };
#   };

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # set cursor size and dpi for 4k monitor
  #xresources.properties = {
  #  "Xcursor.size" = 16;
  #  "Xft.dpi" = 172;
  #};
```

## possbile alias/ujust/configs from bazzite

```

# Clean up old up unused podman images, volumes, flatpak packages and rpm-ostree content
clean-system:
    #!/usr/bin/bash
    podman image prune -af
    podman volume prune -f
    flatpak uninstall --unused
    rpm-ostree cleanup -bm
    brew autoremove
    brew cleanup

# vim: set ft=make :

uid := `id -u`
shell := `grep :$(id -u): /etc/passwd | cut -d: -f7`

# Boot into this device's BIOS/UEFI screen
bios:
    #!/usr/bin/bash
    if [ -d /sys/firmware/efi ]; then
      systemctl reboot --firmware-setup
    else
      echo "Rebooting to legacy BIOS from OS is not supported."
    fi

# Show BIOS info
bios-info:
    #!/usr/bin/bash
    echo "Manufacturer: $(sudo dmidecode -s baseboard-manufacturer)"
    echo "Product Name: $(sudo dmidecode -s baseboard-product-name)"
    echo "Version: $(sudo dmidecode -s bios-version)"
    echo "Release Date: $(sudo dmidecode -s bios-release-date)"

# Show all messages from this boot
logs-this-boot:
    sudo journalctl --no-hostname -b 0

# Show all messages from last boot
logs-last-boot:
    sudo journalctl --no-hostname -b -1

# Enroll Nvidia driver & KMOD signing key for secure boot - Enter password "universalblue" if prompted
enroll-secure-boot-key:
    sudo mokutil --timeout -1
    echo 'The next line will prompt for a MOK password. Then, input "universalblue"'
    sudo mokutil --import /etc/pki/akmods/certs/akmods-ublue.der
    echo 'At next reboot, the mokutil UEFI menu UI will be displayed (*QWERTY* keyboard input and navigation).\nThen, select "Enroll MOK", and input "universalblue" as the password'

# Toggle display of the user-motd in terminal
toggle-user-motd:
    #!/usr/bin/bash
    if test -e "${HOME}/.config/no-show-user-motd"; then
      rm -f "${HOME}/.config/no-show-user-motd"
    else
      if test ! -d "${HOME}/.config"; then
        mkdir "${HOME}/.config"
      fi
      touch "${HOME}/.config/no-show-user-motd"
    fi

# Check for local overrides
check-local-overrides:
    #!/usr/bin/bash
    diff -r \
      --suppress-common-lines \
      --color="always" \
      --exclude "passwd*" \
      --exclude "group*" \
      --exclude="subgid*" \
      --exclude="subuid*" \
      --exclude="machine-id" \
      --exclude="adjtime" \
      --exclude="fstab" \
      --exclude="system-connections" \
      --exclude="shadow*" \
      --exclude="gshadow*" \
      --exclude="ssh_host*" \
      --exclude="cmdline" \
      --exclude="crypttab" \
      --exclude="hostname" \
      --exclude="localtime" \
      --exclude="locale*" \
      --exclude="*lock" \
      --exclude=".updated" \
      --exclude="*LOCK" \
      --exclude="vconsole*" \
      --exclude="00-keyboard.conf" \
      --exclude="grub" \
      --exclude="system.control*" \
      --exclude="cdi" \
      --exclude="default.target" \
      /usr/etc /etc 2>/dev/null | sed '/Binary\ files\ /d'

# Gather device info to a pastebin
device-info:
    #!/usr/bin/bash
    fpaste <(rpm-ostree status) <(fpaste --sysinfo --printonly) <(flatpak list --columns=application,version,options)

# Measure Idle Power Draw
check-idle-power-draw:
    #!/usr/bin/bash
    sudo powerstat -a -r

# vim: set ft=make :

alias upgrade := update

# Update system, flatpaks, and containers all at once
update:
    #!/usr/bin/bash

    # Source brew if we are not in an interactive session
    [[ $- != *i* ]] && source <(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

    /usr/bin/topgrade --config /usr/share/ublue-os/topgrade.toml --keep

# Turn automatic updates on or off
_toggle-updates ACTION="prompt":
    #!/usr/bin/bash
    source /usr/lib/ujust/ujust.sh
    CURRENT_STATE="$(systemctl is-enabled uupd.timer)"
    OPTION={{ ACTION }}
    if [ "$OPTION" == "prompt" ]; then
      echo "Automatic updates are currently: ${bold}${CURRENT_STATE^}${normal}"
      echo "Enable or Disable automatic updates?"
      OPTION=$(ugum choose Enable Disable)
    elif [ "$OPTION" == "help" ]; then
      echo "Usage: ujust toggle-updates <option>"
      echo "  <option>: Specify the quick option - 'enable' or 'disable'"
      echo "  Use 'enable' to Enable automatic updates."
      echo "  Use 'disable' to Disable automatic updates."
      exit 0
    fi
    if [ "${OPTION,,}" == "enable" ]; then
      sudo systemctl enable uupd.timer
    elif [ "${OPTION,,}" == "disable" ]; then
      sudo systemctl disable uupd.timer
    fi

alias changelog := changelogs

# Show the stable changelog
changelogs:
    #!/usr/bin/bash
    CONTENT=$(curl -s https://api.github.com/repos/ublue-os/bazzite/releases/latest | jq -r '.body')
      echo "$CONTENT" | glow -

# Show the testing (pre-release) changelog
changelogs-testing:
    #!/usr/bin/bash
    CONTENT=$(curl -s https://api.github.com/repos/ublue-os/bazzite/releases | jq -r 'map(select(.prerelease)) | .[0].body')
       echo "$CONTENT" | glow -

# vim: set ft=make :

# Enable automatic LUKS unlock via TPM
setup-luks-tpm-unlock:
    #!/usr/bin/bash
    sudo /usr/libexec/luks-enable-tpm2-autounlock

# Disable automatic LUKS unlock via TPM
remove-luks-tpm-unlock:
    #!/usr/bin/bash
    sudo /usr/libexec/luks-disable-tpm2-autounlock

# vim: set ft=make :

alias assemble := distrobox-assemble

# Create distroboxes from a defined manifest
distrobox-assemble CONTAINER="prompt" ACTION="create" FILE="/etc/distrobox/distrobox.ini":
    #!/usr/bin/bash
    # Distroboxes are gathered from distrobox.ini, please add them there
    source /usr/lib/ujust/ujust.sh
    AssembleList {{ FILE }} {{ ACTION }} {{ CONTAINER }}

alias distrobox := distrobox-new

# Create a new custom distrobox
distrobox-new IMAGE="prompt" NAME="prompt" HOMEDIR="":
    #!/usr/bin/bash
    # Please only add distroboxes here if you need special checks and logins!
    source /usr/lib/ujust/ujust.sh
    # Supported images
    IMAGES='
      New
      Bazzite-arch
    '
    IMAGE={{ IMAGE }}
    NAME={{ NAME }}
    HOMEDIR={{ HOMEDIR }}
    ARGS=""
    # Ask user to select an image if we need to prompt
    if [ "$IMAGE" == "prompt" ]; then
      echo "Select what container you want to make"
      IMAGE=$(Choose $IMAGES)
    fi
    # If image is "new"
    if [ "${IMAGE,,}" == "new" ]; then
      echo -en "Please enter an image: "
      read IMAGE
      if [ "$NAME" == "prompt" ]; then
        echo -en "Please enter a name for the container: "
        read NAME
      fi
    elif [ -z "${IMAGE,,}" ]; then
      exit 1
    fi
    # Tailored image selection logic
    # Logic for bazzite-arch
    if [ ${IMAGE,,} == "bazzite-arch" ]; then
      echo "${b}Creating Bazzite distrobox ...${n}"
      if command -v /usr/bin/mutter > /dev/null; then
        IMAGE="ghcr.io/ublue-os/bazzite-arch-gnome"
        NAME="bazzite-arch"
        ARGS="--unshare-netns"
      else
        IMAGE="ghcr.io/ublue-os/bazzite-arch"
        NAME="bazzite-arch"
        ARGS="--unshare-netns"
      fi
    # Anything else
    else
      if [ "$NAME" == "prompt" ]; then
        echo -en "Please enter a name for the container: "
        read NAME
      fi
    fi
    # Create the distrobox
    Distrobox "$IMAGE" "$NAME" "$HOMEDIR" $ARGS
    # If IMAGE is bazzite-arch, link to documentation
    if [ "${IMAGE,,}" == "bazzite-arch" ]; then
      echo $(Urllink "https://github.com/ublue-os/bazzite-arch" "Check out the docs for exportable apps and instructions")
    fi

# Install specialized application containers (like brew)
setup-distrobox-app CONTAINER="prompt":
    #!/usr/bin/bash
    source /usr/lib/ujust/ujust.sh
    AssembleList "/etc/distrobox/apps.ini" create {{ CONTAINER }}

# Install/update DaVinci Resolve, a closed-source video editing utility
install-resolve ACTION="":
    #!/usr/bin/bash
    source /usr/lib/ujust/ujust.sh
    set -eo pipefail
    SCRIPT_URL="https://raw.githubusercontent.com/zelikos/davincibox/10b4b82f0e7f121596b33595f584bc576c03bb3a/setup.sh"
    DOWNLOADDIR=$(xdg-user-dir DOWNLOAD || echo ${HOME})
    tmpdir=/var/tmp/bazzite_davincibox_setup.tmp
    mkdir -p $tmpdir
    trap "rm -rf ${tmpdir}" INT EXIT HUP
    OPTION={{ ACTION }}
    if [ "$OPTION" == "help" ]; then
      echo "Usage: ujust install-resolve <option>"
      echo "  <option>: Specify the quick option to skip the prompt"
      echo "  Use 'install' to select Install/upgrade davincibox"
      echo "  Use 'uninstall' to select Uninstall davincibox"
      exit 0
    elif [ "$OPTION" == "" ]; then
      # Display install state and show options
      INSTALL_STATE=0
      INSTALL_STATE=$(podman container exists davincibox; echo $?)
      if (( $INSTALL_STATE == 0 )); then
        echo "Installed?: ${green}yes${n}"
      else
        echo "Installed?: ${red}no${n}"
      fi
      OPTION=$(Choose \
        "Install/upgrade davincibox" \
        "Uninstall davincibox" \
      )
      if [[ "${OPTION,,}" =~ (^install/upgrade[[:space:]]davincibox) ]]; then
        echo "This script requires you to download the DaVinci Resolve installer (should be a zip file) manually from their website and place it in ${HOME} or ${DOWNLOADDIR}"
        echo "https://www.blackmagicdesign.com/event/davinciresolvedownload"
        echo ""
        echo -e "${b}\033[3mDo not\033[0m ${b}extract the .zip contents, the script will handle everything${n}"
        echo "${lightgrey}TIP: For manual installation, see https://github.com/zelikos/davincibox${n}"
        # Get sure user reads instructions
        ugum confirm || exit 0
        # Download davincibox setup script
        SETUPSCRIPT=/tmp/davincibox_setup.sh
        wget -O $SETUPSCRIPT ${SCRIPT_URL}
        chmod +x $SETUPSCRIPT
        # Check if the installer is in HOME or DOWNLOAD
        shopt -s nullglob && possible_installers=({$HOME,$DOWNLOADDIR}/DaVinci_Resolve_{,Studio_}*_Linux.{zip,run}) \
            && shopt -u nullglob
        runfile=$(Choose ${possible_installers[@]})
        if [[ ! -z $runfile && -f $runfile ]]; then
          if [[ $runfile =~ .zip$ ]]; then
            unzip -o -d "$tmpdir" "$runfile"
            RUNFILE=$(find $tmpdir -executable -name "DaVinci_Resolve_*.run")
          else
            RUNFILE="$runfile"
          fi
          echo "Installer found: ${RUNFILE}"
        else
          echo "${red}Installer not found${n}";
          echo "${red}Please place the file DaVinci_Resolve_*_Linux.run in ${HOME} or ${DOWNLOADDIR}${n}";
          exit 1
        fi
        bash <<< "env -C ${tmpdir} $SETUPSCRIPT $RUNFILE"
        echo "davincibox was successfully installed"
      elif [[ "${OPTION,,}" =~ (^uninstall[[:space:]]davincibox) ]]; then
        ugum confirm "Confirm davincibox uninstall?" || exit 0
        # Remove the existing container
        if podman container exists davincibox >/dev/null 2>&1; then
          echo "Removing existing davincibox container"
          distrobox enter davincibox -- add-davinci-launcher remove
          podman stop davincibox
          podman rm davincibox
        else
          echo "davincibox is not installed, skip..."
          exit 0
        fi
      fi
    else
      echo "Incorrect option"
      exit 1
    fi

alias install-resolve-studio := install-resolve



# vim: set ft=make :

alias broadcom-wl := configure-broadcom-wl

# Configure Broadcom WL driver (Enabling WL breaks numerous other Wi-Fi adapters)
configure-broadcom-wl ACTION="prompt":
    #!/usr/bin/bash
    source /usr/lib/ujust/ujust.sh
    OPTION={{ ACTION }}
    if [ "$OPTION" == "prompt" ]; then
      echo "${bold}Configuring Broadcom Wi-Fi${normal}"
      echo 'Enabling Broadcom WL driver will break numerous other Wi-Fi adapters.'
      echo 'Enable or Disable Broadcom Wl?'
      OPTION=$(ugum choose Enable Disable)
    elif [ "$OPTION" == "help" ]; then
      echo "Usage: ujust configure-broadcom-wl <option>"
      echo "  <option>: Specify the quick option - 'enable' or 'disable'"
      echo "  Use 'enable' to select Enable"
      echo "  Use 'disable' to select Disable"
      exit 0
    fi
    if [ "${OPTION,,}" == "enable" ]; then
      sudo rm -f /etc/modprobe.d/broadcom-wl-blacklist.conf
      sudo rm -f /etc/modprobe.d/default-disable-broadcom-wl.conf
      echo "${bold}Enabled${normal} Broadcom Wireless, please reboot for changes to take effect"
    elif [ "${OPTION,,}" == "disable" ]; then
      sudo ln -sf /dev/null /etc/modprobe.d/broadcom-wl-blacklist.conf
      sudo bash -c 'echo "blacklist wl" > /etc/modprobe.d/default-disable-broadcom-wl.conf'
      echo "${bold}Disabled${normal} Broadcom Wireless, please reboot for changes to take effect"
    fi


# toggles password prompt feedback in terminal, where sudo password prompts will display asterisks when enabled
toggle-password-feedback ACTION="":
    #!/usr/bin/bash
    PWFEEDBACK_FILE="/etc/sudoers.d/enable-pwfeedback"
    OPTION={{ ACTION }}
    if [ "$OPTION" = "on" ]; then
      echo 'Defaults pwfeedback' | sudo tee $PWFEEDBACK_FILE
      echo "enabled, restart terminal to see changes"
    elif [ "$OPTION" = "off" ]; then
      sudo rm -f $PWFEEDBACK_FILE
      echo "disabled pwfeedback. restart your terminal to see changes"
    elif sudo test -f $PWFEEDBACK_FILE; then
      sudo rm -f $PWFEEDBACK_FILE
      echo "disabled pwfeedback. restart your terminal to see changes"
    else
      echo 'Defaults pwfeedback' | sudo tee $PWFEEDBACK_FILE
      echo "enabled, restart terminal to see changes"
    fi

# Create fedora distrobox if it doesn't exist
[private]
distrobox-check-fedora:
    #!/usr/bin/bash
    source /usr/lib/ujust/ujust.sh
    if grep -qvz "fedora" <<< $(distrobox list); then
      echo "Setting up Fedora distrobox"
      Assemble noconfirmcreate "" "fedora"
    fi

# Install Resilio Sync, a file synchronization utility powered by BitTorrent
install-resilio-sync: distrobox-check-fedora
    distrobox-enter -n fedora -- bash -c 'sudo rpm --import https://linux-packages.resilio.com/resilio-sync/key.asc' && \
    distrobox-enter -n fedora -- bash -c 'sudo wget https://raw.githubusercontent.com/ublue-os/bazzite/main/post_install_files/resilio_sync/resilio-sync.repo -O /etc/yum.repos.d/resilio-sync.repo' && \
    distrobox-enter -n fedora -- bash -c 'sudo dnf install -y resilio-sync' && \
    mkdir -p ~/.config/systemd/user/ && \
    rm -f ~/.config/systemd/user/fedora-resilio-sync.service && \
    wget https://raw.githubusercontent.com/ublue-os/bazzite/main/post_install_files/resilio_sync/fedora-resilio-sync.service -O ~/.config/systemd/user/fedora-resilio-sync.service && \
    systemctl --user daemon-reload && \
    systemctl enable --user --now fedora-resilio-sync.service

# Install scrcpy, a utility that mirrors Android devices (video and audio) connected via USB or over TCP/IP
install-scrcpy: distrobox-check-fedora
    distrobox enter -n fedora -- bash -c 'sudo dnf copr enable -y zeno/scrcpy && \
      sudo dnf install -y scrcpy && \
      distrobox-export --app scrcpy'

# Install EmuDeck (https://www.emudeck.com/)
install-emudeck:
    #!/usr/bin/bash
    set -eo pipefail
    remote_appimage_url="$(
        curl -s https://api.github.com/repos/EmuDeck/emudeck-electron/releases/latest | \
        jq -r ".assets[] | select(.name | test(\".*AppImage\")) | .browser_download_url"
    )"
    download_dest="$(xdg-user-dir DOWNLOAD)/EmuDeck.AppImage"
    if ! grep -q 'it.mijorus.gearlever' < <(flatpak list --columns application); then
        flatpak install --system -y flathub it.mijorus.gearlever
    fi
    wget "$remote_appimage_url" -O "$download_dest"
    chmod +x "$download_dest"
    flatpak run it.mijorus.gearlever "$download_dest"

# Install OpenRGB (https://openrgb.org/)
install-openrgb:
    #!/usr/bin/bash
    if grep -q 'it.mijorus.gearlever' <<< $(flatpak list); then
      wget https://openrgb.org/releases/release_0.9/OpenRGB_0.9_x86_64_b5f46e3.AppImage \
        -O $HOME/Downloads/OpenRGB.AppImage
      chmod +x $HOME/Downloads/OpenRGB.AppImage
      flatpak run it.mijorus.gearlever $HOME/Downloads/OpenRGB.AppImage
    else
      wget https://openrgb.org/releases/release_0.9/OpenRGB_0.9_x86_64_b5f46e3.AppImage \
        -O $HOME/Desktop/OpenRGB.AppImage
      chmod +x $HOME/Desktop/OpenRGB.AppImage
    fi


# Install LACT to control your AMD, Nvidia or Intel GPU on a Linux system.
install-lact:
    #!/usr/bin/bash
    rpm-ostree kargs --append-if-missing=$(printf 'amdgpu.ppfeaturemask=0x%x\n' "$(($(cat /sys/module/amdgpu/parameters/ppfeaturemask) | 0x4000))")
    flatpak --system install -y flathub io.github.ilya_zlobintsev.LACT
    echo 'Complete, please reboot to apply changes.'

# Install CoolerControl, a GUI for viewing all your system's sensors and for creating custom fan and pump profiles based on any available temperature sensor28
install-coolercontrol:
    #!/usr/bin/bash
    echo 'Enabling Terra Repository.'
    sudo sed -i 's@enabled=0@enabled=1@g' /etc/yum.repos.d/terra.repo
    echo 'Installing Cooler Control'
    rpm-ostree install -y liquidctl coolercontrol
    echo 'Complete, please reboot to apply changes.'


# vim: set ft=make :

# Setup and configure Sunshine Game Streaming host
setup-sunshine ACTION="":
    #!/usr/bin/bash
    source /usr/lib/ujust/ujust.sh
    SERVICE_STATE="$(systemctl is-enabled --user sunshine.service)"
    OPTION={{ ACTION }}
    if [ "$SERVICE_STATE" == "enabled" ]; then
        SERVICE_STATE="${green}${b}Enabled${n}"
    else
        SERVICE_STATE="${red}${b}Disabled${n}"
    fi
    if [ "$OPTION" == "help" ]; then
      echo "Usage: ujust setup-sunshine <option>"
      echo "  <option>: Specify the quick option to skip the prompt"
      echo "  Use 'enable' to enable the Sunshine service"
      echo "  Use 'disable' to disable the Sunshine service"
      echo "  Use 'portal' to open the Sunshine management portal"
      echo "  Use 'exit' to exit without making changes"
      exit 0
    elif [ "$OPTION" == "" ]; then
      echo "Service is $SERVICE_STATE"
      OPTION=$(Choose "Enable" "Disable" "Open Portal" "Exit")
    fi
    if [[ "${OPTION,,}" =~ ^enable ]]; then
      systemctl enable --user --now sunshine.service
    elif [[ "${OPTION,,}" =~ ^(remove|uninstall|disable) ]]; then
      systemctl disable --user --now sunshine.service
    elif [[ "${OPTION,,}" =~ ^(portal|open) ]]; then
      echo "Opening Sunshine management portal..."
      xdg-open https://localhost:47990
    elif [[ "${OPTION,,}" =~ ^exit ]]; then
      echo "Exiting without making changes."
      exit 0
    fi

# vim: set ft=make :

alias configure-waydroid := setup-waydroid

# Launch Waydroid configuration helper
setup-waydroid ACTION="":
    #!/usr/bin/bash
    source /usr/lib/ujust/ujust.sh
    IMAGE_INFO="/usr/share/ublue-os/image-info.json"
    IMAGE_NAME=$(jq -r '."image-name"' < $IMAGE_INFO)
    OPTION={{ ACTION }}
    if [ "$OPTION" == "help" ]; then
      echo "Usage: ujust configure-waydroid <option>"
      echo "  <option>: Specify the quick option to skip the prompt"
      echo "  Use 'init' to select Initialize Waydroid"
      echo "  Use 'configure' to select Configure Waydroid"
      echo "  Use 'gpu' to choose Select GPU for Waydroid"
      echo "  Use 'integration' to enable desktop window integration for Waydroid"
      echo "  Use 'reset' to select Configure Waydroid"
      exit 0
    elif [ "$OPTION" == "" ]; then
      echo "${bold}Waydroid Setup${normal}"
      echo "Please read the $(Urllink "https://docs.bazzite.gg/Installing_and_Managing_Software/Waydroid_Setup_Guide/" "Waydroid setup documentation") before continuing"
      OPTION=$(Choose "Initialize Waydroid" "Configure Waydroid" "Select GPU for Waydroid" "Reset Waydroid (also removes waydroid-related files from user folder)")
    fi
    if [[ "${OPTION,,}" =~ ^init ]]; then
      if [[ ! $IMAGE_NAME =~ "deck" && ! $IMAGE_NAME =~ "ally" ]]; then
        sudo systemctl enable --now waydroid-container
      fi
      sudo waydroid init -c 'https://ota.waydro.id/system' -v 'https://ota.waydro.id/vendor'
      sudo restorecon -R /var/lib/waydroid
      cp /usr/share/applications/waydroid-container-restart.desktop ~/.local/share/applications
      echo "Waydroid has been initialized, please run waydroid once before you Configure Waydroid"
    elif [[ "${OPTION,,}" =~ ^configure ]]; then
      git clone https://github.com/ublue-os/waydroid_script.git --depth 1 /tmp/waydroid_script
      python -m venv /tmp/waydroid_script/venv
      source /tmp/waydroid_script/venv/bin/activate
      sudo pip install -r /tmp/waydroid_script/requirements.txt
      sudo /tmp/waydroid_script/main.py
      deactivate
      sudo rm -rf /tmp/waydroid_script
    elif [[ "${OPTION,,}" =~ gpu ]]; then
      sudo /usr/bin/waydroid-choose-gpu
    elif [[ "${OPTION,,}" =~ integration ]]; then
      waydroid prop set persist.waydroid.multi_windows true
    elif [[ "${OPTION,,}" =~ ^reset ]]; then
      echo "Resetting Waydroid"
      bash -c 'sudo rm -rf /var/lib/waydroid /home/.waydroid ~/waydroid ~/.share/waydroid ~/.local/share/applications/*aydroid* ~/.local/share/waydroid'
      echo "Waydroid has been reset"
    fi


# vim: set ft=make :

# Setup and configure virtualization and vfio
setup-virtualization ACTION="":
    #!/usr/bin/bash
    source /usr/lib/ujust/ujust.sh
    if [[ $(id -u) -eq 0 ]]; then
      echo "Please do not run this command as root"
      exit 1
    fi
    # Check if we are running on a Steam Deck
    if /usr/libexec/hwsupport/valve-hardware; then
      echo "${red}${b}WARNING${n}: Virtualization is not properly supported on Steam Deck by Valve"
      echo "Use at your own risk and performance may not be ideal."
    fi
    if [ "$(systemctl is-enabled libvirtd.service)" == "disabled" ]; then
      echo "${b}libvirtd${n} service is ${red}disabled${n}!"
      echo "${green}enabling${n} and starting libvirtd"
      echo "If virt-manager says libvirtd.sock is not available after a big update, re-run this command."
      sudo systemctl enable --now libvirtd 2> /dev/null
      echo "Press ESC if you want to exit and do not need to do anything"
    fi
    OPTION={{ ACTION }}
    if [ "$OPTION" == "help" ]; then
      echo "Usage: ujust setup-virtualization <option>"
      echo "  <option>: Specify the quick option to skip the prompt"
      echo "  Use 'virt-on' to select Enable Virtualization"
      echo "  Use 'virt-off' to select Disable Virtualization"
      echo "  Use 'group' to select Add $USER to libvirt group"
      echo "  Use 'vfio-on' to select Enable VFIO drivers"
      echo "  Use 'vfio-off' to select Disable VFIO drivers"
      echo "  Use 'kvmfr' to select Autocreate Looking-Glass shm"
      echo "  Use 'usbhp-on' to select Enable SPICE USB hot plugging"
      echo "  Use 'usbhp-off' to select Disable SPICE USB hot plugging"
      exit 0
    elif [ "$OPTION" == "" ]; then
      echo "${bold}Virtualization Setup${normal}"
      echo "NOTE: Enabling Virtualization will install the virt-manager flatpak and set kernel args"
      OPTION=$(Choose \
        "Enable Virtualization" \
        "Disable Virtualization" \
        "Add $USER to libvirt group" \
        "Enable VFIO drivers" \
        "Disable VFIO drivers" \
        "Enable kvmfr module" \
        "Enable USB hot plugging" \
        "Disable USB hot plugging" \
      )
    fi
    if [[ "${OPTION,,}" =~ (^enable[[:space:]]virtualization|virt-on) ]]; then
        if ! rpm -q virt-manager | grep -P "^virt-manager-" 1>/dev/null; then
          echo "Installing virt-manager..."
          flatpak install flathub org.virt_manager.virt-manager
          rpm-ostree kargs \
          --append-if-missing="kvm.ignore_msrs=1" \
          --append-if-missing="kvm.report_ignored_msrs=0"
          echo "Making sure swtpm will work"
          if [ ! -d "/var/lib/swtpm-localca" ]; then
            sudo mkdir /var/lib/swtpm-localca
          fi
          sudo chown tss /var/lib/swtpm-localca
          sudo restorecon -rv /var/lib/libvirt
          sudo restorecon -rv /var/log/libvirt
          echo "Giving qemu access to read ISO files from $HOME"
          sudo setfacl -m u:qemu:rx $HOME
          if sudo test ! -f "/etc/libvirt/hooks/qemu"; then
            echo "Adding libvirt qemu hooks"
            sudo wget 'https://raw.githubusercontent.com/PassthroughPOST/VFIO-Tools/master/libvirt_hooks/qemu' -O /etc/libvirt/hooks/qemu
            sudo chmod +x /etc/libvirt/hooks/qemu
            sudo grep -A1 -B1 "# Add" /etc/libvirt/hooks/qemu | sed 's/^# //g'
            if sudo test ! -d "/etc/libvirt/hooks/qemu.d"; then
              sudo mkdir /etc/libvirt/hooks/qemu.d
            fi
          fi
          sudo systemctl enable bazzite-libvirtd-setup.service \
            && echo "libvirtd will be enabled at next reboot"
          echo 'Please reboot to apply changes'
        fi
    elif [[ "${OPTION,,}" =~ (^disable[[:space:]]virtualization|virt-off) ]]; then
      if [ "$(systemctl is-enabled libvirtd.service)" == "enabled" ]; then
        echo "${red}Disabling${n} libvirtd before removal"
        sudo systemctl disable --now libvirtd 2> /dev/null
      fi
      if [ "$(systemctl is-enabled bazzite-libvirtd-setup.service)" == "enabled" ]; then
        echo "${red}Disabling${n} bazzite-libvirtd-setup"
        sudo systemctl disable --now bazzite-libvirtd-setup.service 2> /dev/null
      fi
      echo "Removing virt-manager..."
      flatpak uninstall org.virt_manager.virt-manager
      rpm-ostree kargs \
      --delete-if-present="kvm.ignore_msrs=1" \
      --delete-if-present="kvm.report_ignored_msrs=0"
      echo 'Please reboot to apply changes'
    elif [[ "${OPTION,,}" =~ (^enable[[:space:]]vfio|vfio-on) ]]; then
      # Check if we are running on a Steam Deck
      if /usr/libexec/hwsupport/valve-hardware; then
        echo "IOMMU is not supported on Steam Deck"
        exit 0
      fi
      echo "Enabling VFIO..."
      VIRT_TEST=$(rpm-ostree kargs)
      CPU_VENDOR=$(grep "vendor_id" "/proc/cpuinfo" | uniq | awk -F": " '{ print $2 }')
      VENDOR_KARG="unset"
      if [[ ${VIRT_TEST} == *kvm.report_ignored_msrs* ]]; then
        rpm-ostree initramfs --enable
        if [[ ${CPU_VENDOR} == "AuthenticAMD" ]]; then
          VENDOR_KARG="amd_iommu=on"
        elif [[ ${CPU_VENDOR} == "GenuineIntel" ]]; then
          VENDOR_KARG="intel_iommu=on"
        fi
        if [[ ${VENDOR_KARG} == "unset" ]]; then
          echo "Failed to get CPU vendor, exiting..."
          exit 1
        else
          rpm-ostree kargs \
            --append-if-missing="${VENDOR_KARG}" \
            --append-if-missing="iommu=pt" \
            --append-if-missing="rd.driver.pre=vfio-pci" \
            --append-if-missing="vfio_pci.disable_vga=1"
          echo "VFIO will be enabled on next boot, make sure you enable IOMMU, VT-d or AMD-v in your BIOS!"
          echo "Please understand that since this is such a niche use case, support will be very limited!"
          echo 'Use the command "ls-iommu -grk" to get iommu information about your GPUs, use the "--help" flag for more options'
          echo ""
          echo "${b}Systems with multiple GPUs${n}"
          echo "Bind your unused/second GPU device ids to the vfio driver by running"
          echo 'rpm-ostree kargs --append-if-missing="vfio_pci.ids=xxxx:yyyy,xxxx:yyzz"'
          echo "You will require a $(Urllink "https://www.amazon.com/s?k=hdmi+displayport+dummy+plug" "Dummy HDMI/DisplayPort plug (Ghost Adapter)") or hook the GPU"
          echo "to a separate monitor input in order to turn the GPU on when starting the VM."
          echo "NOTE: Your second GPU should be as different as possible from your main GPU and will not be usable by the host after you bind it to the vfio driver!"
          echo ""
          echo "${b}Systems with 1 GPU${n}"
          echo "Once rebooted you can continue setting up whatever scripts and hooks you need"
          echo "to get Single GPU passthrough working, however ${u}you will be on your own${n}."
          echo "${b}Do not ask for support for setting up Single GPU Passthrough, we can not help you!${n}"
        fi
      fi
    elif [[ "${OPTION,,}" =~ (^disable[[:space:]]vfio|vfio-off) ]]; then
      # Check if we are running on a Steam Deck
      if /usr/libexec/hwsupport/valve-hardware; then
        echo "IOMMU is not supported on Steam Deck"
        exit 0
      fi
      echo ""
      echo "Make sure you have ${b}disabled autostart of all VMs using VFIO${n} before continuing!"
      CONFIRM=$(Choose Cancel Continue)
      if [ "$CONFIRM" == "Continue" ]; then
        echo "Disabling VFIO..."
        VFIO_IDS="$(rpm-ostree kargs | sed -E 's/.+(vfio_pci.ids=.+\s)/\1/' | awk '{ print $1 }' | grep vfio_pci.ids)"
        VFIO_IDS_KARG=""
        if [ -n "$VFIO_IDS" ]; then
          echo "Found VFIO ids in kargs, adding the below line to removal list"
          echo "$VFIO_IDS"
          VFIO_IDS_KARG="--delete-if-present=\"$VFIO_IDS\""
        fi
        KVMFR_VAL="$(rpm-ostree kargs | sed -E 's/.+(kvmfr.static_size_mb=.+\s)/\1/' | awk '{ print $1 }' | grep kvmfr.static_size_mb)"
        KVMFR_KARG=""
        if [ -n "$KVMFR_VAL" ]; then
          echo "Found KVMFR static_size_mb in kargs, adding the below line to removal list"
          echo "$KVMFR_VAL"
          KVMFR_KARG="--delete-if-present=\"$KVMFR_VAL\""
        fi
        echo "Removing deprecated dracut modules"
        sudo rm /etc/dracut.conf.d/vfio.conf
        sudo rm /etc/modprobe.d/kvmfr.conf
        rpm-ostree kargs \
        --delete-if-present="iommu=pt" \
        --delete-if-present="iommu=on" \
        --delete-if-present="amd_iommu=on" \
        --delete-if-present="intel_iommu=on" \
        --delete-if-present="rd.driver.pre=vfio-pci" \
        --delete-if-present="vfio_pci.disable_vga=1" \
        --delete-if-present="vfio_pci.disable_vga=0" \
        $VFIO_IDS_KARG \
        $KVMFR_KARG
      fi
    elif [[ "${OPTION,,}" =~ kvmfr ]]; then
      # Check if we are running on a Steam Deck
      if /usr/libexec/hwsupport/valve-hardware; then
        echo "IOMMU is not supported on Steam Deck"
        exit 0
      fi
      echo "$(Urllink "https://looking-glass.io/docs/rc/ivshmem_kvmfr/#libvirt" "This module") along with $(Urllink "https://looking-glass.io" "Looking Glass") is very experimental and not recommended for production use!"
      echo "The ublue team packages the kvmfr module only because it has to be supplied with the system image while using an atomic desktop."
      echo "If you do plan to use Looking Glass, please $(Urllink "https://docs.bazzite.gg/Advanced/looking-glass/" "follow the guide here") on how to compile it for your system."
      echo "To use the kvmfr module after enabling it, just add and edit the xml for libvirt from the documentation in the first link."
      echo "Since we package the kvmfr module please open kvmfr related issues you have on Bazzite"
      echo "in the $(Urllink "https://discord.bazzite.gg/" "Bazzite Discord") or the $(Urllink "https://github.com/ublue-os/bazzite/issues" "Bazzite Github issue tracker")."
      echo "~ @HikariKnight"
      CONFIRM=$(Choose Ok Cancel)
      if [ "$CONFIRM" == "Cancel" ]; then
        exit 0
      fi
      echo ""
      echo "Setting up kvmfr module so it loads next boot"
      if [ -f "/etc/modprobe.d/kvmfr.conf" ]; then
        echo "Re-creating dummy kvmfr modprobe file"
        sudo rm /etc/modprobe.d/kvmfr.conf
      fi
      sudo bash -c 'cat << KVMFR_MODPROBE > /etc/modprobe.d/kvmfr.conf
    # This is a dummy file and changing it does nothing
    # If you want to change the kvmfr static_size_mb
    # Run "rpm-ostree kargs --replace=kvmfr.static_size_mb=oldvalue=newvalue"
    # Default value set by us is 128 which is enough for 4k SDR
    # Find the current value by running "rpm-ostree kargs"
    KVMFR_MODPROBE'
      rpm-ostree kargs --append-if-missing="kvmfr.static_size_mb=128" --append-if-missing="split_lock_detect=off"
      if [ -f "/etc/udev/rules.d/99-kvmfr.rules" ]; then
        echo "Re-creating kvmfr udev rules"
        sudo rm /etc/udev/rules.d/99-kvmfr.rules
      fi
      echo "Adding udev rule for /dev/kvmfr0"
      sudo bash -c 'cat << KVMFR_UDEV > /etc/udev/rules.d/99-kvmfr.rules
    SUBSYSTEM=="kvmfr", OWNER="'$USER'", GROUP="qemu", MODE="0660"
    KVMFR_UDEV'
      echo "Adding /dev/kvmfr0 to qemu cgroup_device_acl"
      sudo perl -0777 -pi -e 's/
    #cgroup_device_acl = \[
    #    "\/dev\/null", "\/dev\/full", "\/dev\/zero",
    #    "\/dev\/random", "\/dev\/urandom",
    #    "\/dev\/ptmx", "\/dev\/kvm",
    #    "\/dev\/userfaultfd"
    #\]
    /
    cgroup_device_acl = \[
        "\/dev\/null", "\/dev\/full", "\/dev\/zero",
        "\/dev\/random", "\/dev\/urandom",
        "\/dev\/ptmx", "\/dev\/kvm",
        "\/dev\/userfaultfd", "\/dev\/kvmfr0"
    \]
    /' /etc/libvirt/qemu.conf
      echo "Adding SELinux context record for /dev/kvmfr0"
      sudo semanage fcontext -a -t svirt_tmpfs_t /dev/kvmfr0
      echo "Adding SELinux access rules for /dev/kvmfr0"
      if [ ! -d "$HOME/.config/selinux_te/mod" ]; then
        mkdir -p "$HOME/.config/selinux_te/mod"
      fi
      if [ ! -d "$HOME/.config/selinux_te/pp" ]; then
        mkdir -p "$HOME/.config/selinux_te/pp"
      fi
      if [ -f "$HOME/.config/selinux_te/kvmfr.te" ]; then
        echo "Re-creating kvmfr selinux type enforcement rules"
        rm $HOME/.config/selinux_te/kvmfr.te
      fi
      bash -c "cat << KVMFR_SELINUX > $HOME/.config/selinux_te/kvmfr.te
    module kvmfr 1.0;

    require {
        type device_t;
        type svirt_t;
        class chr_file { open read write map };
    }

    #============= svirt_t ==============
    allow svirt_t device_t:chr_file { open read write map };
    KVMFR_SELINUX"
      echo "This is the type enforcement we wrote for SELinux and you can find it in $HOME/.config/selinux_te/kvmfr.te"
      echo "#======= start of kvmfr.te ======="
      cat "$HOME/.config/selinux_te/kvmfr.te"
      echo "#======== end of kvmfr.te ========"
      checkmodule -M -m -o "$HOME/.config/selinux_te/mod/kvmfr.mod" "$HOME/.config/selinux_te/kvmfr.te"
      semodule_package -o "$HOME/.config/selinux_te/pp/kvmfr.pp" -m "$HOME/.config/selinux_te/mod/kvmfr.mod"
      sudo semodule -i "$HOME/.config/selinux_te/pp/kvmfr.pp"
      echo "Loading kvmfr module so you do not have to reboot to use it the first time"
      sudo modprobe kvmfr static_size_mb=128
      sudo chown $USER:qemu /dev/kvmfr0
      echo ""
      echo "Kvmfr0 $(Urllink "https://looking-glass.io/docs/B7-rc1/install_libvirt/#determining-memory" "static size is set to 128mb by default")"
      echo "this will work with up to 4K SDR resolutiion, as most dummy plugs go up to 4K"
      echo "some games will try use the adapters max resolution on first boot and cause issues if the value is too low."
      echo "Most ghost display adapters max out at 4k, hence the default value of 128mb."
      echo ""
      echo "If you need to change it to a different value"
      echo "you can do that by running \"rpm-ostree kargs --replace=kvmfr.static_size_mb=128=newvalue\""
      echo "You can check the current kernel arguments with \"rpm-ostree kargs\""
      echo "$(Urllink "https://looking-glass.io/docs/rc/ivshmem_kvmfr/#libvirt" "Please read official documentation for kvmfr for how to use it")"
      echo "${b}NOTE: You can start using kvmfr right now without rebooting if you already rebooted after enabling VFIO.${n}"
      CONFIRM=$(Choose OK)
    elif [[ "${OPTION,,}" =~ (^enable[[:space:]]usb|usbhp-on) ]]; then
      echo "Adding udev rule for USB devices"
      sudo bash -c 'cat << USBHP_UDEV > /etc/udev/rules.d/72-usbhp.rules
    ACTION=="add" SUBSYSTEM=="usb", TAG+="uaccess"
    USBHP_UDEV'
    elif [[ "${OPTION,,}" =~ (^disable[[:space:]]usb|usbhp-off) ]]; then
      sudo bash -c 'rm /etc/udev/rules.d/72-usbhp.rules'
    elif [[ "${OPTION,,}" =~ group ]]; then
      if ! grep -q "^libvirt" /etc/group; then
        grep '^libvirt' /usr/lib/group | sudo tee -a /etc/group > /dev/null
      fi
      sudo usermod -aG libvirt $USER
    fi


# runs ryzenadj --max-performance on AC power change
enable-ryzenadj-max-performance:
    #/bin/bash
    # credit to adolforegosa on discord for the original fix
    echo 'this fix sets ryzenadj --max-performance whenever AC status changes to battery from plugged-in'
    echo 'ACTION=="add|change", SUBSYSTEM=="power_supply", ATTR{online}=="0", RUN+="/bin/sh -c '/usr/bin/ryzenadj --max-performance'"' | sudo tee "/etc/udev/rules.d/99-ryzenadj-power-source-change.rules" > /dev/null

    sudo udevadm control --reload-rules
    echo 'installation complete. Reboot to take effect'


# toggles password prompt feedback in terminal, where sudo password prompts will display asterisks when enabled
toggle-password-feedback ACTION="":
    #!/usr/bin/bash
    PWFEEDBACK_FILE="/etc/sudoers.d/enable-pwfeedback"
    OPTION={{ ACTION }}

    if [ "$OPTION" = "on" ]; then
      echo 'Defaults pwfeedback' | sudo tee $PWFEEDBACK_FILE
      echo "enabled, restart terminal to see changes"
    elif [ "$OPTION" = "off" ]; then
      sudo rm -f $PWFEEDBACK_FILE
      echo "disabled pwfeedback. restart your terminal to see changes"
    elif sudo test -f $PWFEEDBACK_FILE; then
      sudo rm -f $PWFEEDBACK_FILE
      echo "disabled pwfeedback. restart your terminal to see changes"
    else
      echo 'Defaults pwfeedback' | sudo tee $PWFEEDBACK_FILE
      echo "enabled, restart terminal to see changes"
    fi

# vim: set ft=make :

# Set up DLSS-Enabler Upscaling and Framegen mod. This mod replaces DLSS upscaling and frame generation with FSR3 equivalents in supported games.
get-framegen ACTION="prompt":
    #!/usr/bin/bash
    source /usr/lib/ujust/ujust.sh
    FG_FILES=(
        "amd_fidelityfx_dx12.dll" "dlssg_to_fsr3_amd_is_better.dll" "libxess.dll"
        "amd_fidelityfx_vk.dll" "dlssg_to_fsr3.ini"
        "d3dcompiler_47.dll" "dxgi.dll" "nvapi64.dll"
        "DisableNvidiaSignatureChecks.reg" "dxvk.conf" "_nvngx.dll"
        "dlss-enabler.dll" "fakenvapi.ini" "nvngx.ini"
        "dlss-enabler-upscaler.dll" "fgmod" "nvngx-wrapper.dll"
        "dlssg_to_fsr3_amd_is_better-3.0.dll" "fgmod-uninstaller.sh" "RestoreNvidiaSignatureChecks.reg"
    )
    function check_fgmod_installed() {
        FG_DIR="$HOME/fgmod"
        if [[ -d "$FG_DIR" ]]; then
            for file in "${FG_FILES[@]}"; do
                # Check if 'licenses' is a directory
                if [[ "$file" == "licenses" ]]; then
                    if [[ ! -d "$FG_DIR/$file" ]]; then
                        echo "${yellow}${bold}FGmod is partially installed. 'licenses' is missing or not a directory.${normal}"
                        return
                    fi
                elif [[ ! -f "$FG_DIR/$file" ]]; then
                    echo "${yellow}${bold}FGmod is partially installed. Missing file: ${file}${normal}"
                    return
                fi
            done
            echo "${green}${bold}FGmod is installed and ready to use.${normal}"
        else
            echo "${red}${bold}FGmod is not installed.${normal}"
        fi
    }
    function check_decky_installed() {
        PLUGIN_DIR="$HOME/homebrew/plugins/Decky-Framegen"
        if [[ -d "$PLUGIN_DIR" ]]; then
            echo "${green}${bold}Decky Framegen plugin is installed.${normal}"
        else
            echo "${red}${bold}Decky Framegen plugin is not installed.${normal}"
        fi
    }
    OPTION={{ ACTION }}
    if [ "$OPTION" == "prompt" ]; then
        echo ""
        echo "Current Status:"
        check_fgmod_installed
        echo ""
        check_decky_installed
        echo ""
        echo "${bold}FGmod${normal} enables the replacement of DLSS Upscaling and Framegen with FSR3 equivalents."
        echo ""
        echo "Below you can install or remove ${bold}FGmod${normal} files,"
        echo "or install the ${bold}Decky Framegen${normal} plugin for managing everything conveniently in Game Mode."
        echo ""
        echo "To patch a Steam game after installation, use the launch option: '~/fgmod/fgmod %COMMAND%'"
        echo "To revert changes to the game's files, use: '~/fgmod/fgmod-uninstaller.sh %COMMAND%'"
        echo ""
        echo "What would you like to do with FGmod?"
        echo ""
        OPTION=$(ugum choose "Install Decky Framegen plugin" "Install FGmod" "Uninstall FGmod" "Exit without changes")
    elif [ "$OPTION" == "help" ]; then
        echo "Usage: just get-framegen <option>"
        echo "  <option>: Specify an action - 'install', 'install-decky-plugin', or 'uninstall'"
        echo "  Use 'install' to install FGmod."
        echo "  Use 'install-decky-plugin' to install the Decky Framegen plugin."
        echo "  Use 'uninstall' to remove FGmod."
        exit 0
    fi
    if [ "${OPTION,,}" == "install" ] || [ "${OPTION,,}" == "install fgmod" ]; then
        echo "Installing FGmod..."
        TMP_DIR=$(mktemp -d) && cd "$TMP_DIR"
        git clone https://github.com/xXJSONDeruloXx/fgmod-bazzite.git .
        chmod +x prepare.sh
        ./prepare.sh
        echo "FGmod installed successfully!"
        echo "To patch a game, add the launch option '~/fgmod/fgmod %COMMAND%' in its settings."
    elif [ "${OPTION,,}" == "install-decky-plugin" ] || [ "${OPTION,,}" == "install decky framegen plugin" ]; then
        echo "Installing Decky Framegen plugin..."
        API_URL="https://api.github.com/repos/xXJSONDeruloXx/Decky-Framegen/releases/latest"
        PLUGIN_URL=$(curl -s "$API_URL" | grep "browser_download_url" | grep ".zip" | cut -d '"' -f 4)

        if [ -z "$PLUGIN_URL" ]; then
            echo "Failed to fetch the latest Decky Framegen release. Exiting..."
            exit 1
        fi
        PLUGIN_NAME="Decky-Framegen"
        PLUGIN_DIR="$HOME/homebrew/plugins"
        if [ ! -d "$PLUGIN_DIR" ]; then
            echo "Creating plugins directory with sudo..."
            sudo mkdir -p "$PLUGIN_DIR"
        fi
        cd "$PLUGIN_DIR" || { echo "Failed to navigate to plugins directory"; exit 1; }
        if [ -d "$PLUGIN_NAME" ]; then
            echo "Removing existing $PLUGIN_NAME directory with sudo..."
            sudo rm -rf "$PLUGIN_NAME"
        fi
        echo "Downloading $PLUGIN_NAME from $PLUGIN_URL..."
        sudo curl -L -o "${PLUGIN_NAME}.zip" "$PLUGIN_URL"
        if [ $? -ne 0 ]; then
            echo "Download failed!"
            exit 1
        fi
        echo "Extracting $PLUGIN_NAME..."
        sudo unzip -o "${PLUGIN_NAME}.zip" -d .
        if [ $? -ne 0 ]; then
            echo "Extraction failed!"
            exit 1
        fi
        if [ -d "./${PLUGIN_NAME}/${PLUGIN_NAME}" ]; then
            echo "Fixing folder structure..."
            sudo mv ./${PLUGIN_NAME}/${PLUGIN_NAME}/* ./${PLUGIN_NAME}/
            sudo rm -rf ./${PLUGIN_NAME}/${PLUGIN_NAME}
        fi
        echo "Cleaning up..."
        sudo rm -f "${PLUGIN_NAME}.zip"
        echo "$PLUGIN_NAME has been installed successfully to $PLUGIN_DIR!"
        echo "Please restart Decky Loader to activate the plugin."
    elif [ "${OPTION,,}" == "uninstall" ] || [ "${OPTION,,}" == "uninstall fgmod" ]; then
        echo "Uninstalling FGmod..."
        if [[ -d "$HOME/fgmod" ]]; then
            rm -rf "$HOME/fgmod"
        fi
        downloads_dir="$HOME/Downloads"
        files_to_remove=("prepare.sh" "fgmod.sh" "fgmod-uninstaller.sh")
        for file in "${files_to_remove[@]}"; do
            if [[ -f "$downloads_dir/$file" ]]; then
                rm "$downloads_dir/$file"
            fi
        done
        echo "FGmod removed successfully!"
    elif [ "${OPTION,,}" == "exit" ] || [ "${OPTION,,}" == "exit without changes" ]; then
        echo "No changes made. Exiting..."
        exit 0
    else
        echo "Invalid option. Exiting..."
        exit 1
    fi




```
