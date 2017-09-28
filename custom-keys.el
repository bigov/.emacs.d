;;
;; file: custom-keys.el
;;
;; Индивидуальная настройка работы клавишных комбинаций
;;
(provide 'custom-keys)

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

;;C-z, C-x C-z вызов команды "suspend-frame"
(global-unset-key (kbd "C-z"))
;; ^^
;; Отменить последнее изменение ( C-_, C-/, C-x u )
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-я") 'undo)

;; Дублирование базовых команд в русской раскладке
(global-set-key (kbd "C-н") 'yank) ; Ru: C-y
