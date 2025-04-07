# Configuration file for ipython.

# import site
# from os import environ
# from os.path import join
# from sys import version_info
#
# if "VIRTUAL_ENV" in environ:
#     virtual_env = join(
#         environ.get("VIRTUAL_ENV"),
#         "lib",
#         "python%d.%d" % version_info[:2],
#         "site-packages",
#     )
#     site.addsitedir(virtual_env)
#     print("VIRTUAL_ENV ->", virtual_env)
#     del virtual_env
# del site, environ, join, version_info

c = get_config()  # noqa


c.TerminalIPythonApp.display_banner = False


c.InteractiveShell.autoindent = True
c.InteractiveShell.automagic = True


c.InteractiveShell.colors = "Linux"


c.TerminalInteractiveShell.colors = "Linux"


c.TerminalInteractiveShell.editing_mode = "vi"
c.TerminalInteractiveShell.editor = "vi"
c.TerminalInteractiveShell.emacs_bindings_in_vi_insert_mode = False


c.TerminalInteractiveShell.highlight_matching_brackets = True

c.TerminalInteractiveShell.highlighting_style = "one-dark"


c.TerminalInteractiveShell.modal_cursor = False


c.TerminalInteractiveShell.true_color = True


c.MagicsManager.auto_magic = True
