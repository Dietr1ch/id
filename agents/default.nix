{
  imports = [ ./dietr1ch.nix ];

  users = {
    groups = {
      "agents" = { }; # ..users.groups."agents"
    }; # ..users.groups
  }; # ..users

  systemd = {
    # https://search.nixos.org/options?channel=unstable&query=systemd.tmpfiles
    tmpfiles = {
      settings = {
        # /etc/tmpfiles.d/
        "10-agents" = {
          "/agents" = {
            d = {
              mode = "750";
              user = "root";
              group = "agents";
            };
          }; # ..systemd.tmpfiles.settings."10-agents"."/agents"
        }; # ..systemd.tmpfiles.settings."10-agents"
      }; # ..systemd.tmpfiles.settings
    }; # ..systemd.tmpfiles
  }; # ..systemd
}
