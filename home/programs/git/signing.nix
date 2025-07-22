# This file is used to sign git commits using an SSH key.
{
  # Obviously, change this to your own SSH key.
  home.file.".ssh/allowed_signers".text = "* ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFaDI8rwpE+yYLQcuNw239fURQCUsWA0TXo4ZwPOKiVb null@null-fw13";

  programs.git.extraConfig = {
    commit.gpgsign = true;
    gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    gpg.format = "ssh";
    user.signingkey = "~/.ssh/signing-key.pub";
  };
}