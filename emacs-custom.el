;;
;; Персональные настройки Emacs
;;
;; Установка пакетов для кастомной конфигурации:
;;
;;	M-x package-refresh-contents
;;  M-x package-install-selected-packages
;;
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(provide 'emacs-custom)

(load-theme 'leuven t)
(when (display-graphic-p) (add-to-list 'default-frame-alist
									   '(font . "DejaVu Sans Mono-9")))

;;(defun system-is-Linux() (string-equal system-type "gnu/linux"))
;;(defun system-is-MsWin() (string-equal system-type "windows-nt"))
;;(defun system-is-msys2() (string-equal system-type "cygwin"))
;;(defun system-is-unix()  (string-equal system-type "berkeley-unix"))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Вначале загружаем сторонние модули
(require 'dired)
(setq dired-recursive-deletes 'top) ; разрешить удалять непустые директории

;; Навигация по буферам (Esc F9), список всех буферов: C-x C-b
(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)      

;; <F6>: ввод имени функции для быстрого перехода к ней (custom-keys)
;;(require 'imenu)
;;(setq imenu-auto-rescan      t)
;;(setq imenu-use-popup-menu nil)

;; Syntax highlighting
(require 'font-lock)
(global-font-lock-mode             t) ;; включено с версии Emacs-22. На всякий...
(setq font-lock-maximum-decoration t)

;;Автодополнение - company, company-go и добавляем в конфиг: 
(require 'company)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

;;Сниппеты
(require 'yasnippet)
(yas-reload-all)

;; Подсветка ошибок до компиляции очень ускоряет разработку. Для этого
;; ставим flycheck и делаем общие настройки, по необходимости. Затем
;; переключаемся в буфер в котором включен режим go-mode и проверяем,
;; что flycheck видит все необходимые утилиты: "M-x flycheck-verify-setup"
(require 'flycheck)

;;http://reangdblog.blogspot.com/2016/02/emacs-multi-compile.html
(require 'multi-compile)
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

(column-number-mode            t) ; показывать в статусе номер колонки
(display-time-mode             t) ; показывать в статусе текущее время
(setq display-time-24hr-format t) ; Display file size/time in mode-line
(size-indication-mode          t)

(setq show-paren-style 'mixed) ; режим отображения парных скобок
(show-paren-mode t)            ; включить

;; Настройка плавного скроллинга
(setq scroll-step   1) ; вверх-вниз по 1 строке
(setq scroll-margin 6) ; сдвигать буфер верх/вниз когда курсор в 6 строках от верхней/нижней границы
(setq scroll-conservatively 10000)

;; Графические элементы окна
(when (display-graphic-p)
  (scroll-bar-mode t)
  (tool-bar-mode   t)
  (menu-bar-mode   t))

(tooltip-mode        t)
(blink-cursor-mode   t)
(setq use-dialog-box t)
(setq redisplay-dont-pause t)
(setq ring-bell-function 'ignore)  ; звук ошибки отключить
(setq x-select-enable-clipboard t) ; использовать буфер обмена OC

(setq make-backup-files        nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default        nil) ; автосохранение не использовать

(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t)

(electric-pair-mode          -1) ; авто-скобки/кавычки ВЫКЛ
(electric-indent-mode         t) ; автоотступ, если глючит - можно отключить
(electric-indent-just-newline t)

;; Автоматический перенос длинных строк
(setq word-wrap          t)
(global-visual-line-mode t)

(setq-default fill-column 78)
(auto-fill-mode t)

;; Indent settings
;;(setq-default indent-tabs-mode nil) ;отключить возможность ставить отступы TAB'ом
;;(setq indent-line-function 'insert-tab)
(setq-default tab-width          4) ; ширина табуляции - 4 пробельных символа
(setq-default c-basic-offset     4)
(setq-default standart-indent    4) ; стандартная ширина отступа - 4 пробельных символа

(setq lisp-body-indent 2) ; сдвигать Lisp-выражения на 2 символа
(setq lisp-indent-function  'common-lisp-indent-function)

;; Coding-system settings
(set-language-environment 'UTF-8)

;;(progn
;;  (setq default-buffer-file-coding-system 'utf-8)
;;  (setq-default coding-system-for-read    'utf-8)
;;  (setq file-name-coding-system           'utf-8)
;;  (set-selection-coding-system            'utf-8)
;;  (set-keyboard-coding-system             'utf-8-unix)
;;  (set-terminal-coding-system             'utf-8)
;;  (prefer-coding-system                   'utf-8))
