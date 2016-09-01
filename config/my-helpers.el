;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Insert a black line above/below point ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my/evil-insert-line-below (count)
  "Insert one of several lines below the current point's line without changing
the current state and point position."
  (interactive "p")
  (save-excursion
    (evil-save-state (evil-open-below count))))

(defun my/evil-insert-line-above (count)
  "Insert one of several lines above the current point's line without changing
the current state and point position."
  (interactive "p")
  (save-excursion
    (evil-save-state (evil-open-above count))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable cycling of themes ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defadvice load-theme (before theme-dont-propagate activate)
  "Disable theme before loading new one."
  (mapc #'disable-theme custom-enabled-themes))

(defun my/next-theme (theme)
  (if (eq theme 'default)
      (disable-theme *my-current-theme*)
    (progn
      (load-theme theme)
      (spaceline-compile))
  (setq *my-current-theme* theme)))

(defun my/toggle-theme ()
  "Allow for cycling of themes
   NOTE: these variables are set in my-ui.el"
  (interactive)
  (my/next-theme (if (eql *my-current-theme* (car (last *my-themes*)))
                     ;; Loop back to the start
                     (car *my-themes*)
                   ;; Otherwise, load the next in the list
                   (cadr (member *my-current-theme* *my-themes*)))))


(provide 'my-helpers)
