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

(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Вначале загружаем сторонние модули
(require 'dired)
(setq dired-recursive-deletes 'top) ; разрешить удалять непустые директории

;; Навигация по буферам (Esc F9)
(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)      ; список всех буферов: C-x C-b

;; F6: ввод имени функции для быстрого перехода к ней (custom-keys)
(require 'imenu)
(setq imenu-auto-rescan      t)
(setq imenu-use-popup-menu nil)

;; Syntax highlighting
(require 'font-lock)
(global-font-lock-mode             t) ;; включено с версии Emacs-22. На всякий...
(setq font-lock-maximum-decoration t)

;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; После сторонних модулей загружаем свои
(require 'custom-keys)

;; Элементы интерфейса настраиваем в последнюю очередь
(setq frame-title-format "EMACS: %b")

(require 'linum)
(line-number-mode   t)
(global-linum-mode  t)         ; показывать слева номера строк
(setq linum-format "%3d ")     ; формат поля - с пробелом в конце

(setq-default indicate-empty-lines           t)
(setq-default indicate-buffer-boundaries 'left)

;; не добавлять новую строку в конец при смещении курсора  стрелками
(setq next-line-add-newlines nil)

(defun format-current-buffer()
    "Пользовательская функция, которая удаляет лишние пробелы,
заменяет TAB'ы на пробелы, выравнивает отступы и сохраняет буфер в файл"
    (interactive)
    (indent-region (point-min) (point-max))
    (if (not indent-tabs-mode) (untabify (point-min) (point-max)) nil)
    (delete-trailing-whitespace)
    (save-buffer))
(global-set-key (kbd "ESC <f2>") 'format-current-buffer)

(if (equal nil (equal major-mode 'org-mode)) ; перемещение между окнами при помощи
    (windmove-default-keybindings 'meta))    ; Alt и стрелок (кроме режима ORG)

(setq search-highlight        t)
(setq query-replace-highlight t)

(column-number-mode t)         ; показывать в статусе номер колонки
(display-time-mode             t)
(setq display-time-24hr-format t) ; Display file size/time in mode-line
(size-indication-mode          t)

(setq show-paren-style 'mixed) ; режим отображения парных скобок
(show-paren-mode t)            ; включить

;; Настройка плавного скроллинга
(setq scroll-step   1) ;; вверх-вниз по 1 строке
(setq scroll-margin 8) ;; сдвигать буфер верх/вниз когда курсор в 8 шагах от верхней/нижней границы
(setq scroll-conservatively 10000)

;; Графические элементы окна
(menu-bar-mode      t)             ; строку меню отображать
(tool-bar-mode      t)             ; панель инструментов
(tooltip-mode       t)
(scroll-bar-mode    t)
(blink-cursor-mode  t)
(setq use-dialog-box     t)
(setq redisplay-dont-pause t)
(setq ring-bell-function 'ignore)  ; звук ошибки отключить
(setq x-select-enable-clipboard t) ; использовать буфер обмена OC

(setq make-backup-files        nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default        nil) ; автосохранение не использовать

(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t)

(electric-pair-mode    t) ; авто-скобки/кавычки
(electric-indent-mode  t) ; автоотступ, если глючит - можно отключить

;; Автоматический перенос длинных строк
(setq word-wrap          t)
(global-visual-line-mode t)

;; Indent settings
(setq-default indent-tabs-mode nil) ;; отключить возможность ставить отступы TAB'ом
(setq-default tab-width          4) ;; ширина табуляции - 4 пробельных символа
(setq-default c-basic-offset     4)
(setq-default standart-indent    4) ;; стандартная ширина отступа - 4 пробельных символа
(setq-default lisp-body-indent   4) ;; сдвигать Lisp-выражения на 4 пробельных символа
(global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии Enter перевести каретку и сделать отступ
(setq lisp-indent-function  'common-lisp-indent-function)

;; Coding-system settings
(set-language-environment 'UTF-8)
;;(if (system-is-linux)
(progn
    (setq default-buffer-file-coding-system 'utf-8)
    (setq-default coding-system-for-read    'utf-8)
    (setq file-name-coding-system           'utf-8)
    (set-selection-coding-system            'utf-8)
    (set-keyboard-coding-system             'utf-8-unix)
    (set-terminal-coding-system             'utf-8)
    (prefer-coding-system                   'utf-8)
    )
;;    (progn
;;        (prefer-coding-system                   'windows-1251)
;;        (set-terminal-coding-system             'windows-1251)
;;        (set-keyboard-coding-system             'windows-1251-unix)
;;        (set-selection-coding-system            'windows-1251)
;;        (setq file-name-coding-system           'windows-1251)
;;        (setq-default coding-system-for-read    'windows-1251)
;;        (setq default-buffer-file-coding-system 'windows-1251))
;;)
