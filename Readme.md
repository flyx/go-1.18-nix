# Nix Overlay for Go 1.18beta2

This overlay adds Go 1.18 beta 2 to your packages.
It also adds `buildGo118Module` which uses this new beta version to build Go modules.

Go 1.18 beta 2 is **beta software** and **not production ready**.
Use at your own risk.

## Usage

In a flake:

```nix
{
  inputs.nixpkgs.url = github:nixos/nixpkgs;
  inputs.go-1-18.url = github:flyx/go-1-18-nix;

  outputs = { self, nixpkgs, go-1-18 }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ go-1-18.overlay ];
      };
    in {
      defaultPackage.x86_64-linux = pkgs.buildGo118Module {
        # ...
      };
    };
}
```

## How this works

I basically copied nixpkgs' Go 1.17 package, updated the source to point to the 1.18 beta, and made minimal necessary modifications so that the Go 1.18 codebase builds.
This isn't necessarily everything that *should* be done.
