;;
;; file: custom-keys.el
;;
;; Индивидуальная настройка работы клавишных комбинаций
;;
(provide 'custom-keys)

;; Сохранить текущий файл
(global-unset-key (kbd "<f5>"))
(global-set-key (kbd "<f5>") 'save-buffer)

;; Ввод имени функции для быстрого перехода
(global-set-key (kbd "<f6>") 'imenu)

;; Выход из Emacs
(global-unset-key (kbd "<f8>"))
(global-set-key (kbd "<f8>") 'save-buffers-kill-terminal)

;; Открыть файл
(global-unset-key (kbd "<f9>"))
(global-set-key (kbd "<f9>") 'find-file)

;; Список активных буферов для быстрого перехода
(global-set-key (kbd "ESC <f9>") 'bs-show)

;; Копировать выделение в буфер
(global-unset-key (kbd "C-c"))
(global-set-key (kbd "C-c") 'kill-ring-save)
(global-set-key (kbd "C-с") 'kill-ring-save); =RU= раскладка

;; Сброс терминала
(global-unset-key (kbd "M-w"))
(global-set-key (kbd "M-w") 'suspend-frame)
(global-set-key (kbd "M-ц") 'suspend-frame)

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-я") 'undo)

;; Дублирование базовых команд в русской раскладке
(global-set-key (kbd "C-н") 'yank) ; C-y (вставка из буфера)

