(require 'color-theme)
(load-library "themes/color-theme-library.el")
(color-theme-tty-dark)
(add-to-list 'default-frame-alist
             '(font . "-apple-Courier_New-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1"))
(set-face-attribute 'default nil :height 150)
(blink-cursor-mode t)
