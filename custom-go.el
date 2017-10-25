;;;
;;; go-mode
;;; Работа с исходникам на языке GO
;;;
;;; основано на
;;; http://reangdblog.blogspot.com/2016/06/emacs-ide-go.html
;;;
(provide 'custom-go)

(setq package-selected-packages (append package-selected-packages
   '(go-guru go-direx go-scratch gotest go-rename company-go go-eldoc go-mode)))

(require 'go-guru)
(require 'go-direx)
(require 'go-scratch)
(require 'gotest)
(require 'go-rename)
(require 'go-mode)
(require 'company-go)
(require 'go-eldoc)

(setq multi-compile-alist '((go-mode . (
("go-build" "go build -v"
   (locate-dominating-file buffer-file-name ".git"))
("go-build-and-run" "go build -v && echo 'build finish' && eval ./${PWD##*/}"
   (multi-compile-locate-file-dir ".git"))))))

;; Форматирование исходников делается через "goimports", который установили
;; выше. Он помимо собственно форматирования, умеет добавлять необходимые
;; импорты в текущем файле и вычищать неиспользуемые. Удобно вызывать его
;; автоматически, при сохранении:
;;(add-hook 'before-save-hook 'gofmt-before-save) ; автоматически исправляет исходники
(setq-default gofmt-command "goimports")

(add-hook 'go-mode-hook (lambda ()
    (set (make-local-variable 'company-backends) '(company-go))
    (company-mode)))

;; Плагин go-eldoc - умеет показывать в строке состояния информацию о
;; переменной или аргументе\возвращаемом значении функции находящейся под
;; курсором. Фактически документация по сигнатурам. настройки: 
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook 'yas-minor-mode)
(add-hook 'go-mode-hook 'flycheck-mode)

;; Переименование функций и структур - самый используемый из методов
;; рефакторинга. Он поддерживается плагином go-rename и вызывается при
;; помощи "M-x go-rename". Из недостатков - go-rename не работает, если
;; в проекте есть синтаксические ошибки.

;; M-x go-test-current-test - запустить тест внутри которого находится курсор
;; M-x go-test-current-file - запустить тесты внутри текущего файла
;; M-x go-test-current-project - запустить тесты для текущего проекта
;; M-x go-test-current-benchmark - по аналогии - запустить бенчмарк внутри которого находится курсор
;; M-x go-test-current-file-benchmarks - запустить бенчмарки в файле
;; M-x go-test-current-project-benchmarks - запустить бенчмарки в проекте
