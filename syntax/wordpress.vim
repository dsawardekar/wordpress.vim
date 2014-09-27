if exists('b:current_syntax') && b:current_syntax == 'php.wordpress'
  finish
elseif !exists('b:wordpress_buffer')
  finish
elseif exists('g:wordpress_vim_php_syntax_highlight') && !g:wordpress_vim_php_syntax_highlight
  finish
end

" --- Functions --- 

" script-loader.php 
syn keyword wpFunction wp_default_scripts contained
syn keyword wpFunction wp_default_styles contained
syn keyword wpFunction wp_prototype_before_jquery contained
syn keyword wpFunction wp_just_in_time_script_localization contained
syn keyword wpFunction wp_style_loader_src contained
syn keyword wpFunction print_head_scripts contained
syn keyword wpFunction print_footer_scripts contained
syn keyword wpFunction wp_print_head_scripts contained
syn keyword wpFunction wp_print_footer_scripts contained
syn keyword wpFunction wp_enqueue_scripts contained
syn keyword wpFunction print_admin_styles contained
syn keyword wpFunction print_late_styles contained
syn keyword wpFunction script_concat_settings contained

" post-formats.php 
syn keyword wpFunction get_post_format contained
syn keyword wpFunction has_post_format contained
syn keyword wpFunction set_post_format contained
syn keyword wpFunction get_post_format_strings contained
syn keyword wpFunction get_post_format_slugs contained
syn keyword wpFunction get_post_format_string contained
syn keyword wpFunction get_post_format_link contained

" http.php 
syn keyword wpFunction wp_safe_remote_request contained
syn keyword wpFunction wp_safe_remote_get contained
syn keyword wpFunction wp_safe_remote_post contained
syn keyword wpFunction wp_safe_remote_head contained
syn keyword wpFunction wp_remote_request contained
syn keyword wpFunction wp_remote_get contained
syn keyword wpFunction wp_remote_post contained
syn keyword wpFunction wp_remote_head contained
syn keyword wpFunction wp_remote_retrieve_headers contained
syn keyword wpFunction wp_remote_retrieve_header contained
syn keyword wpFunction wp_remote_retrieve_response_code contained
syn keyword wpFunction wp_remote_retrieve_response_message contained
syn keyword wpFunction wp_remote_retrieve_body contained
syn keyword wpFunction wp_http_supports contained
syn keyword wpFunction get_http_origin contained
syn keyword wpFunction get_allowed_http_origins contained
syn keyword wpFunction is_allowed_http_origin contained
syn keyword wpFunction send_origin_headers contained
syn keyword wpFunction wp_http_validate_url contained
syn keyword wpFunction allowed_http_request_hosts contained
syn keyword wpFunction ms_allowed_http_request_hosts contained

" cron.php 
syn keyword wpFunction wp_schedule_single_event contained
syn keyword wpFunction wp_schedule_event contained
syn keyword wpFunction wp_reschedule_event contained
syn keyword wpFunction wp_unschedule_event contained
syn keyword wpFunction wp_clear_scheduled_hook contained
syn keyword wpFunction wp_next_scheduled contained
syn keyword wpFunction spawn_cron contained
syn keyword wpFunction wp_cron contained
syn keyword wpFunction wp_get_schedules contained
syn keyword wpFunction wp_get_schedule contained

" rewrite.php 
syn keyword wpFunction add_rewrite_rule contained
syn keyword wpFunction add_rewrite_tag contained
syn keyword wpFunction add_permastruct contained
syn keyword wpFunction add_feed contained
syn keyword wpFunction flush_rewrite_rules contained
syn keyword wpFunction add_rewrite_endpoint contained
syn keyword wpFunction url_to_postid contained

" ms-blogs.php 
syn keyword wpFunction wpmu_update_blogs_date contained
syn keyword wpFunction get_blogaddress_by_id contained
syn keyword wpFunction get_blogaddress_by_name contained
syn keyword wpFunction get_id_from_blogname contained
syn keyword wpFunction get_blog_details contained
syn keyword wpFunction refresh_blog_details contained
syn keyword wpFunction update_blog_details contained
syn keyword wpFunction clean_blog_cache contained
syn keyword wpFunction get_blog_option contained
syn keyword wpFunction add_blog_option contained
syn keyword wpFunction delete_blog_option contained
syn keyword wpFunction update_blog_option contained
syn keyword wpFunction switch_to_blog contained
syn keyword wpFunction restore_current_blog contained
syn keyword wpFunction ms_is_switched contained
syn keyword wpFunction is_archived contained
syn keyword wpFunction update_archived contained
syn keyword wpFunction update_blog_status contained
syn keyword wpFunction get_blog_status contained
syn keyword wpFunction get_last_updated contained

" taxonomy.php 
syn keyword wpFunction create_initial_taxonomies contained
syn keyword wpFunction get_taxonomies contained
syn keyword wpFunction get_object_taxonomies contained
syn keyword wpFunction get_taxonomy contained
syn keyword wpFunction taxonomy_exists contained
syn keyword wpFunction is_taxonomy_hierarchical contained
syn keyword wpFunction register_taxonomy contained
syn keyword wpFunction get_taxonomy_labels contained
syn keyword wpFunction register_taxonomy_for_object_type contained
syn keyword wpFunction unregister_taxonomy_for_object_type contained
syn keyword wpFunction get_objects_in_term contained
syn keyword wpFunction get_tax_sql contained
syn keyword wpFunction get_term contained
syn keyword wpFunction get_term_by contained
syn keyword wpFunction get_term_children contained
syn keyword wpFunction get_term_field contained
syn keyword wpFunction get_term_to_edit contained
syn keyword wpFunction get_terms contained
syn keyword wpFunction term_exists contained
syn keyword wpFunction term_is_ancestor_of contained
syn keyword wpFunction sanitize_term contained
syn keyword wpFunction sanitize_term_field contained
syn keyword wpFunction wp_count_terms contained
syn keyword wpFunction wp_delete_object_term_relationships contained
syn keyword wpFunction wp_delete_term contained
syn keyword wpFunction wp_delete_category contained
syn keyword wpFunction wp_get_object_terms contained
syn keyword wpFunction wp_insert_term contained
syn keyword wpFunction wp_set_object_terms contained
syn keyword wpFunction wp_add_object_terms contained
syn keyword wpFunction wp_remove_object_terms contained
syn keyword wpFunction wp_unique_term_slug contained
syn keyword wpFunction wp_update_term contained
syn keyword wpFunction wp_defer_term_counting contained
syn keyword wpFunction wp_update_term_count contained
syn keyword wpFunction wp_update_term_count_now contained
syn keyword wpFunction clean_object_term_cache contained
syn keyword wpFunction clean_term_cache contained
syn keyword wpFunction get_object_term_cache contained
syn keyword wpFunction update_object_term_cache contained
syn keyword wpFunction update_term_cache contained
syn keyword wpFunction get_term_link contained
syn keyword wpFunction the_taxonomies contained
syn keyword wpFunction get_the_taxonomies contained
syn keyword wpFunction get_post_taxonomies contained
syn keyword wpFunction is_object_in_term contained
syn keyword wpFunction is_object_in_taxonomy contained
syn keyword wpFunction get_ancestors contained
syn keyword wpFunction wp_get_term_taxonomy_parent_id contained
syn keyword wpFunction wp_check_term_hierarchy_for_loops contained

" query.php 
syn keyword wpFunction get_query_var contained
syn keyword wpFunction get_queried_object contained
syn keyword wpFunction get_queried_object_id contained
syn keyword wpFunction set_query_var contained
syn keyword wpFunction query_posts contained
syn keyword wpFunction wp_reset_query contained
syn keyword wpFunction wp_reset_postdata contained
syn keyword wpFunction is_archive contained
syn keyword wpFunction is_post_type_archive contained
syn keyword wpFunction is_attachment contained
syn keyword wpFunction is_author contained
syn keyword wpFunction is_category contained
syn keyword wpFunction is_tag contained
syn keyword wpFunction is_tax contained
syn keyword wpFunction is_comments_popup contained
syn keyword wpFunction is_date contained
syn keyword wpFunction is_day contained
syn keyword wpFunction is_feed contained
syn keyword wpFunction is_comment_feed contained
syn keyword wpFunction is_front_page contained
syn keyword wpFunction is_home contained
syn keyword wpFunction is_month contained
syn keyword wpFunction is_page contained
syn keyword wpFunction is_paged contained
syn keyword wpFunction is_preview contained
syn keyword wpFunction is_robots contained
syn keyword wpFunction is_search contained
syn keyword wpFunction is_single contained
syn keyword wpFunction is_singular contained
syn keyword wpFunction is_time contained
syn keyword wpFunction is_trackback contained
syn keyword wpFunction is_year contained
syn keyword wpFunction is_404 contained
syn keyword wpFunction is_main_query contained
syn keyword wpFunction have_posts contained
syn keyword wpFunction in_the_loop contained
syn keyword wpFunction rewind_posts contained
syn keyword wpFunction the_post contained
syn keyword wpFunction have_comments contained
syn keyword wpFunction the_comment contained
syn keyword wpFunction wp_old_slug_redirect contained
syn keyword wpFunction setup_postdata contained

" functions.wp-scripts.php 
syn keyword wpFunction wp_print_scripts contained
syn keyword wpFunction wp_register_script contained
syn keyword wpFunction wp_localize_script contained
syn keyword wpFunction wp_deregister_script contained
syn keyword wpFunction wp_enqueue_script contained
syn keyword wpFunction wp_dequeue_script contained
syn keyword wpFunction wp_script_is contained

" media.php 
syn keyword wpFunction image_constrain_size_for_editor contained
syn keyword wpFunction image_hwstring contained
syn keyword wpFunction image_downsize contained
syn keyword wpFunction add_image_size contained
syn keyword wpFunction has_image_size contained
syn keyword wpFunction remove_image_size contained
syn keyword wpFunction set_post_thumbnail_size contained
syn keyword wpFunction get_image_tag contained
syn keyword wpFunction wp_constrain_dimensions contained
syn keyword wpFunction image_resize_dimensions contained
syn keyword wpFunction image_make_intermediate_size contained
syn keyword wpFunction image_get_intermediate_size contained
syn keyword wpFunction get_intermediate_image_sizes contained
syn keyword wpFunction wp_get_attachment_image_src contained
syn keyword wpFunction wp_get_attachment_image contained
syn keyword wpFunction img_caption_shortcode contained
syn keyword wpFunction gallery_shortcode contained
syn keyword wpFunction wp_underscore_playlist_templates contained
syn keyword wpFunction wp_playlist_scripts contained
syn keyword wpFunction wp_playlist_shortcode contained
syn keyword wpFunction wp_mediaelement_fallback contained
syn keyword wpFunction wp_get_audio_extensions contained
syn keyword wpFunction wp_get_attachment_id3_keys contained
syn keyword wpFunction wp_audio_shortcode contained
syn keyword wpFunction wp_get_video_extensions contained
syn keyword wpFunction wp_video_shortcode contained
syn keyword wpFunction previous_image_link contained
syn keyword wpFunction next_image_link contained
syn keyword wpFunction adjacent_image_link contained
syn keyword wpFunction get_attachment_taxonomies contained
syn keyword wpFunction get_taxonomies_for_attachments contained
syn keyword wpFunction wp_imagecreatetruecolor contained
syn keyword wpFunction wp_embed_register_handler contained
syn keyword wpFunction wp_embed_unregister_handler contained
syn keyword wpFunction wp_embed_defaults contained
syn keyword wpFunction wp_expand_dimensions contained
syn keyword wpFunction wp_oembed_get contained
syn keyword wpFunction wp_oembed_add_provider contained
syn keyword wpFunction wp_oembed_remove_provider contained
syn keyword wpFunction wp_maybe_load_embeds contained
syn keyword wpFunction wp_embed_handler_googlevideo contained
syn keyword wpFunction wp_embed_handler_youtube contained
syn keyword wpFunction wp_embed_handler_audio contained
syn keyword wpFunction wp_embed_handler_video contained
syn keyword wpFunction wp_convert_hr_to_bytes contained
syn keyword wpFunction wp_max_upload_size contained
syn keyword wpFunction wp_get_image_editor contained
syn keyword wpFunction wp_image_editor_supports contained
syn keyword wpFunction wp_plupload_default_settings contained
syn keyword wpFunction wp_prepare_attachment_for_js contained
syn keyword wpFunction wp_enqueue_media contained
syn keyword wpFunction get_attached_media contained
syn keyword wpFunction get_media_embedded_in_content contained
syn keyword wpFunction get_post_galleries contained
syn keyword wpFunction get_post_gallery contained
syn keyword wpFunction get_post_galleries_images contained
syn keyword wpFunction get_post_gallery_images contained
syn keyword wpFunction wp_maybe_generate_attachment_metadata contained
syn keyword wpFunction attachment_url_to_postid contained
syn keyword wpFunction wpview_media_sandbox_styles contained

" formatting.php 
syn keyword wpFunction wptexturize contained
syn keyword wpFunction wpautop contained
syn keyword wpFunction shortcode_unautop contained
syn keyword wpFunction seems_utf8 contained
syn keyword wpFunction wp_specialchars_decode contained
syn keyword wpFunction wp_check_invalid_utf8 contained
syn keyword wpFunction utf8_uri_encode contained
syn keyword wpFunction remove_accents contained
syn keyword wpFunction sanitize_file_name contained
syn keyword wpFunction sanitize_user contained
syn keyword wpFunction sanitize_key contained
syn keyword wpFunction sanitize_title contained
syn keyword wpFunction sanitize_title_for_query contained
syn keyword wpFunction sanitize_title_with_dashes contained
syn keyword wpFunction sanitize_sql_orderby contained
syn keyword wpFunction sanitize_html_class contained
syn keyword wpFunction convert_chars contained
syn keyword wpFunction balanceTags contained
syn keyword wpFunction format_to_edit contained
syn keyword wpFunction zeroise contained
syn keyword wpFunction backslashit contained
syn keyword wpFunction trailingslashit contained
syn keyword wpFunction untrailingslashit contained
syn keyword wpFunction addslashes_gpc contained
syn keyword wpFunction stripslashes_deep contained
syn keyword wpFunction urlencode_deep contained
syn keyword wpFunction rawurlencode_deep contained
syn keyword wpFunction antispambot contained
syn keyword wpFunction make_clickable contained
syn keyword wpFunction wp_rel_nofollow contained
syn keyword wpFunction wp_rel_nofollow_callback contained
syn keyword wpFunction translate_smiley contained
syn keyword wpFunction convert_smilies contained
syn keyword wpFunction is_email contained
syn keyword wpFunction wp_iso_descrambler contained
syn keyword wpFunction get_gmt_from_date contained
syn keyword wpFunction get_date_from_gmt contained
syn keyword wpFunction iso8601_timezone_to_offset contained
syn keyword wpFunction iso8601_to_datetime contained
syn keyword wpFunction popuplinks contained
syn keyword wpFunction sanitize_email contained
syn keyword wpFunction human_time_diff contained
syn keyword wpFunction wp_trim_excerpt contained
syn keyword wpFunction wp_trim_words contained
syn keyword wpFunction ent2ncr contained
syn keyword wpFunction wp_richedit_pre contained
syn keyword wpFunction wp_htmledit_pre contained
syn keyword wpFunction esc_sql contained
syn keyword wpFunction esc_url contained
syn keyword wpFunction esc_url_raw contained
syn keyword wpFunction htmlentities2 contained
syn keyword wpFunction esc_js contained
syn keyword wpFunction esc_html contained
syn keyword wpFunction esc_attr contained
syn keyword wpFunction esc_textarea contained
syn keyword wpFunction tag_escape contained
syn keyword wpFunction wp_make_link_relative contained
syn keyword wpFunction sanitize_option contained
syn keyword wpFunction wp_parse_str contained
syn keyword wpFunction wp_pre_kses_less_than contained
syn keyword wpFunction wp_pre_kses_less_than_callback contained
syn keyword wpFunction wp_sprintf contained
syn keyword wpFunction wp_sprintf_l contained
syn keyword wpFunction wp_html_excerpt contained
syn keyword wpFunction links_add_base_url contained
syn keyword wpFunction links_add_target contained
syn keyword wpFunction normalize_whitespace contained
syn keyword wpFunction wp_strip_all_tags contained
syn keyword wpFunction sanitize_text_field contained
syn keyword wpFunction wp_basename contained
syn keyword wpFunction capital_P_dangit contained
syn keyword wpFunction sanitize_mime_type contained
syn keyword wpFunction sanitize_trackback_urls contained
syn keyword wpFunction wp_slash contained
syn keyword wpFunction wp_unslash contained
syn keyword wpFunction get_url_in_content contained
syn keyword wpFunction wp_spaces_regexp contained

" admin-bar.php 
syn keyword wpFunction wp_admin_bar_render contained
syn keyword wpFunction wp_admin_bar_wp_menu contained
syn keyword wpFunction wp_admin_bar_sidebar_toggle contained
syn keyword wpFunction wp_admin_bar_my_account_item contained
syn keyword wpFunction wp_admin_bar_my_account_menu contained
syn keyword wpFunction wp_admin_bar_site_menu contained
syn keyword wpFunction wp_admin_bar_my_sites_menu contained
syn keyword wpFunction wp_admin_bar_shortlink_menu contained
syn keyword wpFunction wp_admin_bar_edit_menu contained
syn keyword wpFunction wp_admin_bar_new_content_menu contained
syn keyword wpFunction wp_admin_bar_comments_menu contained
syn keyword wpFunction wp_admin_bar_appearance_menu contained
syn keyword wpFunction wp_admin_bar_updates_menu contained
syn keyword wpFunction wp_admin_bar_search_menu contained
syn keyword wpFunction wp_admin_bar_add_secondary_groups contained
syn keyword wpFunction wp_admin_bar_header contained
syn keyword wpFunction show_admin_bar contained
syn keyword wpFunction is_admin_bar_showing contained

" post-template.php 
syn keyword wpFunction the_ID contained
syn keyword wpFunction get_the_ID contained
syn keyword wpFunction the_title contained
syn keyword wpFunction the_title_attribute contained
syn keyword wpFunction get_the_title contained
syn keyword wpFunction the_guid contained
syn keyword wpFunction get_the_guid contained
syn keyword wpFunction the_content contained
syn keyword wpFunction get_the_content contained
syn keyword wpFunction the_excerpt contained
syn keyword wpFunction get_the_excerpt contained
syn keyword wpFunction has_excerpt contained
syn keyword wpFunction post_class contained
syn keyword wpFunction get_post_class contained
syn keyword wpFunction body_class contained
syn keyword wpFunction get_body_class contained
syn keyword wpFunction post_password_required contained
syn keyword wpFunction wp_link_pages contained
syn keyword wpFunction post_custom contained
syn keyword wpFunction wp_dropdown_pages contained
syn keyword wpFunction wp_list_pages contained
syn keyword wpFunction wp_page_menu contained
syn keyword wpFunction walk_page_tree contained
syn keyword wpFunction walk_page_dropdown_tree contained
syn keyword wpFunction the_attachment_link contained
syn keyword wpFunction wp_get_attachment_link contained
syn keyword wpFunction prepend_attachment contained
syn keyword wpFunction get_the_password_form contained
syn keyword wpFunction is_page_template contained
syn keyword wpFunction get_page_template_slug contained
syn keyword wpFunction wp_post_revision_title contained
syn keyword wpFunction wp_post_revision_title_expanded contained
syn keyword wpFunction wp_list_post_revisions contained

" comment-template.php 
syn keyword wpFunction get_comment_author contained
syn keyword wpFunction comment_author contained
syn keyword wpFunction get_comment_author_email contained
syn keyword wpFunction comment_author_email contained
syn keyword wpFunction comment_author_email_link contained
syn keyword wpFunction get_comment_author_email_link contained
syn keyword wpFunction get_comment_author_link contained
syn keyword wpFunction comment_author_link contained
syn keyword wpFunction get_comment_author_IP contained
syn keyword wpFunction comment_author_IP contained
syn keyword wpFunction get_comment_author_url contained
syn keyword wpFunction comment_author_url contained
syn keyword wpFunction get_comment_author_url_link contained
syn keyword wpFunction comment_author_url_link contained
syn keyword wpFunction comment_class contained
syn keyword wpFunction get_comment_class contained
syn keyword wpFunction get_comment_date contained
syn keyword wpFunction comment_date contained
syn keyword wpFunction get_comment_excerpt contained
syn keyword wpFunction comment_excerpt contained
syn keyword wpFunction get_comment_ID contained
syn keyword wpFunction comment_ID contained
syn keyword wpFunction get_comment_link contained
syn keyword wpFunction get_comments_link contained
syn keyword wpFunction comments_link contained
syn keyword wpFunction get_comments_number contained
syn keyword wpFunction comments_number contained
syn keyword wpFunction get_comments_number_text contained
syn keyword wpFunction get_comment_text contained
syn keyword wpFunction comment_text contained
syn keyword wpFunction get_comment_time contained
syn keyword wpFunction comment_time contained
syn keyword wpFunction get_comment_type contained
syn keyword wpFunction comment_type contained
syn keyword wpFunction get_trackback_url contained
syn keyword wpFunction trackback_url contained
syn keyword wpFunction trackback_rdf contained
syn keyword wpFunction comments_open contained
syn keyword wpFunction pings_open contained
syn keyword wpFunction wp_comment_form_unfiltered_html_nonce contained
syn keyword wpFunction comments_template contained
syn keyword wpFunction comments_popup_script contained
syn keyword wpFunction comments_popup_link contained
syn keyword wpFunction get_comment_reply_link contained
syn keyword wpFunction comment_reply_link contained
syn keyword wpFunction get_post_reply_link contained
syn keyword wpFunction post_reply_link contained
syn keyword wpFunction get_cancel_comment_reply_link contained
syn keyword wpFunction cancel_comment_reply_link contained
syn keyword wpFunction get_comment_id_fields contained
syn keyword wpFunction comment_id_fields contained
syn keyword wpFunction comment_form_title contained
syn keyword wpFunction wp_list_comments contained
syn keyword wpFunction comment_form contained

" general-template.php 
syn keyword wpFunction get_header contained
syn keyword wpFunction get_footer contained
syn keyword wpFunction get_sidebar contained
syn keyword wpFunction get_template_part contained
syn keyword wpFunction get_search_form contained
syn keyword wpFunction wp_loginout contained
syn keyword wpFunction wp_logout_url contained
syn keyword wpFunction wp_login_url contained
syn keyword wpFunction wp_registration_url contained
syn keyword wpFunction wp_login_form contained
syn keyword wpFunction wp_lostpassword_url contained
syn keyword wpFunction wp_register contained
syn keyword wpFunction wp_meta contained
syn keyword wpFunction bloginfo contained
syn keyword wpFunction get_bloginfo contained
syn keyword wpFunction wp_title contained
syn keyword wpFunction single_post_title contained
syn keyword wpFunction post_type_archive_title contained
syn keyword wpFunction single_cat_title contained
syn keyword wpFunction single_tag_title contained
syn keyword wpFunction single_term_title contained
syn keyword wpFunction single_month_title contained
syn keyword wpFunction get_archives_link contained
syn keyword wpFunction wp_get_archives contained
syn keyword wpFunction calendar_week_mod contained
syn keyword wpFunction get_calendar contained
syn keyword wpFunction delete_get_calendar_cache contained
syn keyword wpFunction allowed_tags contained
syn keyword wpFunction the_date_xml contained
syn keyword wpFunction the_date contained
syn keyword wpFunction get_the_date contained
syn keyword wpFunction the_modified_date contained
syn keyword wpFunction get_the_modified_date contained
syn keyword wpFunction the_time contained
syn keyword wpFunction get_the_time contained
syn keyword wpFunction get_post_time contained
syn keyword wpFunction the_modified_time contained
syn keyword wpFunction get_the_modified_time contained
syn keyword wpFunction get_post_modified_time contained
syn keyword wpFunction the_weekday contained
syn keyword wpFunction the_weekday_date contained
syn keyword wpFunction wp_head contained
syn keyword wpFunction wp_footer contained
syn keyword wpFunction feed_links contained
syn keyword wpFunction feed_links_extra contained
syn keyword wpFunction rsd_link contained
syn keyword wpFunction wlwmanifest_link contained
syn keyword wpFunction noindex contained
syn keyword wpFunction wp_no_robots contained
syn keyword wpFunction user_can_richedit contained
syn keyword wpFunction wp_default_editor contained
syn keyword wpFunction wp_editor contained
syn keyword wpFunction get_search_query contained
syn keyword wpFunction the_search_query contained
syn keyword wpFunction language_attributes contained
syn keyword wpFunction paginate_links contained
syn keyword wpFunction wp_admin_css_color contained
syn keyword wpFunction register_admin_color_schemes contained
syn keyword wpFunction wp_admin_css_uri contained
syn keyword wpFunction wp_admin_css contained
syn keyword wpFunction add_thickbox contained
syn keyword wpFunction wp_generator contained
syn keyword wpFunction the_generator contained
syn keyword wpFunction get_the_generator contained
syn keyword wpFunction checked contained
syn keyword wpFunction selected contained
syn keyword wpFunction disabled contained
syn keyword wpFunction wp_heartbeat_settings contained

" template.php 
syn keyword wpFunction get_query_template contained
syn keyword wpFunction get_index_template contained
syn keyword wpFunction get_404_template contained
syn keyword wpFunction get_archive_template contained
syn keyword wpFunction get_post_type_archive_template contained
syn keyword wpFunction get_author_template contained
syn keyword wpFunction get_category_template contained
syn keyword wpFunction get_tag_template contained
syn keyword wpFunction get_taxonomy_template contained
syn keyword wpFunction get_date_template contained
syn keyword wpFunction get_home_template contained
syn keyword wpFunction get_front_page_template contained
syn keyword wpFunction get_page_template contained
syn keyword wpFunction get_paged_template contained
syn keyword wpFunction get_search_template contained
syn keyword wpFunction get_single_template contained
syn keyword wpFunction get_attachment_template contained
syn keyword wpFunction get_comments_popup_template contained
syn keyword wpFunction locate_template contained
syn keyword wpFunction load_template contained

" comment.php 
syn keyword wpFunction check_comment contained
syn keyword wpFunction get_approved_comments contained
syn keyword wpFunction get_comment contained
syn keyword wpFunction get_comments contained
syn keyword wpFunction get_comment_statuses contained
syn keyword wpFunction get_lastcommentmodified contained
syn keyword wpFunction get_comment_count contained
syn keyword wpFunction add_comment_meta contained
syn keyword wpFunction delete_comment_meta contained
syn keyword wpFunction get_comment_meta contained
syn keyword wpFunction update_comment_meta contained
syn keyword wpFunction wp_set_comment_cookies contained
syn keyword wpFunction sanitize_comment_cookies contained
syn keyword wpFunction wp_allow_comment contained
syn keyword wpFunction check_comment_flood_db contained
syn keyword wpFunction separate_comments contained
syn keyword wpFunction get_comment_pages_count contained
syn keyword wpFunction get_page_of_comment contained
syn keyword wpFunction wp_blacklist_check contained
syn keyword wpFunction wp_count_comments contained
syn keyword wpFunction wp_delete_comment contained
syn keyword wpFunction wp_trash_comment contained
syn keyword wpFunction wp_untrash_comment contained
syn keyword wpFunction wp_spam_comment contained
syn keyword wpFunction wp_unspam_comment contained
syn keyword wpFunction wp_get_comment_status contained
syn keyword wpFunction wp_transition_comment_status contained
syn keyword wpFunction wp_get_current_commenter contained
syn keyword wpFunction wp_insert_comment contained
syn keyword wpFunction wp_filter_comment contained
syn keyword wpFunction wp_throttle_comment_flood contained
syn keyword wpFunction wp_new_comment contained
syn keyword wpFunction wp_set_comment_status contained
syn keyword wpFunction wp_update_comment contained
syn keyword wpFunction wp_defer_comment_counting contained
syn keyword wpFunction wp_update_comment_count contained
syn keyword wpFunction wp_update_comment_count_now contained
syn keyword wpFunction discover_pingback_server_uri contained
syn keyword wpFunction do_all_pings contained
syn keyword wpFunction do_trackbacks contained
syn keyword wpFunction generic_ping contained
syn keyword wpFunction pingback contained
syn keyword wpFunction privacy_ping_filter contained
syn keyword wpFunction trackback contained
syn keyword wpFunction weblog_ping contained
syn keyword wpFunction pingback_ping_source_uri contained
syn keyword wpFunction xmlrpc_pingback_error contained
syn keyword wpFunction clean_comment_cache contained
syn keyword wpFunction update_comment_cache contained

" media-template.php 
syn keyword wpFunction wp_underscore_audio_template contained
syn keyword wpFunction wp_underscore_video_template contained
syn keyword wpFunction wp_print_media_templates contained

" post.php 
syn keyword wpFunction create_initial_post_types contained
syn keyword wpFunction get_attached_file contained
syn keyword wpFunction update_attached_file contained
syn keyword wpFunction get_extended contained
syn keyword wpFunction get_post contained
syn keyword wpFunction get_post_ancestors contained
syn keyword wpFunction get_post_field contained
syn keyword wpFunction get_post_mime_type contained
syn keyword wpFunction get_post_status contained
syn keyword wpFunction get_post_statuses contained
syn keyword wpFunction get_page_statuses contained
syn keyword wpFunction register_post_status contained
syn keyword wpFunction get_post_status_object contained
syn keyword wpFunction get_post_stati contained
syn keyword wpFunction is_post_type_hierarchical contained
syn keyword wpFunction post_type_exists contained
syn keyword wpFunction get_post_type contained
syn keyword wpFunction get_post_type_object contained
syn keyword wpFunction get_post_types contained
syn keyword wpFunction register_post_type contained
syn keyword wpFunction get_post_type_capabilities contained
syn keyword wpFunction get_post_type_labels contained
syn keyword wpFunction add_post_type_support contained
syn keyword wpFunction remove_post_type_support contained
syn keyword wpFunction get_all_post_type_supports contained
syn keyword wpFunction post_type_supports contained
syn keyword wpFunction set_post_type contained
syn keyword wpFunction get_posts contained
syn keyword wpFunction add_post_meta contained
syn keyword wpFunction delete_post_meta contained
syn keyword wpFunction get_post_meta contained
syn keyword wpFunction update_post_meta contained
syn keyword wpFunction delete_post_meta_by_key contained
syn keyword wpFunction get_post_custom contained
syn keyword wpFunction get_post_custom_keys contained
syn keyword wpFunction get_post_custom_values contained
syn keyword wpFunction is_sticky contained
syn keyword wpFunction sanitize_post contained
syn keyword wpFunction sanitize_post_field contained
syn keyword wpFunction stick_post contained
syn keyword wpFunction unstick_post contained
syn keyword wpFunction wp_count_posts contained
syn keyword wpFunction wp_count_attachments contained
syn keyword wpFunction get_post_mime_types contained
syn keyword wpFunction wp_match_mime_types contained
syn keyword wpFunction wp_post_mime_type_where contained
syn keyword wpFunction wp_delete_post contained
syn keyword wpFunction wp_trash_post contained
syn keyword wpFunction wp_untrash_post contained
syn keyword wpFunction wp_trash_post_comments contained
syn keyword wpFunction wp_untrash_post_comments contained
syn keyword wpFunction wp_get_post_categories contained
syn keyword wpFunction wp_get_post_tags contained
syn keyword wpFunction wp_get_post_terms contained
syn keyword wpFunction wp_get_recent_posts contained
syn keyword wpFunction wp_insert_post contained
syn keyword wpFunction wp_update_post contained
syn keyword wpFunction wp_publish_post contained
syn keyword wpFunction check_and_publish_future_post contained
syn keyword wpFunction wp_unique_post_slug contained
syn keyword wpFunction wp_add_post_tags contained
syn keyword wpFunction wp_set_post_tags contained
syn keyword wpFunction wp_set_post_terms contained
syn keyword wpFunction wp_set_post_categories contained
syn keyword wpFunction wp_transition_post_status contained
syn keyword wpFunction add_ping contained
syn keyword wpFunction get_enclosed contained
syn keyword wpFunction get_pung contained
syn keyword wpFunction get_to_ping contained
syn keyword wpFunction trackback_url_list contained
syn keyword wpFunction get_all_page_ids contained
syn keyword wpFunction get_page_by_path contained
syn keyword wpFunction get_page_by_title contained
syn keyword wpFunction get_page_children contained
syn keyword wpFunction get_page_hierarchy contained
syn keyword wpFunction get_page_uri contained
syn keyword wpFunction get_pages contained
syn keyword wpFunction is_local_attachment contained
syn keyword wpFunction wp_insert_attachment contained
syn keyword wpFunction wp_delete_attachment contained
syn keyword wpFunction wp_get_attachment_metadata contained
syn keyword wpFunction wp_update_attachment_metadata contained
syn keyword wpFunction wp_get_attachment_url contained
syn keyword wpFunction wp_get_attachment_thumb_file contained
syn keyword wpFunction wp_get_attachment_thumb_url contained
syn keyword wpFunction wp_attachment_is_image contained
syn keyword wpFunction wp_mime_type_icon contained
syn keyword wpFunction wp_check_for_changed_slugs contained
syn keyword wpFunction get_private_posts_cap_sql contained
syn keyword wpFunction get_posts_by_author_sql contained
syn keyword wpFunction get_lastpostdate contained
syn keyword wpFunction get_lastpostmodified contained
syn keyword wpFunction update_post_cache contained
syn keyword wpFunction clean_post_cache contained
syn keyword wpFunction update_post_caches contained
syn keyword wpFunction update_postmeta_cache contained
syn keyword wpFunction clean_attachment_cache contained
syn keyword wpFunction wp_get_post_parent_id contained
syn keyword wpFunction wp_check_post_hierarchy_for_loops contained
syn keyword wpFunction set_post_thumbnail contained
syn keyword wpFunction delete_post_thumbnail contained
syn keyword wpFunction wp_delete_auto_drafts contained

" author-template.php 
syn keyword wpFunction get_the_author contained
syn keyword wpFunction the_author contained
syn keyword wpFunction get_the_modified_author contained
syn keyword wpFunction the_modified_author contained
syn keyword wpFunction get_the_author_meta contained
syn keyword wpFunction the_author_meta contained
syn keyword wpFunction get_the_author_link contained
syn keyword wpFunction the_author_link contained
syn keyword wpFunction get_the_author_posts contained
syn keyword wpFunction the_author_posts contained
syn keyword wpFunction the_author_posts_link contained
syn keyword wpFunction get_author_posts_url contained
syn keyword wpFunction wp_list_authors contained
syn keyword wpFunction is_multi_author contained

" category.php 
syn keyword wpFunction get_categories contained
syn keyword wpFunction get_category contained
syn keyword wpFunction get_category_by_path contained
syn keyword wpFunction get_category_by_slug contained
syn keyword wpFunction get_cat_ID contained
syn keyword wpFunction get_cat_name contained
syn keyword wpFunction cat_is_ancestor_of contained
syn keyword wpFunction sanitize_category contained
syn keyword wpFunction sanitize_category_field contained
syn keyword wpFunction get_tags contained
syn keyword wpFunction get_tag contained
syn keyword wpFunction clean_category_cache contained

" l10n.php 
syn keyword wpFunction get_locale contained
syn keyword wpFunction translate contained
syn keyword wpFunction before_last_bar contained
syn keyword wpFunction translate_with_gettext_context contained
syn keyword wpFunction esc_attr__ contained
syn keyword wpFunction esc_html__ contained
syn keyword wpFunction esc_attr_e contained
syn keyword wpFunction esc_html_e contained
syn keyword wpFunction esc_attr_x contained
syn keyword wpFunction esc_html_x contained
syn keyword wpFunction translate_nooped_plural contained
syn keyword wpFunction load_textdomain contained
syn keyword wpFunction unload_textdomain contained
syn keyword wpFunction load_default_textdomain contained
syn keyword wpFunction load_plugin_textdomain contained
syn keyword wpFunction load_muplugin_textdomain contained
syn keyword wpFunction load_theme_textdomain contained
syn keyword wpFunction load_child_theme_textdomain contained
syn keyword wpFunction get_translations_for_domain contained
syn keyword wpFunction is_textdomain_loaded contained
syn keyword wpFunction translate_user_role contained
syn keyword wpFunction get_available_languages contained
syn keyword wpFunction wp_get_installed_translations contained
syn keyword wpFunction wp_get_pomo_file_data contained
syn keyword wpFunction wp_dropdown_languages contained

" link-template.php 
syn keyword wpFunction the_permalink contained
syn keyword wpFunction user_trailingslashit contained
syn keyword wpFunction permalink_anchor contained
syn keyword wpFunction get_the_permalink contained
syn keyword wpFunction get_permalink contained
syn keyword wpFunction get_post_permalink contained
syn keyword wpFunction post_permalink contained
syn keyword wpFunction get_page_link contained
syn keyword wpFunction get_attachment_link contained
syn keyword wpFunction get_year_link contained
syn keyword wpFunction get_month_link contained
syn keyword wpFunction get_day_link contained
syn keyword wpFunction the_feed_link contained
syn keyword wpFunction get_feed_link contained
syn keyword wpFunction get_post_comments_feed_link contained
syn keyword wpFunction post_comments_feed_link contained
syn keyword wpFunction get_author_feed_link contained
syn keyword wpFunction get_category_feed_link contained
syn keyword wpFunction get_term_feed_link contained
syn keyword wpFunction get_tag_feed_link contained
syn keyword wpFunction get_edit_tag_link contained
syn keyword wpFunction edit_tag_link contained
syn keyword wpFunction get_edit_term_link contained
syn keyword wpFunction edit_term_link contained
syn keyword wpFunction get_search_link contained
syn keyword wpFunction get_search_feed_link contained
syn keyword wpFunction get_search_comments_feed_link contained
syn keyword wpFunction get_post_type_archive_link contained
syn keyword wpFunction get_post_type_archive_feed_link contained
syn keyword wpFunction get_edit_post_link contained
syn keyword wpFunction edit_post_link contained
syn keyword wpFunction get_delete_post_link contained
syn keyword wpFunction get_edit_comment_link contained
syn keyword wpFunction edit_comment_link contained
syn keyword wpFunction get_edit_bookmark_link contained
syn keyword wpFunction edit_bookmark_link contained
syn keyword wpFunction get_edit_user_link contained
syn keyword wpFunction get_previous_post contained
syn keyword wpFunction get_next_post contained
syn keyword wpFunction get_adjacent_post contained
syn keyword wpFunction get_adjacent_post_rel_link contained
syn keyword wpFunction adjacent_posts_rel_link contained
syn keyword wpFunction adjacent_posts_rel_link_wp_head contained
syn keyword wpFunction next_post_rel_link contained
syn keyword wpFunction prev_post_rel_link contained
syn keyword wpFunction get_boundary_post contained
syn keyword wpFunction get_previous_post_link contained
syn keyword wpFunction previous_post_link contained
syn keyword wpFunction get_next_post_link contained
syn keyword wpFunction next_post_link contained
syn keyword wpFunction get_adjacent_post_link contained
syn keyword wpFunction adjacent_post_link contained
syn keyword wpFunction get_pagenum_link contained
syn keyword wpFunction get_next_posts_page_link contained
syn keyword wpFunction next_posts contained
syn keyword wpFunction get_next_posts_link contained
syn keyword wpFunction next_posts_link contained
syn keyword wpFunction get_previous_posts_page_link contained
syn keyword wpFunction previous_posts contained
syn keyword wpFunction get_previous_posts_link contained
syn keyword wpFunction previous_posts_link contained
syn keyword wpFunction get_posts_nav_link contained
syn keyword wpFunction posts_nav_link contained
syn keyword wpFunction get_comments_pagenum_link contained
syn keyword wpFunction get_next_comments_link contained
syn keyword wpFunction next_comments_link contained
syn keyword wpFunction get_previous_comments_link contained
syn keyword wpFunction previous_comments_link contained
syn keyword wpFunction paginate_comments_links contained
syn keyword wpFunction get_shortcut_link contained
syn keyword wpFunction home_url contained
syn keyword wpFunction get_home_url contained
syn keyword wpFunction site_url contained
syn keyword wpFunction get_site_url contained
syn keyword wpFunction admin_url contained
syn keyword wpFunction get_admin_url contained
syn keyword wpFunction includes_url contained
syn keyword wpFunction content_url contained
syn keyword wpFunction plugins_url contained
syn keyword wpFunction network_site_url contained
syn keyword wpFunction network_home_url contained
syn keyword wpFunction network_admin_url contained
syn keyword wpFunction user_admin_url contained
syn keyword wpFunction self_admin_url contained
syn keyword wpFunction set_url_scheme contained
syn keyword wpFunction get_dashboard_url contained
syn keyword wpFunction get_edit_profile_url contained
syn keyword wpFunction rel_canonical contained
syn keyword wpFunction wp_get_shortlink contained
syn keyword wpFunction wp_shortlink_wp_head contained
syn keyword wpFunction wp_shortlink_header contained
syn keyword wpFunction the_shortlink contained

" pluggable.php 
syn keyword wpFunction wp_set_current_user contained
syn keyword wpFunction wp_get_current_user contained
syn keyword wpFunction get_currentuserinfo contained
syn keyword wpFunction get_userdata contained
syn keyword wpFunction get_user_by contained
syn keyword wpFunction cache_users contained
syn keyword wpFunction wp_mail contained
syn keyword wpFunction wp_authenticate contained
syn keyword wpFunction wp_logout contained
syn keyword wpFunction wp_validate_auth_cookie contained
syn keyword wpFunction wp_generate_auth_cookie contained
syn keyword wpFunction wp_parse_auth_cookie contained
syn keyword wpFunction wp_set_auth_cookie contained
syn keyword wpFunction wp_clear_auth_cookie contained
syn keyword wpFunction is_user_logged_in contained
syn keyword wpFunction auth_redirect contained
syn keyword wpFunction check_admin_referer contained
syn keyword wpFunction check_ajax_referer contained
syn keyword wpFunction wp_redirect contained
syn keyword wpFunction wp_sanitize_redirect contained
syn keyword wpFunction wp_safe_redirect contained
syn keyword wpFunction wp_validate_redirect contained
syn keyword wpFunction wp_notify_postauthor contained
syn keyword wpFunction wp_notify_moderator contained
syn keyword wpFunction wp_password_change_notification contained
syn keyword wpFunction wp_new_user_notification contained
syn keyword wpFunction wp_nonce_tick contained
syn keyword wpFunction wp_verify_nonce contained
syn keyword wpFunction wp_create_nonce contained
syn keyword wpFunction wp_salt contained
syn keyword wpFunction wp_hash contained
syn keyword wpFunction wp_hash_password contained
syn keyword wpFunction wp_check_password contained
syn keyword wpFunction wp_generate_password contained
syn keyword wpFunction wp_rand contained
syn keyword wpFunction wp_set_password contained
syn keyword wpFunction get_avatar contained
syn keyword wpFunction wp_text_diff contained

" capabilities.php 
syn keyword wpFunction map_meta_cap contained
syn keyword wpFunction current_user_can contained
syn keyword wpFunction current_user_can_for_blog contained
syn keyword wpFunction author_can contained
syn keyword wpFunction user_can contained
syn keyword wpFunction get_role contained
syn keyword wpFunction add_role contained
syn keyword wpFunction remove_role contained
syn keyword wpFunction get_super_admins contained
syn keyword wpFunction is_super_admin contained

" option.php 
syn keyword wpFunction get_option contained
syn keyword wpFunction wp_protect_special_option contained
syn keyword wpFunction form_option contained
syn keyword wpFunction wp_load_alloptions contained
syn keyword wpFunction wp_load_core_site_options contained
syn keyword wpFunction update_option contained
syn keyword wpFunction add_option contained
syn keyword wpFunction delete_option contained
syn keyword wpFunction delete_transient contained
syn keyword wpFunction get_transient contained
syn keyword wpFunction set_transient contained
syn keyword wpFunction wp_user_settings contained
syn keyword wpFunction get_user_setting contained
syn keyword wpFunction set_user_setting contained
syn keyword wpFunction delete_user_setting contained
syn keyword wpFunction get_all_user_settings contained
syn keyword wpFunction wp_set_all_user_settings contained
syn keyword wpFunction delete_all_user_settings contained
syn keyword wpFunction get_site_option contained
syn keyword wpFunction add_site_option contained
syn keyword wpFunction delete_site_option contained
syn keyword wpFunction update_site_option contained
syn keyword wpFunction delete_site_transient contained
syn keyword wpFunction get_site_transient contained
syn keyword wpFunction set_site_transient contained

" nav-menu-template.php 
syn keyword wpFunction wp_nav_menu contained
syn keyword wpFunction walk_nav_menu_tree contained

" ms-load.php 
syn keyword wpFunction is_subdomain_install contained
syn keyword wpFunction wp_get_active_network_plugins contained
syn keyword wpFunction ms_site_check contained
syn keyword wpFunction get_network_by_path contained
syn keyword wpFunction wp_get_network contained
syn keyword wpFunction get_site_by_path contained
syn keyword wpFunction ms_not_installed contained

" class-pop3.php 
syn keyword wpFunction stripos contained

" category-template.php 
syn keyword wpFunction get_category_link contained
syn keyword wpFunction get_category_parents contained
syn keyword wpFunction get_the_category contained
syn keyword wpFunction get_the_category_by_ID contained
syn keyword wpFunction get_the_category_list contained
syn keyword wpFunction in_category contained
syn keyword wpFunction the_category contained
syn keyword wpFunction category_description contained
syn keyword wpFunction wp_dropdown_categories contained
syn keyword wpFunction wp_list_categories contained
syn keyword wpFunction wp_tag_cloud contained
syn keyword wpFunction default_topic_count_scale contained
syn keyword wpFunction wp_generate_tag_cloud contained
syn keyword wpFunction walk_category_tree contained
syn keyword wpFunction walk_category_dropdown_tree contained
syn keyword wpFunction get_tag_link contained
syn keyword wpFunction get_the_tags contained
syn keyword wpFunction get_the_tag_list contained
syn keyword wpFunction the_tags contained
syn keyword wpFunction tag_description contained
syn keyword wpFunction term_description contained
syn keyword wpFunction get_the_terms contained
syn keyword wpFunction get_the_term_list contained
syn keyword wpFunction the_terms contained
syn keyword wpFunction has_category contained
syn keyword wpFunction has_tag contained
syn keyword wpFunction has_term contained

" kses.php 
syn keyword wpFunction wp_kses contained
syn keyword wpFunction wp_kses_allowed_html contained
syn keyword wpFunction wp_kses_hook contained
syn keyword wpFunction wp_kses_version contained
syn keyword wpFunction wp_kses_split contained
syn keyword wpFunction wp_kses_split2 contained
syn keyword wpFunction wp_kses_attr contained
syn keyword wpFunction wp_kses_hair contained
syn keyword wpFunction wp_kses_check_attr_val contained
syn keyword wpFunction wp_kses_bad_protocol contained
syn keyword wpFunction wp_kses_no_null contained
syn keyword wpFunction wp_kses_stripslashes contained
syn keyword wpFunction wp_kses_array_lc contained
syn keyword wpFunction wp_kses_js_entities contained
syn keyword wpFunction wp_kses_html_error contained
syn keyword wpFunction wp_kses_bad_protocol_once contained
syn keyword wpFunction wp_kses_bad_protocol_once2 contained
syn keyword wpFunction wp_kses_normalize_entities contained
syn keyword wpFunction wp_kses_named_entities contained
syn keyword wpFunction wp_kses_normalize_entities2 contained
syn keyword wpFunction wp_kses_normalize_entities3 contained
syn keyword wpFunction valid_unicode contained
syn keyword wpFunction wp_kses_decode_entities contained
syn keyword wpFunction wp_filter_kses contained
syn keyword wpFunction wp_kses_data contained
syn keyword wpFunction wp_filter_post_kses contained
syn keyword wpFunction wp_kses_post contained
syn keyword wpFunction wp_filter_nohtml_kses contained
syn keyword wpFunction kses_init_filters contained
syn keyword wpFunction kses_remove_filters contained
syn keyword wpFunction kses_init contained
syn keyword wpFunction safecss_filter_attr contained

" deprecated.php 
syn keyword wpFunction remove_custom_background contained

" class-wp-customize-manager.php 
syn keyword wpFunction sanitize_hex_color contained
syn keyword wpFunction sanitize_hex_color_no_hash contained
syn keyword wpFunction maybe_hash_hex_color contained

" default-widgets.php 
syn keyword wpFunction wp_widget_rss_output contained
syn keyword wpFunction wp_widget_rss_form contained
syn keyword wpFunction wp_widget_rss_process contained
syn keyword wpFunction wp_widgets_init contained

" user.php 
syn keyword wpFunction wp_signon contained
syn keyword wpFunction wp_authenticate_username_password contained
syn keyword wpFunction wp_authenticate_cookie contained
syn keyword wpFunction wp_authenticate_spam_check contained
syn keyword wpFunction wp_validate_logged_in_cookie contained
syn keyword wpFunction count_user_posts contained
syn keyword wpFunction count_many_users_posts contained
syn keyword wpFunction get_current_user_id contained
syn keyword wpFunction get_user_option contained
syn keyword wpFunction update_user_option contained
syn keyword wpFunction delete_user_option contained
syn keyword wpFunction get_users contained
syn keyword wpFunction get_blogs_of_user contained
syn keyword wpFunction is_user_member_of_blog contained
syn keyword wpFunction add_user_meta contained
syn keyword wpFunction delete_user_meta contained
syn keyword wpFunction get_user_meta contained
syn keyword wpFunction update_user_meta contained
syn keyword wpFunction count_users contained
syn keyword wpFunction setup_userdata contained
syn keyword wpFunction wp_dropdown_users contained
syn keyword wpFunction sanitize_user_field contained
syn keyword wpFunction update_user_caches contained
syn keyword wpFunction clean_user_cache contained
syn keyword wpFunction username_exists contained
syn keyword wpFunction email_exists contained
syn keyword wpFunction validate_username contained
syn keyword wpFunction wp_insert_user contained
syn keyword wpFunction wp_update_user contained
syn keyword wpFunction wp_create_user contained
syn keyword wpFunction wp_get_user_contact_methods contained
syn keyword wpFunction check_password_reset_key contained
syn keyword wpFunction reset_password contained
syn keyword wpFunction register_new_user contained
syn keyword wpFunction wp_get_session_token contained
syn keyword wpFunction wp_get_all_sessions contained
syn keyword wpFunction wp_destroy_current_session contained
syn keyword wpFunction wp_destroy_other_sessions contained
syn keyword wpFunction wp_destroy_all_sessions contained

" canonical.php 
syn keyword wpFunction lowercase_octets contained
syn keyword wpFunction redirect_canonical contained
syn keyword wpFunction redirect_guess_404_permalink contained
syn keyword wpFunction wp_redirect_admin_locations contained

" load.php 
syn keyword wpFunction wp_unregister_GLOBALS contained
syn keyword wpFunction wp_fix_server_vars contained
syn keyword wpFunction wp_check_php_mysql_versions contained
syn keyword wpFunction wp_favicon_request contained
syn keyword wpFunction wp_maintenance contained
syn keyword wpFunction timer_start contained
syn keyword wpFunction timer_stop contained
syn keyword wpFunction wp_debug_mode contained
syn keyword wpFunction wp_set_lang_dir contained
syn keyword wpFunction require_wp_db contained
syn keyword wpFunction wp_set_wpdb_vars contained
syn keyword wpFunction wp_using_ext_object_cache contained
syn keyword wpFunction wp_start_object_cache contained
syn keyword wpFunction wp_not_installed contained
syn keyword wpFunction wp_get_mu_plugins contained
syn keyword wpFunction wp_get_active_and_valid_plugins contained
syn keyword wpFunction wp_set_internal_encoding contained
syn keyword wpFunction wp_magic_quotes contained
syn keyword wpFunction shutdown_action_hook contained
syn keyword wpFunction is_admin contained
syn keyword wpFunction is_blog_admin contained
syn keyword wpFunction is_network_admin contained
syn keyword wpFunction is_user_admin contained
syn keyword wpFunction is_multisite contained
syn keyword wpFunction get_current_blog_id contained
syn keyword wpFunction wp_load_translations_early contained

" js/tinymce/wp-tinymce.php 
syn keyword wpFunction get_file contained

" update.php 
syn keyword wpFunction wp_version_check contained
syn keyword wpFunction wp_update_plugins contained
syn keyword wpFunction wp_update_themes contained
syn keyword wpFunction wp_maybe_auto_update contained
syn keyword wpFunction wp_get_translation_updates contained
syn keyword wpFunction wp_get_update_data contained
syn keyword wpFunction wp_schedule_update_checks contained

" plugin.php 
syn keyword wpFunction add_filter contained
syn keyword wpFunction has_filter contained
syn keyword wpFunction apply_filters contained
syn keyword wpFunction apply_filters_ref_array contained
syn keyword wpFunction remove_filter contained
syn keyword wpFunction remove_all_filters contained
syn keyword wpFunction current_filter contained
syn keyword wpFunction current_action contained
syn keyword wpFunction doing_filter contained
syn keyword wpFunction doing_action contained
syn keyword wpFunction add_action contained
syn keyword wpFunction do_action contained
syn keyword wpFunction did_action contained
syn keyword wpFunction do_action_ref_array contained
syn keyword wpFunction has_action contained
syn keyword wpFunction remove_action contained
syn keyword wpFunction remove_all_actions contained
syn keyword wpFunction plugin_basename contained
syn keyword wpFunction wp_register_plugin_realpath contained
syn keyword wpFunction plugin_dir_path contained
syn keyword wpFunction plugin_dir_url contained
syn keyword wpFunction register_activation_hook contained
syn keyword wpFunction register_deactivation_hook contained
syn keyword wpFunction register_uninstall_hook contained

" ms-functions.php 
syn keyword wpFunction get_sitestats contained
syn keyword wpFunction get_admin_users_for_domain contained
syn keyword wpFunction get_active_blog_for_user contained
syn keyword wpFunction get_user_count contained
syn keyword wpFunction get_blog_count contained
syn keyword wpFunction get_blog_post contained
syn keyword wpFunction add_user_to_blog contained
syn keyword wpFunction remove_user_from_blog contained
syn keyword wpFunction create_empty_blog contained
syn keyword wpFunction get_blog_permalink contained
syn keyword wpFunction get_blog_id_from_url contained
syn keyword wpFunction is_email_address_unsafe contained
syn keyword wpFunction wpmu_validate_user_signup contained
syn keyword wpFunction wpmu_validate_blog_signup contained
syn keyword wpFunction wpmu_signup_blog contained
syn keyword wpFunction wpmu_signup_user contained
syn keyword wpFunction wpmu_signup_blog_notification contained
syn keyword wpFunction wpmu_signup_user_notification contained
syn keyword wpFunction wpmu_activate_signup contained
syn keyword wpFunction wpmu_create_user contained
syn keyword wpFunction wpmu_create_blog contained
syn keyword wpFunction newblog_notify_siteadmin contained
syn keyword wpFunction newuser_notify_siteadmin contained
syn keyword wpFunction domain_exists contained
syn keyword wpFunction insert_blog contained
syn keyword wpFunction install_blog contained
syn keyword wpFunction wpmu_welcome_notification contained
syn keyword wpFunction wpmu_welcome_user_notification contained
syn keyword wpFunction get_current_site contained
syn keyword wpFunction get_most_recent_post_of_user contained
syn keyword wpFunction get_dirsize contained
syn keyword wpFunction recurse_dirsize contained
syn keyword wpFunction check_upload_mimes contained
syn keyword wpFunction update_posts_count contained
syn keyword wpFunction wpmu_log_new_registrations contained
syn keyword wpFunction global_terms contained
syn keyword wpFunction redirect_this_site contained
syn keyword wpFunction upload_is_file_too_big contained
syn keyword wpFunction signup_nonce_fields contained
syn keyword wpFunction signup_nonce_check contained
syn keyword wpFunction maybe_redirect_404 contained
syn keyword wpFunction maybe_add_existing_user_to_blog contained
syn keyword wpFunction add_existing_user_to_blog contained
syn keyword wpFunction add_new_user_to_blog contained
syn keyword wpFunction fix_phpmailer_messageid contained
syn keyword wpFunction is_user_spammy contained
syn keyword wpFunction update_blog_public contained
syn keyword wpFunction is_user_option_local contained
syn keyword wpFunction users_can_register_signup_filter contained
syn keyword wpFunction welcome_user_msg_filter contained
syn keyword wpFunction force_ssl_content contained
syn keyword wpFunction filter_SSL contained
syn keyword wpFunction wp_schedule_update_network_counts contained
syn keyword wpFunction wp_update_network_counts contained
syn keyword wpFunction wp_maybe_update_network_site_counts contained
syn keyword wpFunction wp_maybe_update_network_user_counts contained
syn keyword wpFunction wp_update_network_site_counts contained
syn keyword wpFunction wp_update_network_user_counts contained
syn keyword wpFunction get_space_used contained
syn keyword wpFunction get_space_allowed contained
syn keyword wpFunction get_upload_space_available contained
syn keyword wpFunction is_upload_space_available contained
syn keyword wpFunction upload_size_limit_filter contained
syn keyword wpFunction wp_is_large_network contained
syn keyword wpFunction wp_get_sites contained

" default-constants.php 
syn keyword wpFunction wp_initial_constants contained
syn keyword wpFunction wp_plugin_directory_constants contained
syn keyword wpFunction wp_cookie_constants contained
syn keyword wpFunction wp_ssl_constants contained
syn keyword wpFunction wp_functionality_constants contained
syn keyword wpFunction wp_templating_constants contained

" ms-default-constants.php 
syn keyword wpFunction ms_upload_constants contained
syn keyword wpFunction ms_cookie_constants contained
syn keyword wpFunction ms_file_constants contained
syn keyword wpFunction ms_subdomain_constants contained

" functions.php 
syn keyword wpFunction mysql2date contained
syn keyword wpFunction current_time contained
syn keyword wpFunction date_i18n contained
syn keyword wpFunction number_format_i18n contained
syn keyword wpFunction size_format contained
syn keyword wpFunction get_weekstartend contained
syn keyword wpFunction maybe_unserialize contained
syn keyword wpFunction is_serialized contained
syn keyword wpFunction is_serialized_string contained
syn keyword wpFunction maybe_serialize contained
syn keyword wpFunction xmlrpc_getposttitle contained
syn keyword wpFunction xmlrpc_getpostcategory contained
syn keyword wpFunction xmlrpc_removepostdata contained
syn keyword wpFunction wp_extract_urls contained
syn keyword wpFunction do_enclose contained
syn keyword wpFunction wp_get_http contained
syn keyword wpFunction wp_get_http_headers contained
syn keyword wpFunction is_new_day contained
syn keyword wpFunction build_query contained
syn keyword wpFunction add_query_arg contained
syn keyword wpFunction remove_query_arg contained
syn keyword wpFunction add_magic_quotes contained
syn keyword wpFunction wp_remote_fopen contained
syn keyword wpFunction wp contained
syn keyword wpFunction get_status_header_desc contained
syn keyword wpFunction status_header contained
syn keyword wpFunction wp_get_nocache_headers contained
syn keyword wpFunction nocache_headers contained
syn keyword wpFunction cache_javascript_headers contained
syn keyword wpFunction get_num_queries contained
syn keyword wpFunction bool_from_yn contained
syn keyword wpFunction do_feed contained
syn keyword wpFunction do_feed_rdf contained
syn keyword wpFunction do_feed_rss contained
syn keyword wpFunction do_feed_rss2 contained
syn keyword wpFunction do_feed_atom contained
syn keyword wpFunction do_robots contained
syn keyword wpFunction is_blog_installed contained
syn keyword wpFunction wp_nonce_url contained
syn keyword wpFunction wp_nonce_field contained
syn keyword wpFunction wp_referer_field contained
syn keyword wpFunction wp_original_referer_field contained
syn keyword wpFunction wp_get_referer contained
syn keyword wpFunction wp_get_original_referer contained
syn keyword wpFunction wp_mkdir_p contained
syn keyword wpFunction path_is_absolute contained
syn keyword wpFunction path_join contained
syn keyword wpFunction wp_normalize_path contained
syn keyword wpFunction get_temp_dir contained
syn keyword wpFunction wp_is_writable contained
syn keyword wpFunction win_is_writable contained
syn keyword wpFunction wp_upload_dir contained
syn keyword wpFunction wp_unique_filename contained
syn keyword wpFunction wp_upload_bits contained
syn keyword wpFunction wp_ext2type contained
syn keyword wpFunction wp_check_filetype contained
syn keyword wpFunction wp_check_filetype_and_ext contained
syn keyword wpFunction wp_get_mime_types contained
syn keyword wpFunction get_allowed_mime_types contained
syn keyword wpFunction wp_nonce_ays contained
syn keyword wpFunction wp_die contained
syn keyword wpFunction wp_send_json contained
syn keyword wpFunction wp_send_json_success contained
syn keyword wpFunction wp_send_json_error contained
syn keyword wpFunction smilies_init contained
syn keyword wpFunction wp_parse_args contained
syn keyword wpFunction wp_parse_id_list contained
syn keyword wpFunction wp_array_slice_assoc contained
syn keyword wpFunction wp_filter_object_list contained
syn keyword wpFunction wp_list_filter contained
syn keyword wpFunction wp_list_pluck contained
syn keyword wpFunction wp_maybe_load_widgets contained
syn keyword wpFunction wp_widgets_add_menu contained
syn keyword wpFunction wp_ob_end_flush_all contained
syn keyword wpFunction dead_db contained
syn keyword wpFunction absint contained
syn keyword wpFunction is_lighttpd_before_150 contained
syn keyword wpFunction apache_mod_loaded contained
syn keyword wpFunction iis7_supports_permalinks contained
syn keyword wpFunction validate_file contained
syn keyword wpFunction is_ssl contained
syn keyword wpFunction force_ssl_login contained
syn keyword wpFunction force_ssl_admin contained
syn keyword wpFunction wp_guess_url contained
syn keyword wpFunction wp_suspend_cache_addition contained
syn keyword wpFunction wp_suspend_cache_invalidation contained
syn keyword wpFunction is_main_site contained
syn keyword wpFunction is_main_network contained
syn keyword wpFunction global_terms_enabled contained
syn keyword wpFunction wp_timezone_override_offset contained
syn keyword wpFunction wp_timezone_choice contained
syn keyword wpFunction wp_scheduled_delete contained
syn keyword wpFunction get_file_data contained
syn keyword wpFunction send_nosniff_header contained
syn keyword wpFunction wp_find_hierarchy_loop contained
syn keyword wpFunction wp_find_hierarchy_loop_tortoise_hare contained
syn keyword wpFunction send_frame_options_header contained
syn keyword wpFunction wp_allowed_protocols contained
syn keyword wpFunction wp_debug_backtrace_summary contained
syn keyword wpFunction wp_is_stream contained
syn keyword wpFunction wp_checkdate contained
syn keyword wpFunction wp_auth_check_load contained
syn keyword wpFunction wp_auth_check_html contained
syn keyword wpFunction wp_auth_check contained
syn keyword wpFunction get_tag_regex contained
syn keyword wpFunction mbstring_binary_safe_encoding contained
syn keyword wpFunction reset_mbstring_encoding contained
syn keyword wpFunction wp_validate_boolean contained

" theme.php 
syn keyword wpFunction wp_get_themes contained
syn keyword wpFunction wp_get_theme contained
syn keyword wpFunction wp_clean_themes_cache contained
syn keyword wpFunction is_child_theme contained
syn keyword wpFunction get_stylesheet contained
syn keyword wpFunction get_stylesheet_directory contained
syn keyword wpFunction get_stylesheet_directory_uri contained
syn keyword wpFunction get_stylesheet_uri contained
syn keyword wpFunction get_locale_stylesheet_uri contained
syn keyword wpFunction get_template contained
syn keyword wpFunction get_template_directory contained
syn keyword wpFunction get_template_directory_uri contained
syn keyword wpFunction get_theme_roots contained
syn keyword wpFunction register_theme_directory contained
syn keyword wpFunction search_theme_directories contained
syn keyword wpFunction get_theme_root contained
syn keyword wpFunction get_theme_root_uri contained
syn keyword wpFunction get_raw_theme_root contained
syn keyword wpFunction locale_stylesheet contained
syn keyword wpFunction preview_theme contained
syn keyword wpFunction preview_theme_ob_filter contained
syn keyword wpFunction preview_theme_ob_filter_callback contained
syn keyword wpFunction switch_theme contained
syn keyword wpFunction validate_current_theme contained
syn keyword wpFunction get_theme_mods contained
syn keyword wpFunction get_theme_mod contained
syn keyword wpFunction set_theme_mod contained
syn keyword wpFunction remove_theme_mod contained
syn keyword wpFunction remove_theme_mods contained
syn keyword wpFunction get_header_textcolor contained
syn keyword wpFunction header_textcolor contained
syn keyword wpFunction display_header_text contained
syn keyword wpFunction get_header_image contained
syn keyword wpFunction get_random_header_image contained
syn keyword wpFunction is_random_header_image contained
syn keyword wpFunction header_image contained
syn keyword wpFunction get_uploaded_header_images contained
syn keyword wpFunction get_custom_header contained
syn keyword wpFunction register_default_headers contained
syn keyword wpFunction unregister_default_headers contained
syn keyword wpFunction get_background_image contained
syn keyword wpFunction background_image contained
syn keyword wpFunction get_background_color contained
syn keyword wpFunction background_color contained
syn keyword wpFunction add_editor_style contained
syn keyword wpFunction remove_editor_styles contained
syn keyword wpFunction get_editor_stylesheets contained
syn keyword wpFunction add_theme_support contained
syn keyword wpFunction get_theme_support contained
syn keyword wpFunction remove_theme_support contained
syn keyword wpFunction current_theme_supports contained
syn keyword wpFunction require_if_theme_supports contained
syn keyword wpFunction check_theme_switched contained
syn keyword wpFunction wp_customize_url contained
syn keyword wpFunction wp_customize_support_script contained
syn keyword wpFunction is_customize_preview contained

" vars.php 
syn keyword wpFunction wp_is_mobile contained

" compat.php 
syn keyword wpFunction mb_substr contained
syn keyword wpFunction hash_hmac contained
syn keyword wpFunction json_encode contained
syn keyword wpFunction json_decode contained
syn keyword wpFunction hash_equals contained

" bookmark.php 
syn keyword wpFunction get_bookmark contained
syn keyword wpFunction get_bookmark_field contained
syn keyword wpFunction get_bookmarks contained
syn keyword wpFunction sanitize_bookmark contained
syn keyword wpFunction sanitize_bookmark_field contained
syn keyword wpFunction clean_bookmark_cache contained

" functions.wp-styles.php 
syn keyword wpFunction wp_print_styles contained
syn keyword wpFunction wp_add_inline_style contained
syn keyword wpFunction wp_register_style contained
syn keyword wpFunction wp_deregister_style contained
syn keyword wpFunction wp_enqueue_style contained
syn keyword wpFunction wp_dequeue_style contained
syn keyword wpFunction wp_style_is contained
syn keyword wpFunction wp_style_add_data contained

" feed.php 
syn keyword wpFunction get_bloginfo_rss contained
syn keyword wpFunction bloginfo_rss contained
syn keyword wpFunction get_default_feed contained
syn keyword wpFunction get_wp_title_rss contained
syn keyword wpFunction wp_title_rss contained
syn keyword wpFunction get_the_title_rss contained
syn keyword wpFunction the_title_rss contained
syn keyword wpFunction get_the_content_feed contained
syn keyword wpFunction the_content_feed contained
syn keyword wpFunction the_excerpt_rss contained
syn keyword wpFunction the_permalink_rss contained
syn keyword wpFunction comments_link_feed contained
syn keyword wpFunction comment_guid contained
syn keyword wpFunction get_comment_guid contained
syn keyword wpFunction comment_link contained
syn keyword wpFunction get_comment_author_rss contained
syn keyword wpFunction comment_author_rss contained
syn keyword wpFunction comment_text_rss contained
syn keyword wpFunction get_the_category_rss contained
syn keyword wpFunction the_category_rss contained
syn keyword wpFunction html_type_rss contained
syn keyword wpFunction rss_enclosure contained
syn keyword wpFunction atom_enclosure contained
syn keyword wpFunction prep_atom_text_construct contained
syn keyword wpFunction self_link contained
syn keyword wpFunction feed_content_type contained
syn keyword wpFunction fetch_feed contained

" meta.php 
syn keyword wpFunction add_metadata contained
syn keyword wpFunction update_metadata contained
syn keyword wpFunction delete_metadata contained
syn keyword wpFunction get_metadata contained
syn keyword wpFunction metadata_exists contained
syn keyword wpFunction get_metadata_by_mid contained
syn keyword wpFunction update_metadata_by_mid contained
syn keyword wpFunction delete_metadata_by_mid contained
syn keyword wpFunction update_meta_cache contained
syn keyword wpFunction get_meta_sql contained
syn keyword wpFunction is_protected_meta contained
syn keyword wpFunction sanitize_meta contained
syn keyword wpFunction register_meta contained

" locale.php 
syn keyword wpFunction is_rtl contained

" class-simplepie.php 
syn keyword wpFunction wp_simplepie_autoload contained

" nav-menu.php 
syn keyword wpFunction wp_get_nav_menu_object contained
syn keyword wpFunction is_nav_menu contained
syn keyword wpFunction register_nav_menus contained
syn keyword wpFunction unregister_nav_menu contained
syn keyword wpFunction register_nav_menu contained
syn keyword wpFunction get_registered_nav_menus contained
syn keyword wpFunction get_nav_menu_locations contained
syn keyword wpFunction has_nav_menu contained
syn keyword wpFunction is_nav_menu_item contained
syn keyword wpFunction wp_create_nav_menu contained
syn keyword wpFunction wp_delete_nav_menu contained
syn keyword wpFunction wp_update_nav_menu_object contained
syn keyword wpFunction wp_update_nav_menu_item contained
syn keyword wpFunction wp_get_nav_menus contained
syn keyword wpFunction wp_get_nav_menu_items contained
syn keyword wpFunction wp_setup_nav_menu_item contained
syn keyword wpFunction wp_get_associated_nav_menu_items contained

" widgets.php 
syn keyword wpFunction register_widget contained
syn keyword wpFunction unregister_widget contained
syn keyword wpFunction register_sidebars contained
syn keyword wpFunction register_sidebar contained
syn keyword wpFunction unregister_sidebar contained
syn keyword wpFunction wp_register_sidebar_widget contained
syn keyword wpFunction wp_widget_description contained
syn keyword wpFunction wp_sidebar_description contained
syn keyword wpFunction wp_unregister_sidebar_widget contained
syn keyword wpFunction wp_register_widget_control contained
syn keyword wpFunction wp_unregister_widget_control contained
syn keyword wpFunction dynamic_sidebar contained
syn keyword wpFunction is_active_widget contained
syn keyword wpFunction is_dynamic_sidebar contained
syn keyword wpFunction is_active_sidebar contained
syn keyword wpFunction wp_get_sidebars_widgets contained
syn keyword wpFunction wp_set_sidebars_widgets contained
syn keyword wpFunction wp_get_widget_defaults contained
syn keyword wpFunction wp_convert_widget_settings contained
syn keyword wpFunction the_widget contained
syn keyword wpFunction retrieve_widgets contained

" rss.php 
syn keyword wpFunction fetch_rss contained
syn keyword wpFunction init contained
syn keyword wpFunction is_info contained
syn keyword wpFunction is_success contained
syn keyword wpFunction is_redirect contained
syn keyword wpFunction is_error contained
syn keyword wpFunction is_client_error contained
syn keyword wpFunction is_server_error contained
syn keyword wpFunction parse_w3cdtf contained
syn keyword wpFunction wp_rss contained
syn keyword wpFunction get_rss contained

" revision.php 
syn keyword wpFunction wp_save_post_revision contained
syn keyword wpFunction wp_get_post_autosave contained
syn keyword wpFunction wp_is_post_revision contained
syn keyword wpFunction wp_is_post_autosave contained
syn keyword wpFunction wp_get_post_revision contained
syn keyword wpFunction wp_restore_post_revision contained
syn keyword wpFunction wp_delete_post_revision contained
syn keyword wpFunction wp_get_post_revisions contained
syn keyword wpFunction wp_revisions_enabled contained
syn keyword wpFunction wp_revisions_to_keep contained

" cache.php 
syn keyword wpFunction wp_cache_add contained
syn keyword wpFunction wp_cache_close contained
syn keyword wpFunction wp_cache_decr contained
syn keyword wpFunction wp_cache_delete contained
syn keyword wpFunction wp_cache_flush contained
syn keyword wpFunction wp_cache_get contained
syn keyword wpFunction wp_cache_incr contained
syn keyword wpFunction wp_cache_init contained
syn keyword wpFunction wp_cache_replace contained
syn keyword wpFunction wp_cache_set contained
syn keyword wpFunction wp_cache_switch_to_blog contained
syn keyword wpFunction wp_cache_add_global_groups contained
syn keyword wpFunction wp_cache_add_non_persistent_groups contained

" post-thumbnail-template.php 
syn keyword wpFunction has_post_thumbnail contained
syn keyword wpFunction get_post_thumbnail_id contained
syn keyword wpFunction the_post_thumbnail contained
syn keyword wpFunction update_post_thumbnail_cache contained
syn keyword wpFunction get_the_post_thumbnail contained

" shortcodes.php 
syn keyword wpFunction add_shortcode contained
syn keyword wpFunction remove_shortcode contained
syn keyword wpFunction remove_all_shortcodes contained
syn keyword wpFunction shortcode_exists contained
syn keyword wpFunction has_shortcode contained
syn keyword wpFunction do_shortcode contained
syn keyword wpFunction get_shortcode_regex contained
syn keyword wpFunction do_shortcode_tag contained
syn keyword wpFunction shortcode_parse_atts contained
syn keyword wpFunction shortcode_atts contained
syn keyword wpFunction strip_shortcodes contained
syn keyword wpFunction strip_shortcode_tag contained

" class-wp-error.php 
syn keyword wpFunction is_wp_error contained

" bookmark-template.php 
syn keyword wpFunction wp_list_bookmarks contained

" --- Classes --- 

" Text/Diff/Engine/xdiff.php 
syn keyword wpClass Text_Diff_Engine_xdiff contained

" SimplePie/HTTP/Parser.php 
syn keyword wpClass SimplePie_HTTP_Parser contained

" class-IXR.php 
syn keyword wpClass IXR_Value contained
syn keyword wpClass IXR_Message contained
syn keyword wpClass IXR_Server contained
syn keyword wpClass IXR_Request contained
syn keyword wpClass IXR_Client contained
syn keyword wpClass IXR_Error contained
syn keyword wpClass IXR_Date contained
syn keyword wpClass IXR_Base64 contained
syn keyword wpClass IXR_IntrospectionServer contained
syn keyword wpClass IXR_ClientMulticall contained

" SimplePie/Registry.php 
syn keyword wpClass SimplePie_Registry contained

" SimplePie/Cache.php 
syn keyword wpClass SimplePie_Cache contained

" class-snoopy.php 
syn keyword wpClass Snoopy contained

" class-wp-customize-widgets.php 
syn keyword wpClass WP_Customize_Widgets contained

" class-wp-customize-panel.php 
syn keyword wpClass WP_Customize_Panel contained

" rewrite.php 
syn keyword wpClass WP_Rewrite contained

" class-phpmailer.php 
syn keyword wpClass PHPMailer contained
syn keyword wpClass phpmailerException contained

" SimplePie/Source.php 
syn keyword wpClass SimplePie_Source contained

" SimplePie/Cache/DB.php 
syn keyword wpClass SimplePie_Cache_DB contained

" taxonomy.php 
syn keyword wpClass WP_Tax_Query contained

" query.php 
syn keyword wpClass WP_Query contained

" ID3/module.audio.dts.php 
syn keyword wpClass getid3_dts contained

" wp-db.php 
syn keyword wpClass wpdb contained

" ID3/module.audio-video.flv.php 
syn keyword wpClass getid3_flv contained
syn keyword wpClass AMFStream contained
syn keyword wpClass AMFReader contained
syn keyword wpClass AVCSequenceParameterSetReader contained

" Text/Diff.php 
syn keyword wpClass Text_Diff contained
syn keyword wpClass Text_MappedDiff contained
syn keyword wpClass Text_Diff_Op contained
syn keyword wpClass Text_Diff_Op_copy contained
syn keyword wpClass Text_Diff_Op_delete contained
syn keyword wpClass Text_Diff_Op_add contained
syn keyword wpClass Text_Diff_Op_change contained

" SimplePie/Cache/MySQL.php 
syn keyword wpClass SimplePie_Cache_MySQL contained

" SimplePie/Restriction.php 
syn keyword wpClass SimplePie_Restriction contained

" ID3/module.audio-video.riff.php 
syn keyword wpClass getid3_riff contained

" Text/Diff/Engine/native.php 
syn keyword wpClass Text_Diff_Engine_native contained

" SimplePie/gzdecode.php 
syn keyword wpClass SimplePie_gzdecode contained

" SimplePie/Rating.php 
syn keyword wpClass SimplePie_Rating contained

" pomo/translations.php 
syn keyword wpClass Translations contained
syn keyword wpClass Gettext_Translations contained
syn keyword wpClass NOOP_Translations contained

" class-wp-xmlrpc-server.php 
syn keyword wpClass wp_xmlrpc_server contained

" post-template.php 
syn keyword wpClass Walker_Page contained
syn keyword wpClass Walker_PageDropdown contained

" comment-template.php 
syn keyword wpClass Walker_Comment contained

" ID3/module.audio-video.matroska.php 
syn keyword wpClass getid3_matroska contained

" Text/Diff/Renderer.php 
syn keyword wpClass Text_Diff_Renderer contained

" comment.php 
syn keyword wpClass WP_Comment_Query contained

" class-wp-customize-setting.php 
syn keyword wpClass WP_Customize_Setting contained
syn keyword wpClass WP_Customize_Filter_Setting contained
syn keyword wpClass WP_Customize_Header_Image_Setting contained
syn keyword wpClass WP_Customize_Background_Image_Setting contained

" class-wp-editor.php 
syn keyword wpClass _WP_Editors contained

" class.wp-dependencies.php 
syn keyword wpClass WP_Dependencies contained
syn keyword wpClass _WP_Dependency contained

" SimplePie/Sanitize.php 
syn keyword wpClass SimplePie_Sanitize contained

" post.php 
syn keyword wpClass WP_Post contained

" SimplePie/Cache/File.php 
syn keyword wpClass SimplePie_Cache_File contained

" class-wp.php 
syn keyword wpClass WP contained
syn keyword wpClass WP_MatchesMapRegex contained

" class-wp-ajax-response.php 
syn keyword wpClass WP_Ajax_Response contained

" class-oembed.php 
syn keyword wpClass WP_oEmbed contained

" class-wp-customize-section.php 
syn keyword wpClass WP_Customize_Section contained

" SimplePie/Enclosure.php 
syn keyword wpClass SimplePie_Enclosure contained

" capabilities.php 
syn keyword wpClass WP_Roles contained
syn keyword wpClass WP_Role contained
syn keyword wpClass WP_User contained

" SimplePie/Copyright.php 
syn keyword wpClass SimplePie_Copyright contained

" pluggable-deprecated.php 
syn keyword wpClass wp_atom_server contained

" ID3/module.tag.apetag.php 
syn keyword wpClass getid3_apetag contained

" class-wp-embed.php 
syn keyword wpClass WP_Embed contained

" ID3/module.audio.flac.php 
syn keyword wpClass getid3_flac contained

" wp-diff.php 
syn keyword wpClass WP_Text_Diff_Renderer_Table contained
syn keyword wpClass WP_Text_Diff_Renderer_inline contained

" nav-menu-template.php 
syn keyword wpClass Walker_Nav_Menu contained

" class-wp-image-editor-gd.php 
syn keyword wpClass WP_Image_Editor_GD contained

" class-pop3.php 
syn keyword wpClass POP3 contained

" class-feed.php 
syn keyword wpClass WP_Feed_Cache contained
syn keyword wpClass WP_Feed_Cache_Transient contained
syn keyword wpClass WP_SimplePie_File contained
syn keyword wpClass WP_SimplePie_Sanitize_KSES contained

" category-template.php 
syn keyword wpClass Walker_Category contained
syn keyword wpClass Walker_CategoryDropdown contained

" class-wp-admin-bar.php 
syn keyword wpClass WP_Admin_Bar contained

" ID3/module.audio.ac3.php 
syn keyword wpClass getid3_ac3 contained

" SimplePie/Exception.php 
syn keyword wpClass SimplePie_Exception contained

" class-wp-image-editor.php 
syn keyword wpClass WP_Image_Editor contained

" ID3/module.audio.ogg.php 
syn keyword wpClass getid3_ogg contained

" class-wp-customize-control.php 
syn keyword wpClass WP_Customize_Control contained
syn keyword wpClass WP_Customize_Color_Control contained
syn keyword wpClass WP_Customize_Upload_Control contained
syn keyword wpClass WP_Customize_Image_Control contained
syn keyword wpClass WP_Customize_Background_Image_Control contained
syn keyword wpClass WP_Customize_Header_Image_Control contained
syn keyword wpClass WP_Widget_Area_Customize_Control contained
syn keyword wpClass WP_Widget_Form_Customize_Control contained

" class-wp-image-editor-imagick.php 
syn keyword wpClass WP_Image_Editor_Imagick contained

" atomlib.php 
syn keyword wpClass AtomFeed contained
syn keyword wpClass AtomEntry contained
syn keyword wpClass AtomParser contained

" class-wp-customize-manager.php 
syn keyword wpClass WP_Customize_Manager contained

" default-widgets.php 
syn keyword wpClass WP_Widget_Pages contained
syn keyword wpClass WP_Widget_Links contained
syn keyword wpClass WP_Widget_Search contained
syn keyword wpClass WP_Widget_Archives contained
syn keyword wpClass WP_Widget_Meta contained
syn keyword wpClass WP_Widget_Calendar contained
syn keyword wpClass WP_Widget_Text contained
syn keyword wpClass WP_Widget_Categories contained
syn keyword wpClass WP_Widget_Recent_Posts contained
syn keyword wpClass WP_Widget_Recent_Comments contained
syn keyword wpClass WP_Widget_RSS contained
syn keyword wpClass WP_Widget_Tag_Cloud contained
syn keyword wpClass WP_Nav_Menu_Widget contained

" class-wp-theme.php 
syn keyword wpClass WP_Theme contained

" user.php 
syn keyword wpClass WP_User_Query contained

" SimplePie/Net/IPv6.php 
syn keyword wpClass SimplePie_Net_IPv6 contained

" ID3/module.tag.id3v1.php 
syn keyword wpClass getid3_id3v1 contained

" ID3/module.audio-video.quicktime.php 
syn keyword wpClass getid3_quicktime contained

" Text/Diff/Engine/shell.php 
syn keyword wpClass Text_Diff_Engine_shell contained

" class.wp-scripts.php 
syn keyword wpClass WP_Scripts contained

" SimplePie/Misc.php 
syn keyword wpClass SimplePie_Misc contained

" class-wp-http-ixr-client.php 
syn keyword wpClass WP_HTTP_IXR_Client contained

" ID3/module.audio-video.asf.php 
syn keyword wpClass getid3_asf contained

" SimplePie/Content/Type/Sniffer.php 
syn keyword wpClass SimplePie_Content_Type_Sniffer contained

" ID3/getid3.lib.php 
syn keyword wpClass getid3_lib contained

" class.wp-styles.php 
syn keyword wpClass WP_Styles contained

" ID3/module.tag.lyrics3.php 
syn keyword wpClass getid3_lyrics3 contained

" SimplePie/Locator.php 
syn keyword wpClass SimplePie_Locator contained

" SimplePie/Caption.php 
syn keyword wpClass SimplePie_Caption contained

" class-phpass.php 
syn keyword wpClass PasswordHash contained

" pomo/mo.php 
syn keyword wpClass MO contained

" SimplePie/Core.php 
syn keyword wpClass SimplePie_Core contained

" pomo/entry.php 
syn keyword wpClass Translation_Entry contained

" Text/Diff/Renderer/inline.php 
syn keyword wpClass Text_Diff_Renderer_inline contained

" SimplePie/Item.php 
syn keyword wpClass SimplePie_Item contained

" date.php 
syn keyword wpClass WP_Date_Query contained

" ID3/getid3.php 
syn keyword wpClass getID3 contained
syn keyword wpClass getid3_handler contained
syn keyword wpClass getid3_exception contained

" SimplePie/IRI.php 
syn keyword wpClass SimplePie_IRI contained

" class-json.php 
syn keyword wpClass Services_JSON contained
syn keyword wpClass Services_JSON_Error contained

" class-wp-walker.php 
syn keyword wpClass Walker contained

" session.php 
syn keyword wpClass WP_Session_Tokens contained
syn keyword wpClass WP_User_Meta_Session_Tokens contained

" SimplePie/XML/Declaration/Parser.php 
syn keyword wpClass SimplePie_XML_Declaration_Parser contained

" pomo/po.php 
syn keyword wpClass PO contained

" meta.php 
syn keyword wpClass WP_Meta_Query contained

" class-http.php 
syn keyword wpClass WP_Http contained
syn keyword wpClass WP_Http_Streams contained
syn keyword wpClass WP_HTTP_Fsockopen contained
syn keyword wpClass WP_Http_Curl contained
syn keyword wpClass WP_HTTP_Proxy contained
syn keyword wpClass WP_Http_Cookie contained
syn keyword wpClass WP_Http_Encoding contained

" SimplePie/File.php 
syn keyword wpClass SimplePie_File contained

" pomo/streams.php 
syn keyword wpClass POMO_Reader contained
syn keyword wpClass POMO_FileReader contained
syn keyword wpClass POMO_StringReader contained
syn keyword wpClass POMO_CachedFileReader contained
syn keyword wpClass POMO_CachedIntFileReader contained

" ID3/module.audio.mp3.php 
syn keyword wpClass getid3_mp3 contained

" SimplePie/Author.php 
syn keyword wpClass SimplePie_Author contained

" locale.php 
syn keyword wpClass WP_Locale contained

" class-simplepie.php 
syn keyword wpClass SimplePie contained

" SimplePie/Parser.php 
syn keyword wpClass SimplePie_Parser contained

" ID3/module.tag.id3v2.php 
syn keyword wpClass getid3_id3v2 contained

" SimplePie/Parse/Date.php 
syn keyword wpClass SimplePie_Parse_Date contained

" SimplePie/Category.php 
syn keyword wpClass SimplePie_Category contained

" widgets.php 
syn keyword wpClass WP_Widget contained
syn keyword wpClass WP_Widget_Factory contained

" SimplePie/Credit.php 
syn keyword wpClass SimplePie_Credit contained

" SimplePie/Cache/Memcache.php 
syn keyword wpClass SimplePie_Cache_Memcache contained

" Text/Diff/Engine/string.php 
syn keyword wpClass Text_Diff_Engine_string contained

" rss.php 
syn keyword wpClass MagpieRSS contained
syn keyword wpClass RSSCache contained

" SimplePie/Decode/HTML/Entities.php 
syn keyword wpClass SimplePie_Decode_HTML_Entities contained

" cache.php 
syn keyword wpClass WP_Object_Cache contained

" class-smtp.php 
syn keyword wpClass SMTP contained

" class-wp-error.php 
syn keyword wpClass WP_Error contained

" --- Deprecated Functions --- 

" post.php 
syn keyword wpDeprecated get_page contained

" pluggable-deprecated.php 
syn keyword wpDeprecated set_current_user contained
syn keyword wpDeprecated get_userdatabylogin contained
syn keyword wpDeprecated get_user_by_email contained
syn keyword wpDeprecated wp_setcookie contained
syn keyword wpDeprecated wp_clearcookie contained
syn keyword wpDeprecated wp_get_cookie_login contained
syn keyword wpDeprecated wp_login contained

" ms-load.php 
syn keyword wpDeprecated get_current_site_name contained
syn keyword wpDeprecated wpmu_current_site contained

" deprecated.php 
syn keyword wpDeprecated get_postdata contained
syn keyword wpDeprecated start_wp contained
syn keyword wpDeprecated the_category_ID contained
syn keyword wpDeprecated the_category_head contained
syn keyword wpDeprecated previous_post contained
syn keyword wpDeprecated next_post contained
syn keyword wpDeprecated user_can_create_post contained
syn keyword wpDeprecated user_can_create_draft contained
syn keyword wpDeprecated user_can_edit_post contained
syn keyword wpDeprecated user_can_delete_post contained
syn keyword wpDeprecated user_can_set_post_date contained
syn keyword wpDeprecated user_can_edit_post_date contained
syn keyword wpDeprecated user_can_edit_post_comments contained
syn keyword wpDeprecated user_can_delete_post_comments contained
syn keyword wpDeprecated user_can_edit_user contained
syn keyword wpDeprecated get_linksbyname contained
syn keyword wpDeprecated wp_get_linksbyname contained
syn keyword wpDeprecated get_linkobjectsbyname contained
syn keyword wpDeprecated get_linkobjects contained
syn keyword wpDeprecated get_linksbyname_withrating contained
syn keyword wpDeprecated get_links_withrating contained
syn keyword wpDeprecated get_autotoggle contained
syn keyword wpDeprecated list_cats contained
syn keyword wpDeprecated wp_list_cats contained
syn keyword wpDeprecated dropdown_cats contained
syn keyword wpDeprecated list_authors contained
syn keyword wpDeprecated wp_get_post_cats contained
syn keyword wpDeprecated wp_set_post_cats contained
syn keyword wpDeprecated get_archives contained
syn keyword wpDeprecated get_author_link contained
syn keyword wpDeprecated link_pages contained
syn keyword wpDeprecated get_settings contained
syn keyword wpDeprecated permalink_link contained
syn keyword wpDeprecated permalink_single_rss contained
syn keyword wpDeprecated wp_get_links contained
syn keyword wpDeprecated get_links contained
syn keyword wpDeprecated get_links_list contained
syn keyword wpDeprecated links_popup_script contained
syn keyword wpDeprecated get_linkrating contained
syn keyword wpDeprecated get_linkcatname contained
syn keyword wpDeprecated comments_rss_link contained
syn keyword wpDeprecated get_category_rss_link contained
syn keyword wpDeprecated get_author_rss_link contained
syn keyword wpDeprecated comments_rss contained
syn keyword wpDeprecated create_user contained
syn keyword wpDeprecated gzip_compression contained
syn keyword wpDeprecated get_commentdata contained
syn keyword wpDeprecated get_catname contained
syn keyword wpDeprecated get_category_children contained
syn keyword wpDeprecated get_all_category_ids contained
syn keyword wpDeprecated get_the_author_description contained
syn keyword wpDeprecated the_author_description contained
syn keyword wpDeprecated get_the_author_login contained
syn keyword wpDeprecated the_author_login contained
syn keyword wpDeprecated get_the_author_firstname contained
syn keyword wpDeprecated the_author_firstname contained
syn keyword wpDeprecated get_the_author_lastname contained
syn keyword wpDeprecated the_author_lastname contained
syn keyword wpDeprecated get_the_author_nickname contained
syn keyword wpDeprecated the_author_nickname contained
syn keyword wpDeprecated get_the_author_email contained
syn keyword wpDeprecated the_author_email contained
syn keyword wpDeprecated get_the_author_icq contained
syn keyword wpDeprecated the_author_icq contained
syn keyword wpDeprecated get_the_author_yim contained
syn keyword wpDeprecated the_author_yim contained
syn keyword wpDeprecated get_the_author_msn contained
syn keyword wpDeprecated the_author_msn contained
syn keyword wpDeprecated get_the_author_aim contained
syn keyword wpDeprecated the_author_aim contained
syn keyword wpDeprecated get_author_name contained
syn keyword wpDeprecated get_the_author_url contained
syn keyword wpDeprecated the_author_url contained
syn keyword wpDeprecated get_the_author_ID contained
syn keyword wpDeprecated the_author_ID contained
syn keyword wpDeprecated the_content_rss contained
syn keyword wpDeprecated make_url_footnote contained
syn keyword wpDeprecated translate_with_context contained
syn keyword wpDeprecated get_alloptions contained
syn keyword wpDeprecated get_the_attachment_link contained
syn keyword wpDeprecated get_attachment_icon_src contained
syn keyword wpDeprecated get_attachment_icon contained
syn keyword wpDeprecated get_attachment_innerHTML contained
syn keyword wpDeprecated get_link contained
syn keyword wpDeprecated sanitize_url contained
syn keyword wpDeprecated clean_url contained
syn keyword wpDeprecated js_escape contained
syn keyword wpDeprecated wp_specialchars contained
syn keyword wpDeprecated attribute_escape contained
syn keyword wpDeprecated register_sidebar_widget contained
syn keyword wpDeprecated unregister_sidebar_widget contained
syn keyword wpDeprecated register_widget_control contained
syn keyword wpDeprecated unregister_widget_control contained
syn keyword wpDeprecated delete_usermeta contained
syn keyword wpDeprecated get_usermeta contained
syn keyword wpDeprecated update_usermeta contained
syn keyword wpDeprecated get_users_of_blog contained
syn keyword wpDeprecated automatic_feed_links contained
syn keyword wpDeprecated get_profile contained
syn keyword wpDeprecated get_usernumposts contained
syn keyword wpDeprecated funky_javascript_callback contained
syn keyword wpDeprecated funky_javascript_fix contained
syn keyword wpDeprecated is_taxonomy contained
syn keyword wpDeprecated is_term contained
syn keyword wpDeprecated is_plugin_page contained
syn keyword wpDeprecated update_category_cache contained
syn keyword wpDeprecated wp_timezone_supported contained
syn keyword wpDeprecated the_editor contained
syn keyword wpDeprecated get_user_metavalues contained
syn keyword wpDeprecated sanitize_user_object contained
syn keyword wpDeprecated get_boundary_post_rel_link contained
syn keyword wpDeprecated start_post_rel_link contained
syn keyword wpDeprecated get_index_rel_link contained
syn keyword wpDeprecated index_rel_link contained
syn keyword wpDeprecated get_parent_post_rel_link contained
syn keyword wpDeprecated parent_post_rel_link contained
syn keyword wpDeprecated wp_admin_bar_dashboard_view_site_menu contained
syn keyword wpDeprecated is_blog_user contained
syn keyword wpDeprecated debug_fopen contained
syn keyword wpDeprecated debug_fwrite contained
syn keyword wpDeprecated debug_fclose contained
syn keyword wpDeprecated get_themes contained
syn keyword wpDeprecated get_theme contained
syn keyword wpDeprecated get_current_theme contained
syn keyword wpDeprecated clean_pre contained
syn keyword wpDeprecated add_custom_image_header contained
syn keyword wpDeprecated remove_custom_image_header contained
syn keyword wpDeprecated add_custom_background contained
syn keyword wpDeprecated get_theme_data contained
syn keyword wpDeprecated update_page_cache contained
syn keyword wpDeprecated clean_page_cache contained
syn keyword wpDeprecated wp_explain_nonce contained
syn keyword wpDeprecated sticky_class contained
syn keyword wpDeprecated wp_load_image contained
syn keyword wpDeprecated image_resize contained
syn keyword wpDeprecated wp_get_single_post contained
syn keyword wpDeprecated user_pass_ok contained
syn keyword wpDeprecated gd_edit_image_support contained
syn keyword wpDeprecated wp_convert_bytes_to_hr contained
syn keyword wpDeprecated rich_edit_exists contained
syn keyword wpDeprecated default_topic_count_text contained
syn keyword wpDeprecated format_to_post contained
syn keyword wpDeprecated like_escape contained
syn keyword wpDeprecated url_is_accessable_via_ssl contained

" load.php 
syn keyword wpDeprecated wp_clone contained

" ms-functions.php 
syn keyword wpDeprecated install_blog_defaults contained

" ms-deprecated.php 
syn keyword wpDeprecated get_dashboard_blog contained
syn keyword wpDeprecated generate_random_password contained
syn keyword wpDeprecated is_site_admin contained
syn keyword wpDeprecated graceful_fail contained
syn keyword wpDeprecated get_user_details contained
syn keyword wpDeprecated clear_global_post_cache contained
syn keyword wpDeprecated is_main_blog contained
syn keyword wpDeprecated validate_email contained
syn keyword wpDeprecated get_blog_list contained
syn keyword wpDeprecated get_most_active_blogs contained
syn keyword wpDeprecated wpmu_admin_do_redirect contained
syn keyword wpDeprecated wpmu_admin_redirect_add_updated_param contained
syn keyword wpDeprecated get_user_id_from_string contained
syn keyword wpDeprecated get_blogaddress_by_domain contained

" cache.php 
syn keyword wpDeprecated wp_cache_reset contained


" Extend php.vim
syn cluster phpClConst add=wpFunction,wpClass,wpDeprecated

" Constants
syn match wpConstant "\vWP_[A-Z_]+"
syn match wpConstant "\vDB_[A-Z_]+"
syn match wpConstant "\v[A-Z_]+_KEY"
syn match wpConstant "\v[A-Z_]+_SALT"

syn cluster phpClConst add=wpConstant

" Highlighting
hi def link wpFunction Function
hi def link wpClass StorageClass
hi def link wpDeprecated Error
hi def link wpConstant Constant

" Done
let b:current_syntax = 'php.wordpress'
