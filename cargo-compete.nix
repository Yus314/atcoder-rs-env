{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "cargo-compete";
  version = "0.10.6";

  src = fetchFromGitHub {
    owner = "qryxip";
    repo = pname;
    rev = "f17c37417b270c8a726eab8ee5a6ea09a202348a";
    sha256 = "sha256-OgT8jwpRmwBrwtzue3pDwjNkzJmzHzpNTi889ucs8wY=";
  };

  cargoSha256 = "sha256-V3lA9IlAWvWS+EHF10XNylALBe1Jh8FFwGPJPCemIGM=";

  RUSTFLAGS = "-C target-feature=-aes";

  meta = with lib; {
    description = "A cargo subcommand to compete in programming contests";
    homepage = "https://github.com/qryxip/cargo-compete";
    license = with licenses; [
      asl20
      /*
      or MIT
      */
    ];
    maintainers = with maintainers; [
      /*
      TODO
      */
    ];
  };
}
