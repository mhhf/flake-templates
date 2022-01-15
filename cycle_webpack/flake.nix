{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = import nixpkgs {
          inherit system;
        };
        packages = with pkgs; [
          nodejs
        ];
      in
        {

          packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

          defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;

          devShell = pkgs.mkShell {

            buildInputs = packages;

          };

        });
}
