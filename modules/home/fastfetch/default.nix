{ ... }: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "Muhammad";
        padding = {
          top = 3;
          right = 3;
          left = 3;
        };
      };
      display = {
        size = { binaryPrefix = "si"; };
        color = "magenta";
        separator = " › ";
      };
      modules = [
        "title"
        {
          type = "separator";
          string = "¨";
        }
        {
          type = "custom";
          format = "{#12}╭──────────── {#10}Software{#12} ────────────";
        }
        {
          type = "os";
          key = "{#12}│ {#14}OS";
        }
        {
          type = "kernel";
          key = "{#12}│ {#14}Kernel";
        }
        {
          type = "packages";
          key = "{#12}│ {#14}Packages";
        }
        {
          type = "shell";
          key = "{#12}│ {#14}Shell";
        }
        {
          type = "de";
          key = "{#12}│ {#14}DE";
        }
        {
          type = "terminal";
          key = "{#12}│ {#14}Terminal";
        }
        {
          type = "localip";
          key = "{#12}│ {#14}Local IP";
        }
        {
          type = "custom";
          format = "{#12}├──────────── {#10}Hardware{#12} ────────────";
        }
        {
          type = "host";
          key = "{#12}│ {#14}Host";
        }
        {
          type = "cpu";
          key = "{#12}│ {#14}CPU";
        }
        {
          type = "gpu";
          key = "{#12}│ {#14}GPU";
        }
        {
          type = "memory";
          key = "{#12}│ {#14}Memory";
        }
        {
          type = "disk";
          key = "{#12}│ {#14}Disk";
        }
        {
          type = "custom";
          format = "{#12}├───────────── {#10}Uptime{#12} ─────────────";
        }
        {
          type = "uptime";
          key = "{#12}│";
        }
        {
          type = "custom";
          format = "{#12}╰──────────────────────────────────";
        }
        "break"
        "colors"
      ];
    };
  };
}