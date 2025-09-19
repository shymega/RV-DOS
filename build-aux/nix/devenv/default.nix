# SPDX-FileCopyrightText: 2025 Dom Rodriguez <shymega@shymega.org.uk>
#
# SPDX-License-Identifier: GPL-3.0-only
{pkgs, ...}: {
  env.LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib/";
  packages = with pkgs; [
    buildbox
    buildstream
    lzip
    perl
    python3Packages.dulwich
    python3Packages.packaging
    python3Packages.pip
    python3Packages.requests
    python3Packages.tomlkit
    python3Packages.tox
  ];

  languages = {
    nix.enable = true;
    rust.enable = true;
    shell.enable = true;
  };

  devcontainer.enable = true;
  difftastic.enable = true;
  dotenv.enable = true;

  git-hooks.hooks = {
    actionlint.enable = true;
    commitizen.enable = true;
    markdownlint.enable = true;
  };
}
