_: {
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.just
          pkgs.zola
        ];

        shellHook = ''
          echo
          echo "red-oxide.org"
          echo
          echo "Zola: $(zola --version)"
          echo "Just: $(just --version)"
          echo
          echo "Commands:"
          just --list
          echo
        '';
      };
    };
}
