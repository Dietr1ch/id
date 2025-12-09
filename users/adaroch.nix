{
  users = {
    users = {
      adaroch = {
        description = "Arnaldo Daroch";

        # Generated with mkpasswd --method=sha-512
        initialHashedPassword = "$6$YJb/lERyTp/xRo0K$.V.NM6LCZht6IdJexJAL95xZ8dLGCZg/ZAFTlAOlj7rihyRbrX1FnyVM31ifOIsASlbOwK/CcE7eCSriWKaJb1";

        uid = 1911;
        isNormalUser = true;

        extraGroups = [
          "users" # Regular users
          "phys" # Users with physical access

          "audio" # Allow playing music
          "gamemode" # Run games
          "libvirtd" # Manage libvirt VMs
        ];

        openssh.authorizedKeys.keys = [
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA adaroch@flock"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKcrYgoJkPxBIgPg798k0ZUE0fv+8CvqpqMwyHTZ8PLd adaroch@nuerburgring"

          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP/CxvI2UR4RdDUR3qim5J53PPyRNHWY2IANze8RtRw7 arnal@LAPTOP-B9UL4OIE" # G14
        ];
      };
    };
  };

  services = {
    # https://search.nixos.org/options?channel=unstable&query=services.postgresql
    postgresql = {
      ensureUsers = [
        {
          name = "adaroch";
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
        "adaroch"
      ];
    };
  };
}
