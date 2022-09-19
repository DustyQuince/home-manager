;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Dusty Quince"
      user-mail-address "dustyquince@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Source Code Pro" :size 22))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; winum settings
(winum-mode t)
(map! :map doom-leader-map "0" #'winum-select-window-0)
(map! :map doom-leader-map "1" #'winum-select-window-1)
(map! :map doom-leader-map "2" #'winum-select-window-2)
(map! :map doom-leader-map "3" #'winum-select-window-3)
(map! :map doom-leader-map "4" #'winum-select-window-4)
(map! :map doom-leader-map "5" #'winum-select-window-5)
(map! :map doom-leader-map "6" #'winum-select-window-6)
(map! :map doom-leader-map "7" #'winum-select-window-7)
(map! :map doom-leader-map "8" #'winum-select-window-8)
(map! :map doom-leader-map "9" #'winum-select-window-9)

;; Tangle on save in org-mode
(add-hook 'org-mode-hook
          (lambda () (add-hook 'after-save-hook #'org-babel-tangle
                          :append :local)))

;; Haskell-lsp waits for nix-shell to load
(use-package lsp-mode
  :hook (haskell-mode . lsp-deferred)
  :commands (lsp lsp-deferred))

;; PDF reading/tools. Dark
(use-package pdf-view
  :hook (pdf-tools-enabled . pdf-view-midnight-minor-mode)
  :hook (pdf-tools-enabled . hide-mode-line-mode)
  :config
  (setq pdf-view-midnight-colors '("#ABB2BF" . "#282C35")))

;; Disables incredibly annoying functionality
(setq haskell-interactive-popup-errors nil)

(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp)))
  :init
  (setq lsp-python-ms-executable (executable-find "python-language-server")))

(use-package ormolu
 :hook (haskell-mode . ormolu-format-on-save-mode)
 :bind
 (:map haskell-mode-map
   ("C-c r" . ormolu-format-buffer)))

;; Make sure emacs is seeing the right PATH for shell and for external calls
(setenv "PATH" (concat (getenv "PATH") ":/home/dustyquince/.nix-profile/bin"))
(setq exec-path (append exec-path '("/home/dustyquince/.nix-profile/bin")))

;; elfeed config
(setq rmh-elfeed-org-files (list "~/elfeed.org"))

;; Org-roam setup
(setq org-capture-templates
      '(("g" "Goal" entry (id "goals/")
"*** <Fill>
- [ ] <Achieved Result>
- [ ] <n> Minutes of Focus
"
)))

(setq org-roam-directory (file-truename "~/org/roam"))
(org-roam-db-autosync-mode)
(setq org-roam-dailies-directory "daily/")

(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
"* Schedule
** Work Goals
*** <Fill>
- [ ] <Achieved Result>
- [ ] <n> Minutes of Focus
** Work Achievements
** Other Goals
** Other Achievements

* Workout
** <Activity>
*** <Time>

* Maintenance
- [ ] Pistols
  - 0
- [ ] Pull-ups
  - 0
- [ ] Shoulder flow
- [ ] Band-assisted Hamstring Stretch

* Daily Meeze
** Clean Your Station
- [ ] Empty and Log Physical Inputs
- [ ] Clear and Log Digital Inputs
"
:target (file+head "%<%Y-%m-%d>.org"
                   "#+title: %<%Y-%m-%d>\n"))))


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
