;;;
;;; file: custom-keys.el
;;;
;;; Индивидуальная настройка работы клавишных комбинаций
;;;
(provide 'custom-keys)

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

(cua-mode)
;; ^^
;;(global-set-key (kbd "C-с") 'kill-ring-save)
;;(global-set-key (kbd "C-ч") 'cua-cut-region)

(global-unset-key (kbd "C-e"))
(global-set-key (kbd "C-e") 'center-region)

;; Дублирование базовых команд в русской раскладке
(global-set-key (kbd "C-у") 'center-region)         ; C-e
(global-set-key (kbd "C-г") 'universal-argument)    ; C-u
(global-set-key (kbd "C-с") 'cua-copy-region)       ; C-c
(global-set-key (kbd "C-ч") 'kill-region)           ; C-x
(global-set-key (kbd "C-м") 'cua-paste)             ; C-v
(global-set-key (kbd "C-я") 'undo)                  ; C-z
(global-set-key (kbd "C-н") 'yank)                  ; C-y
(global-set-key (kbd "C-ц") 'kill-region)           ; C-w
(global-set-key (kbd "M-ц") 'kill-ring-save)        ; M-w
(global-set-key (kbd "M-ш") 'tab-to-tab-stop)       ; M-i
