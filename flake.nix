{
  description = "Identity";

  outputs =
    { ... }:
    {
      users = import ./users; # ./users/default.nix
      users-dietr1ch = import ./users/dietr1ch.nix;
      users-ninis = import ./users/ninis.nix;
      users-adaroch = import ./users/adaroch.nix;
      users-ivonne = import ./users/ivonne.nix;

      locations-ca-kicking_horse = import ./locations/ca/kicking_horse.nix;
      locations-ca-whistler = import ./locations/ca/whistler.nix;
      locations-ch-mythenregion = import ./locations/ch/mythenregion.nix;
      locations-ch-zermatt = import ./locations/ch/zermatt.nix;
      locations-cl-chillan = import ./locations/cl/chillan.nix;
      locations-cl-valle_nevado = import ./locations/cl/valle_nevado.nix;
      locations-us-mammoth = import ./locations/us/mammoth.nix;
      locations-us-squaw = import ./locations/us/squaw.nix;
    };
}
