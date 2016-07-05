(require 'package)
(add-to-list 'package-archives	     
	     '("melpa" . "https://melpa.org/packages/")
	     '("melpa-stable" . "https://stable.melpa.org/packages/")
	     ;; '("marmalade" . "http://marmalade-repo.org/packages/")
	     )

(setq required-packages
      '(paredit
	clojure-mode
	cider
	rainbow-delimiters
	mic-paren
	company
	company-flx
	ido-ubiquitous
	flx-ido
	magit
	git-gutter
	markdown-mode
	clj-refactor
	aggressive-indent))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-initialize)

(defun install-required-packages (package-list)
  (package-refresh-contents)
  (dolist (p package-list)
    (when (not (package-installed-p p))
      (print (format "Installing %s" p))
      (package-install p))))

;; (install-required-packages required-packages)


;; Emacs reset
(menu-bar-mode -1)
(tool-bar-mode -1)
(setenv "PATH" (concat (getenv "PATH") ":~/bin:/usr/local/bin"))
(setq exec-path (append exec-path '("~/bin" "/usr/local/bin")))
(setq-default cursor-type 'bar)
(global-linum-mode)
(set-default-font "Consolas 14")

;; Activate theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'noctilux t)

;; Activate and configure modes
(add-to-list 'load-path "~/.emacs.d/config")

(load "paredit-conf.el")
(load "aggressive-indent-conf.el")
(load "mic-paren-conf.el")
(load "clojure-conf.el")
(load "flx-ido-conf.el")
(load "ido-conf.el")

(with-eval-after-load 'company
  (company-flx-mode +1))

(load "company-mode-conf.el")
(load "cider-conf.el")
(load "gitgutter-conf.el")
(load "magit-conf.el")
(load "clj-refactor-conf.el")

;; (load "ocaml-conf.el")
;; (load "ocaml-ide-conf.el")

(load "custom.el")


;; Save buffers and minibuffer completion
(desktop-save-mode 1)
(savehist-mode 1)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
;; get rid of that annoying "bell"
(setq ring-bell-function 'ignore)

