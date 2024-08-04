(setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 15 :weight 'semi-bold)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 15 :weight 'bold)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 15 :weight 'bold :slant 'italic))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(set-face-attribute 'mode-line nil :font "JetBrainsMono Nerd Font Bold")
(setq doom-modeline-height 30                   ;; Sets modeline height
      doom-modeline-bar-width 5                 ;; Sets right bar width
      doom-modeline-persp-name t                ;; adds perspective name to modeline
      doom-modeline-env-load-string "..."       ;; sets modeline loading string
      doom-modeline-persp-icon t)               ;; adds folder icon next to persp name

(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")

(beacon-mode 1)

(setq bookmark-default-file "~/.config/doom/bookmarks")

(map! :leader
      (:prefix ("b". "buffer")
       :desc "List bookmarks"                          "L" #'list-bookmarks
       :desc "Set bookmark"                            "m" #'bookmark-set
       :desc "Delete bookmark"                         "M" #'bookmark-set
       :desc "Save current bookmarks to bookmark file" "w" #'bookmark-save))

(map! :leader
      (:prefix ("c h" . "Help info from Clippy")
       :desc "Clippy describes function under point" "f" #'clippy-describe-function
       :desc "Clippy describe variable under point" "v" #'clippy-describe-variable))

(setq doom-localleader-key "\\")

;; (setq fancy-splash-image "~/.config/doom/banner/doom-emacs-dash.png")
(defun custom-dashboard ()
  (let* ((banner'("______ _____ ____ ___ ___"
                  "`  _  V  _  V  _ \\|  V  ´"
                  "| | | | | | | | | |     |"
                  "| | | | | | | | | | . . |"
                  "| |/ / \\ \\| | |/ /\\ |V| |"
                  "|   /   \\__/ \\__/  \\| | |"
                  "|  /                ' | |"
                  "| /     E M A C S     \\ |"
                  "´´                     ``"))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'custom-dashboard)

(map! :leader
      (:prefix ("d". "dired")
       :desc "Open Dired" "d" #'dired
       :desc "Dired Jump To Current Directory" "j" #'dired-jump)
      (:after dired
        (:map dired-mode-map
         :desc "Peep-dired image previews" "d p" #'peep-dired
         :desc "Dired view file" "d v" #'dired-view-file)))

(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-open-file ; use dired-find-file instead of dired-open.
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  (kbd "u") 'dired-unmark
  (kbd "C") 'dired-do-copy
  (kbd "D") 'dired-do-delete
  (kbd "J") 'dired-goto-file
  (kbd "M") 'dired-do-chmod
  (kbd "O") 'dired-do-chown
  (kbd "P") 'dired-do-print
  (kbd "R") 'dired-do-rename
  (kbd "T") 'dired-do-touch
  (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
  (kbd "Z") 'dired-do-compress
  (kbd "+") 'dired-create-directory
  (kbd "N") 'dired-create-empty-file
  (kbd "-") 'dired-do-kill-lines
  (kbd "% l") 'dired-downcase
  (kbd "% m") 'dired-mark-files-regexp
  (kbd "% u") 'dired-upcase
  (kbd "* %") 'dired-mark-files-regexp
  (kbd "* .") 'dired-mark-extension
  (kbd "* /") 'dired-mark-directories
  (kbd "; d") 'epa-dired-do-decrypt
  (kbd "; e") 'epa-dired-do-encrypt)
;; Get file icons in dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("png" . "sxiv")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv")))

(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(use-package emojify
  :hook (after-init . global-emojify-mode))

(defun hv/insert-todays-date (prefix)
  (interactive "P")
  (let ((format (cond
                 ((not prefix) "%A, %B %d, %Y")
                 ((equal prefix '(4)) "%m-%d-%Y")
                 ((equal prefix '(16)) "%Y-%m-%d"))))
    (insert (format-time-string format))))

(require 'calendar)
(defun hv/insert-any-date (date)
  "Insert DATE using the current locale."
  (interactive (list (calendar-read-date)))
  (insert (calendar-date-string date)))

(map! :leader
      (:prefix ("i d" . "Insert date")
        :desc "Insert any date"    "a" #'hv/insert-any-date
        :desc "Insert todays date" "t" #'hv/insert-todays-date))

(defun hv/markdown-colors-doom-one ()
  "Enable Doom One colors for Markdown headers."
  (interactive)
  (require 'markdown-mode) ; Ensure Markdown mode is loaded
  (dolist
      (face
       '((markdown-header-face-1 1.6 "#51afef" ultra-bold)
         (markdown-header-face-2 1.5 "#c678dd" extra-bold)
         (markdown-header-face-3 1.4 "#98be65" bold)
         (markdown-header-face-4 1.3 "#da8548" semi-bold)
         (markdown-header-face-5 1.2 "#5699af" normal)
         (markdown-header-face-6 1.1 "#a9a1e1" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face))))

(hv/markdown-colors-doom-one)

(map! :leader
      (:prefix ("m". "markdown")
       :desc "Toggle Inline Image" "i" #'markdown-toggle-inline-images
       :desc "Generate toc" "t" #'markdown-toc-generate-toc ))

(setq minimap-window-location 'right)
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle minimap-mode" "m" #'minimap-mode))

(xterm-mouse-mode 1)

(after! neotree
  (setq neo-smart-open t
        neo-window-fixed-size nil))
(after! doom-themes
  (setq doom-neotree-enable-variable-pitch t))
(map! :leader
      :desc "Toggle neotree file viewer" "t n" #'neotree-toggle
      :desc "Open directory in neotree" "d n" #'neotree-dir)

(use-package obsidian
  :ensure t
  :demand t
  :config
  (obsidian-specify-path "/run/media/harsh/Vault/Notebook")
  )

(map! :leader
      (:prefix ("O" . "Obsidian")
       :desc "obsidian-insert-link" "l" #'obsidian-insert-link
       :desc "obsidian-insert-wikilink" "w" #'obsidian-insert-wikilink
       :desc "obsidian-jump" "j" #'obsidian-jump
       :desc "obsidian-capture" "n" #'obsidian-capture
       :desc "obsidian-search" "s" #'obsidian-search
       :desc "obsidian-tag-find" "t" #'obsidian-tag-find
       :desc "obsidian-move-file" "m" #'obsidian-move-file))

(map! :leader
      :desc "Org babel Tangle" "\\ B" #'org-babel-tangle)

(after! org
  (setq org-directory "~/org"
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        org-superstar-itembullet-alist '((?+ . ?➤) (?- . ?✦)) ; changes +/- symbols in item lists
        org-log-done 'time
        org-hide-emphasis-markers t
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist  ;This overwrites the default Doom org-link-abbrev-list
        '(("google" . "https://www.google.com/search?q=")
          ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-table-convert-region-max-lines 2000
        org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"           ; A task that is ready to be tackled
             "BLOG(b)"           ; Blog writing assignments
             "GYM(g)"            ; Things to accomplish at the gym
             "PROJ(p)"           ; A project that contains other tasks
             "VIDEO(v)"          ; Video assignments
             "WAIT(w)"           ; Something is holding up this task
             "|"                 ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"           ; Task has been completed
             "CANCELLED"))))    ; Task has been cancelled

(after! org
  (setq org-agenda-files '("~/org/agenda.org")))

(setq
   org-fancy-priorities-list '("🟥" "🟧" "🟨")
   org-priority-faces
   '((?A :foreground "#ff6c6b" :weight bold)
     (?B :foreground "#98be65" :weight bold)
     (?C :foreground "#c678dd" :weight bold))
   org-agenda-block-separator 8411)

(setq org-agenda-custom-commands
      '(("v" "A better agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (tags "PRIORITY=\"B\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Medium-priority unfinished tasks:")))
          (tags "PRIORITY=\"C\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Low-priority unfinished tasks:")))
          (tags "customtag"
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Tasks marked with customtag:")))

          (agenda "")
          (alltodo "")))))

(defun hv/org-headers ()
  "Enable Doom One colors for Org headers."
  (interactive)
  (require 'org) ; Ensure Org mode is loaded
  (dolist
      (face
       '((org-level-1 1.7 "#51afef" ultra-bold)
         (org-level-2 1.6 "#c678dd" extra-bold)
         (org-level-3 1.5 "#98be65" bold)
         (org-level-4 1.4 "#da8548" semi-bold)
         (org-level-5 1.3 "#5699af" normal)
         (org-level-6 1.2 "#a9a1e1" normal)
         (org-level-7 1.1 "#46d9ff" normal)
         (org-level-8 1.0 "#ff6c6b" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(hv/org-headers)

(setq org-journal-dir "~/org/journal"
      org-journal-date-prefix "* "
      org-journal-time-prefix "** "
      org-journal-date-format "%B %d %Y (%A)"
      org-journal-file-format "%Y-%m-%d")

(after! org
  (setq org-roam-directory "~/org/roam"
        org-roam-graph-view "/usr/bin/firefox"))
(map! :leader
      (:prefix ("n". "Custom Maps")))

(map! :leader
      (:prefix ("n r". "org-roam")
       :desc "Completion at point" "c" #'completion-at-point
       :desc "Find node" "f" #'org-roam-node-find
       :desc "Show graph" "g" #'org-roam-graph
       :desc "Insert node" "i" #'org-roam-node-insert
       :desc "Capture to node" "n" #'org-roam-capture
       :desc "Toggle roam buffer" "r" #'org-roam-buffer-toggle))

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
    (when (not (memq major-mode
                (list 'org-agenda-mode)))
     (rainbow-mode 1))))
(global-rainbow-mode 1 )

(setq shell-file-name "/bin/fish"
      vterm-max-scrollback 5000)
(setq eshell-rc-script "~/.config/doom/eshell/profile"
      echell-aliases-file "~/.config/doom/eshell/aliases"
      eshell-history-size 5000
      eshell-buffer-maximum-lines 5000
      eshell-hist-ignoredups t
      eshell-scroll-to-bottom-on-input t
      eshell-destroy-buffer-when-process-dies t
      eshell-visual-commands '("bash" "fish" "btop" "ssh" "top" "zsh"))

;; Eshell Mapping
(map! :leader
      (:prefix ("e" . "Eshell")
      :desc "Eshell"                 "s" #'eshell
      :desc "Eshell popup toggle"    "t" #'+eshell/toggle
      :desc "Counsel eshell history" "h" #'counsel-esh-history))

;; For Vterm Mapping
(map! :leader
      (:prefix ("v". "Vterm")
       :desc "Vterm Popup Toggle" "t" #'+vterm/toggle))
