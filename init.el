;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load path etc.

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Load up ELPA, the package manager

(add-to-list 'load-path dotfiles-dir)

(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit/auto-complete"))
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit/emacs-dbgr"))
(add-to-list 'load-path (concat dotfiles-dir "/scala"))
;;(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit/yasnippet"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

(require 'package)
(dolist (source '(("technomancy" . "http://repo.technomancy.us/emacs/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)
(require 'starter-kit-elpa)

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'open-next-line)
(require 'tramp)
(require 'autopair)
;;(require 'yasnippet)
(require 'scala-mode-auto)


;; backport some functionality to Emacs 22 if needed
(require 'dominating-file)

;; Load up starter kit customizations

(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-perl)
(require 'starter-kit-ruby)
(require 'starter-kit-js)
(require 'starter-kit-python)
(require 'starter-kit-completion)
(require 'starter-kit-org)

(load-file "/Users/rjchacko/.emacs.d/emacs-for-python/epy-init.el")
(epy-setup-checker "/Library/Frameworks/EPD64.framework/Versions/Current/bin/pyflakes %f")
(epy-setup-ipython)
(global-hl-line-mode t) ;; To enable
 (set-face-background 'hl-line "lavender") ;; change with the color that you like
                                        ;; for a list of colors: http://raebear.net/comp/emacscolors.html

(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)

(regen-autoloads)
(load custom-file 'noerror)

(load "appearance.el")

;; You can keep system- or user-specific customizations here
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name))
(add-to-list 'load-path user-specific-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-dir)
  (mapc #'load (directory-files user-specific-dir nil ".*el$")))

(setq flymake-gui-warnings-enabled nil)

;;; init.el ends here
(put 'dired-find-alternate-file 'disabled nil)
(setq cua-enable-cua-keys nil)
(cua-mode t)

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

