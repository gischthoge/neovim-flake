require 'colorizer'.setup {
  filetypes = { "*" },
  user_default_options = {
    RGB = true;
    RRGGBB = true;
    names = true;
    RRGGBBAA = true;
    AARRGGBB = false;
    rgb_fn = true;
    hsl_fn = true;
    css_fn = true;
    mode = "background"; -- background, foreground, virtualtext
    tailwind = false;
    sass = { enable = false, parsers = { "css" }, },
    virtualtext = "■",
    always_update = false,
  },
  bufftypes = {},
}
