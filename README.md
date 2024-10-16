
# Vim Cheat Sheet

This document provides an extensive collection of Vim commands that aid in navigation, editing, searching, and more. 
These commands are primarily used in Normal Mode, so remember to press 'ESC' before utilizing them.

## Basic Movements
- **h:** Move cursor left.
- **j:** Move cursor down.
- **k:** Move cursor up.
- **l:** Move cursor right.

## Modes
- **Esc:** Normal Mode
- **i:** Insert text before the cursor
- **I:** Insert text at the beginning of the line
- **a:** Append text after the cursor
- **A:** Append text at the end of the line
- **v:** Visual Mode (character-wise)
- **V:** Visual Mode (line-wise)
- **Ctrl+v:** Visual Mode (block-wise)
- **::** Command-line Mode
- **r:** Replace a single character
- **R:** Replace mode (continuous replace)

## Word Movements
- **w:** Move to the start of the next word.
- **b:** Move to the start of the current/previous word.
- **e:** Move to the end of the next word.

## Screen Movements
- **H:** Move to the top of the screen.
- **M:** Move to the middle of the screen.
- **L:** Move to the bottom of the screen.
- **zz:** Center the current line.
- **zt:** Move the current line to the top.

## Paragraph and Block Movements
- **{:** Start of the current paragraph/block.
- **}:** End of the current paragraph/block.

## File Movements
- **gg:** Start of the file.
- **G:** End of the file.
- **:<line_number>:** Go to a specific line.

## Jump Movements
- **gd:** Go to definition.
- **ctrl-o:** Previous location.
- **ctrl-i:** Next location.
- **'m:** Jump to mark 'm'.
- **[g, ]g:** Navigate diagnostics.
- **<F2>:** Rename occurrences.

## Additional
- **Shift 3:** Highlight All Occurrences
- **n:** Navigate highlights.
- **:noh:** Clear highlights.

## Scrolling
- **ctrl-u:** Scroll up (half-screen).
- **ctrl-d:** Scroll down (half-screen).
- **ctrl-b:** Scroll up (full screen).
- **ctrl-f:** Scroll down (full screen).

## Search
- **/<word>:** Search for a word.
- **ge:** Replace word under cursor.

## Editing
- **diw:** Delete current word.
- **yiw:** Copy the current word.
- **u:** Undo.
- **p:** Paste copied by yiw (pastes after the cursor).
- **shift+p:** Paste before the cursor.

## Fold
- **zf:** Fold at current indent level.
- **za:** Toggle current fold.

## Buffers
- **gb:** List buffers.
- **bd:** Delete current buffer.
- **bd!:** Delete current buffer without saving changes.
- **b<buffer_number>:** Go to a specific buffer.

## Session
- **mks!:** Create a session.
- **vim -S:** Load a session.

## File Operations
- **:w:** Save file.
- **:q:** Quit without saving.
- **:q!:** Force quit without saving.
- **:wq:** Save and quit.

## NERDTree
- **<leader>t:** Open NERDTree (C means CTRL).
- **<leader>f:** Open NERDTree and put the cursor on the file that we are in.
- **<leader>r:** Refresh the NERDTree to see new or deleted files
- **<leader>:** A key specified in .vimrc, my leader key is a comma 'space'.

## Fuzzy Finder
- **<leader>ff:** Open Fuzzy finder search
