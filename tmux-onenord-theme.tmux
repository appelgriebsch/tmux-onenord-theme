#!/bin/bash
theme_black="#2E3440"
theme_green="#9EC183"
theme_yellow="#EBCB8B"
theme_red="#E06C75"
theme_white="#E5E9F0"
theme_blue="#81A1C1"
theme_visual_grey="#3F4758"
theme_comment_grey="#E5E9F0"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$theme_white"
set "message-bg" "$theme_black"

set "message-command-fg" "$theme_white"
set "message-command-bg" "$theme_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$theme_black"
setw "window-status-bg" "$theme_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$theme_black"
setw "window-status-activity-fg" "$theme_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$theme_comment_grey"
set "window-active-style" "fg=$theme_white"

set "pane-border-fg" "$theme_white"
set "pane-border-bg" "$theme_black"
set "pane-active-border-fg" "$theme_blue"
set "pane-active-border-bg" "$theme_black"

set "display-panes-active-colour" "$theme_yellow"
set "display-panes-colour" "$theme_green"

set "status-bg" "$theme_black"
set "status-fg" "$theme_white"

set "@prefix_highlight_fg" "$theme_black"
set "@prefix_highlight_bg" "$theme_blue"
set "@prefix_highlight_copy_mode_attr" "fg=$theme_black,bg=$theme_blue"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@theme_widgets")
time_format=$(get "@theme_time_format" "%R")
date_format=$(get "@theme_date_format" "%d/%m/%Y")

set "status-right" "#[fg=$theme_white,bg=$theme_black,nounderscore,noitalics]${time_format}  ${date_format} #[fg=$theme_visual_grey,bg=$theme_black]#[fg=$theme_visual_grey,bg=$theme_visual_grey]#[fg=$theme_white, bg=$theme_visual_grey]${status_widgets} #[fg=$theme_blue,bg=$theme_visual_grey,nobold,nounderscore,noitalics]#[fg=$theme_black,bg=$theme_blue,bold] #h #[fg=$theme_yellow, bg=$theme_blue]#[fg=$theme_red,bg=$theme_yellow]"
set "status-left" "#[fg=$theme_black,bg=$theme_blue,bold] #S #{prefix_highlight}#[fg=$theme_blue,bg=$theme_black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$theme_black,bg=$theme_black,nobold,nounderscore,noitalics]#[fg=$theme_white,bg=$theme_black] #I  #W #[fg=$theme_black,bg=$theme_black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$theme_black,bg=$theme_visual_grey,nobold,nounderscore,noitalics]#[fg=$theme_white,bg=$theme_visual_grey,nobold] #I  #W #[fg=$theme_visual_grey,bg=$theme_black,nobold,nounderscore,noitalics]"