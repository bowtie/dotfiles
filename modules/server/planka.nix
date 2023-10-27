{pkgs, ...}: {
  virtualisation.oci-containers.containers = {
    planka = {
      image = "ghcr.io/plankanban/planka:latest";
      extraOptions = ["--network=planka-bridge"];
      ports = ["8085:1337"];

      volumes = [
        "${userAvatars}:/app/public/user-avatars"
        "${projectBackgroundImages}:/app/public/project-background-images"
        "${attachaments}:/app/private/attachements"
      ];

      environment = {
        BASE_URL = "http://planka.service";
        TRUST_PROXY = "1";
        # TODO: SOPS-Nix:
        DATABASE_URL = "postgresql://planka_admin:hunter2@swift/planka";
        SECRET_KEY = "hunter2";
      };

      autoStart = true;
    };
  };
}
