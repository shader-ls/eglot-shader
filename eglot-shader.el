;;; eglot-shader.el --- Eglot Clients for Shader  -*- lexical-binding: t; -*-

;; Copyright (C) 2023-2025  Shen, Jen-Chieh

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Maintainer: Shen, Jen-Chieh <jcs090218@gmail.com>
;; URL: https://github.com/shader-ls/eglot-shader
;; Version: 0.1.0
;; Package-Requires: ((emacs "26.1") (eglot "1.4"))
;; Keywords: convenience shader

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Eglot Clients for Shader.
;;

;;; Code:

(require 'eglot)

(defgroup eglot-shader nil
  "Settings for the Shader Language Server.

Link: https://github.com/shader-ls/shader-language-server"
  :group 'eglot
  :link '(url-link "https://github.com/shader-ls/eglot-shader"))

(defcustom eglot-shader-active-modes
  '(shader-mode hlsl-mode glsl-mode)
  "List of major mode that work with shader-ls."
  :type 'list
  :group 'eglot-shader)

(defun eglot-shader--server-command ()
  "Generate startup command for Shader language server."
  (list 'eglot-shader-server "shader-ls" "--stdio"))

(add-to-list 'eglot-server-programs
             `(,eglot-shader-active-modes . ,(eglot-shader--server-command)))

(provide 'eglot-shader)
;;; eglot-shader.el ends here
