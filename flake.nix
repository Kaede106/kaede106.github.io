{
  description = "Leptos website development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ (import rust-overlay) ];
        };

        rustToolchain = pkgs.rust-bin.stable.latest.default.override {
          targets = [ "wasm32-unknown-unknown" ];
          extensions = [ "rustfmt" ];
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            rustToolchain
            cargo
            rustfmt
            cargo-leptos
            pkg-config
            openssl
            binaryen
            wasm-bindgen-cli
            nodejs
            git
            trunk
            lld
          ];

          env = {
            PKG_CONFIG_PATH =
              "${pkgs.openssl.dev}/lib/pkgconfig";
          };
        };
      });
}

