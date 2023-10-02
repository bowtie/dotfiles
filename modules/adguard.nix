{ pkgs, lib, ... }: {
  config = {
    networking = {
      firewall = {
        allowedTCPPorts = [ 3000 ];
        allowedUDPPorts = [ 53 ];
      };
    };

    services = {
      adguardhome = {
        enable = true;
        openFirewall = true;
        settings = {
          bind_port = 3000;
          dns = {
            # bind_hosts = [ "0.0.0.0" ];
            bind_host = "0.0.0.0";
            edns_client_subnet.enabled = false;
            upstream_dns = [
              "192.168.1.1:53"
            ];
            bootstrap_dns =
              [ "9.9.9.10" "149.112.112.10" "2620:fe::10" "2620:fe::fe:10" ];
            resolve_clients = true;
            statistics.interval = "24h";
          };
        };
        extraArgs = [
        # Router knows best, i.e. stop returning 127.0.0.1 for DNS calls for self
        "--no-etc-hosts"
        ];
      };
    };
  };
}
