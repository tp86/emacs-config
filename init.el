;; Basic UI settings
(setq inhibit-startup-message t)

;; get rid of bars
(when (display-graphic-p)
      (scroll-bar-mode -1)
      (tool-bar-mode -1)
      (tooltip-mode -1)
      (set-fringe-mode 0))
(menu-bar-mode -1)

;; flash, not beep
(setq visible-bell t)

;; set default font if available
(if (member "Hack" (font-family-list))
    (set-face-attribute 'default nil :font "Hack" :height 120))

;; load theme
(load-theme 'tango-dark)

;; Package management
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
