{
  description = "Ambiente com Kubernetes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShells = {
          kubernetes = pkgs.mkShell {
            name = "backend-shell";
            packages = with pkgs; [
                kind
                kubectl
            ];
          };

        };
      }
    );
}

