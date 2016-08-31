;; Persistant Keybinding states for more involved tasks!


(defhydra hydra-projectile (:color teal
                            :hint nil)
  "
  Projectile: %(projectile-project-root)

  Files                Search                 Switching              Caching
------------------------------------------------------------------------------------------
  _f_: file            _a_: ag                _s_: switch project    _c_: cache clear
  _r_: recent file     _g_: grep              _b_: switch buffer     _x_: remove known project
  _d_: find dir        _m_: multi-swoop       _K_: Kill all buffers  _X_: cleanup non-existing
                                                                 ^^^^_z_: cache current file
"
  ;; File related
  ("f"   helm-projectile-find-file)
  ("r"   helm-projectile-recentf)
  ("d"   helm-projectile-find-dir)
  ;; Searching
  ("a"   helm-projectile-ag)
  ("g"   helm-projectile-grep)
  ("m"   helm-multi-swoop-projectile)
  ;; Switch project / buffer
  ("s"   helm-projectile-switch-project)
  ("b"   helm-projectile-switch-to-buffer)
  ("K"   projectile-kill-buffers)
  ;; Cache actions
  ("c"   projectile-invalidate-cache)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)
  ;; Choices not in the docstring appear at the bottom
  ("q"   nil "cancel" :color blue))


(defhydra hydra-docker (:color teal
                        :hint nil)
  "
Docker - available commands
  "
  ;; Mainly just a namespace: extend later
  ("i" 'docker-images)
  ("c" 'docker-containers)
  ("v" 'docker-volumes)

  ("q" nil "cancel" :color blue))

(provide 'my-hydras)
