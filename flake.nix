{
  description = "Identity";

  outputs =
    { self }:
    {
      users = import ./users;
      users-dietr1ch = import ./users/dietr1ch.nix;
    };
}
