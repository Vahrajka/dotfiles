{ ... }:

{
  services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

       #Optional helps save long term battery health
       STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
       WIFI_PWR_ON_BAT = "off";  # Disables WiFi power saving on battery
       WIFI_PWR_ON_AC = "off";   # Disables WiFi power saving when plugged in
      };
};
  services.upower.enable = true;

}
