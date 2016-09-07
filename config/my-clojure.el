;; Setup for clojure development

(use-package clojure-mode
  :ensure clojure-mode
  :commands clojure-mode
  :init (add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
  )

; (use-package cider
;   :ensure cider
; )

(provide 'my-clojure)
