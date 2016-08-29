;; Not working perfectly yet but this is my main config for
;; working with python files

(use-package python
  :init
  (progn
    (setq mode-name "Python"
          tab-width 4))
  :config
  (progn
    (defun py-start-or-switch-to-repl ()
      "Start and/or switch to the REPL."
      (interactive)
      (run-python "python3 -i")
      (python-shell-switch-to-shell)
      (evil-insert-state))
    
    (eval-after-load 'evil-leader
      '(progn
        (evil-leader/set-key-for-mode 'python-mode
        ;; Python docs and navigation
        ",d" 'anaconda-mode-find-definitions
        ",?" 'anaconda-mode-show-doc
        ",a" 'anaconda-mode-find-assignments
        ;; Python nose tests
        ",ta" 'nosetests-all
        ",to" 'nosetests-one
        ",tm" 'nosetests-module
        ",ts" 'nosetests-suite
        ;; REPL interaction
        ",p" 'py-start-or-switch-to-repl
        ",b" 'python-shell-send-buffer
        ",f" 'python-shell-send-defun
        ",v" 'python-shell-send-region))) 
))


(use-package python-mode
  :commands python-mode
  :mode "\\.py\\'"
  :init
  (progn
    (add-to-list 'auto-mode-alist '("/PYDOCS\\'" . help-mode))
    (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode)))
  :config
  (progn
    (setq py-electric-comment-p nil)
    (setq py-max-help-buffer-p nil)
    (setq py-electric-comment-add-space-p nil)
    (setq py-tab-indent nil)
    (setq py-smart-indentation t)
    (setq py-return-key 'py-newline-and-indent)
    (setq py-complete-function nil)
    (setq py-empty-line-closes-p nil)
))


(use-package anaconda-mode
  :ensure anaconda-mode
  :config
  (progn
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
))

(use-package company-anaconda
  :ensure company-anaconda
  :config
  (progn
    (eval-after-load "company"
      '(add-to-list 'company-backends '(company-anaconda :with company-capf)))
))
  
(use-package nose
  :ensure nose
  :commands (nosetests-one
             nosetests-pdb-one
             nosetests-all
             nosetests-pdb-all
             nosetests-module
             nosetests-pdb-module
             nosetests-suite
             nosetests-pdb-suite)
  :config
  (progn
    (add-to-list 'nose-project-root-files "setup.cfg")
    (setq nose-use-verbose nil)))


;; Make sure the shell works correctly without warnings about readline
;; NOTE: This is executed regardless of being in python mode
(setq python-shell-completion-native-enable nil
      py-python-command "python3"
      python-shell-interpreter "python3"
      python-shell-interpreter-interactive-arg "-i")

(provide 'my-python)
