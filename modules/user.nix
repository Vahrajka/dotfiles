{ ... }:

{
  users.users.zayd = {
    isNormalUser = true;
    description = "zayd";
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
  };
}
