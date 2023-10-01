{
  programs.fish = {
    enable = true;

    # Setup sharship shell
    interactiveShellInit = ''
      starship init fish | source
    '';

    # Remove greeting
    functions = {
      fish_greeting = "neofetch";
    };
  };
}