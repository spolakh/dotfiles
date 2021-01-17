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
;; font string.
;;
;(setq doom-font (font-spec :family "monospace" :size 14))
; spolakh/FAVS:
;(setq doom-font (font-spec :family "Menlo" :size 13))
(setq doom-font "-*-Menlo-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")
;(setq doom-font (font-spec :family "Anonymous Pro" :size 13 :weight 'bold))
;  (setq doom-font "Fira Code-12")
;  (setq doom-font "Ubuntu Mono-14")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `visual)
(global-display-line-numbers-mode)


(setq frame-title-format "%b - @mine Emacs")


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

(add-to-list 'load-path "~/.doom.d/vendor/auto-dark-emacs/")
(require 'auto-dark-emacs)
;; (setq auto-dark-emacs/dark-theme 'doom-nova)
;; (setq auto-dark-emacs/light-theme 'base16-atelier-sulphurpool-light-spolakh)
;; (setq doom-theme 'base16-atelier-sulphurpool-light-spolakh)
(setq auto-dark-emacs/dark-theme 'doom-one)
(setq auto-dark-emacs/light-theme 'base16-cupcake-spolakh)
(setq doom-theme 'base16-cupcake-spolakh)


; Other Favs:
;   - Light:
;(load-theme 'doom-solarized-light 'NO-CONFIRM)
;(load-theme 'doom-one-light 'NO-CONFIRM)
;(load-theme 'doom-tomorrow-day 'NO-CONFIRM)
;(load-theme 'dichromacy 'NO-CONFIRM)
;(load-theme 'spacemacs-light 'NO-CONFIRM)
;(load-theme 'base16-grayscale-light 'NO-CONFIRM)
;(load-theme 'base16-default-light 'NO-CONFIRM)
;(load-theme 'base16-tomorrow 'NO-CONFIRM)
;(load-theme 'base16-atelier-savanna-light 'NO-CONFIRM)
;(load-theme 'base16-atelier-estuary-light 'NO-CONFIRM)
;(load-theme 'base16-atelier-sulphurpool-light 'NO-CONFIRM)
;   - Dark:
;(load-theme 'base16-ashes 'NO-CONFIRM)
;(load-theme 'doom-gruvbox 'NO-CONFIRM)
;(load-theme 'doom-one 'NO-CONFIRM)
;(load-theme 'doom-vibrant 'NO-CONFIRM)
;(load-theme 'doom-spacegrey 'NO-CONFIRM)
;(load-theme 'doom-tomorrow-night 'NO-CONFIRM)
;(load-theme 'doom-nord 'NO-CONFIRM)
;(load-theme 'doom-nova 'NO-CONFIRM)
;(load-theme 'doom-zenburn 'NO-CONFIRM)
;(load-theme 'base16-ocean 'NO-CONFIRM)
;(load-theme 'base16-zenburn 'NO-CONFIRM)
; WORK
; base16-drakula
; base16-material-palenight


; LIGHT
;base16-cupcake
;base16-atelier-lakeside-light
;base16-classic-light
;base16-mexico-light
;base16-one-light
;base16-tomorrow
;
; DARK
; base16-espresso
; run this before cycling themes to make sure all of them are loaded and available for cycle-themes
;; (cl-loop for x in cycle-themes-theme-list
;;   do (progn (if x (load-theme x t t))))
(use-package! cycle-themes
  :init
  (map!
   "s-O" #'cycle-themes)
  (defun spolakh/message-next-theme ()
    (load-theme (cycle-themes-get-next-valid-theme) t t)
    (message "Loading theme: %s" (cycle-themes-get-next-valid-theme)))
  (advice-add #'cycle-themes :before #'spolakh/message-next-theme)
  :config
  (cycle-themes-mode)
)

; MODELINE
(setq doom-modeline-icon (display-graphic-p))
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-buffer-modification-icon t)
(setq doom-modeline-lsp t)
(setq doom-modeline-persp-name t)
(setq doom-modeline-persp-icon t)

; NAVIGATION:

(map!
 (:map evil-motion-state-map
  "<s-]>" #'better-jumper-jump-forward
  "s-]" #'better-jumper-jump-forward
  "<s-[>" #'better-jumper-jump-backward
  "s-[" #'better-jumper-jump-backward
  "s-{" #'winner-undo
  "<s-{>" #'winner-undo
  "s-}" #'winner-redo
  "<s-}>" #'winner-redo
  "s-1" #'+workspace/switch-to-0
  "<s-1>" #'+workspace/switch-to-0
  "s-2" #'+workspace/switch-to-1
  "<s-2>" #'+workspace/switch-to-1
  "s-3" #'+workspace/switch-to-2
  "<s-3>" #'+workspace/switch-to-2
  "s-4" #'+workspace/switch-to-3
  "<s-4>" #'+workspace/switch-to-3
  "s-5" #'+workspace/switch-to-4
  "<s-5>" #'+workspace/switch-to-4
  "s-6" #'+workspace/switch-to-5
  "<s-6>" #'+workspace/switch-to-5
  "s-7" #'+workspace/switch-to-6
  "<s-7>" #'+workspace/switch-to-6
  "s-8" #'+workspace/switch-to-7
  "<s-8>" #'+workspace/switch-to-7
  "s-9" #'+workspace/switch-to-8
  "<s-9>" #'+workspace/switch-to-8
  ))

(setq better-jumper-new-window-behavior 'empty)
(setq better-jumper-add-jump-behavior 'replace)

(map!
 (:map general-override-mode-map
  "s-l" #'evil-window-right
  "s-h" #'evil-window-left
  "s-j" #'evil-window-down
  "s-k" #'evil-window-up
  "s-L" #'+evil/window-move-right
  "s-H" #'+evil/window-move-left
  "s-J" #'+evil/window-move-down
  "s-K" #'+evil/window-move-up))

(after! hydra
  (defhydra hydra-window (:color red)
    ("h" evil-window-left)
    ("j" evil-window-down)
    ("k" evil-window-up)
    ("l" evil-window-right)
    ("H" +evil/window-move-left)
    ("J" +evil/window-move-down)
    ("K" +evil/window-move-up)
    ("L" +evil/window-move-right)
    ("[" evil-window-decrease-width)
    ("]" evil-window-increase-width)
    ("<up>" evil-window-increase-height)
    ("<down>" evil-window-decrease-height)
    ("q" nil)
    )
  (map! (:map general-override-mode-map
         ("s-w" #'hydra-window/body)
         )
        )
 )

(use-package! flx
  :config
  (setq ivy-re-builders-alist
        '((t . ivy--regex-fuzzy)))
  )

(after! ivy
(map!
 (:map ivy-minibuffer-map
 "S-SPC" nil
 "s-SPC" #'ivy-restrict-to-matches)
 )
)

(after! avy
  (map! :after evil-org-agenda
   (:map evil-motion-state-map 
        (:prefix ("g" . "Go")
        (:prefix ("s" . "Snipe-ish")
          "SPC" #'avy-goto-char-2))
    )
   )
  )

; ORG-MODE:

(use-package! org
  :config
  (map!
   (:map evil-normal-state-map
    "<s-return>" nil)
   (:map global-map
    "<S-s-return>" nil)
   (:map evil-normal-state-map
    "<S-s-return>" nil)
   (:map org-mode-map
    "<s-return>" #'org-todo
    "<S-s-return>" #'org-toggle-checkbox
    )
   )
  (require 'find-lisp)
  (setq spolakh/org-agenda-directory "~/Dropbox/org/notes/private/gtd/"
        spolakh/org-dailies-directory "~/Dropbox/org/notes/private/dailies/"
        spolakh/org-phone-directory "~/Dropbox/org/notes/private/phone/"
        spolakh/org-gcal-directory "~/Dropbox/org/cal/"
        spolakh/org-directory "~/Dropbox/org/")
  (defun spolakh/open-projects ()
    (interactive)
    (find-file (concat spolakh/org-agenda-directory "projects.org.gpg")))
  (defun spolakh/fuck-it ()
    (interactive)
    (find-file (concat spolakh/org-agenda-directory "non_gtd.org.gpg")))
  (map! :map org-mode-map
      (:prefix ("g" . "go")
       :desc "evil-next-visual-line" :n "j" 'evil-next-visual-line 
       :desc "evil-previous-visual-line" :n "k" 'evil-previous-visual-line))
  (map! :map org-mode-map
      :leader
      (:prefix ("n" . "notes")
       :desc "Refile" "R" 'org-refile
       :desc "Projects" "p" 'spolakh/open-projects
       :desc "Fuck it" "F" 'spolakh/fuck-it
       :desc "Capture" "c" 'org-capture
       :desc "GoTo active clock" "C" 'org-clock-goto
       :desc "Clock in" "i" 'org-clock-in
       :desc "Toggle last clock" "o" '+org/toggle-last-clock))
  (setq org-capture-templates
        `(("i" "Inbox @mine TODO" entry (file ,(concat spolakh/org-agenda-directory "inbox.org.gpg"))
           "* TODO %? :@mine:")
          ("I" "Inbox @work TODO" entry (file ,(concat spolakh/org-agenda-directory "inbox.org.gpg"))
           "* TODO %? :@work:")
          ("p" "Project @mine TODO" entry (file ,(concat spolakh/org-agenda-directory "projects.org.gpg"))
           "* TODO [%^{Project title}] :@mine:\nGoal: *%^{Goal}*\n%^{Description}\n** TODO %?")
          ("P" "Project @work TODO" entry (file ,(concat spolakh/org-agenda-directory "projects.org.gpg"))
           "* TODO [%^{Project title}] :@work:\nGoal: *%^{Goal}*\n%^{Description}\n** TODO %?")
          ("t" "inbox @mine TODO for Today" entry (file ,(concat spolakh/org-agenda-directory "inbox.org.gpg"))
           "* TODO %? :@mine:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))")
          ("T" "inbox @work TODO for Today" entry (file ,(concat spolakh/org-agenda-directory "inbox.org.gpg"))
           "* TODO %? :@work:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))")
          ("c" "add note to Clocked item" plain (clock)
           "%T: %?"
           :unnarrowed t)
          ("a" "org-protocol-capture from Alfred" entry (file ,(concat spolakh/org-agenda-directory "inbox.org.gpg"))
            "* TODO %i"
            :immediate-finish t)))
  (setq
   org-use-fast-todo-selection 'auto
   org-log-note-clock-out t
   org-startup-with-inline-images t
   org-image-actual-width 400
   org-log-done 'time
   org-todo-keywords '(
    (sequence "TODO(t)" "|" "DONE(d)")
    (sequence "SPRINT(s)" "|" "DONE")
    (sequence "WAITING(w@/!)" "|""PASS(p@/!)")
    (sequence "Fleeting(f)" "Evergreen")
    (sequence "Open(O!)" "In Progress(I!)" "Going Well(G!)" "Resolved(R!)") ; Board items
    (sequence "TODIGEST" "|" "DIGESTED") ; Nibbles(Articles / Books / Videos / ...) for quotations
    )
   org-todo-keyword-faces
       '(
         ; Sprint
         ("SPRINT" . (:foreground "orange"))
         ("WAITING" . (:background "firebrick" :weight bold :foreground "gold"))
         ; Notes
         ("Fleeting" . (:foreground "#5F9EA0"))
         ("Evergreen" . (:foreground "olivedrab" :weight bold))
         ; Board
         ("Open" . (:foreground "BurlyWood" :weight bold))
         ("In Progress" . (:foreground "DarkSalmon" :weight bold))
         ("Going Well" . (:foreground "LightCoral" :weight bold))
         ("Resolved" . (:foreground "SlateBlue" :weight bold))
         ("[Inkling]" . (:foreground "mediumpurple" :weight bold))
         )
   org-directory spolakh/org-directory)
  (setq org-tag-alist (quote (
                            ;(:startgrouptag)
                            ;("work/mine")
                            ;(:grouptags)
                            ("@work" . ?w)
                            ("@mine" . ?m)
                            ;(:endgrouptag)
                            ;(:startgrouptag)
                            ;("People")
                            ;(:grouptags)
                            ("Lily" . ?l)
                            ;(:endgrouptag)
                            )))
  (setq org-fast-tag-selection-single-key nil)
  (setq org-refile-targets `((,(concat spolakh/org-agenda-directory "later.org.gpg") :maxlevel . 1)
                              (,(concat spolakh/org-agenda-directory "repeaters.org.gpg") :level . 0)
                              (,(concat spolakh/org-agenda-directory "projects.org.gpg") :maxlevel . 1)
                              (nil :maxlevel . 2)))
  (defun spolakh/shift-dwim-at-point ()
    (interactive)
    (let ((org-link-frame-setup (quote
                               ((vm . vm-visit-folder-other-window)
                                (gnus . gnus)
                                (file . find-file-other-window)
                                (wl . wl)))
                              ))
    (+org/dwim-at-point)))
  (map! (:map org-mode-map
         "<S-return>" #'spolakh/shift-dwim-at-point
         ))
)

(use-package! org-download
    :after org
    :init
    (setq org-download-method 'directory)
    (setq org-download-timestamp "%Y%m%d-%H%M%S_")
    (setq org-download-screenshot-method "/usr/local/bin/pngpaste %s")
    (setq org-download-heading-lvl nil)
    (setq org-download-image-dir "images")
    (map! :map org-mode-map
          :leader
          (:prefix ("n" . "notes")
           :desc "Paste Screenshot" "P" 'org-download-screenshot
           ))
    )

(use-package! org-habit)
; From https://emacs.stackexchange.com/questions/13360/org-habit-graph-on-todo-list-agenda-view
(defvar my/org-habit-show-graphs-everywhere t
  "If non-nil, show habit graphs in all types of agenda buffers.")

(defun my/org-agenda-mark-habits ()
  "Mark all habits in current agenda for graph display.

This function enforces `my/org-habit-show-graphs-everywhere' by
marking all habits in the current agenda as such.  When run just
before `org-agenda-finalize' (such as by advice; unfortunately,
`org-agenda-finalize-hook' is run too late), this has the effect
of displaying consistency graphs for these habits.

When `my/org-habit-show-graphs-everywhere' is nil, this function
has no effect."
  (when (and my/org-habit-show-graphs-everywhere
         (not (get-text-property (point) 'org-series)))
    (let ((cursor (point))
          item data)
      (while (setq cursor (next-single-property-change cursor 'org-marker))
        (setq item (get-text-property cursor 'org-marker))
        (when (and item (org-is-habit-p item))
          (with-current-buffer (marker-buffer item)
            (setq data (org-habit-parse-todo item)))
          (put-text-property cursor
                             (next-single-property-change cursor 'org-marker)
                             'org-habit-p data))))))

(advice-add #'org-agenda-finalize :before #'my/org-agenda-mark-habits)


(use-package! org-agenda
  :init
  (setq org-agenda-block-separator nil
        org-habit-show-habits t
        org-agenda-skip-archived-trees t
        org-habit-show-all-today nil
        org-archive-default-command 'org-archive-to-archive-sibling
        org-agenda-start-with-log-mode t
        org-agenda-skip-scheduled-if-done t
        org-agenda-log-mode-items '(closed clock))
        ; org-agenda-log-mode-items '(closed clock state))
  (add-hook 'evil-org-agenda-mode-hook #'display-line-numbers-mode)
  (setq org-agenda-time-grid
      '((daily today)
        (1200 1400 1600 1800 2000 2200 0000 0200)
        "    " "- - - - - - - - - - - - - - - - - - - - - - - - - - -"))
  (setq org-agenda-use-time-grid t)
  (setq org-extend-today-until 5)
  (setq org-agenda-todo-list-sublevels t)
  (defun spolakh/set-todo-waiting ()
    (interactive)
    (org-agenda-todo "WAITING"))
  (defun spolakh/set-todo-idea ()
    (interactive)
    (org-agenda-todo "Fleeting"))
  (defun spolakh/set-todo-done ()
    (interactive)
    (org-agenda-todo "DONE"))
  (defun spolakh/set-todo-pass ()
    (interactive)
    (org-agenda-todo "PASS"))
  (defun spolakh/org-current-is-first-level-headline ()
    (= 1 (org-current-level)))
  (defun spolakh/org-current-is-todo ()
    (or (string= "TODO" (org-get-todo-state))))

  (defun spolakh/org-agenda-leave-only-first-three-children ()
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
      (setq should-skip-entry t))
    (when (> (org-current-level) 2)
      (setq should-skip-entry t))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))

  (defun spolakh/is-daily ()
    (progn
      (s-starts-with-p spolakh/org-roam-daily-prefix (org-get-category))))

  (defun spolakh/org-agenda-leave-second-level-in-dailies ()
    (when (or (> (org-current-level) 2)
              (and (= (org-current-level) 2) (not (spolakh/is-daily))))
      (or (outline-next-heading)
          (goto-char (point-max)))))

  (defun spolakh/org-agenda-leave-first-level-only ()
    (when (not (spolakh/org-current-is-first-level-headline))
      (or (outline-next-heading)
          (goto-char (point-max)))))

  (defun org-agenda-skip-if-scheduled-for-later-with-day-granularity ()
    (ignore-errors
      (let ((subtree-end (save-excursion (org-end-of-subtree t)))
            (scheduled-day
             (time-to-days
              (org-time-string-to-time
               (org-entry-get nil "SCHEDULED"))))
            (now (time-to-days (current-time))))
        (and scheduled-day
             (> (org-time-stamp-to-now (org-entry-get nil "SCHEDULED")) 0)
             subtree-end))))

  (defun org-agenda-skip-if-scheduled-for-later-with-clock-granularity ()
    (ignore-errors
      (let ((subtree-end (save-excursion (org-end-of-subtree t)))
            (scheduled-seconds
             (time-to-seconds
              (org-time-string-to-time
               (org-entry-get nil "SCHEDULED"))))
            (now (time-to-seconds (current-time))))
        (and scheduled-seconds
             (>= scheduled-seconds now)
             subtree-end))))

  (defun spolakh/was-done-today ()
    (let* ((end (save-excursion (org-end-of-subtree t)))
           (last-done-timestamp (org-entry-get nil "LAST_REPEAT"))
           (last-done (and last-done-timestamp (decode-time (org-time-string-to-time last-done-timestamp))))
           )
      (and last-done
           (= (nth 0 org-agenda-current-date) (nth 4 last-done))
           (= (nth 1 org-agenda-current-date) (nth 3 last-done))
           (= (nth 2 org-agenda-current-date) (nth 5 last-done))
           ))
    )

  (defun spolakh/skip-subtree-if-later ()
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (if
          (string= (org-get-category) "later.org")
          subtree-end
        nil)))

  (defun spolakh/skip-subtree-if-irrelevant-to-current-context (filter)
    (let ((subtree-end (save-excursion (org-end-of-subtree t)))
          (tags (org-get-tags))
          (tag (substring filter 1))
          )
      (if
          (or (and (> (length tags) 0) (not (member tag tags)))
              (member "ARCHIVE" tags))
          subtree-end
        nil)))

  (defun spolakh/skip-if-waiting ()
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (if
          (string= (org-get-todo-state) "WAITING")
          subtree-end
        nil)))

  (defun air-org-skip-subtree-if-habit ()
    "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (if
          (and
           (string= (org-entry-get nil "STYLE") "habit")
           (not (spolakh/was-done-today)))
          subtree-end
        nil)))

  ; This makes org-agenda integration w/ mobile capture (Orgzly) work without conflicts
  ; (in tandem with adding ((nil . ((eval . (auto-revert-mode 1))))) into .dir-locals.el in gtd directory)
  (defun xah-save-all-unsaved ()
    (interactive)
    (save-some-buffers t))
  ;; when switching out of emacs, all unsaved files will be saved
  (add-hook 'focus-out-hook 'xah-save-all-unsaved)
  (setq auto-save-timeout 1
      auto-save-default t
      auto-save-visited-file-name t
      auto-revert-use-notify nil
      auto-revert-interval 1)
  (defun spolakh/org-agenda-redo ()
    (interactive)
    (with-current-buffer "*Org Agenda*"
      (org-agenda-maybe-redo)))
  (add-hook 'after-revert-hook #'spolakh/org-agenda-redo)

  ; attempts at coloring the agenda
  ;; 1. (propertize "Project" 'font-lock-face '(:foreground "red")) - apparently agenda doesn't use font-lock at all
  ;; 2. highlight-regexp
  (add-hook 'org-agenda-finalize-hook
            (lambda ()
              (highlight-regexp "\\(^Project\\) " "spolakh-hi-lock-project-face" 1)))

  :config

  (defface spolakh-hi-lock-project-face '((t (:foreground  "PaleVioletRed"
                                 :bold t)))
    "spolakh-hi-lock-project-face")

  (defun spolakh/project-agenda-section-for-filter (filter)
    `(tags-todo ,(concat "TODO=\"TODO\"" filter)
                ((org-agenda-overriding-header ,(concat "🚀 Projects (" filter "): MAX 4 >"))
                 (org-agenda-hide-tags-regexp "")
                 (org-agenda-todo-keyword-format "Project")
                 (org-agenda-dim-blocked-tasks nil)
                 (org-agenda-prefix-format
                  '((tags . "")))
                 (org-agenda-skip-function #'spolakh/org-agenda-leave-first-level-only)
                 (org-agenda-files
                  '(
                    ,(concat spolakh/org-agenda-directory "projects.org.gpg")
                    ))))
    )

; leftover items from previous sprint: waiting and SPRINT
;

  (defun spolakh/review-for-filter (filter)
    `((tags-todo "LEVEL=2+TODO=\"Going Well\"+TIMESTAMP_IA<=\"<-1m>\""
                 ((org-agenda-overriding-header "🏆 Going Well - without reminders - for a month. If dropped - In Progress. If still going - Resolved & 🐦 tweet it 💗")
                  (org-agenda-prefix-format '((tags . " - ")))
                  (org-agenda-skip-function '(or (spolakh/skip-subtree-if-irrelevant-to-current-context ,filter)))
                  (org-todo-keyword-faces '(("Going Well" . (:foreground "LightCoral" :weight bold))))
                  (org-agenda-files '(,(concat spolakh/org-agenda-directory "board.org.gpg")))))

      (tags-todo "LEVEL=2+TODO=\"In Progress\""
                   ((org-agenda-overriding-header "🎗 Everything In Progress. If we feel safe loosening attention around it - Going Well. If dropped - Open (or archive)")
                    (org-agenda-prefix-format '((tags . " - ")))
                    (org-agenda-skip-function '(or (spolakh/skip-subtree-if-irrelevant-to-current-context ,filter)))
                    (org-todo-keyword-faces '(("In Progress" . (:foreground "DarkSalmon" :weight bold))))
                    (org-agenda-files '(,(concat spolakh/org-agenda-directory "board.org.gpg")))))

      ,(spolakh/project-agenda-section-for-filter filter)
      ,(spolakh/project-agenda-section-for-filter "-@work-@mine")
      )
; all tasks from /active/ projects
; ticklers from later - copypaste from inbox section

; fleetings
; inbox (without later ticklers)
    )

  (defun spolakh/agenda-for-filter (filter)
    `((agenda ""
            ((org-agenda-span 1)
             (org-agenda-start-day "today")
             (org-agenda-start-on-weekday nil)
             (org-agenda-skip-archived-trees t)
             (org-agenda-files
              (append
               `(,(concat spolakh/org-phone-directory "phone-work.org") ,(concat spolakh/org-phone-directory "phone.org"))
               (find-lisp-find-files spolakh/org-dailies-directory "\.org.gpg$")
               (find-lisp-find-files spolakh/org-gcal-directory "\.org.gpg$")
               (find-lisp-find-files spolakh/org-agenda-directory "\.org.gpg$")))
             (org-deadline-warning-days 3)
             ;(org-agenda-prefix-format '((agenda . " %i %-21:c%?-16t% s%b"))) ; adds category
             (org-agenda-prefix-format '((agenda . " %i %?-16t% s%b")))
             (org-agenda-skip-function '(or
                                         (air-org-skip-subtree-if-habit)
                                         (spolakh/skip-if-waiting)
                                         (spolakh/skip-subtree-if-irrelevant-to-current-context ,filter)
                                         (spolakh/skip-subtree-if-later)))
             ))
    (tags-todo ,(concat "STYLE=\"habit\"" filter)
        ((org-agenda-overriding-header "👘 Repeaters >")
         (org-todo-keyword-faces '(("TODO" . (:foreground "brown"))))
         (org-agenda-prefix-format '((tags . "[%-4e] ")))
         (org-agenda-skip-function #'org-agenda-skip-if-scheduled-for-later-with-clock-granularity)
         (org-agenda-files
           '(
            ,(concat spolakh/org-agenda-directory "repeaters.org.gpg")
           ))))
    (todo "WAITING"
          ((org-agenda-overriding-header "🌒 Waiting (want to do if not blocked, else postpone) >")
          (org-agenda-skip-function '(or
                                       (org-agenda-skip-if-scheduled-for-later-with-day-granularity)
                                       (spolakh/skip-subtree-if-irrelevant-to-current-context ,filter)
                                       ))
          (org-agenda-hide-tags-regexp "")
          ))
    (todo "TODO"
          ((org-agenda-overriding-header "📤 To Activate/Snooze (decide if now is a good time to do these) >")
           (org-agenda-files (append
                              (sort (find-lisp-find-files spolakh/org-dailies-directory "\.org.gpg$") #'string>)
                             '(
                               ,(concat spolakh/org-agenda-directory "inbox.org.gpg")
                               ,(concat spolakh/org-phone-directory "phone.org")
                               ,(concat spolakh/org-phone-directory "phone-work.org")
                               ,(concat spolakh/org-agenda-directory "later.org.gpg")
                               )
                             ))
           (org-agenda-skip-function '(or
                                       (org-agenda-skip-if-scheduled-for-later-with-day-granularity)
                                       (spolakh/skip-subtree-if-irrelevant-to-current-context ,filter)
                                       (spolakh/org-agenda-leave-second-level-in-dailies)
                                       ))
           (org-agenda-max-entries 10)))
    (todo "Fleeting"
          ((org-agenda-overriding-header "🔖 to Finalize into Permanent Notes >")
           (org-agenda-files (append
                              (find-lisp-find-files spolakh/org-dailies-directory "\.org.gpg$")
                              '(
                                ,(concat spolakh/org-agenda-directory "inbox.org.gpg")
                                ,(concat spolakh/org-phone-directory "phone.org")
                                ,(concat spolakh/org-phone-directory "phone-work.org")
                                )
                               ))
           (org-agenda-max-entries 3)))
    (todo "TODO"
          ((org-agenda-overriding-header "🚀 Projects (things that feel interesting now in addition to Repeaters) >")
          (org-agenda-files '(,(concat spolakh/org-agenda-directory "projects.org.gpg")))
          (org-agenda-skip-function '(or
                                      (org-agenda-skip-entry-if 'deadline 'scheduled)
                                      (spolakh/skip-subtree-if-irrelevant-to-current-context ,filter)
                                      (spolakh/org-agenda-leave-only-first-three-children)))
          (org-agenda-hide-tags-regexp "")
          ))
    ))

  (defun spolakh/done-for-filter (filter ndays)
      (let ((all-files `(append
                              (sort (find-lisp-find-files spolakh/org-dailies-directory "\.org.gpg$") #'string>)
                             '(
                               ,(concat spolakh/org-agenda-directory "projects.org.gpg")
                               ,(concat spolakh/org-agenda-directory "inbox.org.gpg")
                               ,(concat spolakh/org-agenda-directory "later.org.gpg")
                               ,(concat spolakh/org-phone-directory "phone.org")
                               ,(concat spolakh/org-phone-directory "phone-work.org")
                               )
                             )))
       `(tags ,(format "CLOSED>=\"<-%dd>\"" ndays)
                   ((org-agenda-overriding-header "💠 Done >")
                    (org-agenda-files ,all-files)
                    (org-agenda-prefix-format '((tags . "[%-4e] %?-8b")))
                    (org-agenda-skip-function '(or
                                                (spolakh/skip-subtree-if-irrelevant-to-current-context ,filter)
                                                ))
                    (org-agenda-hide-tags-regexp "")
                    ))))

  (defun spolakh/kanban-for-filter (filter)
    (let ((all-files `(append
                              (sort (find-lisp-find-files spolakh/org-dailies-directory "\.org.gpg$") #'string>)
                              (find-lisp-find-files spolakh/org-gcal-directory "\.org.gpg$")
                              (find-lisp-find-files spolakh/org-agenda-directory "\.org.gpg$")
                             '(
                               ,(concat spolakh/org-phone-directory "phone.org")
                               ,(concat spolakh/org-phone-directory "phone-work.org")
                               )
                             )))
      `((agenda ""
                ((org-agenda-span 1)
                 (org-agenda-start-day "today")
                 (org-agenda-start-on-weekday nil)
                 (org-agenda-skip-archived-trees t)
                 (org-agenda-files ,all-files)
                 (org-deadline-warning-days 3)
                 (org-agenda-prefix-format '((agenda . " %i %?-16t% s%b")))
                 (org-agenda-skip-function '(or
                                             (air-org-skip-subtree-if-habit)
                                             (spolakh/skip-if-waiting)
                                             (spolakh/skip-subtree-if-irrelevant-to-current-context ,filter)
                                             (spolakh/skip-subtree-if-later)))))

        (tags-todo "LEVEL=2+TODO=\"In Progress\""
                   ((org-agenda-overriding-header "🎗 In Progress")
                    (org-agenda-prefix-format '((tags . " - ")))
                    (org-agenda-todo-keyword-format "")
                    (org-agenda-skip-function '(or (spolakh/skip-subtree-if-irrelevant-to-current-context ,filter)))
                    (org-todo-keyword-faces '(("In Progress" . (:foreground "DarkSalmon" :weight bold))))
                    (org-agenda-files '(,(concat spolakh/org-agenda-directory "board.org.gpg")))))

        (todo "SPRINT"
              ((org-agenda-overriding-header "🗂 Sprint >")
               (org-agenda-files ,all-files)
               (org-agenda-hide-tags-regexp "")
               (org-agenda-prefix-format '((todo . "[%-4e] %?-8b")))
               (org-agenda-skip-function '(or
                                           (spolakh/skip-subtree-if-irrelevant-to-current-context ,filter)
                                           (org-agenda-skip-entry-if 'scheduled)
                                           ))
               ))

        (todo "WAITING"
              ((org-agenda-overriding-header "🌒 Waiting >")
               (org-agenda-files ,all-files)
               (org-agenda-prefix-format '((todo . "[%-4e] %?-8b")))
               (org-agenda-skip-function '(or
                                           (org-agenda-skip-if-scheduled-for-later-with-day-granularity)
                                           (spolakh/skip-subtree-if-irrelevant-to-current-context ,filter)
                                           ))
               (org-agenda-hide-tags-regexp "")
               ))
        
        ,(spolakh/done-for-filter filter (if (= (decoded-time-weekday (decode-time)) 6) 0 (+ (decoded-time-weekday (decode-time)) 1)))
        )))

  (setq org-agenda-prefix-format
        '((agenda . " %i %-12:c%?-12t% s%b")
          (todo . "[%-4e] %?-17b")
          (tags . "[%-4e] %-17(org-format-outline-path (org-get-outline-path))")
          (search . "[%-4e] %?-17b")))
  (setq org-columns-default-format "%40ITEM(Task) %Effort(EE){:} %CLOCKSUM(Time Spent) %SCHEDULED(Scheduled) %DEADLINE(Deadline)")
  (add-to-list 'org-global-properties
         '("Effort_ALL". "100:00 0:15 0:30 1:00 2:00 4:00 12:00"))
  (setq org-agenda-custom-commands `(
                                     ("k" "Kanban" ,(spolakh/kanban-for-filter "+@mine"))
                                     ("K" "Work Kanban" ,(spolakh/kanban-for-filter "+@work"))
                                     ("a" "Agenda" ,(spolakh/agenda-for-filter "+@mine"))
                                     ("A" "Work Agenda" ,(spolakh/agenda-for-filter "+@work"))
                                     ("7" "Work Done" (,(spolakh/done-for-filter "+@mine" 7)))
                                     ("&" "Work Done" (,(spolakh/done-for-filter "+@work" 7)))
                                     ("l" "Lily" ,(spolakh/agenda-for-filter "+Lily"))
                                     ("i" "Fleetings (full list)" (
                                    (todo "Fleeting"
                                          ((org-agenda-overriding-header "🔖 to Finalize into Permanent Notes >")
                                          (org-agenda-files (append
                                                              (find-lisp-find-files spolakh/org-dailies-directory "\.org.gpg$")
                                                              '(
                                                                ,(concat spolakh/org-agenda-directory "inbox.org.gpg")
                                                                ,(concat spolakh/org-phone-directory "phone.org")
                                                                ,(concat spolakh/org-phone-directory "phone-work.org")
                                                                )))))))
                                    ("r" "Repeaters (All)" (
                                      (tags-todo "STYLE=\"habit\""
                                          ((org-agenda-overriding-header "👘 Repeaters >")
                                          (org-agenda-prefix-format
                                            '((tags . "[%-4e] ")))
                                          (org-agenda-files
                                                              '(
                                                                ,(concat spolakh/org-agenda-directory "repeaters.org.gpg")
                                                                  ))))))
                                    ("/" "What feels important now?" ,(spolakh/review-for-filter "+@mine"))
                                    ("?" "What feels important at work?" ,(spolakh/review-for-filter "+@work"))
                                     ))
  (defun spolakh/switch-to-agenda ()
    (interactive)
    (org-agenda nil "a")
    (spolakh/org-agenda-find-beginning-of-inbox)
    )
  (defun spolakh/switch-to-lily-agenda ()
    (interactive)
    (org-agenda nil "l")
    (spolakh/org-agenda-find-beginning-of-inbox)
    )
  (defun spolakh/switch-to-work-agenda ()
    (interactive)
    (org-agenda nil "A")
    (spolakh/org-agenda-find-beginning-of-inbox)
    )
  (defun spolakh/switch-to-ideas-agenda ()
    (interactive)
    (org-agenda nil "i")
    (spolakh/org-agenda-find-beginning-of-inbox)
    )
  (defun spolakh/switch-to-repeaters-agenda ()
    (interactive)
    (org-agenda nil "r")
    (spolakh/org-agenda-find-beginning-of-inbox)
    )
  (defun spolakh/switch-to-kanban-agenda ()
    (interactive)
    (org-agenda nil "k")
    )
  (defun spolakh/switch-to-work-kanban-agenda ()
    (interactive)
    (org-agenda nil "K")
    )
  (defun spolakh/switch-to-done-review-agenda ()
    (interactive)
    (org-agenda nil "7")
    )
  (defun spolakh/switch-to-work-done-review-agenda ()
    (interactive)
    (org-agenda nil "&")
    )
  (defun spolakh/switch-to-weekly-agenda ()
    (interactive)
    (org-agenda nil "/")
    )
  (defun spolakh/switch-to-weekly-work-agenda ()
    (interactive)
    (org-agenda nil "?")
    )
  (map! :map org-mode-map :leader
        (:prefix ("n" . "Notes") "a" nil)
        (:prefix ("a" . "Agenda")
         :desc "Agenda" "a" #'spolakh/switch-to-agenda
         :desc "Lily" "l" #'spolakh/switch-to-lily-agenda
         :desc "Fleetings" "i" #'spolakh/switch-to-ideas-agenda
         :desc "Repeaters (All)" "r" #'spolakh/switch-to-repeaters-agenda
         :desc "Kanban" "k" #'spolakh/switch-to-kanban-agenda
         :desc "Work Kanban" "K" #'spolakh/switch-to-work-kanban-agenda
         :desc "Done for last 7 days" "7" #'spolakh/switch-to-done-review-agenda
         :desc "Work Done for last 7 days" "&" #'spolakh/switch-to-work-done-review-agenda
         :desc "What feels important now?" "/" #'spolakh/switch-to-weekly-agenda
         :desc "What can I drop from work tasks?" "?" #'spolakh/switch-to-weekly-work-agenda
         :desc "Work Agenda" "A" #'spolakh/switch-to-work-agenda))
  (defun spolakh/org-fast-effort-selection ()
    "Modification of `org-fast-todo-selection' for use with org-set-effert. Select an effort value with single keys.
      Returns the new effort value, or nil if no state change should occur.
      Motivated by https://emacs.stackexchange.com/questions/59424/org-set-effort-fast-effort-selection"
    ;; Format effort values into an alist keyed by index
    (let* ((fulltable (seq-map-indexed (lambda (e i) (cons (car e) (string-to-char (int-to-string i))))
                                      (org-property-get-allowed-values nil org-effort-property t)))
          (maxlen (apply 'max (mapcar
                                (lambda (x)
                                  (if (stringp (car x)) (string-width (car x)) 0))
                                fulltable)))
          (expert (equal org-use-fast-todo-selection 'expert))
          (prompt "")
          (fwidth (+ maxlen 3 1 3))
          (ncol (/ (- (window-width) 4) fwidth))
          tg cnt e c tbl subtable)
      (save-excursion
        (save-window-excursion
          (if expert
              (set-buffer (get-buffer-create " *Org effort"))
            (delete-other-windows)
            (set-window-buffer (split-window-vertically) (get-buffer-create " *Org effort*"))
            (org-switch-to-buffer-other-window " *Org effort*"))
          (erase-buffer)
          (setq tbl fulltable cnt 0)
          (while (setq e (pop tbl))
            (setq tg (car e)
                  c (cdr e))
            (print (char-to-string c))
            (when (and (= cnt 0))
              (insert "  "))
            (setq prompt (concat prompt "[" (char-to-string c) "] " tg " "))
            (insert "[" c "] " tg (make-string
                                  (- fwidth 4 (length tg)) ?\ ))
            (when (and (= (setq cnt (1+ cnt)) ncol)
                      ;; Avoid lines with just a closing delimiter.
                      (not (equal (car tbl) '(:endgroup))))
              (insert "\n")
              (setq cnt 0)))
          (insert "\n")
          (goto-char (point-min))
          (unless expert (org-fit-window-to-buffer))
          (message (concat "[1-9..]:Set [SPC]:clear"
                          (if expert (concat "\n" prompt) "")))
          (setq c (let ((inhibit-quit t)) (read-char-exclusive)))
          (setq subtable (nreverse subtable))
          (cond
          ((or (= c ?\C-g)
                (and (= c ?q) (not (rassoc c fulltable))))
            (setq quit-flag t))
          ((= c ?\ ) nil)
          ((setq e (or (rassoc c subtable) (rassoc c fulltable))
                  tg (car e))
            tg)
          (t (setq quit-flag t)))))))
  (defun spolakh/invoke-fast-effort-selection ()
    (interactive)
      (let* ((hdmarker (or (org-get-at-bol 'org-hd-marker)
        (org-agenda-error)))
      (buffer (marker-buffer hdmarker))
      (pos (marker-position hdmarker))
      (inhibit-read-only t)
      newhead)
      (org-with-remote-undo buffer
       (with-current-buffer buffer
        (widen)
        (goto-char pos)
        (org-show-context 'agenda)
        (org-set-effort nil (spolakh/org-fast-effort-selection))
        (end-of-line 1)
        (setq newhead (org-get-heading)))
        (org-agenda-change-all-lines newhead hdmarker)))
  )
  (defun spolakh/org-agenda-next-section ()
    (interactive)
    (forward-char)
    (re-search-forward ">$" nil 1)
    (let ((current-prefix-arg '(4))) (call-interactively 'recenter-top-bottom))
    )
  (defun spolakh/org-agenda-previous-section ()
    (interactive)
    (backward-char)
    (re-search-backward ">$" nil 1)
    (let ((current-prefix-arg '(4))) (call-interactively 'recenter-top-bottom))
    )
  (defun spolakh/refile-to-later ()
   (org-agenda-refile nil (list "" (concat spolakh/org-agenda-directory "later.org.gpg") nil nil)))
  (after! hydra
    (defhydra hydra-schedule (:color teal)
      "Remind about this in:"
      ("g" (lambda () (interactive) nil) "quit")
      ("d" (lambda () (interactive) (progn (org-agenda-schedule nil "+1d") (spolakh/refile-to-later) (spolakh/advance-inbox-processing))) "1 Day")
      ("w" (lambda () (interactive) (progn (org-agenda-schedule nil "+1w") (spolakh/refile-to-later) (spolakh/advance-inbox-processing))) "1 Week")
      ("m" (lambda () (interactive) (progn (org-agenda-schedule nil "+1m") (spolakh/refile-to-later) (spolakh/advance-inbox-processing))) "1 Month")
      ("q" (lambda () (interactive) (progn (org-agenda-schedule nil "+3m") (spolakh/refile-to-later) (spolakh/advance-inbox-processing))) "1 Quarter - 3 months")
      ("h" (lambda () (interactive) (progn (org-agenda-schedule nil "+6m") (spolakh/refile-to-later) (spolakh/advance-inbox-processing))) "1 Half - 6 months")
      ("y" (lambda () (interactive) (progn (org-agenda-schedule nil "+1y") (spolakh/refile-to-later) (spolakh/advance-inbox-processing))) "1 Year")
      ("p" (lambda () (interactive) ;(let ((current-prefix-arg '(4)))
             (progn
               ;(call-interactively 'org-agenda-schedule)
               (org-agenda-refile) (spolakh/advance-inbox-processing)))
        ;)
       "refile to existing Project")
      )
    )
  (defvar spolakh/org-agenda-process-inbox-do-bulk nil)
  (defun spolakh/advance-inbox-processing ()
     (if (looking-at ".*>$") (setq spolakh/org-agenda-process-inbox-do-bulk nil))
     (if spolakh/org-agenda-process-inbox-do-bulk (spolakh/org-agenda-process-inbox-item))
    )
  (defun spolakh/org-agenda-refile ()
     (advice-remove 'org-store-log-note #'spolakh/org-agenda-refile)
     (switch-to-buffer "*Org Agenda*")
     (hydra-schedule/body)
     )
  (defun spolakh/org-agenda-process-inbox-item ()
    ;; "process a single item in the org-agenda."
    (interactive)
     (org-with-wide-buffer
       (beginning-of-line)
       (if spolakh/org-agenda-process-inbox-do-bulk
           (let ((current-prefix-arg 0)) (call-interactively 'recenter-top-bottom)))
       (advice-add 'org-store-log-note :after #'spolakh/org-agenda-refile)
       (if (= 0 (length (org-get-at-bol 'tags))) (org-agenda-set-tags))
       (unless (org-entry-get (org-get-at-bol 'org-hd-marker) "Effort") (spolakh/invoke-fast-effort-selection))
       (org-agenda-add-note)
       (org-add-log-note)
     )
  )
  (defun spolakh/org-agenda-process-single-inbox-item ()
    (interactive)
    (setq spolakh/org-agenda-process-inbox-do-bulk nil)
    (spolakh/org-agenda-process-inbox-item))
  (defun spolakh/org-agenda-find-beginning-of-inbox ()
    (beginning-of-buffer)
    (spolakh/org-agenda-next-section)
    (spolakh/org-agenda-next-section)
    (spolakh/org-agenda-next-section)
    (next-line)
    (point)
    )
  (defun spolakh/org-agenda-bulk-process-inbox ()
    (interactive)
    (spolakh/org-agenda-find-beginning-of-inbox)
    (setq spolakh/org-agenda-process-inbox-do-bulk t)
    (spolakh/org-agenda-process-inbox-item)
     )

  ; http://pragmaticemacs.com/emacs/reorder-todo-items-in-your-org-mode-agenda/
  (defun spolakh/org-headline-to-top ()
  "Move the current org headline to the top of its section"
  (interactive)
  ;; check if we are at the top level
  (let ((lvl (org-current-level)))
    (cond
     ;; above all headlines so nothing to do
     ((not lvl)
      (message "No headline to move"))
     ((= lvl 1)
      ;; if at top level move current tree to go above first headline
      (org-cut-subtree)
      (beginning-of-buffer)
      ;; test if point is now at the first headline and if not then
      ;; move to the first headline
      (unless (looking-at-p "*")
        (org-next-visible-heading 1))
      (org-paste-subtree))
     ((> lvl 1)
      ;; if not at top level then get position of headline level above
      ;; current section and refile to that position. Inspired by
      ;; https://gist.github.com/alphapapa/2cd1f1fc6accff01fec06946844ef5a5
      (let* ((org-reverse-note-order t)
             (pos (save-excursion
                    (outline-up-heading 1)
                    (point)))
             (filename (buffer-file-name))
             (rfloc (list nil filename nil pos)))
        (org-refile nil nil rfloc))))))
    (defun spolakh/org-agenda-parent-to-top ()
      "Same as 'spolakh/org-agenda-item-to-top but for the parent of the current item"
      (interactive)
      (org-save-all-org-buffers)
      (org-agenda-switch-to)
      (outline-up-heading 1)
      (spolakh/org-headline-to-top)
      (switch-to-buffer "*Org Agenda*")
      (org-agenda-redo)
    )
    (defun spolakh/org-agenda-item-to-top ()
    "Move the current agenda item to the top of the subtree in its file"
      (interactive)
      ;; save buffers to preserve agenda
      (org-save-all-org-buffers)
      ;; switch to buffer for current agenda item
      (org-agenda-switch-to)
      ;; move item to top
      (spolakh/org-headline-to-top)
      ;; go back to agenda view
      (switch-to-buffer "*Org Agenda*")
      ;; refresh agenda
      (org-agenda-redo)
    )

    :config 
    (map! :after evil-org-agenda
          :map (evil-org-agenda-mode-map org-agenda-mode-map)
                                        ; org-agenda-keymap
                                        ; org-agenda-mode-map
                                        ; evil-org-agenda-mode-map
          :m "i" #'org-agenda-clock-in
          "o" #'org-agenda-clock-out
          :m "I" #'org-pomodoro
          :m "O" #'org-pomodoro
          :m "s-i" #'spolakh/set-todo-idea
                                        ;"a" #'org-agenda-add-note ; we always link notes in the default item processing flow
          "d" #'org-agenda-deadline
          :m "e" #'spolakh/invoke-fast-effort-selection
          "s" #'org-agenda-schedule
          "a" #'org-agenda-archive-default-with-confirmation
          "p" #'spolakh/org-agenda-process-single-inbox-item
          :m "P" #'spolakh/org-agenda-bulk-process-inbox
          :m "t"  #'org-agenda-columns
          "R" #'org-agenda-refile
          "<s-return>" #'org-agenda-todo
          "<s-S-return>" #'spolakh/set-todo-done
          "D" #'spolakh/set-todo-pass
          "S" #'spolakh/set-todo-waiting
          "s-." #'spolakh/debug
          "!" #'spolakh/org-agenda-parent-to-top
          :m "!" #'spolakh/org-agenda-parent-to-top
          :m "J" #'spolakh/org-agenda-next-section
          :m "K" #'spolakh/org-agenda-previous-section
          :m "1" #'spolakh/org-agenda-item-to-top
          :m "d" nil
          :m "s" nil
          :m "a" nil
          :m "p" nil
          :m "R" nil
          :m "S" nil
          :m "D" nil
          :m "<s-return>" nil
          :m "<s-S-return>" nil
          )
)

(use-package! org-gcal
  :init
  ;; Storing my creds in a secret file so I don't commit them here.
  (require 'json)
  (defun get-gcal-config-value (key)
    "Return the value of the json file gcal_secret for key"
    (cdr (assoc key (json-read-file "~/Dropbox/code/credentials/gcal.json")))
    )

  (setq org-gcal-client-id (get-gcal-config-value 'org-gcal-client-id)
        org-gcal-client-secret (get-gcal-config-value 'org-gcal-client-secret)
        org-gcal-file-alist `(
                              (,(get-gcal-config-value 'calendar-id) .  ,(concat spolakh/org-gcal-directory "gcal.org.gpg"))
                              (,(get-gcal-config-value 'work-calendar-id) .  ,(concat spolakh/org-gcal-directory "gcal-grail.org.gpg"))
                              (,(get-gcal-config-value 'birthday-calendar-id) .  ,(concat spolakh/org-gcal-directory "gcal-birthdays.org.gpg"))
                              )
        org-gcal-remove-api-cancelled-events t
        org-gcal-update-cancelled-events-with-todo nil
        org-gcal-remove-events-with-cancelled-todo t
        org-gcal-up-days 7
        org-gcal-down-days 7
        org-gcal-notify-p nil
        org-gcal-auto-archive nil

        )
  :config
    ;; org-gcal exclude declined events
    (defun cce/filter-gcal-event-declined (event)
      "Function for [org-gcal-fetch-event-filters]."
      (let* ((case-fold-search t)
            (attendees (plist-get event :attendees))
            (my-response (when attendees
                            (cl-reduce (lambda (last next)
                                      (if (plist-get next :self) next last))
                                    attendees
                                    :initial-value nil))))
        (cond ((string-match "office hour" (plist-get event :summary))
              nil)
              ((string-equal (plist-get my-response :responseStatus) "declined")
              nil)
              (t t))))

    (add-to-list 'org-gcal-fetch-event-filters 'cce/filter-gcal-event-declined)
    (defun spolakh/org-gcal-sync ()
      (interactive)
      (org-gcal-sync t))
    (defun spolakh/wipe-work-gcal-and-refetch ()
      (interactive)
      ;(with-current-buffer
      ;    (find-file-noselect (concat spolakh/org-agenda-directory "gcal-grail.org.gpg"))
      ;  (erase-buffer)
      ;  (save-buffer))
      (call-interactively #'spolakh/org-gcal-sync)
      (message "org-gcal-fetch finished"))
    (run-with-idle-timer 60 t 'spolakh/wipe-work-gcal-and-refetch)
)

; ORG-POMODORO
(defun my/org-pomodoro-text-time ()
  "Return status info about org-pomodoro and if org-pomodoro is not running, try to print info about org-clock.
    If either org-pomodoro or org-clock aren't active, print \"No Active Task \" "
  (interactive)
  (cond ((equal :none org-pomodoro-state)
         (if (org-clock-is-active)
             (format "Clock¥%d¥%s"
                     (org-clock-get-clocked-time) (substring-no-properties org-clock-heading))
                     "None"))
        ((equal :pomodoro org-pomodoro-state)
         (format "Pomodoro¥%d¥%d¥%s"
                 org-pomodoro-count (org-pomodoro-remaining-seconds) (substring-no-properties org-clock-heading)))
        ((equal :short-break org-pomodoro-state) "Short")
        ((equal :long-break org-pomodoro-state)  "Long")))


; ORG-ROAM:

(defvar spolakh/org-roam-daily-prefix "ord--"
  "prefix to use for the filenames of daily notes")

(use-package! org-roam
  :hook
  (after-init . org-roam-mode)
  :init
  ; currently (✓ (124/187) org-roam updated (0cce9d1 -> a7cf48e)) is broken
  (setq org-roam-rename-file-on-title-change nil)

  (add-hook 'after-init-hook 'org-roam-mode)
  (setq org-roam-directory (concat spolakh/org-directory "/notes/"))
  (setq org-roam-link-title-format "[[%s]]")
  (setq +org-roam-open-buffer-on-find-file nil)
  (setq org-roam-encrypt-files t)
  (setq org-roam-dailies-directory "private/dailies/")
  (setq epa-file-encrypt-to "onlyusefororg@example.com")
  (setq org-roam-index-file "~/Dropbox/org/notes/index.org.gpg")
  (setq org-roam-db-location "~/org-roam-new.db")
  (setq org-roam-capture-templates
        '(("d" "default" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "${slug}"
           :head "#+TITLE: ${title}\n#+CREATED: [%<%Y-%m-%d %a %H:%M>]\n\n"
           :unnarrowed t)
          ("D" "grail default" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "private/grail/${slug}"
           :head "#+TITLE: GRAIL/${title}\n#+CREATED: [%<%Y-%m-%d %a %H:%M>]\n\n"
           :unnarrowed t)
          ("p" "private" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "private/${slug}"
           :head "#+TITLE: PRIVATE/${title}\n#+CREATED: [%<%Y-%m-%d %a %H:%M>]\n\n"
           :unnarrowed t)
          ))
  (setq org-roam-dailies-capture-templates
        `(("d" "daily" entry (function org-roam-capture--get-point)
           "* TODO %?"
           ;:immediate-finish t
           :file-name ,(concat "private/dailies/" spolakh/org-roam-daily-prefix "%<%Y-%m-%d>")
           :head "#+TITLE: %<%Y-%m-%d>\n\n* [[roam:§ PRIVATE/Nice Things Today]] 1: 2: 3:\n\n* :@mine:\n* :@work:\n"
           :olp (":@mine:"))

          ("D" "work-daily" entry (function org-roam-capture--get-point)
           "* TODO %?"
           ;:immediate-finish t
           :file-name ,(concat "private/dailies/" spolakh/org-roam-daily-prefix "%<%Y-%m-%d>")
           :head "#+TITLE: %<%Y-%m-%d>\n\n* [[roam:§ PRIVATE/Nice Things Today]] 1: 2: 3:\n\n* :@mine:\n* :@work:\n"
           :olp (":@work:"))
        ))
  (map! :map org-roam-mode-map
        :leader
        (:prefix ("n" . "notes")
         (:prefix ("r" . "roam")
          :desc "Entrypoint" "e" 'org-roam-jump-to-index
          :desc "Insert a link to a Note" "l" 'org-roam-insert
          )))
  :config
  (map!
   (:map global-map
    "M-z" "Ω"
    "M-6" "§"
    "M-5" "∞"
    ))
  (after! hydra
    (defhydra hydra-dailies (:color red)
      ("h" org-roam-dailies-find-previous-note)
      ("l" org-roam-dailies-find-next-note)
      ("." org-roam-dailies-find-today)
      ("q" nil)
      )
    (map! :map org-roam-dailies-map
          :leader
          (:prefix ("n" . "notes")
           (:prefix ("r" . "roam")
             (:prefix ("d" . "date")
            :desc "hydra" "h" 'hydra-dailies/body
            ))))
    (map! (:map org-roam-mode-map
             "s-i" 'org-roam-dailies-find-previous-note
             "s-o" 'org-roam-dailies-find-next-note
             ))
    )
  )

(use-package! hydra)
;; (use-package! org-fc
;;   :custom (org-fc-directories '("~/Dropbox/org/notes/private/gtd/"))
;;   :config
;;   (require 'org-fc-hydra))


; LSP
; https://arenzana.org/2019/12/emacs-go-mode-revisited/

(setq read-process-output-max (* 10 1024 1024)) ;; 10mb
(use-package! lsp-mode
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred)

  :init
    (setq lsp-enable-file-watchers nil) ; need to reenable when figure out how to ignore all the bazel and other non-relevant things
    (setq gc-cons-threshold 20000000)

  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

  :config

  (setq lsp-gopls-staticcheck t)
  (setq lsp-eldoc-render-all t)
  ;; temp hack to fix https://github.com/emacs-lsp/lsp-mode/issues/1778
  (setq lsp-gopls-codelens nil)
  ;;(setq lsp-gopls-complete-unimported t)
  )

(use-package! lsp-ui
  :commands lsp-ui-mode
  :init
  :config
  (setq
        ;lsp-ui-doc-enable nil
        lsp-ui-peek-enable t
        lsp-ui-sideline-enable t
        lsp-ui-imenu-enable t
        lsp-ui-flycheck-enable t)
)

(use-package! company
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package! company-lsp
  :commands company-lsp)


;; (use-package! yasnippet
;;   :commands yas-minor-mode
;;   :hook (go-mode . yas-minor-mode))

(use-package! go-mode
:defer t
:mode ("\\.go\\'" . go-mode)
)

(use-package! projectile
  :config
  (map!
   (:map doom-leader-project-map
    "O" 'projectile-toggle-between-implementation-and-test
    ))
  )

; currently having issues with not being able to save winner-ring's which causes this to hang for like 10s every time
;(run-with-idle-timer 30 t #'doom-save-session)
(persp-mode)
(server-start)
