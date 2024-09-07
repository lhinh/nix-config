{ config, pkgs, ... }:
{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  sound.enable = true;
  hardware.pulseaudio.enable = true;
  # # Enable sound with pipewire.
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  #   # If you want to use JACK applications, uncomment this
  #   # jack.enable = false;

  #   # use the example session manager (no others are packaged yet so this is enabled by default,
  #   # no need to redefine it in your config for now)
  #   #media-session.enable = true;

  #   # Drop-in configuration for pipewire.
  #   # extraConfig = {
  #   #   # pipewire."92-low-latency".context.properties = {
  #   #   #   default.clock.rate = 48000; 
  #   #   #   default.clock.allowed-rates = [ 48000 88200 96000 ];
  #   #   #   default.clock.quantum = 32;
  #   #   #   default.clock.min-quantum = 32;
  #   #   #   default.clock.max-quantum = 32;
  #   #   # };

  #   #   # pipewire-pulse."92-low-latency" = {
  #   #   #   context.modules = [
  #   #   #     {
  #   #   #       name = "libpipewire-module-protocol-pulse";
  #   #   #       args = {
  #   #   #         pulse.min.req = "32/48000";
  #   #   #         pulse.default.req = "32/48000";
  #   #   #         pulse.max.req = "32/48000";
  #   #   #         pulse.min.quantum = "32/48000";
  #   #   #         pulse.max.quantum = "32/48000";
  #   #   #       };
  #   #   #     }
  #   #   #   ];
  #   #   #   stream.properties = {
  #   #   #     node.latency = "32/48000";
  #   #   #     resample.quality = 1;
  #   #   #   };
  #   #   # };

  #   #   # pipewire."92-alsa" = {
  #   #   #   context.properties = {
  #   #   #     # Set larger buffer and period sizes to prevent underruns
  #   #   #     default.clock.rate = 48000;  # Set sample rate (standard is 48000)
  #   #   #     default.clock.allowed-rates = [ 48000 88200 96000 ];  # Support these sample rates
  #   #   #     default.clock.quantum = 2048;  # Larger quantum size to avoid underruns
  #   #   #     default.clock.min-quantum = 512;  # Minimum quantum size (experiment with values between 512 and 2048)
  #   #   #     default.clock.max-quantum = 4096;  # Max quantum size, useful for high-latency but stable audio

  #   #   #     # ALSA-specific buffer settings
  #   #   #     alsa.period-size = 1024;  # Period size (in samples)
  #   #   #     alsa.buffer-size = 4096;  # Total buffer size (in samples)
  #   #   #   };
  #   #   # };
  #   # };
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
