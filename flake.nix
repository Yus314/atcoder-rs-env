{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    rust-overlay,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;

        # Adding this overlay adds `pkgs.rust-bin` which is defined by rust-overlay
        overlays = [
          rust-overlay.overlays.default
          # Add cargo-compete
        ];
      };

      rustToolchain = pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
    in {
      devShells.default = pkgs.mkShell {
        nativeBuildInputs = [
          rustToolchain
          pkgs.openssl
          pkgs.openssl.dev
          pkgs.pkg-config
          pkgs.rustup
          pkgs.libgit2
          # add any other packages you want to include here
        ];
        buildInputs = [pkgs.libiconv pkgs.darwin.apple_sdk.frameworks.Security];
        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [pkgs.openssl];
        shellHook = ''
        '';
      };
    });
}
