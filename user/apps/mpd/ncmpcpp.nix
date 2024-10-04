{config, pkgs, ...}:
{
    programs.ncmpcpp = {
        enable = true;
        package = pkgs.ncmpcpp.override {
            outputsSupport = true;
            visualizerSupport = true;
            clockSupport = true;
            taglibSupport = true;
        };
        mpdMusicDir = "${config.home.homeDirectory}/Drives/hdd/Music";
        settings = {
            visualizer_fps = 60;
            # Playlist
            playlist_disable_highlight_delay = "0";
            playlist_display_mode = "columns";
            playlist_show_remaining_time = "yes";
            show_duplicate_tags = "no";

            browser_display_mode = "columns";
            # fancy_scrolling = "yes";
            follow_now_playing_lyrics = "yes";
            # display_screens_numbers_on_start = "yes";
            ignore_leading_the = "yes";
            # lyrics_database = "1";
            song_columns_list_format = "(10)[blue]{l} (30)[green]{a} (30)[magenta]{b} (50)[yellow]{t}";
            colors_enabled = "yes";
            main_window_color = "white";
            # main_window_highlight_color = "blue";
            header_window_color = "cyan";
            volume_color = "red";
            progressbar_color = "cyan";
            statusbar_color = "white";
            # active_column_color = "cyan";
            active_window_border = "blue";

            alternative_header_first_line_format = "$0$aqqu$/a {$7%a - $9}{$5%t$9}|{$8%f$9} $0$atqq$/a$9";
            alternative_header_second_line_format = "{{$6%b$9}{ [$6%y$9]}}|{%D}";
            song_list_format = "{$3%n │ $9}{$7%a - $9}{$5%t$9}|{$8%f$9}$R{$6 │ %b$9}{$3 │ %l$9}";
            user_interface = "alternative";
            default_place_to_search_in = "database"; # ?

            visualizer_type = "ellipse";
            visualizer_in_stereo = "yes";
            visualizer_look = "●●";

            # Navigation
            cyclic_scrolling = "yes";
            header_text_scrolling = "yes";
            jump_to_now_playing_song_at_start = "yes";
            lines_scrolled = "2";

            # Other
            system_encoding = "utf-8";
            regular_expressions = "extended";
            # Selected tracks
            selected_item_prefix = "* ";
            discard_colors_if_item_is_selected = "no";
            # Seeking
            incremental_seeking = "yes";
            seek_time = "1";
            # Visibility
            header_visibility = "yes";
            statusbar_visibility = "yes";
            titles_visibility = "yes";

            progressbar_look = "◈◆◇";
            progressbar_elapsed_color = "white";

            now_playing_prefix = " ";
            song_status_format = " $2%a $4⟫$3⟫ $8%t $4⟫$3⟫ $5%b ";
            autocenter_mode = "yes";
            centered_cursor = "yes";

            # Misc
            display_bitrate = "yes";
            empty_tag_marker = "";
            mouse_support = "yes";

            locked_screen_width_part = 50;
            ask_for_locked_screen_width_part = "no";
            startup_screen = "playlist";
            # startup_slave_screen = "visualizer";
            # startup_slave_screen_focus = "no";
        };
        bindings = [
            {key = "j"; command = "scroll_down"; }
            {key = "k"; command = "scroll_up"; }
            {key = "h"; command = "previous_column"; }
            {key = "l"; command = "next_column"; }
            {key = "G"; command = "move_end"; }
            {key = "n"; command = "next_found_item"; }
            {key = "N"; command = "previous_found_item"; }
            {key = "ctrl-b"; command = "page_up"; }
            {key = "ctrl-f"; command = "page_down"; }
        ];
    };
}
