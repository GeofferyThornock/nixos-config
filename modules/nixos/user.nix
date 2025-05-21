{lib, config, pkgs, ...}:
let 
    cfg = config.main_user;
in
{
    options.main_user = {
        enable 
            = lib.mkEnableOption "enable user module";

        userName = lib.mkOption {
            default = "mainuser";
            description = ''
                username
            '';
        };
    };




    config = lib.mkIf cfg.enable {
        programs.zsh.enable = true;
        users.users.${cfg.userName} = {
            isNormalUser = true;
            description = "main user";
            extraGroups = ["wheel" "networkmanager"];
            shell = pkgs.zsh;
        };
    };
}





