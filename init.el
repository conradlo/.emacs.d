;; Time-stamp: <2018-01-08 17:47:27 slo>

;; melpa package source
;; copy from https://github.com/melpa/melpa#usage

(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(package-initialize)

(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org" "~/.emacs.d"))


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
    (multi-term paredit lispy multiple-cursors helm-ag highlight-symbol company cider-eval-sexp-fu cider exec-path-from-shell inf-clojure parinfer ob-http ob-js ob-Javascript ob-javascript ox-md markdown-mode js2-mode all-the-icons use-package restclient projectile powerline org mode-icons magit-gitflow f auto-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "DeepPink1"))))
 '(header-line ((t (:background "gray0" :foreground "gray100"))))
 '(mode-line-inactive ((t (:background "#212931" :foreground "#eeeeec"))))
 '(region ((t (:background "HotPink4" :foreground "#e1e1e0")))))
