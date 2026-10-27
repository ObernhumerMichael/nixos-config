{ lib, ... }:

let
  browser = "brave-browser.desktop";
  mail = "thunderbird.desktop";
  pdf = "org.gnome.Evince.desktop";
  image = "org.gnome.Loupe.desktop";
  video = "vlc.desktop";

  # Map every mime type in the list to the same desktop entry
  handle = app: types: lib.genAttrs types (_: app);
in
{
  xdg.mimeApps = {
    enable = true;

    defaultApplications =
      handle browser [
        "text/html"
        "x-scheme-handler/http"
        "x-scheme-handler/https"
        "x-scheme-handler/about"
        "x-scheme-handler/unknown"
      ]
      // handle mail [
        "x-scheme-handler/mailto"
        "x-scheme-handler/mid"
        "message/rfc822"
        "x-scheme-handler/webcal"
        "x-scheme-handler/webcals"
        "text/calendar"
        "application/x-extension-ics"
        "x-scheme-handler/net.thunderbird"
      ]
      // handle pdf [ "application/pdf" ]
      // handle image [
        "image/png"
        "image/jpeg"
        "image/gif"
        "image/webp"
        "image/bmp"
        "image/tiff"
        "image/svg+xml"
        "image/avif"
        "image/heic"
      ]
      // handle video [
        "video/mp4"
        "video/x-matroska"
        "video/webm"
        "video/quicktime"
        "video/x-msvideo"
        "video/mpeg"
        "video/ogg"
      ]
      // {
        # Registered by the JetBrains daemon in ~/.local/share/applications
        "x-scheme-handler/jetbrains" = "jetbrainsd.desktop";
      };
  };
}
