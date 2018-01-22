;; My Rust config


(use-package rust-mode
  :ensure rust-mode
  :commands rust-mode
  :init
  (progn
    (setq rust-format-on-save t)
    (eval-after-load 'company
      (add-to-list 'company-backends 'company-racer))
  )
)

(use-package company-racer
  :ensure company-racer
)


(provide 'my-rust)
