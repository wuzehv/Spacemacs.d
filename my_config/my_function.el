;; function
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun switch-to-previous-buffer ()
  "Switch to most recent buffer. Repeated calls toggle back and forth between the most recent two buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun copy-all-or-region ()
  "Put the whole buffer content to `kill-ring', or text selection if there's one.
Respects `narrow-to-region'.
URL `http://ergoemacs.org/emacs/emacs_copy_cut_all_or_region.html'
Version 2015-08-22"
  (interactive)
  (if (use-region-p)
      (progn
        (kill-new (buffer-substring (region-beginning) (region-end)))
        (message "Text selection copied."))
    (progn
      (kill-new (buffer-string))
      (message "Buffer content copied."))))

(defun put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(defun my_prog_mode_setting()
  "program setting"
  (display-line-numbers-mode t)
  (whitespace-mode t)
  (flyspell-mode)
  (hungry-delete-mode t))

(defun my_php_mode_setting()
  "php mode setting"
  (setq indent-tabs-mode t)
  (setq-default tab-width 4)
  (flycheck-mode)
  (company-mode t)
  (require 'company-php)
  (company-mode t)
  (ac-php-core-eldoc-setup) ;; enable eldoc
  (make-local-variable 'company-backends)
  (add-to-list 'company-backends 'company-ac-php-backend))

(defun my_sh_mode_setting()
  "php mode setting"
  (flycheck-mode)
  (company-mode t)
  (require 'company-shell)
  (company-mode t)
  (add-to-list 'company-backends 'company-shll))

(defun my_web_mode_setting()
  "web mode setting"
  (setq-default tab-width 4)
  (setq indent-tabs-mode t))

(defun my_c_mode_setting()
  "web mode setting"
  (local-set-key (kbd "C-c C-c") 'my_c_compile)
  (setq default-tab-width 4)
  (setq c-default-style "Linux")
  (setq c-basic-offset 4))

(defun rename-file-and-buffer()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(defun delete-current-file-copy-to-kill-ring()
  (interactive)
  (progn
    (kill-new (buffer-string))
    (message "Buffer content copied to kill-ring")
    (when (buffer-file-name)
      (when (file-exists-p (buffer-file-name))
        (progn
          (delete-file (buffer-file-name))
          (message "Deleted file: [%s]" (buffer-file-name)))))
    (let ((buffer-offer-save nil))
      (set-buffer-modified-p nil)
      (kill-buffer (current-buffer)))))

(defun dotemacs-buffer-encoding-abbrev ()
  "The line ending convention used in the buffer."
  (let ((buf-coding (format "%s" buffer-file-coding-system)))
    (if (string-match "\\(dos\\|unix\\|mac\\)" buf-coding)
        (match-string 1 buf-coding)
      buf-coding)))

(defun my-org-open-at-point ()
  "open org file at point and full screen"
  (interactive)
  (org-open-at-point)
  (delete-other-windows))

(defun my-helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(defun my_c_compile()
  "auto compile c code && run"
  (interactive)
  (save-buffer)
  (compile (format "gcc %s && ./a.out" (buffer-file-name)))
  (switch-to-buffer-other-window "*compilation*"))

(defun my-indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-region (point-min) (point-max))
        (message "Indented buffer.")))))

(defun my-org-screenshot (basename)
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive "sScreenshot name: ")
  (if (equal basename "")
      (setq basename (format-time-string "%Y%m%d_%H%M%S")))
  (setq filename
        (concat (file-name-directory (buffer-file-name))
                "imgs/"
                (file-name-base (buffer-file-name))
                "_"
                basename
                ".png"))
  (call-process "screencapture" nil nil nil "-s" filename)
  (when (file-exists-p filename)
    ;; 添加子元素
    (org-insert-item)
    ;; 调整优先级
    (org-metaright)
    (insert (concat "[[" filename "]]"))
    (org-display-inline-images)))

(defun my-set-chinese-font (love-font &optional size)
  "根据系统设置中文字体"
  (unless size
    (setq size 16))
  (when (member love-font (font-family-list))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :family love-font :size size)))))

;; after yank auto indent
(dolist (command '(evil-paste-after yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(php-mode web-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(provide 'my_function)
