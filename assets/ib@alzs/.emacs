;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives
			 '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
			 '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
	(helm-projectile helm-swoop iedit anzu ws-butler dtrt-indent clean-aindent-mode undo-tree volatile-highlights helm-gtags helm zygospore projectile use-package rainbow-mode flycheck multi-compile yasnippet company)))
 '(show-paren-mode t)
 '(size-indication-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 78 :width normal)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (display-graphic-p)
  (set-frame-size (selected-frame) 120 43)
  (set-frame-position (selected-frame) 400 0))

(add-to-list 'load-path "~/.emacs.d/slime")
(add-to-list 'load-path "~/.emacs.d/emacs-multi-compile")
(add-to-list 'load-path "~/.emacs.d/emacs-custom")
(require 'emacs-custom)  ; Загрузка кастомной конфигурации

;;=========================================================================
;; Подключаемая конфигурация для работы с GO
(add-hook 'go-mode-hook (load "custom-go.el"))

;;=========================================================================
;; Подключаемая конфигурация для работы с Lisp
(require 'cl)
(setq-default inferior-lisp-program "sbcl")  ; LISP бинарники по-умолчанию
(require 'slime-autoloads)
(setq slime-contribs '(slime-fancy))
