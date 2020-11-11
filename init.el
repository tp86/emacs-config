(setq inhibit-startup-message t)

(when (display-graphic-p)
      (scroll-bar-mode -1)
      (tool-bar-mode -1)
      (tooltip-mode -1)
      (set-fringe-mode 0))
(menu-bar-mode -1)

(setq visible-bell t)

(if (member "Hack" (font-family-list))
    (set-face-attribute 'default nil :font "Hack" :height 120))

(load-theme 'tango-dark)
