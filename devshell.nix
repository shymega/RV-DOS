# SPDX-FileCopyrightText: 2025 Dom Rodriguez <shymega@shymega.org.uk>
#
# SPDX-License-Identifier: GPL-3.0-only
{
  inputs,
  pkgs,
}:
inputs.devenv.lib.mkShell {
  inherit inputs pkgs;
  modules = [
    ./devenv.nix
  ];
}
