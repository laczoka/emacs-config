;; keyboard
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)



(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(define-key global-map (kbd "C-c C-/") 'comment-or-uncomment-region-or-line)
