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
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (leuven)))
 '(display-time-mode t)
 '(frame-resize-pixelwise t)
 '(package-selected-packages
   (quote
	(helm-projectile helm-swoop iedit anzu ws-butler dtrt-indent clean-aindent-mode undo-tree volatile-highlights helm-gtags helm zygospore projectile use-package rainbow-mode go-guru go-direx go-scratch gotest flycheck multi-compile go-rename yasnippet company-go company go-eldoc go-mode go-guru go-direx go-scratch gotest go-rename company-go go-eldoc go-mode)))
 '(show-paren-mode t)
 '(size-indication-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 90 :width normal)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(when (display-graphic-p)

(add-to-list 'default-frame-alist '(width . 140))
(add-to-list 'default-frame-alist '(height . 67))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(left . 480))

(set-frame-size (selected-frame) 140 67)
(set-frame-position (selected-frame) 480 0)
(setq initial-frame-alist
    '((top . 0) (left . 480) (width . 140) (height . 67)))

;; Загрузка кастомной конфигурации
(setq emacs-custom-dir "c:/Users/ib/AppData/Roaming/.emacs.d/emacs-custom")
(add-to-list 'load-path emacs-custom-dir)
(require 'emacs-custom)

;; Модуль настройка окружения для работы с Go
(require 'custom-go)
