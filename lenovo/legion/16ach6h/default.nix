{ ... }:

{
  imports = [ ./hybrid ];

  specialisation.ddg.configuration = {
    # This specialisation is for the case where "DDG" (A hardware feature that can enable in bios) is enabled, since the amd igpu is blocked at hardware level and the built-in display is directly connected to the dgpu, we no longer need the amdgpu and prime configuration.
    services.xserver.videoDrivers = [ "nvidia" ]; # This will override services.xserver.videoDrivers = lib.mkDefault [ "amdgpu" "nvidia" ];
    hardware.nvidia.prime.offload.enable = false;
  };
}