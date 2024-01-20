<?php

namespace RSThemes\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

/**
 * *
 * Date: 24.01.17
 * Time: 10:52
 *
 * @property $id
 * @property $language_id
 * @property $slide_name
 * @property $slide_description
 * @property $slide_text_btn
 * @property $slide_text_btn_home
 * @property $slide_description_home
 * @property $slide_secondary_button_text
 */
class PromoBannerTranslationContent extends Model
{
    public $table = 'rsextension_translation_content';
    public $timestamps = false;
    public $fillable = [
        'id',
        'language_name',
        'slide_name',
        'slide_id',
        'slide_description',
        'slide_text_btn',
        'slide_text_btn_home',
        'slide_title_home',
        'slide_description_home',
        'slide_secondary_button_text',
        'slide_pagination_title_home'
    ];
}
