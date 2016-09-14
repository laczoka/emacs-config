(require 'rust-mode)
(setq racer-rust-src-path "/usr/local/src/rustc-1.11.0/src"
					;(getenv "RUST_SRC_PATH")
      )

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
