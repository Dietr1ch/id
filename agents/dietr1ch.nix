{ config, ... }:

let
  user = "dietr1ch";
  bot = "${user}-bot";
  shared_group = "${user}-shared";
  uid_bot_offset = 10000;
  uid_shared_offset = 20000;
in
{
  users = {
    users = {
      "${user}" = {
        extraGroups = [
          "agents" # Users with agents (and their agents)
          shared_group
        ]; # ..users.users."${user}".extraGroups
      }; # ..users.users."${user}"

      "${bot}" = {
        description = "${user}'s bot";

        uid = config.users.users.${user}.uid + uid_bot_offset;
        isSystemUser = true;

        # NOTE: This pretends that $USER is homed at /home/$USER
        home = "/home/.${user}";
        createHome = true;
        homeMode = "750";

        group = bot;
        extraGroups = [
          "agents"
          shared_group
        ];
      }; # ..users.users."${bot}"
    }; # ..users.users

    groups = {
      "${bot}" = {
        gid = config.users.users.${user}.uid + uid_bot_offset;

        members = [
          user
          bot
        ]; # ..users.groups."${bot}".members
      }; # ..users.groups."${bot}"

      "${shared_group}" = {
        gid = config.users.users.${user}.uid + uid_shared_offset;

        members = [
          user
          bot
        ]; # ..users.groups."${bot}".members
      }; # ..users.groups."${shared_group}"
    }; # ..users.groups

  }; # ..users

  systemd = {
    # https://search.nixos.org/options?channel=unstable&query=systemd.tmpfiles
    tmpfiles = {
      settings = {
        # /etc/tmpfiles.d/
        "11-agents" = {
          "/agents/${user}" = {
            d = {
              mode = "2770";
              user = bot;
              group = shared_group;
            };
          }; # ..systemd.tmpfiles.settings."11-agents"."/agents/${user}"
        }; # ..systemd.tmpfiles.settings."11-agents"
      }; # ..systemd.tmpfiles.settings
    }; # ..systemd.tmpfiles
  }; # ..systemd

  security = {
    sudo = {
      # https://search.nixos.org/options?channel=unstable&query=security.sudo.extraRules
      extraRules = [
        {
          users = [ "${user}" ];
          runAs = "${bot}";
          commands = [ "ALL" ];
          options = [ "NOPASSWD" ];
        }
      ]; # ..security.sudo.extraRules
    }; # ..security.sudo

    sudo-rs = {
      # https://search.nixos.org/options?channel=unstable&query=security.sudo-rs.extraRules
      extraRules = [
        {
          users = [ "${user}" ];
          runAs = "${bot}";
          commands = [
            {
              command = "ALL";
              options = [ "NOPASSWD" ];
            }
          ];
        }
      ]; # ..security.sudo-rs.extraRules
    }; # ..security.sudo-rs
  }; # ..security
}
