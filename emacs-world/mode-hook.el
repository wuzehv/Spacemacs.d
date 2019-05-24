;; mode
(defun my_prog_mode_setting()
  "program setting"
  (display-line-numbers-mode t)
  (whitespace-mode t)
  (hungry-delete-mode t))

(defun my_php_mode_setting()
  "php mode setting"
  (setq indent-tabs-mode t)
  (setq-default tab-width 4)
  (company-mode t)
  (require 'company-php)
  (flycheck-mode)
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

(add-hook 'prog-mode-hook 'my_prog_mode_setting)

(add-hook 'php-mode-hook 'my_php_mode_setting)

(add-hook 'sh-mode-hook 'my_sh_mode_setting)

(add-hook 'web-mode-hook 'my_web_mode_setting)

(add-hook 'c-mode-hook 'my_c_mode_setting)

(add-hook 'helm-minibuffer-set-up-hook
          'my-helm-hide-minibuffer-maybe)

(add-hook 'youdao-dictionary-mode-hook #'(lambda ()
                                           (evil-emacs-state)))

(defun date-hook-fn ()
  (goto-char (line-end-position))
  (insert (format-time-string " ~:%Y-%m-%d %H:%M:%S~")))

(add-hook 'org-checkbox-statistics-hook 'date-hook-fn)

(provide 'mode-hook)