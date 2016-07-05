(require 'cider)

;(defun live-windows-hide-eol ()
; "Do not show ^M in files containing mixed UNIX and DOS line endings."
; (interactive)
; (setq buffer-display-table (make-display-table))
; (aset buffer-display-table ?\^M []))

;(when (eq system-type 'windows-nt)
;  (add-hook 'nrepl-mode-hook 'live-windows-hide-eol ))

(add-hook 'cider-repl-mode-hook #'eldoc-mode)          
(add-hook 'cider-mode-hook  #'eldoc-mode)

(add-hook 'cider-repl-mode-hook #'paredit-mode)          
(add-hook 'cider-mode-hook  #'paredit-mode)

(setq cider-popup-stacktraces t)
(setq cider-popup-stacktraces-in-repl t)
;; (add-to-list 'same-window-buffer-names "*cider*")


(setq cider-repl-wrap-history t)

;; (setq nrepl-port "4555")

(setq cider-repl-display-help-banner nil)

(setq cider-repl-pop-to-buffer-on-connect nil)

(setq cider-show-error-buffer 'except-in-repl)

(setq cider-prompt-for-symbol nil)

(setq cider-font-lock-dynamically '(macro core function var))
