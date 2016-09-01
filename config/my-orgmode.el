;; Extensions and tweaks for Org mode
;;
;; Howard Abrams has a *lot* of org mode stuff!
;; https://github.com/howardabrams/dot-files/blob/master/emacs-org.org
;;
;; To look at:
;;     https://github.com/yjwen/org-reveal
;;     https://github.com/kelvinh/org-page
;;     https://github.com/myuhe/org-gcal.el
;;     https://github.com/gregsexton/ob-ipython

(use-package org-bullets
  :ensure org-bullets
  :diminish org-bullets
  :config
  (progn
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))))

(use-package evil-org
  :ensure evil-org
  :diminish evil-org)

(provide 'my-orgmode)
