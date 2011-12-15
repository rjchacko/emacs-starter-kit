(require 'color-theme)
(load-library "themes/color-theme-library.el")
(load-library "themes/color-theme-mac-classic.el")
(require 'color-theme-solarized)
(color-theme-solarized-light)

(add-to-list 'default-frame-alist
             '(font . "-apple-Bitstream_Vera_Sans_Mono-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1"))
(set-face-attribute 'default nil :height 130)
(blink-cursor-mode t)
