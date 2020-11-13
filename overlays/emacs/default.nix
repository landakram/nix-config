self: super:
{
  emacs = (super.emacs27.overrideAttrs (o: rec {
    patches = [
      ./fix-window-role.patch
      ./ligatures-freeze-fix.patch
      ./no-frame-refocus-cocoa.patch
      #    ./no-titlebar.patch
      ./system-appearance.patch
    ];
  }));
}
