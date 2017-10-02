;;
;; Подключаемая конфигурация для работы с Lisp
;; 
(provide 'custom-lisp)

;; LISP бинарники по-умолчанию
(require 'cl)
(setq-default inferior-lisp-program "sbcl")

;; SLIME: The Superior Lisp Interaction Mode for Emacs
;; Use M-x slime to fire up and connect to an inferior Lisp.
;; SLIME will now automatically be available in your Lisp source buffers.
(add-to-list 'load-path "~/files/github.com/slime")
(require 'slime-autoloads)
(setq slime-contribs '(slime-fancy))

