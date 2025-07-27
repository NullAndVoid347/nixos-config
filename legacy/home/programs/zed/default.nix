{ pkgs, lib, ... }: {
  programs.zed-editor = {
    enable = true;
    extensions = [
#       "html"
#       "toml"
      "nix"
      # "ron"
      "git-firefly"
      # Languages
      "nix"
      # "gosum"
      # "cue"
      # "rhai"
      # "zig"
      # "sql"
      # Templating
      # "jsonnet"
      # "jinja2"
      # Shells
#       "basher"
      "nu"
      # Tools
      # "proto"
      # "log"
      # "env"
      # "live-server"
      # Build
#       "make"
#       "just"
      # DevOps
#       "dockerfile"
#       "docker-compose"
      # "helm"
      # "terraform"
      # "kdl"
      # Formats
#       "toml"
#       "cargo-tom"
#       "csv"
#       "ini"
      # "scheme"
      # "asciidoc"
#       "http"
      # Themes
      # "catppuccin"
      # "tokyo-night"
#       "one-dark-pro"
      # "catppuccin-blur"
    ];
    extraPackages = with pkgs; [
      nixd
      nil
      alejandra
    ];
    userSettings = {
#       features = {
#         inline_completion_provider = "none";
#       };
#       assistant.enabled = false;
      autosave.after_delay.milliseconds = 1000;
      tab_size = 2;
      vim_mode = false;
      soft_wrap = "editor_width";
      terminal = {
        copy_on_select = true;
        env = {};
      };
#       theme = lib.mkDefault {
#         mode = "dark";
#         light = "One Light";
#         dark = "One Dark";
#       };
      show_whitespaces = "none";
      lsp = {
        nil = {
          initialization_options = {
            formatting.command = [ "nixfmt" ];
          };
        };
        nix = {
          binary = {
            path_lookup = true;
          };
        };
        # rust-analyzer = {
        #   binary.path_lookup = true;
        # };
        # zls.binary.path_lookup = true;
      };
      languages = {
        Nix = {
          tab_size = 2;
          language_servers = [
            "nil"
            "!nixd"
          ];
          formatter.external.command = "nixfmt";
        };
      };
    };
  };
}
