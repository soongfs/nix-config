{ pkgs, ... }:

let
  forgejoComposePath = "$HOME/.config/forgejo/compose.yaml";

  mkForgejoScript =
    name: command:
    pkgs.writeShellScriptBin name ''
      set -eu

      if ! command -v docker-compose >/dev/null 2>&1; then
        echo "docker-compose is not available in PATH" >&2
        exit 1
      fi

      if ! colima status >/dev/null 2>&1; then
        echo "colima is not running; start it first with: colima start" >&2
        exit 1
      fi

      exec docker-compose -f ${forgejoComposePath} ${command}
    '';
in
{
  home.packages = [
    (mkForgejoScript "forgejo-up" "up -d")
    (mkForgejoScript "forgejo-down" "down")
    (mkForgejoScript "forgejo-logs" "logs -f")
    (mkForgejoScript "forgejo-ps" "ps")
  ];

  home.file.".config/forgejo/compose.yaml".text = ''
    services:
      server:
        image: codeberg.org/forgejo/forgejo:14
        container_name: forgejo
        environment:
          - USER_UID=1000
          - USER_GID=1000
          - FORGEJO__database__DB_TYPE=sqlite3
        restart: always
        volumes:
          - forgejo-data:/data
        ports:
          - "3000:3000"
          - "2222:22"

    volumes:
      forgejo-data:
  '';
}
