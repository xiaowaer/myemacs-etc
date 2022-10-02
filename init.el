;;; 参考地址 https://zhuanlan.zhihu.com/p/432552171
;;;  https://github.com/purcell/emacs.d/blob/master/init.el

;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:
;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:
;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

;;; emacs 使用的基本概念之缓冲和窗口 
;;;     缓冲：打开一个文件就相当于开了一个缓冲区，写入数据，先从缓冲刷入磁盘，读取数据，先从缓冲读入。
;;;     窗口：在emacs中的显示单元，显示一个缓冲区内容的区域，就是窗口。
;;;     一个窗口只能显示一个缓冲，但是一个缓冲区可被显示在多个窗口上。 
;;;         窗口操作
            ; C-x 0: 删除当前窗口
            ; C-x 1: 删除当前窗口外的其他窗口
            ; C-x 4 0: 删除当前窗口，并关闭其中显示的缓冲区
            ; C-x 2:上下分窗口
            ; C-x 3:左右分窗口
            ; 但是有一个问题就是默认会绑在同一个缓冲上。
            ; 解决方案：

;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;

(let ((minver "26.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "27.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; 设定源码加载路径
;; (require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;; Adjust garbage collection thresholds during startup, and thereafter

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))


;;; 涉及一些基本的启动要素，例如检查版本、设定源码加载路径、通过修改垃圾回收的内存上限来提高 Emacs 启动速度等等。
;;; 其中，设定源码加载路径” 这句代码是指将 ~/.emacs.d/lisp/ 目录作为源码加载路径，
;;; 这样你可以将功能需求拆分成多个文件放置在这个目录中，供 init.el 使用。
;;; 那么拆分出去的功能怎么使用呢？如果你使用的是 Steve Purcell 的配置，可以看到许多的 (require 'xxx)，这个可以理解为 ”导入并执行
;;; 基本类似于 Python 的 import。 也就是导入刚刚说的放置在了 ~/.emacs.d/lisp/ 目录下的某个源码文件，
;;; 并运行了其中的代码使得内部的设置和函数定义生效。
(require 'hello)

(electric-pair-mode t)                       ; 自动补全括号
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号
(column-number-mode t)                       ; 在 Mode line 上显示列号
(global-auto-revert-mode t)                  ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(delete-selection-mode t)                    ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(setq inhibit-startup-message t)             ; 关闭启动 Emacs 时的欢迎界面
(setq make-backup-files nil)                 ; 关闭文件自动备份
(add-hook 'prog-mode-hook #'hs-minor-mode)   ; 编程模式下，可以折叠代码块
(global-display-line-numbers-mode 1)         ; 在 Window 显示行号
(savehist-mode 1)                            ; （可选）打开 Buffer 历史记录保存
(add-to-list 'default-frame-alist '(width . 90))  ; （可选）设定启动图形界面时的初始 Frame 宽度（字符数）
(add-to-list 'default-frame-alist '(height . 55)) ; （可选）设定启动图形界面时的初始 Frame 高度（字符数）

(require 'package)
(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "http://mirrors.ustc.edu.cn/elpa/nongnu/")))
(package-initialize)
(package-refresh-contents)
;;; BOOK MARKS 和电子书中的书签一样，在光标处打点，想要的时候再回来。

;;; 异步处理     async  
;;; 自动校对     auto-correct 
;;; 快速跳转     avy 
;;; blist        Display bookmarks in= an ibutter way
;;; buffer-env   buffer-local process environments
;;; clipboard collector 根据正则表达式规则收集剪贴板条目
;;; comint-mime  Display content of various MIME types in comint buffers
;;; company      Modular text completion framework
;;; eglot        lsp server
;;; ivy           Incremental Vertical completYon 
;;; kiwix         Searching offline Wikipedia through Kiwix
;;; minibuffer-header 
;;; minibuffer-line
;;; map 
;;; mini-map  
;;; mult-shell
;;; org
;;; pyim (输入法)
;;; pyim-basedict
;;; rainbow-mode 彩虹模式
;;; smart-yank 	A different approach of yank pointer handling
;;; undo-tree
;;; dracula-theme

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
;;; evil
     (require 'evil)
     (evil-mode 1)
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;



