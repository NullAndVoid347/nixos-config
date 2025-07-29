{pkgs, ...}:
{

  # environment.systemPackages = [ pkgs.alpaca ];

  # Use this instead if you want an instance self contained within alpaca
  # environment.systemPackages = [
  #   (pkgs.alpaca.override {
  #     ollama = pkgs.ollama-rocm;
  #     })
  # ];

  services.ollama = {
    enable = true;
    acceleration = "rocm";
    host = "127.0.0.1";
    port = 11434;
    openFirewall = true;
    # home = "/data/ollama";
    # Optional: preload models, see https://ollama.com/library
    # loadModels = [ "llama3.2:3b" "deepseek-r1:1.5b"];
    # environmentVariables = {
    #   HSA_OVERRIDE_GFX_VERSION = "11.0.2";
    # };
  };

  # services.open-webui = {
  #   enable = true;
  #   environment = {
  #     ANONYMIZED_TELEMETRY = "False";
  #     DO_NOT_TRACK = "True";
  #     SCARF_NO_ANALYTICS = "True";
  #     OLLAMA_API_BASE_URL = "http://127.0.0.1:11434/api";
  #     OLLAMA_BASE_URL = "http://127.0.0.1:11434";
  #     # Disable authentication
  #     WEBUI_AUTH = "False";
  #   };
  # };

}
