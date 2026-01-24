{ pkgs, ... }:

{
    boot.kernelParams = [ 
    "intel_idle.max_cstate=4"
    ];
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
       efiSupport = true;
       device = "nodev";
       useOSProber = true;
       #theme = "${(pkgs.callPackage ./../grub-themes/CyberGRUB-2077.nix {}).CyberGRUB-2077}/grub/themes/CyberGRUB-2077";
       theme = "${(pkgs.callPackage ./../grub-themes/LainGrubTheme.nix {}).LainGrubTheme}/grub/themes/LainGrubTheme";
       #theme = "${(pkgs.callPackage ./../grub-themes/Grub_Souls_III.nix {}).Grub_Souls_III}/grub/themes/Grub_Souls_III";
       #theme = "${(pkgs.callPackage ./../grub-themes/hollow-knight-grub.nix {}).hollow-knight-grub}/grub/themes/hollow-knight-grub";

    };
  };
  boot.plymouth = {
    enable = false;
    theme = "ds3";
    themePackages = [
      (pkgs.callPackage ./../plymouth/DS3_plymouth_theme.nix {}).DS3_plymouth_theme
      ];
    };


}
