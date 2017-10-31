;;
;; Персональные настройки Emacs
;; 2017.10.28
;;
;; ;; Для загрузки конфигурации необходимо через переменную "emacs-custom-dir"
;; ;; указать полный путь к папке с настройками, например:
;; (setq emacs-custom-dir "c:/Users/ib/AppData/Roaming/.emacs.d/emacs-custom")
;; (add-to-list 'load-path emacs-custom-dir)
;; (require 'emacs-custom)
;;
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(provide 'emacs-custom)

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

;; Установка пакетов для кастомной конфигурации:
;;	M-x package-refresh-contents
;;  M-x package-install-selected-packages
;;
(setq package-selected-packages (append package-selected-packages
   '(helm-projectile helm-swoop iedit anzu ws-butler dtrt-indent clean-aindent-mode undo-tree volatile-highlights helm-gtags helm zygospore projectile use-package rainbow-mode flycheck yasnippet company)))


(add-to-list 'custom-theme-load-path emacs-custom-dir)
(load-theme 'subleuven t)
;;#1874CD = color-25
(set-face-background 'menu "brightwhite")
(set-face-foreground 'menu "#1874CD")
(set-face-background 'tty-menu-disabled-face "#1874CD")
(set-face-foreground 'tty-menu-disabled-face "darkwhite")
(set-face-background 'tty-menu-enabled-face "#1874CD")
(set-face-foreground 'tty-menu-enabled-face "brightwhite")
(set-face-bold       'tty-menu-enabled-face nil)
(set-face-background 'tty-menu-selected-face "#0063BC")

;;(defun system-is-Linux() (string-equal system-type "gnu/linux"))
;;(defun system-is-MsWin() (string-equal system-type "windows-nt"))
;;(defun system-is-msys2() (string-equal system-type "cygwin"))
;;(defun system-is-unix()  (string-equal system-type "berkeley-unix"))

(require 'company) ; Autocomplete
(setq company-tooltip-limit 20) ; bigger popup window
(setq company-idle-delay .3)    ; decrease delay before popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

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

(require 'font-lock) ; Syntax highlighting
(setq font-lock-maximum-decoration t)

;;(require 'auto-complete) ; Autocomplete
;;(ac-config-default)

(require 'yasnippet) ; Snippets
(yas-reload-all)

;; Подсветка ошибок до компиляции очень ускоряет разработку. Для этого
;; ставим flycheck и делаем общие настройки, по необходимости. Затем
;; переключаемся в буфер в котором включен режим go-mode и проверяем,
;; что flycheck видит все необходимые утилиты: "M-x flycheck-verify-setup"
(require 'flycheck)

;; Автоподсветка цветовых параметров ??
(require 'rainbow-mode)

;;--------------------------- helm module ---------------------------------
(require 'helm)
(require 'helm-config)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-buffers-fuzzy-matching t helm-recentf-fuzzy-match t) ; fuzzy matching

(setq helm-autoresize-max-height 40)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)
(helm-mode 1)
;;-------------------------------------------------------------------------

(add-hook 'after-init-hook 'global-company-mode)
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; После сторонних модулей загружаем свои
(require 'custom-keys)

;; И настраиваем интерфейс
(setq frame-title-format "EMACS: %b")

(require 'linum)
(line-number-mode   t)
(global-linum-mode  t)         ; показывать слева номера строк
(setq linum-format "%3d ")     ; формат поля - с пробелом в конце

(setq-default indicate-empty-lines           t)
(setq-default indicate-buffer-boundaries 'left)

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

(setq word-wrap          nil) ; перенос длинных строк ВЫКЛ
(global-visual-line-mode t)

(setq-default fill-column 78)
(auto-fill-mode t)

;; Indent settings
;;(setq-default indent-tabs-mode nil) ;отключить возможность ставить отступы TAB'ом
;;(setq indent-line-function 'insert-tab)
(setq-default tab-width       4) ; ширина табуляции - 4 пробельных символа
(setq-default c-basic-offset  4)
(setq-default standart-indent 4) ; стандартная ширина отступа - 4 пробельных символа

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

