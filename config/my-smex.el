;;; Package --- Summary
;;; Commentary:
;;; Code:
(use-package smex
  ;; smex is a SMart M-X replacement
  :ensure smex
  :config
  (progn
    (smex-initialize)
    (global-set-key (kbd "M-x") 'smex)
    (global-set-key (kbd "M-X") 'smex-major-mode-commands)
    ;; This is the original M-x behaviour
    (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))

(provide 'my-smex)
;;; my-smex.el ends here
