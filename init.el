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

;; Keybindings
;; make ESC behave like C-g, just for convenience
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

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
(use-package diminish)

;; counsel completion package
(use-package counsel
  :diminish
  :bind (("C-s" . swiper)
	 ("C-x b" . counsel-switch-buffer)
	 :map ivy-minibuffer-map
	 ("C-j" . ivy-next-line-or-history)
	 ("C-k" . ivy-previous-line-or-history))
  :config (counsel-mode 1))

;; nicer modeline
(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))
(use-package doom-themes
  :init (load-theme 'doom-solarized-dark t))

;; Useful for tracking which command and keys are used most often
;; for optimizing work flow
;; (use-package command-log-mode
;;   :diminish)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-command-log-mode nil)
 '(package-selected-packages
   '(doom-themes doom-modeline command-log-mode diminish counsel ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:height 1.0)))))
