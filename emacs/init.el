
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; (load "~/.emacs.d/el-get.el")
;; (add-hook 'python-mode-hook 'jedi:setup)

;; (when (memq window-system '(mac ns x))
;;  (exec-path-from-shell-initialize))


(load "~/.emacs.d/jedi-starter.el")
(load "~/.emacs.d/format-all.el")
(load "~/.emacs.d/neotree.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-python-flake8-executable "/usr/local/bin/flake8")
 '(package-selected-packages
   (quote
    (py-autopep8 zenburn-theme flycheck jedi epc auto-complete projectile better-defaults)))
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "node_modules")))
 '(python-shell-interpreter
   "/Users/navaulakh/.emacs.d/.python-environments/default/bin/python")
 '(python-shell-virtualenv-root nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
