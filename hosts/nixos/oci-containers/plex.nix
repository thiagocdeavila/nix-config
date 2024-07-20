{...}: let
  plexConfigDir = "/var/lib/plex/";
in {
  networking = {
    firewall.allowedTCPPorts = [
      32400 # Web Interface/ Remote Access
    ];
    firewall.allowedUDPPorts = [
      1900 # DLNA
      5353 # Bonjour/Avahi
      32410 # GDM network discovery
      32412 # GDM network discovery
      32413 # GDM network discovery
      32414 # GDM network discovery
      # 32469 # Plex DLNA Server
    ];
  };

  virtualisation.oci-containers = {
    backend = "podman";
    containers.plex = {
      autoStart = false;
      image = "plexinc/pms-docker";
      extraOptions = ["--network=host" "--no-healthcheck"];
      volumes = [
        "${plexConfigDir}/database/:/config"
        "${plexConfigDir}/transcode/:/transcode"
        "/mnt/external-ssd/Plex:/media"
      ];
    };
  };
}
