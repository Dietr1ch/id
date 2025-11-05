{
  users = {
    users = {
      adaroch = {
        description = "Arnaldo Daroch";

        # Generated with mkpasswd --method 'sha-512'
        initialHashedPassword = "$6$YJb/lERyTp/xRo0K$.V.NM6LCZht6IdJexJAL95xZ8dLGCZg/ZAFTlAOlj7rihyRbrX1FnyVM31ifOIsASlbOwK/CcE7eCSriWKaJb1";

        uid = 1911;
        isNormalUser = true;

        extraGroups = [
          "users"
          "phys" # Users with physical access
        ];

        openssh.authorizedKeys.keys = [
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA adaroch@flock"
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA adaroch@raft"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKcrYgoJkPxBIgPg798k0ZUE0fv+8CvqpqMwyHTZ8PLd adaroch@nuerburgring"

          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA adaroch@sigabrt"
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA adaroch@sigterm"
        ];
      };
    };
  };
}
