{
  users = {
    users = {
      ninis = {
        description = "Denisse Daroch";

        # Generated with mkpasswd --method=sha-512
        initialHashedPassword = "$6$2.oy7kYfuss/0R2y$XtHYnCST.ZhM9TdLCrrENXNU0Dkpdn01nsnRvDJGQOmKS11eHYO4oF.g0RfG4rU8n9YIlMdCMQ0k3vZS2SYB7/";

        uid = 1777;
        isNormalUser = true;

        extraGroups = [
          "users" # Regular users
          "phys" # Users with physical access

          "audio" # Allow playing music
          "gamemode" # Run games
          "libvirtd" # Manage libvirt VMs
          "wireshark" # Allow capturing network traffic
        ];

        openssh.authorizedKeys.keys = [
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ninis@flock"
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ninis@raft"
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ninis@nuerburgring"

          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ninis@sigabrt"
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ninis@sigterm"
        ];
      };
    };
  };

  services = {
    # https://search.nixos.org/options?channel=unstable&query=services.postgresql
    postgresql = {
      ensureUsers = [
        {
          name = "ninis";
          ensureDBOwnership = true;
          ensureClauses = {
            # Grants superuser permissions
            superuser = false;

            # Grants createrole permissions
            createrole = true;
            # Grants createdb permissions
            createdb = true;
          };
        }
      ];
      ensureDatabases = [
        "ninis"
      ];
    };
  };
}
