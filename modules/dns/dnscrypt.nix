{lib, ...}: {
  # Disable management of DNS via NetworkManager and override the default DNS to be localhost so that we can use the Encrypted DNS service networking = {
  networking = {
    nameservers = ["::1"];
    networkmanager.dns = "none";
  };

  services = {
    # Making sure services.resolved is off
    resolved = {
      enable = false;
    };

    dnscrypt-proxy2 = {
      enable = true;
      settings = {
        ipv6_servers = false;
        require_dnssec = true;
        require_nolog = true;
        listen_addresses = ["[::1]:51"];

        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
          cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        };
        # You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
        # server_names = [ ... ];
      };
    };
  };

  # Forward loopback traffic on port 53 to dnscrypt-proxy2.
  networking.firewall.extraCommands = ''
    ip6tables --table nat --flush OUTPUT
    ${lib.flip (lib.concatMapStringsSep "\n") ["udp" "tcp"] (proto: ''
      ip6tables --table nat --append OUTPUT \
        --protocol ${proto} --destination ::1 --destination-port 53 \
        --jump REDIRECT --to-ports 51
    '')}
  '';

  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
  };
}