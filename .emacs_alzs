;;
;; Мой личный конфиг (01.10.2017)
;;

(require 'package)
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
 '(display-time-mode t)
 '(font-use-system-font 0)
 '(indent-tabs-mode t)
 '(inhibit-startup-screen 0)
 '(package-selected-packages
   (quote
    (org-edna slime tabbar-ruler nlinum nlinum-hl undo-tree)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(standard-indent 2)
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 78 :width normal))))
 '(linum ((t (:inherit (shadow default))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Загрузка кастомной конфигурации
(add-to-list 'load-path "/home/ib/files/github.com/emacs-custom")
(require 'emacs-custom)

;; LISP бинарники по-умолчанию
(require 'cl)
(setq-default inferior-lisp-program "sbcl")

;; SLIME: The Superior Lisp Interaction Mode for Emacs
;; Use M-x slime to fire up and connect to an inferior Lisp.
;; SLIME will now automatically be available in your Lisp source buffers.
(add-to-list 'load-path "~/files/github.com/slime")
(require 'slime-autoloads)
(setq slime-contribs '(slime-fancy))

;; Start window size
(when (window-system)
    (set-frame-size (selected-frame) 120 43)
    (set-frame-position (selected-frame) 400 0)
    )
;; System type fo multisystem config
;;(defun system-is-linux()   (string-equal system-type "gnu/linux"))
;;(defun system-is-windows() (string-equal system-type "windows-nt"))
;; path-variable
;;(when (system-is-linux)    (setq unix-init-path "~/.emacs.add"))
;;(when (system-is-windows)  (setq win-init-path "C:/.emacs.d"))
