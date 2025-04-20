# Configuration file for ipython.

c = get_config()  # noqa

c.TerminalIPythonApp.display_banner = False
c.TerminalInteractiveShell.editing_mode = "vi"
c.TerminalInteractiveShell.editor = "nvim"
c.TerminalInteractiveShell.emacs_bindings_in_vi_insert_mode = False
c.TerminalInteractiveShell.extra_open_editor_shortcuts = True
c.TerminalInteractiveShell.highlighting_style = "one-dark"
c.TerminalInteractiveShell.modal_cursor = False
c.TerminalInteractiveShell.mouse_support = True
c.TerminalInteractiveShell.pdb = True
c.TerminalInteractiveShell.prompt_includes_vi_mode = False
c.TerminalInteractiveShell.term_title = False
c.TerminalInteractiveShell.true_color = True
