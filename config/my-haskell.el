;; Setup for Haskell development


(use-package haskell-mode
  :ensure haskell-mode
  :commands haskell-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))
    (setq mode-name "Haskell"
          tab-width 4)
    (hl-todo-mode 1)
    (add-hook 'before-save-hook 'delete-trailing-whitespace)
    (eval-after-load "company"
      '(add-to-list 'company-backends 'company-ghc))
  )
)

(use-package company-ghc
  :ensure company-ghc
)

(provide 'my-haskell)
