{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      add_newline = false;

      format = ''
        $directory$git_branch$git_state$git_status$cmd_duration
        $character
      '';

      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
      };

      directory = {
        style = "blue";
        truncation_length = 3;
      };

      git_branch = {
        format = " [$branch]($style)";
        style = "purple";
      };

      git_state = {
        format = " [$state( $progress_current/$progress_total)]($style)";
        style = "yellow";
      };

      git_status = {
        format = " [$all_status$ahead_behind]($style)";
        style = "red";
      };

      cmd_duration = {
        min_time = 1000;
        format = " [$duration](yellow)";
      };

      # Optional: nix-shell prompt
      nix_shell = {
        format = " via [$name](green) ";
        heuristic = true;
      };
    };
  };
}
