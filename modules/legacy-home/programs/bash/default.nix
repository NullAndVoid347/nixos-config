{ custom, ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
    shellAliases = {
        c-update-config = "sudo -i nixos-rebuild switch";
        c-update-system = "sudo -i nixos-rebuild switch --upgrade-all --commit-lock-file";
        c-update-firmware = "sudo fwupdmgr update";
        c-update-flakes = "sudo nix flake update --commit-lock-file";
        c-update-home = "home-manager switch";
        c-test-config-full = "sudo -i nixos-rebuild build-vm";
        c-test-config-medium = "sudo -i nixos-rebuild dry-activate";
        c-test-config-light = "sudo nix flake check";
        c-clean-store = "sudo nix-store --optimise && sudo nix-store --gc";
        c-debug-store = "sudo find -H /nix/var/nix/gcroots/auto -type l | xargs -I {} sh -c 'readlink {}; realpath {}; echo'";
        c-list-gens = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
        c-clean-gens = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
        c-reload-kde = "systemctl --user restart plasma-plasmashell";
        c-reload-shell = "source ~/.bashrc";
        c-update-all = "";
        c-clean-all = "";
        c-debug-home = "journalctl --unit home-manager-${custom.variables.username}.service"; #--since=DATE
    };
  };
}
