;; Time-stamp: <2017-01-08 18:37:13 slo>

;; melpa package source
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;; Personal info
(setq user-full-name "Conrad Lo"
      user-mail-address "email@conradlo.com")

;; backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; just ask for y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; "C-x k" -> kill-this-buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; optimize mousewheel scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; programming
(use-package js2-mode
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-basic-offset 2)

(global-linum-mode t)
(set-face-foreground 'linum "#6e6e6e")

;; markdown
(use-package markdown-mode
  :ensure t)

;; Time Stamp
(add-hook 'before-save-hook 'time-stamp)
(defun cl/insert-time-stamp-string()
  "Insert time stamp string at current position"
  (interactive)
  (insert "Time-stamp:  < >"))

;; version control
(use-package magit
  :ensure t
  :bind (("C-c m" . magit-status)))

(use-package magit-gitflow
  :ensure t
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

;; REST
(use-package restclient
  :ensure t)

;; mode line
(use-package all-the-icons)
;; (use-package powerline)
;; (powerline-default-theme)

;; GUI
(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; http://stackoverflow.com/questions/11679700/emacs-disable-beep-when-trying-to-move-beyond-the-end-of-the-document
(defun my-bell-function ())

(setq ring-bell-function 'my-bell-function)
(setq visible-bell nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(cursor-type t)
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes
   (quote
    ("607b6b4e1e9f0c4a548ed315cbd2f102b32ba4a096231b3ea61787c80d41a8bf" "59e8dd2ea1b7e136fa16446bf542e42eb732e4c35ef84cff53a4051bb3b12e91" default)))
 '(package-selected-packages
   (quote
    (markdown-mode js2-mode all-the-icons use-package restclient projectile powerline org mode-icons magit-gitflow f auto-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "DeepPink1"))))
 '(header-line ((t (:background "gray0" :foreground "gray100"))))
 '(mode-line-inactive ((t (:background "#212931" :foreground "#eeeeec"))))
 '(region ((t (:background "HotPink4" :foreground "#e1e1e0")))))


;; Enable C-c C-u to upper case whole regoin
(put 'upcase-region 'disabled nil)
