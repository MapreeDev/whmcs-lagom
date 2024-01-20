<?php

namespace RSThemes\Extensions;

use DI;
use Exception;
use http\Env\Request;
use RSThemes\Controller\Admin\MainController;
use RSThemes\Helpers\Flash;
use RSThemes\Models\Configuration;
use RSThemes\Models\PromoBannerSlide;
use RSThemes\Models\PromoBannerTranslationContent;
use RSThemes\Service\Util;
use RSThemes\View\ViewHelper;
use Smarty;
use const DS;
use WHMCS\Config\Setting;
use WHMCS\Language\ClientLanguage; 
use WHMCS\Database\Capsule;

class PromoBannersExtension extends Extension
{

    public $name = 'Promotion Manager';
    public $description = 'Manage and create custom banners in Lagom WHMCS theme, choose the placement and bost your sales.';
    public $version = '1.2.0';
    public $formFields = [
        'banner_close' => true,
        'banner_close_time' => 7
    ];

    private $slideConfig;
    private $imagePreviewId = '#rs-module #promo-slide-1-bg-image';
    private $imageWrapperPreview = '#rs-module #promo-slide-1-bg';

    const MODULE_ADDON = RSTHEMES_DIR;
    protected $module = self::MODULE_ADDON;

    public $uploadDirectory = ROOTDIR . DS . 'templates' . DS . 'lagom2' . DS . 'core' . DS . 'extensions' . DS . 'PromoBanners' . DS . 'uploads';


    public function handle(array $params = array())
    {

    }

    public function getDefaultLang()
    {
        return Capsule::table('tblconfiguration')->where('setting', 'language')->select('value')->first()->value;
    }

    public function getTplPath()
    {
        if (!$this->isActive()) {
            $name = 'info';
            if (isset($_GET['exaction'])) {
                $this->loadTables();
            }
        } else {
            $name = 'settings';
        }

        if (isset($_GET['exaction'])) {
            $name = filter_input(INPUT_GET, 'exaction');
        }
        if ($name == 'add') {
            return 'extensions/promobanners/edit';
        } else {
            return 'extensions/promobanners/' . $name;
        }
    }

    public function loadTables()
    {
            if (!Capsule::schema()->hasTable("rsextension_translation_content")) {
            Capsule::schema()->create("rsextension_translation_content", function ($table) {
                $table->increments('id');
                $table->string('language_name')->nullable();
                $table->integer('slide_id');
                $table->string('slide_name')->nullable();
                $table->text('slide_description')->nullable();
                $table->string('slide_text_btn')->default('Order / Learn More');
                $table->string('slide_text_btn_home')->default('Get Started Now');
                $table->string('slide_description_home')->default('');
                $table->string('slide_secondary_button_text')->default('Learn more');
                $table->string('slide_title_home')->default('');
                $table->string('slide_pagination_title_home')->nullable();
            });
        }

        if (!Capsule::schema()->hasTable("rsextension_promobanners_slides")) {
            Capsule::schema()->create("rsextension_promobanners_slides", function ($table) {
                $table->increments('id');
                $table->integer('import_id')->default(0);
                $table->text('slide_product_url')->nullable();
                $table->text('slide_product_url_home')->nullable();
                $table->string('slide_icon')->nullable();
                $table->string('slide_pagination_icon')->nullable();
                $table->string('slide_icon_custom')->nullable();
                $table->integer('slide_show')->default(1);
                $table->text('slide_options')->nullable();
                $table->integer('slide_type')->default(1);
                $table->integer('slide_order')->default(0);
                $table->integer('slide_begin_time')->nullable();
                $table->integer('slide_end_time')->nullable();
                $table->string('slide_secondary_button_url')->default('#');
            });
            $this->migratePromoBanner();
        }
    }
    
    public function loadConfig()
    {
        foreach ($this->formFields as $k => $value) {
            (new Configuration())->saveConfig($this->getKey($k), $value);
        }

        parent::loadConfig();
        $this->loadTables();
    }

    /*====== CRUD ======*/
    public function saveConfig($data)
    {
        if ($data['crud_action'] === 'update') {
            $this->updateSlide($data);
        } elseif ($data['crud_action'] === 'languageUpdate') {
            $this->updateLanguage($data);
        } elseif ($data['crud_action'] === 'delete') {
            PromoBannerSlide::find($data['id'])->delete();
            PromoBannerTranslationContent::where('slide_id', $data['id'])->delete();
        } elseif ($data['crud_action'] === 'sortable') {
            $slideItems = PromoBannerSlide::orderBy('slide_order', 'ASC')->get();
            $id = $data['id'];
            $sorting = $data['sorting'];
            foreach ($slideItems as $item) {
                return PromoBannerSlide::where('id', $id)->update(array('slide_order' => $sorting));
            }
            echo json_encode('Ok');
        } elseif ($data['crud_action'] === 'sortable_new') {
            //$slideItems = PromoBannerSlide::orderBy('slide_order', 'ASC')->get();
            $sorting = $data['sorting'];
            $sorting = explode(",", $sorting);
            foreach ($sorting as $index => $item) {
                PromoBannerSlide::where('id', $item)->update(array('slide_order' => $index));
            }
            die(json_encode('Ok'));
        } elseif ($data['crud_action'] === 'upload_images') {
            $this->uploadImages();
        } elseif ($data['crud_action'] === 'delete_image' && isset($data['name'])) {
            $this->deleteImage();
        } elseif ($data['crud_action'] === 'refresh') {
            $this->migratePromoBanner();
        } elseif ($data['crud_action'] === 'saveGlobalConfig') {
            $this->saveGlobalConfig($data);
        } elseif ($data['crud_action'] === 'update_extension') {
            $this->updateExtension();
        }
    }

    private function saveGlobalConfig($data)
    {
      
        (new Configuration())->saveConfig($this->getKey('banner_close'), $data['banner_close']);
        (new Configuration())->saveConfig($this->getKey('banner_close_time'), $data['banner_close_time']);

        Flash::setFlashMessage('success', 'Save changes successfull!');
        MainController::redirect((new ViewHelper())->url('Template@extension', ['templateName' => $this->template->getMainName(), 'extension' => $this->getLinkName(), 'exaction' => 'options']));

    }

    /*======== UPDATE ======*/
    private function updateSlide($data)
    {
        // Check options
        $options['promotion'] = $data['promotion'];
        $options['general'] = $data['general'];
        $options['config'] = $data['config'];

        if (strlen($data['icon_custom_tmp']) > 1) {
            $image = $data['icon_custom_tmp'];
        }

        $slide = PromoBannerSlide::updateOrCreate([
            'id' => $data['slide_id']
        ], [
            'slide_product_url' => $data['product_url'],
            'slide_product_url_home' => $data['product_url_home'],
            'slide_icon' => $data['icon'],
            'slide_icon_custom' => $image,
            'slide_options' => $options,
            'slide_begin_time' => strtotime($data['begin_time']),
            'slide_end_time' => strtotime($data['end_time']),
            'slide_show' => $data['show'],
            'slide_pagination_icon' => $data['pagination_icon'],
            'slide_secondary_button_url' => $data['secondary_button_url']
        ]);

        if ($slide->content()) {
            $slide->content()->updateOrCreate([
                'slide_id' => $slide->id,
                'language_name' => $data['language']
            ], [
                'language_name' => $data['language'],
                'slide_name' => $data['name'],
                'slide_description' => $data['description'],
                'slide_text_btn' => $data['text_btn'],
                'slide_text_btn_home' => $data['text_btn_home'],
                'slide_title_home' => $data['title_home'],
                'slide_description_home' => $data['description_home'],
                'slide_secondary_button_text' => $data['secondary_button_text'],
                'slide_pagination_title_home' => $data['pagination_title_home'],
            ]);
        }

        if ($data['slide_id']) {
            Flash::setFlashMessage('success', 'Save changes successfull!');
            MainController::redirect((new ViewHelper())->url('Template@extension', ['templateName' => $this->template->getMainName(), 'extension' => $this->getLinkName(), 'exaction' => 'edit', 'slide_id' => $data['slide_id']]));
        } else {
            Flash::setFlashMessage('success', 'Add promotion success!');
            MainController::redirect((new ViewHelper())->url('Template@extension', ['templateName' => $this->template->getMainName(), 'extension' => $this->getLinkName(), 'exaction' => 'settings']));
        }
    }

    /*======== UPDATE Language AJAX =======*/
    private function updateLanguage($data)
    {
        $content = $this->getSlideContent($data['language'], $data['langId']);
        $json = [
            'result' => 'success',
            'content' => $content
        ];
        header('Content-Type: application/json');
        echo json_encode($json);
        die();
    }

    /*======== DELETE =======*/
    private function deleteSlide($data)
    {
        dd($data);
    }

    public function getSlides()
    {
        return PromoBannerSlide::orderBy('slide_order', 'ASC')->get();
    }

    public function getHomepageSlides()
    {
        return PromoBannerSlide::where('slide_show', 1)->where('slide_options', 'like', '%"homepage":"1"%')->orderBy('slide_order', 'ASC')->get();
    }

    public function getSlideContent($language = null, $moveId = null)
    {
        if (isset($_GET['slide_id'])) {
            $id = filter_input(INPUT_GET, 'slide_id');
        } else {
            $id = $moveId;
        }

        if ($language === null) {
            $language = $this->getDefaultLang();
        }
        if (PromoBannerSlide::find($id)) {
            return PromoBannerSlide::find($id)->content()->where('language_name', $language)->first();
        } else {
            return '';
        }
    }

    public function getSlideConfig()
    {
        if (isset($_GET['slide_id'])) {
            $id = filter_input(INPUT_GET, 'slide_id');
        } else {
            $id = null;
        }

        if (PromoBannerSlide::find($id)) {
            return PromoBannerSlide::find($id);
        } else {
            return false;
        }

    }

    public function getLanguages()
    {
        return $availableLanguages = \WHMCS\Language\ClientLanguage::getLanguages();
    }

    public function getUploadImage($slideConfig)
    {
        return \RSThemes\Service\WhmcsHelper::getSystemUrl() . DS . 'templates' . DS . $this->template->getMainName() . DS . 'core' . DS . 'extensions' . DS . 'PromoBanners' . DS . 'uploads' . DS . $slideConfig->slide_icon_custom;
    }

    public function getProducts()
    {
        return \WHMCS\Product\Product::all();
    }

    public function getProductGroup()
    {
        return \WHMCS\Product\Group::all();
    }

    private function migratePromoBanner()
    {
        $pdo = Capsule::connection()->getPdo();
        $pdo->beginTransaction();

        $statement = $pdo->prepare(
            'SELECT `tblmarketconnect_services`.`id`, `tblproducts`.`configoption1`, `tblproductgroups`.`id` as `groupid`, `tblmarketconnect_services`.`name`, `tblmarketconnect_services`.`settings`,`tblproductgroups`.`tagline`, `tblproductgroups`.`headline`, `tblproductgroups`.`name` as `tabname` FROM `tblproductgroups` INNER JOIN `tblproducts` ON `tblproducts`.`gid` = `tblproductgroups`.`id` INNER JOIN `tblmarketconnect_services` ON `tblmarketconnect_services`.`product_ids` COLLATE utf8_unicode_ci LIKE CONCAT(\'%\',`tblproducts`.`configoption1`, \'%\') WHERE `tblproductgroups`.`tagline` != \'\' AND `tblmarketconnect_services`.`status` = 1 AND `tblproducts`.`configoption1` != \'\' GROUP BY `tblmarketconnect_services`.`id`'
        );
        $statement->execute();
        $list = $statement->fetchAll();
        foreach ($list as $single) {
            if (PromoBannerSlide::where('import_id', $single['id'])->count() > 0)
                continue;

            $name = "";
            if ($single['name'] == "symantec")
                $name = "SSL";
            else if ($single['name'] == "weebly")
                $name = "Weebly";
            else if ($single['name'] == "sitelock")
                $name = "SiteLock";
            else if ($single['name'] == "spamexperts")
                $name = "Email Security";
            else if ($single['name'] == "codeguard")
                $name = "CodeGuard";
            else
                $name = $single['tabname'];

            $statement = $pdo->prepare(
                'insert into `rsextension_promobanners_slides` (`slide_product_url`, `slide_options`,`slide_icon` , `slide_pagination_icon`,`import_id`, `slide_secondary_button_url` , `slide_product_url_home`) values (:gid, :settings, :icon, :pagination_icon , :import_id , :secondary_button_url , :product_url_home)'
            );
            $url = Capsule::table('tblconfiguration')->where('setting', 'SystemURL')->first();
            $storeUrl = '';
            $paginationName = '';
            if ($single['name'] == "symantec") {
                $storeUrl = $url->value . 'index.php?rp=/store/ssl-certificates';
                $paginationName = "SSL Certificates";
            } else if ($single['name'] == "weebly") {
                $storeUrl = $url->value . 'index.php?rp=/store/website-builder';
                $paginationName = "Weebly Website Builder";
            } else if ($single['name'] == "sitelock") {
                $storeUrl = $url->value . 'index.php?rp=/store/sitelock';
                $paginationName = "SiteLock";
            } else if ($single['name'] == "spamexperts") {
                $storeUrl = $url->value . 'index.php?rp=/store/email-services';
                $paginationName = "Email Spam Filtering";
            } else if ($single['name'] == "codeguard") {
                $storeUrl = $url->value . 'index.php?rp=/store/codeguard';
                $paginationName = "CodeGuard";
            } else {
                $paginationName = $single['tabname'];
            }
            $settings = json_decode($single['settings']);
            $settings->config->graphic_type = "pre_lagom_icon";
            $settings = json_encode($settings);
            $statement->execute(
                [
                    ':gid' => $storeUrl,
                    ':settings' => $settings,
                    ':icon' => $single['name'],
                    ':pagination_icon' => $single['name'],
                    ':import_id' => $single['id'],
                    ':secondary_button_url' => $storeUrl,
                    ':product_url_home' => $url->value . 'cart.php?gid=' . $single['groupid'],
                ]
            );

            $insertTranslation = $pdo->prepare(
                'insert into `rsextension_translation_content` (`language_name`, `slide_id`, `slide_name`, `slide_description` , `slide_description_home` , `slide_title_home`, `slide_pagination_title_home`) values (\'english\', :id, :name, :desc , :desc_home , :title_home, :pagination_title_home)'
            );
            $insertTranslation->execute(
                [
                    ':id' => $pdo->lastInsertId(),
                    ':name' => $name,//$single['tabname']
                    ':desc' => $single['headline'] . " - " . $single['tagline'],
                    ':desc_home' => $single['tagline'],
                    ':pagination_title_home' => $paginationName,
                    ':title_home' => $single['headline']
                ]
            );
        }
        $pdo->commit();
    }

    private function hrSize($bytes, $decimals = 2) // Human Readable size
    {
        $size = array('B', 'kB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
        $factor = floor((strlen($bytes) - 1) / 3);
        return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)) . @$size[$factor];
    }

    private function better_scandir($dir, $sorting_order = SCANDIR_SORT_ASCENDING)
    {

        $excluded_files = ['why-you-need-a-professional-incoming-filter.tpl', 'why-choose-spam-experts-incoming-filter.tpl', 'outgoing-filter-2.tpl', 'outgoing-filter-1.tpl', 'paypal.tpl', 'stripe.tpl', 'gateway-cc.tpl', 'gateway-banktransfer.tpl', 'gateway-paypal.tpl', 'gateway-tco.tpl', 'gateway-stripe.tpl', 'how-it-works.tpl', 'incoming-filter-3.tpl', 'incoming-filter-2.tpl', 'incoming-filter-1.tpl', 'archiving-1.tpl', 'archiving-2.tpl'];

        $files = array();
        foreach (scandir($dir, $sorting_order) as $file) {
            if ($file[0] === '.' || in_array($file, $excluded_files)) {
                continue;
            }
            $files[$file] = filemtime($dir . '/' . $file);
        }
        if ($sorting_order == SCANDIR_SORT_ASCENDING) {
            asort($files, SORT_NUMERIC);
        } else {
            arsort($files, SORT_NUMERIC);
        }
        $ret = array_keys($files);
        return ($ret) ? $ret : false;
    }

    function getDirContents($type = 'default', $ajax = false)
    {
        if ($type == 'default')
            $directory = __DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'templates' . DIRECTORY_SEPARATOR . $this->template->getMainName() . DIRECTORY_SEPARATOR . 'assets' . DIRECTORY_SEPARATOR . 'svg-illustrations' . DIRECTORY_SEPARATOR . 'products';
        elseif ($type == 'lagom-icons') {
            $directory = __DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'templates' . DIRECTORY_SEPARATOR . $this->template->getMainName() . DIRECTORY_SEPARATOR . 'assets' . DIRECTORY_SEPARATOR . 'svg-icon';
        } else {
            $directory = __DIR__ . DS . '..' . DS . '..' . DS . '..' . DS . '..' . DS . '..' . DS . 'templates' . DS . $this->template->getMainName() . DS . 'core' . DS . 'extensions' . DS . 'PromoBanners' . DS . 'uploads';;
        }
        $results = [];
        $files = $this->better_scandir($directory, SCANDIR_SORT_DESCENDING);   
        foreach ($files as $key => $value) {
            $path = realpath($directory . DIRECTORY_SEPARATOR . $value);
            if (!is_dir($path)) {
                $pathinfo = pathinfo($value);
                $filesize = filesize($path);
                $results[] = ['filename' => $pathinfo['filename'], 'ext' => $pathinfo['extension'], 'hrsize' => $this->hrSize($filesize), 'size' => $filesize, 'fullName' => $pathinfo['filename'] . '.' . $pathinfo['extension']];
            } else if ($value != "." && $value != "..") {
                //getDirContents($path, $results);
                $results[] = ['path' => $value, 'size' => filesize($path)];
            }
        }
        
        if ($ajax) {
            header('Content-Type: application/json');
            echo json_encode($results);
            die();
        } else {
            return $results;
        }

    }

    public function uploadImages()
    {
        if (!empty($_FILES)) {
            if (!file_exists($this->uploadDirectory))
            {
                $oldmask = umask(000);
                mkdir($this->uploadDirectory, 0777);
                umask($oldmask);
            }

            if (!is_writable($this->uploadDirectory)) {
                Flash::setFlashMessage('danger', 'Writable permissions are required on \'uploads\' directory. ( ' . $this->uploadDirectory . ' )');
                MainController::redirect((new ViewHelper())->url('Template@extension', ['templateName' => $this->template->getMainName(), 'extension' => $this->getLinkName(), 'exaction' => 'media']));
            }
            $total = count($_FILES['images']['name']);
           
            for ($i = 0; $i < $total; $i++) {
                $mediaSize = 0;
                $mediaSize = $mediaSize + $_FILES['images']['size'][$i]; //image size is 0 when about max file size in php.ini file
                if ($mediaSize > $this->return_bytes($this->max_upload()) || $mediaSize == 0) {
                    Flash::setFlashMessage('danger', "The image {$_FILES['images']['name'][$i]} is too big. Maximum file size is {$this->max_upload()}");
                    MainController::redirect((new ViewHelper())->url('Template@extension', ['templateName' => $this->template->getMainName(), 'extension' => $this->getLinkName(), 'exaction' => 'media']));
                }
                $tempFile = $_FILES['images']['tmp_name'][$i];
                $imageExtension = pathinfo($_FILES['images']['name'][$i], PATHINFO_EXTENSION);
                if ($imageExtension !== 'svg' && !is_array(getimagesize($tempFile))) {
                    Flash::setFlashMessage('danger', 'Image is not correct, please upload correct file.');
                    MainController::redirect((new ViewHelper())->url('Template@extension', ['templateName' => $this->template->getMainName(), 'extension' => $this->getLinkName(), 'exaction' => 'media']));
                }
                $location = $this->uploadDirectory . '/' . $_FILES['images']['name'][$i];
                move_uploaded_file($tempFile, $location);
                Flash::setFlashMessage('success', 'Image upload success!');
                MainController::redirect((new ViewHelper())->url('Template@extension', ['templateName' => $this->template->getMainName(), 'extension' => $this->getLinkName(), 'exaction' => 'media']));
            }

        }
    }

    public function deleteImage()
    {
        if (isset($_POST["name"])) {
            $filename = $this->uploadDirectory . '/' . basename($_POST["name"]);
            unlink($filename);
        }
    }

    public function extensoin_path()
    {
        return \RSThemes\Service\WhmcsHelper::getSystemUrl() . str_replace(ROOTDIR, '', $this->module . DS . 'views' . DS . 'adminarea' . DS . 'extensions' . DS . 'promobanners');
    }

    public function assets_path()
    {
        $directory = __DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'templates' . DIRECTORY_SEPARATOR . $this->template->getMainName() . DIRECTORY_SEPARATOR . 'assets';
        return $directory;
    }

    public function getConfig($name = null)
    {
        $keyName = $this->key . $name;
        return (new Configuration())->getConfig($keyName);
    }

    public function removeConfig()
    {
        if (isset($_GET['delete'])) {
            foreach ($this->formFields as $field) {
                (new Configuration())->removeConfig($this->getKey($field));
            }

            Capsule::statement('drop table rsextension_promobanners_slides');
            Capsule::statement('drop table rsextension_translation_content');
        }
        parent::removeConfig();
    }

    public function max_upload()
    {
        return ini_get('upload_max_filesize');
    }

    private function return_bytes($val)
    {
        $val = trim($val);

        if (is_numeric($val))
            return $val;

        $last = strtolower($val[strlen($val) - 1]);
        $val = substr($val, 0, -1); // necessary since PHP 7.1; otherwise optional

        switch ($last) {
            // The 'G' modifier is available since PHP 5.1.0
            case 'g':
                $val *= 1024;
            case 'm':
                $val *= 1024;
            case 'k':
                $val *= 1024;
        }

        return $val;
    }

    public function renderPromotionStyles($direction = 'h')
    {
        $slides = [];
        $divSetup = [];
        if ($direction == 'index') {
            $slides = PromoBannerSlide::where('slide_show', 1)->where('slide_options', 'like', '%"homepage":"1"%')->orderBy('slide_order', 'ASC')->get();
            $divSetup = [
                "cssBackgroundGraphic" => '.site .site-banner .slider-background #slider-slide-%slideid%-bg{',
                "cssBackgroundGraphicImg" => '.site .site-banner .slider-background #slider-slide-%slideid%-bg #slider-slide-%slideid%-bg-image{',
            ];
        } elseif ($direction === 'v') {
            $slides = PromoBannerSlide::where('slide_show', 1)->where('slide_options', 'like', '%"product-details":"1"%')->orWhere('slide_options', 'like', '%"product-list":"1"%')->orderBy('slide_order', 'ASC')->get();
            $divSetup = [
                "cssBackgroundGraphic" => '#Promotion .promo-slider-background #promo-slide-%slideid%-bg{',
                "cssBackgroundGraphicImg" => "#Promotion .promo-slider-background #promo-slide-%slideid%-bg #promo-slide-%slideid%-bg-image{",
            ];
        } else {
            $slides = PromoBannerSlide::where('slide_show', 1)->where('slide_options', 'like', '%"client-home":"1"%')->orWhere('slide_options', 'like', '%"cart-view":"1"%')->orderBy('slide_order', 'ASC')->get();
            $divSetup = [
                "cssBackgroundGraphic" => '#Promotion .promo-slider-background #promo-slide-%slideid%-bg{',
                "cssBackgroundGraphicImg" => "#Promotion .promo-slider-background #promo-slide-%slideid%-bg #promo-slide-%slideid%-bg-image{",
            ];
        }

        $containerSelector = ['justify-content', 'align-items'];
        $gradient = '';
        $iconWrapperStyle = '';
        $iconStyle = '';

        $backgroundWrapperIconStyle = '';
        $backgroundIconStyle = '';


        $cssBackgroundGraphic = '';
        $cssBackgroundGraphicImg = '';
        $cssVerticalContentData = '';
        $paddingTopIcon = '';

        foreach ($slides as $k => $slide) {
            // Graphic BACKGROUND
            if ($slide->slide_options['config']['graphic_type'] === 'background') {
                //' . $slide->id . '
                $cssBackgroundGraphic .= str_replace("%slideid%", $slide->id, $divSetup['cssBackgroundGraphic']);
                $cssBackgroundGraphicImg .= str_replace("%slideid%", $slide->id, $divSetup['cssBackgroundGraphicImg']);
                foreach ($slide->slide_options['config']['graphic'][$direction] as $selector => $value) {
                    if (empty($value)) continue;
                    else if ($direction === "v" && $selector === "top-spacing") {
                        $cssVerticalContentData .= "#Promotion .promo-slider-slides #promo-slide-" . $slide->id . " .promo-slider-body .promo-slider-content{margin-top:$value;}";
                    } else if (in_array($selector, $containerSelector)) {
                        $cssBackgroundGraphic .= "$selector:$value;";
                    } else {
                        if ($selector === 'opacity') {
                            $value = $value / 100;
                        }
                        $cssBackgroundGraphicImg .= "$selector:$value;";
                    }
                }
                $cssBackgroundGraphic .= "}";
                $cssBackgroundGraphicImg .= "}";
            } elseif ($slide->slide_options['config']['graphic_type'] === 'custom_icon') {
                if ($direction == 'index') {
                    $backgroundWrapperIconStyle .= '.site .site-banner .slider-wrapper .slider-slides #slider-slide-' . $slide->id . ' .banner-graphic {';
                    $backgroundIconStyle .= '.site .site-banner .slider-wrapper .slider-slides #slider-slide-' . $slide->id . ' .banner-graphic .banner-custom-icon  {';
                } else {
                    $backgroundWrapperIconStyle .= '#Promotion #promo-slide-' . $slide->id . '-icon-wrapper {';
                    $backgroundIconStyle .= '#Promotion #promo-slide-' . $slide->id . '-icon{';
                }
                foreach ($slide->slide_options['config']['icon'][$direction] as $selector => $value) {
                    if (empty($value)) continue;
                    if (in_array($selector, $containerSelector)) {
                        $backgroundWrapperIconStyle .= $selector . ':' . $value . ';';
                    } else {
                        $backgroundIconStyle .= $selector . ':' . $value . ';';
                    }
                }
                $backgroundWrapperIconStyle .= "display:flex;}";
                $backgroundIconStyle .= "}";
            } else {
                $paddingTopIcon .= "#Promotion #promo-slide-" . $slide->id . "{padding-top:0;}";
            }
            $gradientValue = $slide->slide_options['config']['color'] . ',' . $slide->slide_options['config']['color2'];
            if ($direction == "index")
                $gradient .= '.site .site-banner .slider-background #slider-slide-' . $slide->id . '-bg{background:linear-gradient(90deg,' . $gradientValue . ');}';
            else
                $gradient .= '#Promotion .promo-slider-background #promo-slide-' . $slide->id . '-bg{background:linear-gradient(90deg,' . $gradientValue . ');}';
        }
        return $gradient . $cssBackgroundGraphic . $cssBackgroundGraphicImg . $iconWrapperStyle . $backgroundIconStyle . $backgroundWrapperIconStyle . $cssVerticalContentData . $paddingTopIcon;
    }

    public function checkStructureUpdateNeeded()
    {
        //return true;
        //rsextension_promobanners_slides rsextension_translation_content
        $pdo = Capsule::connection()->getPdo();
        $pdo->beginTransaction();
        $amount = $pdo->query("SHOW COLUMNS FROM `rsextension_promobanners_slides` LIKE 'slide_pagination_title_home'");
        $amount = $amount->fetch();
        $pdo->commit();
        return (bool)$amount;
    }

    private function updateStructure()
    {
        if (!$this->checkStructureUpdateNeeded()) return false;
        $pdo = Capsule::connection()->getPdo();
        $pdo->beginTransaction();
        $pdo->query("ALTER TABLE `rsextension_translation_content` ADD slide_pagination_title_home VARCHAR(255) NULL");
        $statement = $pdo->prepare(
            'SELECT `slide_pagination_title_home`,`slide_options`,`slide_icon_custom`,`id` FROM `rsextension_promobanners_slides`'
        );
        $statement->execute();
        $list = $statement->fetchAll();
        foreach ($list as $single) {
            $options = json_decode($single['slide_options']);
            if (!empty($single['slide_icon_custom']))
                $options->config->graphic_type = "background";
            else
                $options->config->graphic_type = "pre_lagom_icon";
            $options = json_encode($options);
            $insertTranslation = $pdo->prepare(
                'UPDATE `rsextension_translation_content` SET `slide_pagination_title_home` = :slide_pagination_title_home WHERE `id`=:id'
            );
            $insertTranslation->execute(
                [
                    ':id' => $single['id'],
                    ':slide_pagination_title_home' => $single['slide_pagination_title_home']
                ]
            );
            $insertOptions = $pdo->prepare(
                'UPDATE `rsextension_promobanners_slides` SET `slide_options` = :slide_options WHERE `id`=:id'
            );
            $insertOptions->execute(
                [
                    ':id' => $single['id'],
                    ':slide_options' => $options
                ]
            );
        }
        $pdo->query("ALTER TABLE rsextension_promobanners_slides DROP slide_pagination_title_home");
        return true;
    }

    public function updateExtension()
    {
        //$this->checkStructureUpdateNeeded();
        $this->updateStructure();
        Flash::setFlashMessage('success', 'Update has been successfull!');
        MainController::redirect((new ViewHelper())->url('Template@extension', ['templateName' => $this->template->getMainName(), 'extension' => $this->getLinkName(), 'exaction' => 'settings']));
    }

}
