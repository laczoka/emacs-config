(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/")
					;'("melpa" . "https://melpa.org/packages/")
	     )

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-initialize)

(defvar my-packages '(clojure-mode 
		      cider 
		      paredit
		      rainbow-delimiters
		      mic-paren
		      company
		      ;; company-flx -> no stable version yet
		      ido-ubiquitous
		      flx-ido
		      magit
		      git-gutter
		      markdown-mode
		      ;; merlin

)
  "A list of packages to ensure are installed at launch.")

(package-refresh-contents)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (print (format "Installing %s" p))
    (package-install p)))

;; TODO
;; (add-hook 'cider-repl-mode-hook #'eldoc-mode)
;; (global-company-mode)

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

(load "~/.emacs.d/config/paredit-conf.el")
(load "~/.emacs.d/config/mic-paren-conf.el")
(load "~/.emacs.d/config/clojure-conf.el")
(load "~/.emacs.d/config/flx-ido-conf.el")
(load "~/.emacs.d/config/ido-conf.el")
(load "~/.emacs.d/config/company-mode-conf.el")
(load "~/.emacs.d/config/cider-conf.el")
(load "~/.emacs.d/config/gitgutter-conf.el")
(load "~/.emacs.d/config/magit-conf.el")
(load "~/.emacs.d/config/custom.el")


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

