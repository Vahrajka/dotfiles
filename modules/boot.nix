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
       #theme = "${(pkgs.callPackage ./../grub-themes/hollow-knight-grub.nix {}).hollow-knight-grub}/grub/themes/hollow-knight-grub";

    };
  };

}
