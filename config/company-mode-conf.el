(require 'company)
;; Use it globally
(add-hook 'after-init-hook 'global-company-mode)
;; Use company only for cider and cider-repl buffers
(setq company-idle-delay 0.5)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 2)
;; invert the navigation direction if the the completion popup-isearch-match
;; is displayed on top (happens near the bottom of windows)
(setq company-tooltip-flip-when-above t)

;; (add-hook 'cider-mode-hook 'company-mode)
;; (add-hook 'cider-repl-mode-hook 'company-mode)
