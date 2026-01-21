# enchant_win8

An attempt to create an [`enchant-2`](https://github.com/rrthomas/enchant) provider that uses the native spellchecker included in Windows 8 and above. Largely based on the implementation found in [HexChat](https://github.com/hexchat/hexchat/tree/master/src/libenchant_win8).

## Compatibility

The provider works with Windows 8+, but removing words that were previously added to the session requires Windows 10+.

- Uses the [`ISpellChecker`](https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ispellchecker) interface added in Windows 8.
- To remove words from the session, the [`ISpellChecker2`](https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ispellchecker2) interface is used, which was added in Windows 10.

## Building with MinGW

1. Install the dependencies.
   ```sh
   pacman -S mingw-w64-x86_64-gcc mingw-w64-x86_64-meson mingw-w64-x86_64-glib2 mingw-w64-x86_64-enchant
   ```
2. Clone this repository. \
   (The MinGW enchant package does not contain the required headers, so they are added via a submodule.)
   ```sh
   git clone https://github.com/Kneemund/enchant_win8
   git submodule update --init
   ```
3. Compile using meson.
   ```sh
   meson setup --prefix=C:/msys64/mingw64 _mesonbuild
   meson compile -C _mesonbuild
   ```
4. Optionally install using meson. \
   (Omit `--tags runtime` to also install the `.dll.a` import library.)
   ```sh
   meson install -C _mesonbuild --tags runtime
   ```
