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
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(indent-tabs-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (tabbar-ruler nlinum nlinum-hl undo-tree ergoemacs-mode)))
 '(show-paren-mode t)
 '(standard-indent 2)
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 90 :width normal))))
 '(linum ((t (:inherit (shadow default))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; System type fo multisystem config
(defun system-is-linux()   (string-equal system-type "gnu/linux"))
(defun system-is-windows() (string-equal system-type "windows-nt"))
; path-variable
(when (system-is-linux)    (setq unix-init-path "~/.emacs.add"))
(when (system-is-windows)  (setq win-init-path "C:/.emacs.d"))

;; автозагрузка путей плагинов
(if (system-is-windows) (add-to-list 'load-path win-init-path))
(if (system-is-linux) (add-to-list 'load-path unix-init-path))

(setq frame-title-format "GNU Emacs: %b") ; current filename in the title bar

(require 'dired)
(setq dired-recursive-deletes 'top) ; разрешить удалять непустые директории

(require 'linum)
(line-number-mode   t)
(global-linum-mode  t)         ; показывать слева номера строк
(setq linum-format "%3d ")     ; формат поля - с пробелом в конце
(column-number-mode t)         ; показывать в статусе номер колонки
(fringe-mode '(0 . 0))         ; ширина боковых границ в пикселях
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)
(setq display-time-24hr-format t) ; Display file size/time in mode-line
(display-time-mode             t)
(size-indication-mode          t)

(setq show-paren-style 'mixed) ; режим отображения парных скобок
(show-paren-mode 1)            ; включить

; Графические элементы окна
(menu-bar-mode 1)              ; строку меню отображать
(tool-bar-mode -1)             ; панель инструментов скрыть
(tooltip-mode      -1)
(scroll-bar-mode    1)
(blink-cursor-mode  1)
;(setq use-dialog-box     nil)
(setq redisplay-dont-pause t)
(setq ring-bell-function 'ignore)  ; звук ошибки отключить
(setq x-select-enable-clipboard t) ; использовать буфер обмена OC
(setq make-backup-files        nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default        nil)
(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t)
(electric-pair-mode    1)  ; авто-скобки/кавычки
;(electric-indent-mode -1) ; автоотступ, если глючит - можно отключить

;; Автоматический перенос длинных строк
;(setq word-wrap          t)
;(global-visual-line-mode t)

; IDO plugin - псевдо-интерактивное открытие файлов в командной строке
(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)
(setq ido-enable-flex-matching t)

(require 'bs) ; Навигация по буферам
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)      ; список всех буферов: C-x C-b
(global-set-key (kbd "<f3>") 'bs-show) ; список буферов пользователя: F3

; Org-mode !!! ИЗУЧИТЬ ВОЗМОЖНОСТИ !!!
(require 'org)
;(global-set-key "C-c a" 'org-agenda)
;(global-set-key "C-c b" 'org-iswitchb)
;(global-set-key "C-c l" 'org-store-link)
(add-to-list 'auto-mode-alist '(".org$" . Org-mode)) ; ассоциируем *.org файлы с org-mode

; F6: ввод имени функции для быстрого перехода к ней
(require 'imenu)
(setq imenu-auto-rescan      t)
(setq imenu-use-popup-menu nil)
(global-set-key (kbd "<f6>") 'imenu)

;;
; cd ~/.emacs.d
; git clone -b master --single-branch https://github.com/ergoemacs/ergoemacs-mode.git
;;
(add-to-list 'load-path "/home/ib/files/github.com/ergoemacs-mode")
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

;; Coding-system settings
(set-language-environment 'UTF-8)
(if (system-is-linux)
    (progn
        (setq default-buffer-file-coding-system 'utf-8)
        (setq-default coding-system-for-read    'utf-8)
        (setq file-name-coding-system           'utf-8)
        (set-selection-coding-system            'utf-8)
        (set-keyboard-coding-system             'utf-8-unix)
        (set-terminal-coding-system             'utf-8)
        (prefer-coding-system                   'utf-8))
;    (progn
;        (prefer-coding-system                   'windows-1251)
;        (set-terminal-coding-system             'windows-1251)
;        (set-keyboard-coding-system             'windows-1251-unix)
;        (set-selection-coding-system            'windows-1251)
;        (setq file-name-coding-system           'windows-1251)
;        (setq-default coding-system-for-read    'windows-1251)
;        (setq default-buffer-file-coding-system 'windows-1251))
)

; Продолжение на
;
;  http://security-corp.org/programming/25178-gnu-emacs-statya-kotoruyu-ya-tak-i-ne-nashel.html
;
; с раздела "Цветовые схемы".
;
