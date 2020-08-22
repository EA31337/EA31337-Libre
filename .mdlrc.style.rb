# Start with all built-in rules.
# https://github.com/markdownlint/markdownlint/blob/master/docs/RULES.md
all

# Ignore line length in code blocks.
rule 'MD013', code_blocks: false

# Set a different line length.
rule 'MD013', :line_length => 120

# Don't check line length in tables.
rule 'MD013', :tables => false

# Allow both fenced and indented code blocks.
#rule 'MD046', style: ['fenced', 'indented']
