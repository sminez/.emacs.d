;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Just getting started with this at the moment but have a look at this:   ;;
;; https://nathantypanski.com/blog/2014-08-03-a-vim-like-emacs-config.html ;;
;;                                                                         ;;
;; more here: https://github.com/nathantypanski/emacs.d/tree/master/config ;;
;;                                                                         ;;
;; Particularly the section on Use-Package for auto installing missing     ;;
;; packages when setting things up for the first time!                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Pull in my config files
(add-to-list 'load-path (concat user-emacs-directory "config"))

;; Populate the package archive
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
			             ("gnu" . "http://elpa.gnu.org/packages/")))

;; Set up the package manager and configure autoloading of packages
;; that aren't currently installed on the system
(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(require 'use-package)

;; Load my config files
(require 'my-ui)
(require 'my-git)
(require 'my-terminal)
(require 'my-evil-vim)
(require 'my-leader-map)

;; Export this as the init function
(provide 'init)
