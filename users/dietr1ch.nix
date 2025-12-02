{
  users = {
    users = {
      dietr1ch = {
        description = "Dietrich Daroch";

        # Generated with mkpasswd --method=sha-512
        initialHashedPassword = "$6$FL76CYUYPb0ZZpuY$3qDRdKMJfX2/4z1Ty6hCzWq/TmG4KkcPvu68buymIS39oENJVIF2KsN9Mo9sOdjbj5.77cTg3lhQY1ujgjOZn0";

        uid = 1337;
        isNormalUser = true;

        extraGroups = [
          "wheel" # Enable ‘sudo’ for the user.
          "users" # Regular users
          "phys" # Users with physical access

          "libvirtd" # Manage libvirt VMs
        ];

        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE9dq6A5RuKMN7aQkkaDU66DrHf+XYWM6Ligk2R8ufza dietr1ch@flock"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwzvK1/wSXxLikDSrXZ23WEzDHv7koRbxuvt0czzocH dietr1ch@raft"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKxM4zgsCOwr6J7Ci1PKyUoI2CL4eL4QSrR6LnfSILXz dietr1ch@nuerburgring"

          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMtQhzl7ihtsn0LMXhcKcjLnqQpoGS+D2vwz4OMkTBck dietr1ch@sigabrt"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMtQhzl7ihtsn0LMXhcKcjLnqQpoGS+D2vwz4OMkTBck dietr1ch@sigterm"
        ];
      };
    };
  };
}
