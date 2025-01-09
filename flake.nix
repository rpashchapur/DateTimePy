{
  description = "Python DateTime Service";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }:
    let
      forAllSystems = system: {
        pkgs = import nixpkgs { inherit system; };
        datetime-service = pkgs.callPackage ./default.nix {};
      };
    in
    {
      packages.default = forAllSystems;
      nixosModules.default = { pkgs, ... }: {
        imports = [ ./service.nix ];
        specialArgs = { inherit forAllSystems; };
      };
    };
}
