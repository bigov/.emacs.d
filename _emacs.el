;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (leuven)))
 '(display-time-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(package-selected-packages
   (quote
	(go-guru go-direx go-scratch gotest flycheck multi-compile go-rename
	 yasnippet company-go company go-eldoc go-mode)))
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (display-graphic-p)
  (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-9")))

(defun system-is-Linux() (string-equal system-type "gnu/linux"))
(defun system-is-MsWin() (string-equal system-type "windows-nt"))
(defun system-is-msys2()  (string-equal system-type "cygwin"))
(defun system-is-unix()   (string-equal system-type "berkeley-unix"))

(when (system-is-Linux)
  (setq my-files "~/files/")
  (when (display-graphic-p)
	(set-frame-size (selected-frame) 140 63)
	(set-frame-position (selected-frame) 400 0)))

(when (system-is-MsWin)
  (setq my-files "f:/")
  (when (display-graphic-p)
	(set-frame-size (selected-frame) 140 65)
	(set-frame-position (selected-frame) 500 0)))

(when (system-is-msys2) (setq my-files "~/"))
(when (system-is-unix) (setq my-files "~/"))

(setq custom-config-dir (concat my-files "github.com/emacs-custom"))
(add-to-list 'load-path custom-config-dir)
(add-to-list 'custom-theme-load-path custom-config-dir)

(require 'emacs-custom)  ; Загрузка кастомной конфигурации

;;(setq tool-bar (:background ,custom-border :foreground "wheat" :box (:line-width 1 :style released-button)))


(setq 'tool-bar-border 1)



(set-face-background 'tool-bar "#f5f5f5")
(set-face-foreground 'mode-line-buffer-id "#ffff33")
(set-face-foreground 'mode-line "#efefef")
(set-face-background 'mode-line "#44d")
(set-face-background 'mode-line-inactive "#afafaf")
(set-face-foreground 'mode-line-inactive "#000000")


(set-face-background 'linum "#fff")
;;(set-face-background 'mode-line "#bcbcbc")
;;(set-face-foreground 'mode-line-inactive "#888")

;;(require 'custom-go)
;;(require 'custom-lisp)
