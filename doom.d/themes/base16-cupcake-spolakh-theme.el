(require 'base16-theme)

;; Define the theme
(deftheme base16-cupcake-spolakh)

(let (
    (base00 "#fbf1f2")
    (base01 "#f2f1f4")
    (base02 "#d8d5dd")
    (base03 "#bfb9c6")
    (base04 "#a59daf")
    (base05 "#8b8198")
    (base06 "#72677e")
    (base07 "#585062")
    (base08 "#d57e85")
    (base09 "#ebb790")
    (base0A "#dcb16c")
    (base0B "#a3b367")
    (base0C "#69a9a7")
    (base0D "#7297b9")
    (base0E "#bb99b4")
    (base0F "#baa58c")
      )

(defvar base16-cupcake-spolakh-colors
  `(:base00 ,base00
    :base01 ,base01
    :base02 ,base02
    :base03 ,base03
    :base04 ,base04
    :base05 ,base05
    :base06 ,base06
    :base07 ,base07
    :base08 ,base08
    :base09 ,base09
    :base0A ,base0A
    :base0B ,base0B
    :base0C ,base0C
    :base0D ,base0D
    :base0E ,base0E
    :base0F ,base0F)
  "All colors for Base16 Cupcake are defined here.")

;; Add all the faces to the theme
(base16-theme-define 'base16-cupcake-spolakh base16-cupcake-spolakh-colors)

(custom-theme-set-faces
   'base16-cupcake-spolakh

   ;; default stuff (Emacs 23)
   ;; `(default ((t (:background ,base01 :foreground ,base06))))
   ;; `(fringe ((t (:background ,base00))))
   ;; `(minibuffer-prompt ((t (:foreground ,slate))))
   ;; `(mode-line ((t (:background ,base03))))
   ;; `(region ((t (:background ,base00))))
   ;; `(sp-pair-overlay-face ((t (:background ,base02))))

   ;; org-mode
   ;; `(org-agenda-block-count ((t (:weight bold :foreground ,base06))))
   ;; `(org-agenda-calendar-event ((t (:weight bold :foreground ,slate))))
   ;; `(org-agenda-calendar-sexp ((t (:foreground ,base07))))
   ;; `(org-agenda-clocking ((t (:foreground ,yellow :background ,base02))))
   ;; `(org-agenda-current-time ((t (:foreground ,teal))))
   ;; `(org-agenda-date ((t (:height 1.4 :weight bold))))
   ;; `(org-agenda-date-today ((t (:height 1.4 :weight bold))))
   ;; `(org-agenda-date-weekend ((t (:height 1.4 :weight bold :foreground ,base05))))
   ;; `(org-agenda-diary ((t (:weight bold :background ,green))))
   ;; `(org-agenda-dimmed-todo-face ((t (:background ,yellow))))
   ;; `(org-agenda-done ((t (:foreground ,green))))
   ;; `(org-agenda-filter-category ((t (:weight bold :foreground ,orange))))
   ;; `(org-agenda-filter-tags ((t (:weight bold :foreground ,orange))))
   ;; `(org-agenda-restriction-lock ((t (:background ,red))))
   ;; `(org-agenda-structure ((t (:height 1.4 :weight bold :foreground ,teal))))
   ;; `(org-archived ((t (:foreground ,base05))))
   ;; `(org-beamer-tag ((t (:box (:line-width 1 :color ,yellow) :foreground ,base05))))
   ;; `(org-block ((t (:background ,yellow :foreground ,base00))))
   ;; `(org-block-background ((t (:foreground ,yellow))))
   ;; `(org-block-begin-line ((t (:underline ,base07 :foreground ,base06 :background ,orange))))
   ;; `(org-block-end-line ((t (:overline ,base07 :foreground ,base06 :background ,orange))))
   ;; `(org-checkbox ((t (:weight bold :box (:line-width 1 :style pressed-button) :foreground ,base00 :background ,base06))))
   ;; `(org-clock-overlay ((t (:foreground ,teal))))
   ;; `(org-date ((t (:underline t :foreground ,slate))))
   ;; `(org-default ((t (:foreground ,base06 :background ,base00))))
   ;; `(org-dim ((t (:foreground ,base04))))
   ;; `(org-document-info ((t (:foreground ,base04))))
   ;; `(org-document-info-keyword ((t (:foreground ,teal))))
   ;; `(org-document-title ((t (:family "sans serif" :height 1.8 :weight bold))))
   ;; `(org-done ((t (:weight bold :foreground ,green))))
   ;; `(org-drawer ((t (:foreground ,green))))
   ;; `(org-ellipsis ((t (:underline nil :box (:line-width 1 :color ,base04) :background ,yellow))))
   ;; `(org-example ((t (:foreground ,base05))))
   ;; `(org-footnote ((t (:underline t :foreground ,teal))))
   ;; `(org-formula ((t (:foreground ,brown))))
   ;; `(org-headline-done ((t (:height 1.0 :weight normal :strike-through t :foreground ,green))))
   ;; `(org-hide ((t (:foreground ,base02))))
   ;; `(org-inlinetask ((t (:foreground ,yellow))))
   ;; `(org-latex-and-related ((t (:foreground ,teal))))
   ;; `(org-level-1 ((t (:foreground ,red))))
   ;; `(org-level-2 ((t (:foreground ,orange))))
   ;; `(org-level-3 ((t (:foreground ,yellow))))
   ;; `(org-level-4 ((t (:foreground ,teal))))
   ;; `(org-level-5 ((t (:foreground ,slate))))
   ;; `(org-level-6 ((t (:foreground ,purple))))
   ;; `(org-level-7 ((t (:foreground ,brown))))
   ;; `(org-level-8 ((t (:foreground ,base05))))
   ;; `(org-link ((t (:foreground ,yellow))))
   ;; `(org-list-dt ((t (:weight bold :foreground ,teal))))
   ;; `(org-macro ((t (:weight bold :foreground ,yellow))))
   ;; `(org-meta-line ((t (:slant normal :foreground ,teal))))
   ;; `(org-mode-line-clock ((t (:foreground ,base05))))
   ;; `(org-mode-line-clock-overrun ((t (:weight bold :box (:line-width 1 :color ,teal) :foreground ,base07 :background ,red))))
   ;; `(org-number-of-items ((t (:weight bold :foreground ,green))))
   ;; `(org-property-value ((t (:foreground ,base04))))
   ;; `(org-quote ((t (:slant italic :foreground ,base04))))
   ;; `(org-scheduled ((t (:foreground ,slate))))
   ;; `(org-scheduled-previously ((t (:foreground ,red))))
   ;; `(org-scheduled-today ((t (:foreground ,orange))))
   ;; `(org-sexp-date ((t (:foreground ,teal))))
   ;; `(org-special-keyword ((t (:weight bold :foreground ,slate))))
   ;; `(org-table ((t (:foreground ,green))))
   ;; `(org-tag ((t (:weight normal :slant italic :foreground ,base02 :background ,base06))))
   ;; `(org-target ((t (:foreground ,orange))))
   ;; `(org-time-grid ((t (:foreground ,orange))))
   ;; `(org-todo ((t (:weight bold :foreground ,red))))
   ;; `(org-upcoming-deadline ((t (:foreground ,red))))
   ;; `(org-verbatim ((t (:foreground ,teal))))
   ;; `(org-verse ((t (:slant italic :foreground ,base05))))
   ;; `(org-warning ((t (:weight bold :foreground ,base07 :background ,base00))))

   ;; org-habit
   `(org-habit-clear-face ((t (:background ,base00 :foreground ,base05))))
   `(org-habit-clear-future-face ((t (:background ,base00 :foreground ,base05))))
   `(org-habit-ready-face ((t (:background ,base00 :foreground ,base05))))
   `(org-habit-ready-future-face ((t (:background ,base00 :foreground ,base05))))

   `(org-habit-alert-face ((t (:background ,base0E :foreground ,base00))))
   `(org-habit-alert-future-face ((t (:background ,base0E :foreground ,base00))))
   `(org-habit-overdue-face ((t (:background ,base02 :foreground ,base05))))
   `(org-habit-overdue-future-face ((t (:background ,base02 :foreground ,base05))))
   )
)


;; Mark the theme as provided
(provide-theme 'base16-cupcake-spolakh)

(provide 'base16-cupcake-spolakh-theme)
