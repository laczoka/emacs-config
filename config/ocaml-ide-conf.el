;; PATH to executables
(setq opam-bin (substring (shell-command-to-string "opam config var bin 2> /dev/null") 0 -1))
(setenv "PATH" (concat (getenv "PATH") opam-bin))
(setq exec-path (append exec-path opam-bin))

;; Add opam emacs directory to the load-path
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(load "tuareg-site-file")


;; Tuareg setup
(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))
;; utop
(autoload 'utop "utop" "Toplevel for OCaml" t)
(setq utop-command "opam config exec -- utop -emacs")

(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)

;; merlin
;(autoload 'merlin-mode "merlin" "Merlin mode" t)
(require 'merlin)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)
(define-key merlin-mode-map
  (kbd "C-c <up>") 'merlin-type-enclosing-go-up)
(define-key merlin-mode-map
  (kbd "C-c <down>") 'merlin-type-enclosing-go-down)
;; (set-face-background 'merlin-type-face "#88FF44")

;; ocp-indent
(require 'ocp-indent)
