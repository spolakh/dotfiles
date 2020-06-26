;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Vlad Sterzhanov"
      user-mail-address "gliderok@gmail.com")

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
(setq doom-font (font-spec :family "monospace" :size 14))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `visual)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

; THEMES:

(setq doom-theme 'doom-gruvbox)
(after! heaven-and-hell
  (setq heaven-and-hell-themes
        '((light . modus-operandi)
          (dark . doom-gruvbox)))
  ;; Optionall, load themes without asking for confirmation.
  (setq heaven-and-hell-load-theme-no-confirm t)
  (map!
   :leader "-" 'heaven-and-hell-toggle-theme))
(add-hook 'after-init-hook 'heaven-and-hell-init-hook)

; Other Favs:
;   - Light:
;(load-theme 'doom-solarized-light 'NO-CONFIRM)
;(load-theme 'doom-one-light 'NO-CONFIRM)
;(load-theme 'doom-tomorrow-day 'NO-CONFIRM)
;(load-theme 'doom-nord-light 'NO-CONFIRM)
;(load-theme 'dichromacy 'NO-CONFIRM)
;(load-theme 'spacemacs-light 'NO-CONFIRM)
;   - Dark:
;(load-theme 'doom-gruvbox 'NO-CONFIRM)
;(load-theme 'doom-one 'NO-CONFIRM)
;(load-theme 'doom-vibrant 'NO-CONFIRM)
;(load-theme 'doom-spacegrey 'NO-CONFIRM)
;(load-theme 'doom-tomorrow-night 'NO-CONFIRM)
;(load-theme 'doom-nord 'NO-CONFIRM)

; NAVIGATION:

(map!
 (:map evil-motion-state-map
  "<s-]>" #'better-jumper-jump-forward
  "s-]" #'better-jumper-jump-forward
  "<s-[>" #'better-jumper-jump-backward
  "s-[" #'better-jumper-jump-backward))

(map!
 (:map general-override-mode-map
  "s-l" #'evil-window-right
  "s-h" #'evil-window-left
  "s-j" #'evil-window-down
  "s-k" #'evil-window-up
  "s-L" #'evil-window-move-far-right
  "s-H" #'evil-window-move-far-left
  "s-J" #'evil-window-move-very-bottom
  "s-K" #'evil-window-move-very-top))

(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))

; ORG-MODE:

(after! org
  (map!
   (:map evil-normal-state-map
    "<s-return>" nil)
   (:map org-mode-map
    "<s-return>" #'org-todo))

  (setq
   org-todo-keywords '(
    (sequence "TODO" "WAITING" "|" "DONE" "PASS")
    (sequence "[NOTE.STUB]" "[NOTE.BOOK.INPROGRESS]" "|" "[NOTE.DAILY]" "[NOTE.EVERGREEN]" "[NOTE.OUTLINE(§)]" "[NOTE.BOOK.DONE]" "[NOTE.PERSON]"))
   org-directory "~/Dropbox/org")
  (require 'find-lisp)
  (setq spolakh/org-agenda-directory "~/Dropbox/org/private/gtd/")
  (setq org-agenda-files
        (find-lisp-find-files spolakh/org-agenda-directory "\.org$"))
  ;org-todo-keyword-faces
)

(use-package! org-agenda
  :init
  (map! :map org-mode-map :leader
        (:prefix ("n" . "notes")
         :desc "Agenda" "a" #'spolakh/switch-to-agenda))
  (setq org-agenda-block-separator nil
        org-agenda-start-with-log-mode t)
  (defun spolakh/switch-to-agenda ()
    (interactive)
    (org-agenda nil " "))
  (defun spolakh/org-current-is-todo ()
    (string= "TODO" (org-get-todo-state)))
  (defun spolakh/org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (let (should-skip-entry)
    (unless (spolakh/org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (spolakh/org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))
  :config
  (setq org-columns-default-format "%40ITEM(Task) %CLOCKSUM(Time Spent) %SCHEDULED(Scheduled) %DEADLINE(Deadline)")
  (setq org-agenda-custom-commands `((" " "Agenda"
  ((agenda ""
            ((org-agenda-span 'week)
            (org-deadline-warning-days 14)))
    (todo "TODO"
          ((org-agenda-overriding-header "To Refile")
          (org-agenda-files '(,(concat spolakh/org-agenda-directory "inbox.org")))))
    (todo "TODO"
          ((org-agenda-overriding-header "Projects")
          (org-agenda-files '(,(concat spolakh/org-agenda-directory "projects.org")))
          (org-agenda-skip-function #'spolakh/org-agenda-skip-all-siblings-but-first)
          ))
    (todo "TODO"
          ((org-agenda-overriding-header "One-off Tasks (under 1 Pomodoro)")
          (org-agenda-files '(,(concat spolakh/org-agenda-directory "oneoff.org")))
          (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled)))))))))


; ORG-ROAM:

(setq org-roam-directory "~/Dropbox/org")
(setq org-roam-link-title-format "[[%s]]")
(setq org-roam-index-file "~/Dropbox/org/index.org")
(setq org-roam-capture-templates
    '(("d" "default" plain (function org-roam--capture-get-point)
     "%?"
     :file-name "${slug}"
     :head "#+TITLE: ${title}\n#+CREATED: [%<%Y-%m-%d %a %H:%M>]\n\n* [NOTE.STUB]\n"
     :unnarrowed t)))


(map! :map org-roam-mode-map
      :leader
      (:prefix ("n" . "notes")
       (:prefix ("r" . "roam")
        :desc "Open Index" "i" 'org-roam-jump-to-index
        :desc "Insert a link to a Note" "l" 'org-roam-insert
       )))

(map!
   (:map global-map
    "M-z" "Ω"))
