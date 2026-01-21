project('enchant_win8', 'cpp',
  version: '0.1.0',
  default_options: [
    'warning_level=2',
    'cpp_std=c++11',
  ],
)

# Dependencies
glib_dep = dependency('glib-2.0')
enchant_dep = dependency('enchant-2')

# Get the enchant provider directory from enchant-2's libdir
enchant_libdir = enchant_dep.get_variable(pkgconfig: 'libdir')
enchant_provider_dir = enchant_libdir / 'enchant-2'

# Windows COM libraries
win_libs = [
  meson.get_compiler('cpp').find_library('ole32'),
  meson.get_compiler('cpp').find_library('oleaut32'),
  meson.get_compiler('cpp').find_library('uuid'),
]

# Windows API version flags (Windows 8+ required for Spell Checking API)
win_version_flags = [
  '-D_WIN32_WINNT=_WIN32_WINNT_WIN8',
  '-DNTDDI_VERSION=NTDDI_WIN8',
]

# Include directories
enchant_inc = include_directories('enchant/lib') # enchant-provider.h

# Source files
sources = files('src/win8_provider.cpp')

# Build shared module
shared_module('enchant_win8',
  sources,
  dependencies: [glib_dep, enchant_dep, win_libs],
  include_directories: enchant_inc,
  cpp_args: win_version_flags,
  name_prefix: '',
  install: true,
  install_dir: enchant_provider_dir,
)
