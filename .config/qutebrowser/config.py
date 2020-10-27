# Fonts
font = "bold 12pt curie"
c.fonts.completion.entry = font
c.fonts.completion.category = font
c.fonts.debug_console = font
c.fonts.downloads = font
c.fonts.hints = font
c.fonts.keyhint = font
c.fonts.messages.error = font
c.fonts.messages.info = font
c.fonts.messages.warning = font
c.fonts.prompts = font
c.fonts.statusbar = font
c.fonts.tabs.selected = font
c.fonts.tabs.unselected = font

#tabs
c.tabs.favicons.show = "never"
c.tabs.padding = {"bottom": 15, "left": 18, "right": 18, "top": 12}
c.tabs.indicator.width = 0
c.tabs.title.format = "{current_title}"

# MPV youtube hints
config.bind('M', 'hint links spawn --detach mpv --force-window yes {hint-url}')

# Pywal theme
config.source('qutewal.py')
