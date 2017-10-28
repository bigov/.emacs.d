# Персональная настройка Emacs.

Для использования необходимо в домашнем файле конфигурации .emacs через переменную "emacs-custom-dir" указать полный путь к папке с настройками, и загрузить модуль. Например:

(setq emacs-custom-dir "c:/Users/ib/AppData/Roaming/.emacs.d/emacs-custom")
(add-to-list 'load-path emacs-custom-dir)
(require 'emacs-custom)
