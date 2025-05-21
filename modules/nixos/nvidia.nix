{lib, config, pkgs, ...}:
let 
    cfg = config.nvidia_stuff;
in
{
    options.nvidia_stuff = {
        enable = lib.mkEnableOption "enables nvidia driver support";
    };

    config = lib.mkIf cfg.enable {
          services.xserver = {
              enable = true;
              videoDrivers = [ "nvidia" ];
          }; 
          hardware.nvidia = {
              modesetting.enable = true;
              nvidiaSettings = true;
              package = config.boot.kernelPackages.nvidiaPackages.latest;
              open=false;
              powerManagement.enable = false;
          };
          hardware.nvidia.prime = {
              intelBusId = "PCI:0:2:0";
              nvidiaBusId = "PCI:1:00:0";
          };
    };
}
