(eval-after-load 'find-file-in-project
  '(add-to-list 'ffip-patterns "*.clj"))

(require 'clojure-mode)

(dolist (x '(scheme emacs-lisp lisp clojure))
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'enable-paredit-mode)
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-delimiters-mode))

(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(add-hook 'clojure-mode-hook 'projectile-mode)

;(define-key clojure-mode-map (kbd "C-:") 'cljr-cycle-stringlike)
;(define-key clojure-mode-map (kbd "C->") 'cljr-cycle-coll)
