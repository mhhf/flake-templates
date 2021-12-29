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
      {
        # # Executed by `nix flake check`
        # checks."<system>"."<name>" = derivation;
        # # Executed by `nix build .#<name>`
        # packages."<system>"."<name>" = derivation;
        # # Executed by `nix build .`
        # defaultPackage."<system>" = derivation;
        # # Executed by `nix run .#<name>`
        # apps."<system>"."<name>" = {
        #   type = "app";
        #   program = "<store-path>";
        # };
        # # Executed by `nix run . -- <args?>`
        # defaultApp."<system>" = { type = "app"; program = "..."; };
        #
        # # Used for nixpkgs packages, also accessible via `nix build .#<name>`
        # legacyPackages."<system>"."<name>" = derivation;
        # # Default overlay, for use in dependent flakes
        # overlay = final: prev: { };
        # # Same idea as overlay but a list or attrset of them.
        # overlays = {};
        # # Default module, for use in dependent flakes
        # nixosModule = { config }: { options = {}; config = {}; };
        # # Same idea as nixosModule but a list or attrset of them.
        # nixosModules = {};
        # # Used with `nixos-rebuild --flake .#<hostname>`
        # # nixosConfigurations."<hostname>".config.system.build.toplevel must be a derivation
        # nixosConfigurations."<hostname>" = {};
        # # Used by `nix develop`
        # devShell."<system>" = derivation;
        # # Used by `nix develop .#<name>`
        # devShells."<system>"."<name>" = derivation;
        # # Hydra build jobs
        # hydraJobs."<attr>"."<system>" = derivation;
        # # Used by `nix flake init -t <flake>`
        # defaultTemplate = {
        #   path = "<store-path>";
        #   description = "template description goes here?";
        # };
        # # Used by `nix flake init -t <flake>#<name>`
        # templates."<name>" = { path = "<store-path>"; description = ""; };
      });
}
