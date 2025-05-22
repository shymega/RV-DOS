# SPDX-FileCopyrightText: 2025 Dom Rodriguez <shymega@shymega.org.uk>
#
# SPDX-License-Identifier: GPL-3.0-only
{
  inputs,
  flake,
  pkgs,
  ...
}: let
  inherit (inputs) crane;
  inherit (pkgs) lib;

  # NB: we don't need to overlay our custom toolchain for the *entire*
  # pkgs (which would require rebuidling anything else which uses rust).
  # Instead, we just want to update the scope that crane will use by appending
  # our specific toolchain there.
  craneLib = (crane.mkLib pkgs).overrideToolchain (
    p:
      p.rust-bin.stable.latest.default.override {
        targets = ["riscv64gc-unknown-none-elf"];
      }
  );

  rv-dos = craneLib.buildPackage {
    buildInputs = [];
    cargoExtraArgs = "--target riscv64gc-unknown-none-elf";
    doCheck = true;
    pname = "rv-dos";
    src = craneLib.cleanCargoSource "${flake}/src/rust/rvdos";
    strictDeps = true;
    version = "0.1.0";
  };
in
  rv-dos
