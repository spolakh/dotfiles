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
(add-to-list 'load-path "~/.doom.d/vendor/auto-dark-emacs/")
(require 'auto-dark-emacs)

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
  (map! :map org-mode-map
      :leader
      (:prefix ("n" . "notes")
       :desc "Refile" "R" 'org-refile
       :desc "Capture to Inbox" "i" (lambda () (interactive) (org-capture nil "i"))))

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

(setq org-refile-targets '(("later.org" :maxlevel . 1)
                           ("oneoff.org" :level . 0)
                           ("projects.org" :maxlevel . 1)))

(setq org-capture-templates
        `(("i" "inbox" entry (file ,(concat spolakh/org-agenda-directory "inbox.org"))
           "* TODO %?")))


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
  ; This is heavily adopted from Sacha Chua's https://sachachua.com/blog/2013/01/emacs-org-display-projects-with-a-few-subtasks-in-the-agenda-view/
  ;; (defun spolakh/org-agenda-project-agenda ()
  ;;   "Return the project headline and up to `org-agenda-max-entries' tasks."
  ;;   (save-excursion
  ;;     (let* ((marker (org-agenda-new-marker))
  ;;            (heading
  ;;             (org-agenda-format-item "" (org-get-heading) (org-get-category) nil))
  ;;            (org-agenda-restrict t)
  ;;            (org-agenda-restrict-begin (point))
  ;;            (org-agenda-restrict-end (org-end-of-subtree 'invisible))
  ;;            ;; Find the TODO items in this subtree
  ;;            (list (org-agenda-get-day-entries (buffer-file-name) (calendar-current-date) :todo)))
  ;;       (org-add-props heading
  ;;           (list 'face 'defaults
  ;;                 'done-face 'org-agenda-done
  ;;                 'undone-face 'default
  ;;                 'mouse-face 'highlight
  ;;                 'org-not-done-regexp org-not-done-regexp
  ;;                 'org-todo-regexp org-todo-regexp
  ;;                 'org-complex-heading-regexp org-complex-heading-regexp
  ;;                 'help-echo
  ;;                 (format "mouse-2 or RET jump to org file %s"
  ;;                         (abbreviate-file-name
  ;;                          (or (buffer-file-name (buffer-base-buffer))
  ;;                              (buffer-name (buffer-base-buffer))))))
  ;;         'org-marker marker
  ;;         'org-hd-marker marker
  ;;         'org-category (org-get-category)
  ;;         'type "tagsmatch")
  ;;       (concat heading "\n"
  ;;               (org-agenda-finalize-entries list)))))
  ;; (defun spolakh/org-agenda-projects-and-tasks (match)
  ;;   "Show TODOs for all `org-agenda-files' headlines matching MATCH."
  ;;   (interactive "MString: ")
  ;;   (let ((todo-only nil))
  ;;     (let* ((org-tags-match-list-sublevels
  ;;             org-tags-match-list-sublevels)
  ;;            (completion-ignore-case t)
  ;;            rtn rtnall files file pos matcher
  ;;            buffer)
  ;;       (when (and (stringp match) (not (string-match "\\S-" match)))
  ;;         (setq match nil))
  ;;       (when match
  ;;         (setq matcher (org-make-tags-matcher match)
  ;;               match (car matcher) matcher (cdr matcher)))
  ;;       (catch 'exit
  ;;         (if org-agenda-sticky
  ;;             (setq org-agenda-buffer-name
  ;;                   (if (stringp match)
  ;;                       (format "*Org Agenda(%s:%s)*"
  ;;                               (or org-keys (or (and todo-only "M") "m")) match)
  ;;                     (format "*Org Agenda(%s)*" (or (and todo-only "M") "m")))))
  ;;         (org-agenda-prepare (concat "TAGS " match))
  ;;         (org-compile-prefix-format 'tags)
  ;;         (org-set-sorting-strategy 'tags)
  ;;         (setq org-agenda-query-string match)
  ;;         (setq org-agenda-redo-command
  ;;               (list 'org-tags-view `(quote ,todo-only)
  ;;                     (list 'if 'current-prefix-arg nil `(quote ,org-agenda-query-string))))
  ;;         (setq files (org-agenda-files nil 'ifmode)
  ;;               rtnall nil)
  ;;         (while (setq file (pop files))
  ;;           (catch 'nextfile
  ;;             (org-check-agenda-file file)
  ;;             (setq buffer (if (file-exists-p file)
  ;;                              (org-get-agenda-file-buffer file)
  ;;                            (error "No such file %s" file)))
  ;;             (if (not buffer)
  ;;                 ;; If file does not exist, error message to agenda
  ;;                 (setq rtn (list
  ;;                            (format "ORG-AGENDA-ERROR: No such org-file %s" file))
  ;;                       rtnall (append rtnall rtn))
  ;;               (with-current-buffer buffer
  ;;                 (unless (derived-mode-p 'org-mode)
  ;;                   (error "Agenda file %s is not in `org-mode'" file))
  ;;                 (save-excursion
  ;;                   (save-restriction
  ;;                     (if org-agenda-restrict
  ;;                         (narrow-to-region org-agenda-restrict-begin
  ;;                                           org-agenda-restrict-end)
  ;;                       (widen))
  ;;                     (setq rtn (org-scan-tags 'spolakh/org-agenda-project-agenda matcher todo-only))
  ;;                     (setq rtnall (append rtnall rtn))))))))
  ;;         (if org-agenda-overriding-header
  ;;             (insert (org-add-props (copy-sequence org-agenda-overriding-header)
  ;;                         nil 'face 'org-agenda-structure) "\n")
  ;;           (insert "Headlines with TAGS match: ")
  ;;           (add-text-properties (point-min) (1- (point))
  ;;                                (list 'face 'org-agenda-structure
  ;;                                      'short-heading
  ;;                                      (concat "Match: " match)))
  ;;           (setq pos (point))
  ;;           (insert match "\n")
  ;;           (add-text-properties pos (1- (point)) (list 'face 'org-warning))
  ;;           (setq pos (point))
  ;;           (unless org-agenda-multi
  ;;             (insert "Press `C-u r' to search again with new search string\n"))
  ;;           (add-text-properties pos (1- (point)) (list 'face 'org-agenda-structure)))
  ;;         (org-agenda-mark-header-line (point-min))
  ;;         (when rtnall
  ;;           (insert (mapconcat 'identity rtnall "\n") ""))
  ;;         (goto-char (point-min))
  ;;         (or org-agenda-multi (org-agenda-fit-window-to-buffer))
  ;;         (add-text-properties (point-min) (point-max)
  ;;                              `(org-agenda-type tags
  ;;                                                org-last-args (,todo-only ,match)
  ;;                                                org-redo-cmd ,org-agenda-redo-command
  ;;                                                org-series-cmd ,org-cmd))
  ;;         (org-agenda-finalize)
  ;;         (setq buffer-read-only t)))))
  (defun spolakh/org-current-is-first-level-headline ()
    (= 1 (org-current-level)))
  (defun spolakh/org-current-is-todo ()
    (or (string= "TODO" (org-get-todo-state))))
  ; org-with-limited-levels?
  ; org-current-level
  (defun spolakh/org-agenda-leave-only-heading-and-three-children ()
  "Returns each 1st level heading and at most 3 of it's TODO subheadings"
  (let (should-skip-entry)
    (unless (spolakh/org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (let ((nth-task 1))
      (while (and (<= nth-task 3) (org-goto-sibling t))
        (when (spolakh/org-current-is-todo)
          (setq nth-task (+ nth-task 1))))
      (when (> nth-task 3)
        (setq should-skip-entry t))))
    (when (spolakh/org-current-is-first-level-headline)
      (setq should-skip-entry nil))
    (when (> (org-current-level) 2)
      (setq should-skip-entry t))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))
  :config
  (setq org-agenda-prefix-format
        '((agenda . " %i %-12:c%?-12t% s")
        (todo . "  ")
        (tags . "  ")
        (search . "  ")))
  (setq org-columns-default-format "%40ITEM(Task) %CLOCKSUM(Time Spent) %SCHEDULED(Scheduled) %DEADLINE(Deadline)")
  (setq org-agenda-custom-commands `((" " "Agenda"
  ((agenda ""
            ((org-agenda-span 'week)
            (org-deadline-warning-days 14)))
    (todo "TODO"
          ((org-agenda-overriding-header "To Refile")
           (org-agenda-files '(,(concat spolakh/org-agenda-directory "inbox.org")))
           (org-agenda-max-entries 10)))
    (todo "TODO"
          ((org-agenda-overriding-header "Projects")
          (org-agenda-files '(,(concat spolakh/org-agenda-directory "projects.org")))
          (org-agenda-skip-function #'spolakh/org-agenda-leave-only-heading-and-three-children)
          ))
    (todo "WAITING"
          ((org-agenda-overriding-header "Blocked")))
    ;; (spolakh/org-agenda-projects-and-tasks "+PROJECT"
    ;;  ((org-agenda-max-entries 3)
    ;;   (org-agenda-files '(,(concat spolakh/org-agenda-directory "projects.org")))))
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
