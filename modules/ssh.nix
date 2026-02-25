# {inputs, pkgs, system, ...}:
# {
#   imports = [
#     inputs.tarmoqchi.nixosModules.tarmoqchi
#     inputs.tarmoqchi.nixosModules.tarmoqchi
#   ];

#   services.tarmoqchi.database.host = "127.0.0.1";

#   # environment.systemPackages = with pkgs; [
#   #   ngrok
#   # ];

#   # services.ngrok = {
#   #   enable = true;
#   #   endpoints = [
#   #     {
#   #       name = "macbook";
#   #       upstream.url = "22";
#   #     }
#   #   ];
#   #   extraConfigFiles = [
#   #     ${config.home.homeDirectory}/.config/sops/age/ngrok.yaml
#   #   ]
#   # };

#   services.openssh = {
#     enable = true;
#     ports = [ 9876 22 ];
#     settings = {
#       PasswordAuthentication = false;
#       KbdInteractiveAuthentication = false;
#       PermitRootLogin = "yes";
#       AllowUsers = [ "muhammad" ];
#     };
#     # knownHosts = {
#     #   Muhammad-MacBook = {
#     #     publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC2XIqQNVhEGxJzPPrevfU8+7xl9/pKtOiMR+a3ZbgUO mukhammad.kammoliddin@gmail.com"
#     #   }
#     # }
#   };

#   networking.firewall = {
#     enable = true;
#     allowedTCPPorts = [ 80 443 9876 22 ];
#     allowedUDPPortRanges = [
#       { from = 4000; to = 4007; }
#       { from = 8000; to = 8010; }
#     ];
#   };
# }
