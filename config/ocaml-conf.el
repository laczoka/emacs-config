;; PATH to executables
(setq opam-bin-dir-path "~/.opam/4.03.0/bin")
(setenv "PATH" (concat (getenv "PATH") "~/.opam/4.03.0/bin"))
(setq exec-path (append exec-path opam-bin-dir-path))
;; Add opam emacs directory to the load-path
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

(load "tuareg-site-file")

(autoload 'merlin-mode "merlin" "Merlin mode" t)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)

(require 'ocp-indent)
;; (require 'merlin)

;; utop
(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)
(setq utop-command "opam config exec -- utop -emacs")

