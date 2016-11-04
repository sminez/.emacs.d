;; Setup for clojure development

(use-package clojure-mode
  :ensure clojure-mode
  :commands clojure-mode
  :init (add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
  :config
  (progn
    ;; NOTE: This is taken from the config for Clojure For the Brave
    (add-hook 'clojure-mode-hook 'enable-paredit-mode)
    ;; Useful for working with camel-case tokens
    (add-hook 'clojure-mode-hook 'subword-mode)
    ;; A little more syntax highlighting
    (use-package clojure-mode-extra-font-locking
      :ensure clojure-mode-extra-font-locking)
    ;; syntax hilighting for midje
    (add-hook 'clojure-mode-hook
              (lambda ()
                (setq inferior-lisp-program "lein repl")
                (font-lock-add-keywords
                 nil
                 '(("(\\(facts?\\)"
                    (1 font-lock-keyword-face))
                   ("(\\(background?\\)"
                    (1 font-lock-keyword-face))))
                (define-clojure-indent (fact 1))
                (define-clojure-indent (facts 1))))

    ;; Use CIDER for a better in editor repl experience!
    (use-package cider
      :ensure cider
      :config
      (progn
        ;; provid minibuffer docs for the code you're typing in the repl
        (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
        ;; go right to the REPL buffer when it's finished connecting
        (setq cider-repl-pop-to-buffer-on-connect t)
        ;; Where to store the cider history.
        (setq cider-repl-history-file "~/.emacs.d/cider-history")
        ;; Wrap when navigating history.
        (setq cider-repl-wrap-history t)
        ;; enable paredit in your REPL
        (add-hook 'cider-repl-mode-hook 'paredit-mode)
        ))

    (eval-after-load 'evil-leader
      (progn
        (evil-leader/set-key-for-mode 'clojure-mode
          ;;Cider stuff
          ",j" 'cider-jack-in
          ",b" 'cider-eval-buffer
          ",e" 'cider-eval-last-sexp
          ;; Helpers for manipulating sexps
          ",]" 'paredit-wrap-square
          ",)" 'paredit-wrap-round
          ",}" 'paredit-wrap-curly
          ",pe" 'enable-paredit-mode
          ",pd" 'disable-paredit-mode
          )))
  ))

(provide 'my-clojure)
