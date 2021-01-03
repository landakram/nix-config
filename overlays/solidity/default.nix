self: super:
with super;
{
  solc = stdenv.mkDerivation rec {
    pname = "solc";
    version = "0.8.0";

    src = fetchurl {
      url = "https://github.com/ethereum/solidity/releases/download/v${version}/solc-macos";
      sha256 = "0dak6b4fjqm31jcw78cnbf4g4zq5yvn48b8qzi897mid9m4gzhy7";
    };
    phases = ["installPhase" "patchPhase"];
    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/solc
      chmod +x $out/bin/solc
    '';
  };
}
