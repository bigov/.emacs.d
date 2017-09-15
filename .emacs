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
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (undo-tree ergoemacs-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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

