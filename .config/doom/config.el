;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Nav Aulakh"
      user-mail-address "nav@navaulakh.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "Berkeley Mono" :size 15 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "Berkeley Mono" :size 15))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Nav's customizations
(setq projectile-project-search-path '("~/Projects/"))

;; fontify code in code blocks
(setq org-src-fontify-natively t)

(setq mac-command-modifier      'super
      ns-command-modifier       'super
      mac-option-modifier       'meta
      ns-option-modifier        'meta
      mac-right-option-modifier 'meta
      ns-right-option-modifier  'meta)

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))



(defun create-branch-from-remote (base-branch new-branch)
  "Create and switch to NEW-BRANCH from BASE-BRANCH after updating BASE-BRANCH.
BASE-BRANCH will be pulled with rebase from its upstream first."
  (interactive
   (list (magit-read-branch "Base branch")
         (magit-read-string-ns "New branch name")))
  (when (or (null base-branch)
            (string-empty-p base-branch)
            (null new-branch)
            (string-empty-p new-branch))
    (user-error "Both base branch and new branch name must be provided"))

  ;; Store current branch to handle errors
  (let ((original-branch (magit-get-current-branch)))
    (condition-case err
        (progn
          ;; Switch to base branch
          (message "Switching to base branch '%s'" base-branch)
          (magit-checkout base-branch)

          ;; Pull with rebase
          (message "Pulling latest changes with rebase")
          (magit-pull-from-upstream "--rebase")

          ;; Create and checkout new branch using magit-branch-create
          (message "Creating and switching to new branch '%s'" new-branch)
          (magit-branch-create new-branch base-branch)
          (magit-checkout new-branch)

          (message "Successfully created and switched to branch '%s' from '%s'"
                   new-branch base-branch))
      ;; Error handling
      (error
       (progn
         (message "Error occurred: %s" (error-message-string err))
         ;; Try to return to original branch on error
         (when original-branch
           (magit-checkout original-branch)
           (message "Returned to branch '%s'" original-branch)))))))

;; Bind to C-c v b for non-evil usage
(with-eval-after-load 'which-key
  (which-key-add-key-based-replacements
    "C-c v b" "Create Branch from Remote"))
(global-set-key (kbd "C-c v b") #'create-branch-from-remote)
