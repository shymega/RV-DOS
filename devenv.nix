# SPDX-FileCopyrightText: 2025 Dom Rodriguez <shymega@shymega.org.uk>
#
# SPDX-License-Identifier: GPL-3.0-only
{pkgs, ...}: {
  packages = [pkgs.git];

  languages = {
    rust.enable = true;
    shell.enable = true;
    nix.enable = true;
  };

  services.postgres = {
    enable = true;
    package = pkgs.postgresql;
    listen_addresses = "127.0.0.1";
    initialDatabases = [{name = "orthros_db";}];
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
