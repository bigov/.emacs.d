;;;
;;; file: custom-keys.el
;;;
;;; Индивидуальная настройка работы клавишных комбинаций
;;;
(provide 'custom-keys)

;;(cua-mode t) ; GIU MS-Win keys support - подключен в ~/.emacs

;; Из коробки TAB работает в режиме indent-relative (вызывается C-i)
;; При редактировании простого текста можно использовать
;; режим, включаемый командой tab-to-tab-stop (вызов M-i)

;; Ctrl-ТАБ переключен на вставку трех пробелов
(global-set-key (kbd "C-<tab>") #'(lambda () (interactive)
    (if (use-region-p)
        (indent-region)
        (insert "   "))))

(global-set-key (kbd "<select>") 'end-of-line)

;; Рекомендуемые клавиши для ORG
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;;<f2> <f2>, <f2> 2, C-x 6 <f2>, C-x 6 2
;;вызов команды "2C-two-columns"
(global-unset-key (kbd "<f2> <f2>"))
(global-unset-key (kbd "<f2> 2"))
;; ^^
;; Сохранить текущий файл
(global-set-key (kbd "<f2>") 'save-buffer)

;; Ввод имени функции для быстрого перехода
(global-set-key (kbd "<f6>") 'imenu)

;; Открыть меню
(global-set-key (kbd "<f9>") 'menu-bar-open)

;; Список активных буферов для быстрого перехода
(global-set-key (kbd "ESC <f9>") 'bs-show)

;; Выход из Emacs
(global-unset-key (kbd "<f10>"))
(global-set-key (kbd "<f10>") 'save-buffers-kill-terminal)
(global-set-key (kbd "M-<f4>") 'save-buffers-kill-terminal)

;;--------------------= helm =---------------------------------------------
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z") 'helm-select-action) ; list actions using C-z
(global-set-key (kbd "M-y") 'helm-show-kill-ring) ; Меню вставки буфера обмена
(global-set-key (kbd "C-x b") 'helm-mini) ; Список открытых буферов
;;-------------------------------------------------------------------------

;; Дублирование базовых команд в русской раскладке
(global-set-key (kbd "C-у") 'center-region)         ; C-e
(global-set-key (kbd "C-г") 'universal-argument)    ; C-u
(global-set-key (kbd "C-с") 'cua-copy-region)       ; C-c
(global-set-key (kbd "C-м") 'cua-paste)             ; C-v
(global-set-key (kbd "C-я") 'undo)                  ; C-z
(global-set-key (kbd "C-н") 'yank)                  ; C-y
(global-set-key (kbd "C-ц") 'kill-region)           ; C-w
(global-set-key (kbd "M-ц") 'kill-ring-save)        ; M-w
(global-set-key (kbd "M-ш") 'tab-to-tab-stop)       ; M-i
