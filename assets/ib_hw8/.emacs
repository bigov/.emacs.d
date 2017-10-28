;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
;;
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (leuven)))
 '(display-time-mode t)
 '(package-selected-packages
   (quote
	(slime-company slime helm-projectile helm-swoop iedit anzu ws-butler dtrt-indent clean-aindent-mode undo-tree volatile-highlights helm-gtags helm zygospore projectile use-package rainbow-mode go-guru go-direx go-scratch gotest flycheck multi-compile go-rename yasnippet company-go company go-eldoc go-mode)))
 '(show-paren-mode t)
 '(size-indication-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 90 :width normal)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (display-graphic-p)
    (set-frame-size (selected-frame) 140 67)
    (set-frame-position (selected-frame) 480 0))

;; Загрузка кастомной конфигурации
(setq emacs-custom-dir "c:/Users/ib/AppData/Roaming/.emacs.d/emacs-custom")
(add-to-list 'load-path emacs-custom-dir)
(require 'emacs-custom)

;;----------------------------------- LISP -----------------------------------
;;(add-to-list 'load-path "f:/github.com/slime")
;;(require 'cl)
;; Под MS-Windows тут: http://www.sbcl.org/platform-table.html
;;(setq inferior-lisp-program "/usr/bin/sbcl")
;;(setq-default inferior-lisp-program "sbcl")

;; SLIME: The Superior Lisp Interaction Mode for Emacs
;; Use M-x slime to fire up and connect to an inferior Lisp.
;; SLIME will now automatically be available in your Lisp source buffers.
;;(add-to-list 'load-path "~/files/github.com/slime")
;;(require 'slime-autoloads)
;;(setq slime-contribs '(slime-fancy))
(require 'custom-go)
