(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-notify-method 'bully)
 '(Man-sed-command "sed")
 '(ansi-color-names-vector
   ["#fafafa" "#e45649" "#50a14f" "#986801" "#4078f2" "#a626a4" "#0184bc" "#383a42"])
 '(auto-save-default nil)
 '(auto-save-timeout 30)
 '(auto-save-visited-interval 1)
 '(company-idle-delay 0)
 '(confirm-kill-processes nil)
 '(custom-safe-themes
   '("3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "439d4ce8295685fc36fc119a062d0283bb05436ae841b053af76e9a5e42bc670" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" default))
 '(display-line-numbers-grow-only t)
 '(display-line-numbers-type t)
 '(display-line-numbers-width nil)
 '(display-line-numbers-width-start nil)
 '(evil-leader/leader "SPC")
 '(fci-rule-color "#383a42")
 '(gofmt-show-errors 'echo)
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "zh-CN")
 '(helm-split-window-other-side-when-one-window 'left)
 '(indent-tabs-mode nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#f0f0f0" "#4078f2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#f0f0f0" "#50a14f"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#f0f0f0" "#9ca0a4"))
 '(objed-cursor-color "#e45649")
 '(org-agenda-files '("~/.org/notes.org"))
 '(org-agenda-window-setup 'only-window)
 '(org-image-actual-width 500)
 '(package-selected-packages
   '(helm-icons helm-icon lsp-mode evil evil-leader evil-surround evil-nerd-commenter company company-go helm helm-ag helm-projectile helm-swoop monokai-theme doom-modeline org-bullets dashboard projectile magit smooth-scrolling hungry-delete expand-region which-key popwin disable-mouse iedit use-package winum youdao-dictionary exec-path-from-shell yasnippet markdown-mode php-mode web-mode lua-mode haskell-mode go-mode))
 '(pdf-view-midnight-colors (cons "#383a42" "#fafafa"))
 '(popwin:special-display-config
   '((Man-mode)
     (godoc-mode)
     ("*Miniedit Help*" :noselect t)
     (help-mode)
     (completion-list-mode :noselect t)
     (compilation-mode :noselect t)
     (grep-mode :noselect t)
     (occur-mode :noselect t)
     ("*Pp Macroexpand Output*" :noselect t)
     ("*Shell Command Output*")
     ("*vc-diff*")
     ("*vc-change-log*")
     (" *undo-tree*" :width 60 :position right)
     ("^\\*anything.*\\*$" :regexp t)
     ("*slime-apropos*")
     ("*slime-macroexpansion*")
     ("*slime-description*")
     ("*slime-compilation*" :noselect t)
     ("*slime-xref*")
     (sldb-mode :stick t)
     (slime-repl-mode)
     (slime-connection-list-mode)))
 '(recentf-auto-cleanup 300)
 '(rustic-ansi-faces
   ["#fafafa" "#e45649" "#50a14f" "#986801" "#4078f2" "#a626a4" "#0184bc" "#383a42"])
 '(smooth-scroll-margin 10)
 '(truncate-partial-width-windows nil)
 '(vc-annotate-background "#fafafa")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50a14f")
    (cons 40 "#688e35")
    (cons 60 "#807b1b")
    (cons 80 "#986801")
    (cons 100 "#ae7118")
    (cons 120 "#c37b30")
    (cons 140 "#da8548")
    (cons 160 "#c86566")
    (cons 180 "#b74585")
    (cons 200 "#a626a4")
    (cons 220 "#ba3685")
    (cons 240 "#cf4667")
    (cons 260 "#e45649")
    (cons 280 "#d2685f")
    (cons 300 "#c07b76")
    (cons 320 "#ae8d8d")
    (cons 340 "#383a42")
    (cons 360 "#383a42")))
 '(vc-annotate-very-old-color nil)
 '(whitespace-style '(face)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-rg-base-rg-cmd-face ((t (:weight normal))))
 '(helm-rg-inactive-arg-face ((t (:weight normal))))
 '(helm-rg-title-face ((t (:background "black" :weight bold))))
 '(line-number ((t (:foreground "#aeaeae"))))
 '(line-number-current-line ((t nil)))
 '(org-block ((t (:extend t :background "#F8F8F8"))))
 '(org-block-begin-line ((t (:extend t :background "#F9F9F9" :foreground "#383a42" :slant italic :weight bold :width expanded))))
 '(org-done ((t (:inherit org-headline-done :foreground "dim gray" :strike-through t :weight bold))))
 '(org-headline-done ((t (:foreground "dim gray" :strike-through t))))
 '(region ((t (:inherit default :extend t :background "khaki"))))
 '(whitespace-empty ((t (:foreground "light gray" :inverse-video t)))))
