[33mWarning: Bare invocation of nixfmt is deprecated. Use 'nixfmt -' for anonymous stdin.[39m
{ ... }:

{
  programs = {
    ssh = {
      knownHosts = {
        "flock" = {
          extraHostNames = [
            "flock.m.daroch.dev"
            "flock.local"
          ];
          publicKey = "";
        }; # ..programs.ssh.knownHosts."flock"
      }; # ..programs.ssh.knownHosts
    }; # ..programs.ssh
  }; # ..programs

  services = {
    openssh = {
      knownHosts = {
        "flock" = {
          extraHostNames = [
            "flock.m.daroch.dev"
            "flock.local"
          ];
          publicKey = "";
        }; # ..services.openssh.knownHosts."flock"
      }; # ..services.openssh.knownHosts
    }; # ..services.openssh
  }; # ..services
}
