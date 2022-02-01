self: super: {
  go_1_18 = super.callPackage ./. {
    inherit (super.darwin.apple_sdk.frameworks) Security Foundation;
  };
  buildGo118Module = super.callPackage "${super.path}/pkgs/development/go-modules/generic" {
    go = self.go_1_18;
  };
}
