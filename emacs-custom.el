;;
;; Персональные настройки Emacs
;;
;; В локальном конфиге выполним настройку Лиспа
;;(setq inferior-lisp-program "/usr/bin/sbcl")
;;(setq slime-contribs '(slime-fancy))
;;
;; и загрузку своей кастомной конфигурации командой
;;(add-to-list 'load-path "~/.emacs.d/emacs-custom")
;;(require 'emacs-custom)
;;
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(provide 'emacs-custom)
;;================

(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;;================

;; Вначале загружаем сторонние модули
(require 'dired)
(setq dired-recursive-deletes 'top) ; разрешить удалять непустые директории

;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; После сторонних модулей загружаем свои
(require 'custom-keys)

;; Элементы интерфейса настраиваем в последнюю очередь
(setq frame-title-format "EMACS: %b")

(require 'linum)
(line-number-mode   t)
(global-linum-mode  t)         ; показывать слева номера строк
(setq linum-format "%3d ")     ; формат поля - с пробелом в конце

(fringe-mode '(0 . 0))         ; ширина боковых границ в пикселях
(setq-default indicate-empty-lines           t)
(setq-default indicate-buffer-boundaries 'left)

(column-number-mode t)         ; показывать в статусе номер колонки
(display-time-mode             t)
(setq display-time-24hr-format t) ; Display file size/time in mode-line
(size-indication-mode          t)

(setq show-paren-style 'mixed) ; режим отображения парных скобок
(show-paren-mode t)            ; включить

; Графические элементы окна
(menu-bar-mode      t)             ; строку меню отображать
(tool-bar-mode      t)             ; панель инструментов скрыть
(tooltip-mode       t)
(scroll-bar-mode    t)
(blink-cursor-mode  t)
(setq use-dialog-box     t)
(setq redisplay-dont-pause t)
(setq ring-bell-function 'ignore)  ; звук ошибки отключить
(setq x-select-enable-clipboard t) ; использовать буфер обмена OC

(setq make-backup-files        nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default        nil)

(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t)

(electric-pair-mode    t) ; авто-скобки/кавычки
(electric-indent-mode  t) ; автоотступ, если глючит - можно отключить

;; Автоматический перенос длинных строк
(setq word-wrap          t)
(global-visual-line-mode t)

;; Навигация по буферам (Esc F9)
(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)      ; список всех буферов: C-x C-b

;; F6: ввод имени функции для быстрого перехода к ней (custom-keys)
(require 'imenu)
(setq imenu-auto-rescan      t)
(setq imenu-use-popup-menu nil)

;; Coding-system settings
(set-language-environment 'UTF-8)
;(if (system-is-linux)
(progn
  (setq default-buffer-file-coding-system 'utf-8)
  (setq-default coding-system-for-read    'utf-8)
  (setq file-name-coding-system           'utf-8)
  (set-selection-coding-system            'utf-8)
  (set-keyboard-coding-system             'utf-8-unix)
  (set-terminal-coding-system             'utf-8)
  (prefer-coding-system                   'utf-8)
)
;    (progn
;        (prefer-coding-system                   'windows-1251)
;        (set-terminal-coding-system             'windows-1251)
;        (set-keyboard-coding-system             'windows-1251-unix)
;        (set-selection-coding-system            'windows-1251)
;        (setq file-name-coding-system           'windows-1251)
;        (setq-default coding-system-for-read    'windows-1251)
;        (setq default-buffer-file-coding-system 'windows-1251))
;)
