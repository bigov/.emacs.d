
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
)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 78 :width normal)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'default-frame-alist '(width . 120))
(add-to-list 'default-frame-alist '(height . 43))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(left . 400))
(setq initial-frame-alist
    '((top . 0) (left . 400) (width . 120) (height . 43)))

(set-frame-size (selected-frame) 120 43)
(set-frame-position (selected-frame) 400 0)

;; Загрузка кастомной конфигурации
(setq emacs-custom-dir "~/.emacs.d/emacs-custom")
(add-to-list 'load-path emacs-custom-dir)
(require 'emacs-custom)

