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

          "libvirtd" # Manage libvirt VMs
        ];

        openssh.authorizedKeys.keys = [
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA dietr1ch@flock"
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA dietr1ch@raft"
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA dietr1ch@nuerburgring"

          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA dietr1ch@sigabrt"
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA dietr1ch@sigterm"
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
