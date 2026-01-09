{ config, ... }:

{
  users = {
    users = {
      ivonne = {
        description = "Ivonne González";

        # Generated with mkpasswd --method=sha-512
        initialHashedPassword = "$6$89CY2nGxh.fa0v/E$QTPHc45etEOZIgr6nzqQ5i0wesSKhS9H0DJLBdm1/8jsJ0akb7IpVV1b1T1dkUkNDlROnOEnt.b6IPe2xivNY0";

        uid = 1999;
        isNormalUser = true;

        extraGroups = [
          "users" # Regular users

          "audio" # Allow playing music
          "gamemode" # Run games
          "openrazer" # Allow interacting with the openrazer daemon

          config.services.kubo.group # Allow using IPFS/kubo
        ];

        openssh.authorizedKeys.keys = [
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ivonne@flock"
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ivonne@raft"
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ivonne@nuerburgring"

          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ivonne@sigabrt"
          # "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ivonne@sigterm"
        ];
      };
    };
  };
}
