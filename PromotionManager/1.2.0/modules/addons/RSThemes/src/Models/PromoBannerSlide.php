<?php

namespace RSThemes\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use WHMCS\Database\Capsule;

/**
 * *
 *
 * @property $id
 * @property $slide_product_url
 * @property $slide_icon
 * @property $slide_icon_custom
 * @property $slide_show
 * @property $slide_options
 * @property $slide_secondary_button_url
 */
class PromoBannerSlide extends Model
{
    protected $table = 'rsextension_promobanners_slides';
    public $timestamps = false;
    const MODULE_ADDON = RSTHEMES_DIR;
    protected $module = self::MODULE_ADDON;
    protected $uploadDirectory = '/PromoBannersUploads/';
    protected $fillable = [
        'id',
        'slide_product_url',
        'slide_product_url_home',
        'slide_icon',
        'slide_pagination_icon',
        'slide_icon_custom',
        'slide_show',
        'slide_text_btn',
        'slide_options',
        'slide_end_time',
        'slide_begin_time',
        'slide_secondary_button_url'
    ];

    protected $casts = [
        'slide_options' => 'array',
    ];

    function getSlideProductUrlAttribute($value)
    {
        return trim($value);
    }

    public function getLanguage()
    {
        return Capsule::table('tblconfiguration')->where('setting', 'language')->select('value')->first()->value;
    }

    public function content()
    {
        return $this->hasMany(PromoBannerTranslationContent::class, 'slide_id', 'id');
    }

    public function getField($field = 'slide_name', $language = null)
    {
        if ($language === null) {
            $language = $this->getLanguage();
        }
        $data = '';
        if ($this->content()->where('language_name', $language)->first()->$field) {
            $data = $this->content()->where('language_name', $language)->first()->$field;
        } else {
            $data = $this->content()->where('language_name', 'english')->first()->$field;
        }
        return $data;
    }

    public function getImageUrl()
    {
        return \RSThemes\Service\WhmcsHelper::getSystemUrl() . DS . 'templates' . DS . 'lagom' . DS . 'core' . DS . 'extensions' . DS . 'PromoBanners' . DS . 'uploads' . DS . $this->slide_icon_custom;
    }

}
