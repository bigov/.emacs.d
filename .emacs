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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (whiteboard)))
 '(font-use-system-font t)
 '(indent-tabs-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (tabbar-ruler nlinum nlinum-hl undo-tree ergoemacs-mode)))
 '(standard-indent 2)
 '(tab-always-indent (quote complete)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default))))))

;(setq initial-frame-alist 
;	`((width . 120) (height . 50) (left . 300) (top . 0)))

(global-linum-mode 1)       ; показывать слева номера строк
(setq linum-format "%3d ")  ; формат поля - с пробелом в конце
(column-number-mode 1)      ; показывать в статусе номер колонки

(setq show-paren-style 'mixed) ; режим отображения парных скобок
(show-paren-mode 1)            ; включить

(menu-bar-mode 1)              ; строку меню отображать
(tool-bar-mode -1)             ; панель инструментов скрыть

(setq make-backup-files        nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default        nil)

;;
; cd ~/.emacs.d
; git clone -b master --single-branch https://github.com/ergoemacs/ergoemacs-mode.git
;;
(add-to-list 'load-path "~/.emacs.d/ergoemacs-mode")
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "us")
(ergoemacs-mode 1)

;;
; Мои клавиатурные настройки
;;
(global-unset-key (kbd "<f2>"))
(global-set-key (kbd "<f2>") 'save-buffer)
(global-set-key (kbd "M-<f4>") 'save-buffers-kill-terminal)



