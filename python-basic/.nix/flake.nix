{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    # import pkgs
    pkgs = import nixpkgs {
      config.allowUnfree = true;
      system = "x86_64-linux";
    };

    # python interpreter to use
    python-interp = pkgs.python311;
    python-interp-pkgs = python-interp.pkgs;
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        pdm
      ];

      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
        pkgs.glib
        pkgs.glibc
        pkgs.stdenv.cc.cc
        pkgs.libz
      ];

      PATH =
        pkgs.lib.makeBinPath [
        ];

      shellHook = ''
        if [ ! -f .pdm-python ]; then
          pdm init
        fi
        pdm install
      '';
    };
  };
}
