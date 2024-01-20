<?php
/*
 * @ Babia.to
 * @ Nulled by @eshaltech
 */

namespace RSThemes\Template;

/**
 * Class License
 * @package RSThemes\Template
 */
class License
{
    /** @var string $licenseKey */
    public $licenseKey = "";
    /** @var int $licenseFailDays */
    public $licenseFailDays = 30;
    /** @var int $licenseFailWarningDays */
    public $licenseFailWarningDays = 3;
    /** @var Template $template */
    public $template = NULL;
    /** @var string $templateName */
    public $templateName = NULL;
    /** @var bool $forceRemoteCheck */
    public $forceRemoteCheck = false;
    /** @var string $licenseKeyName */
    private $licenseKeyName = NULL;
    /** @var string $licenseSecretKey */
    private $licenseSecretKey = NULL;
    /** @var string $licenseConfigKey */
    private $licenseConfigKey = NULL;
    /** @var array $lastRemoteCheck */
    private $activationCache = [];
    /** @var array $licenseDetails */
    private $licenseDetails = ["status" => "", "service_status" => "Active", "license_status" => "Active", "nextduedate" => "2099-10-01", "version" => "1.0.0", "fullversion" => "1.0.0", "lastRemoteChecked" => "2099-10-01", "lastRemoteCheckedFail" => "", "lastRemoteCheckedSuccess" => "2099-10-01", "regdate" => "2023-10-01", "first_payment_amount" => "$0", "recuring_amount" => "$0", "payment_method" => "XtremeHosters.Com", "warningShowDate" => "", "deactivationDate" => "2099-10-01"];
    /** @var array $rawLicenseDetails */
    private $rawLicenseDetails = NULL;
    /** @var string $licenseEncoded */
    private $licenseEncoded = NULL;
    /** @var string $licenseWarningKey */
    private $licenseWarningKey = NULL;
    /** @var string $licenseWarningMessage */
    private $licenseWarningMessage = NULL;
    /** @var bool $debug */
    private $debug = false;
    /**
     * @var string
     */
    private $checkLicenseHour = NULL;
    /** @var string $licenseServerUrl */
    public static $licenseServerUrl = "https://rsstudio.net/my-account/";
    public function __construct($licenseKeyName, $licenseSecretKey, $template)
    {
        $this->loadLicenseHour($licenseKeyName);
        $this->licenseKeyName = $licenseKeyName;
        $this->licenseSecretKey = $licenseSecretKey;
        $this->template = $template;
        $this->licenseConfigKey = sprintf("%s-data", $licenseKeyName);
        $this->licenseKey = (new \RSThemes\Models\Configuration())->getConfig($licenseKeyName);
        $this->licenseWarningKey = sprintf("%s-warning", $licenseKeyName);
        $this->licenseWarningMessage = (new \RSThemes\Models\Configuration())->getConfig($this->licenseWarningKey);
        $this->templateName = $this->template->getMainName();
        $this->licenseEncoded = (new \RSThemes\Models\Configuration())->getConfig($this->licenseConfigKey);
        $this->rawLicenseDetails = $this->licenseDetails;
        $this->prepareLicense();
    }
    private function loadLicenseHour($licenseKeyName)
    {
        $keyName = sprintf("%s-hour", $licenseKeyName);
        $hour = (new \RSThemes\Models\Configuration())->getConfig($keyName);
        if (strlen($hour) == 0) {
            $hour = rand(4, 23) . ":" . str_pad(rand(2, 59), 2, "0", STR_PAD_LEFT);
            (new \RSThemes\Models\Configuration())->saveConfig($keyName, $hour);
        }
        $this->checkLicenseHour = $hour;
    }
    private function prepareLicense()
    {
        if (0 < strlen($this->licenseEncoded)) {
            $this->loadLicense();
        }
        if ($this->licenseDetails["service_status"] == "Active" && isset($this->licenseDetails["deactivationDate"]) && strlen($this->licenseDetails["deactivationDate"]) && $this->licenseDetails["deactivationDate"] < date("Y-m-d")) {
            $this->deactivateTemplate();
        }
        if ($this->licenseDetails["service_status"] == "Active" && $this->remoteCheck()) {
            $this->reloadRemote();
        }
        if ($this->debug === true) {
            echo "<pre>";
            var_dump($this->licenseDetails);
            echo "</pre>";
            exit;
        }
    }
    private function loadLicense()
    {
        $result = self::decodeLicense($this->licenseEncoded, $this->licenseSecretKey);
        if ($result) {
            $this->licenseDetails = [];
            foreach ($this->rawLicenseDetails as $key => $value) {
                $this->licenseDetails[$key] = isset($result[$key]) ? $result[$key] : $this->rawLicenseDetails[$key];
            }
        } else {
            $this->deactivateTemplate();
        }
    }
    public function deactivateTemplate()
    {
        if ((new \RSThemes\Models\Configuration())->getConfig("OrderFormTemplate") == $this->templateName) {
            (new \RSThemes\Models\Configuration())->saveConfig("OrderFormTemplate", "standard_cart");
        }
        if ((new \RSThemes\Models\Configuration())->getConfig("Template") == $this->templateName) {
            (new \RSThemes\Models\Configuration())->saveConfig("Template", "six");
        }
        (new \RSThemes\Models\Configuration())->removeConfig($this->licenseConfigKey);
        $this->licenseDetails = $this->rawLicenseDetails;
        $this->licenseEncoded = "";
    }
    private function remoteCheck()
    {
        if (strlen($this->licenseKey) <= 0) {
            return false;
        }
        if ($this->forceRemoteCheck === true) {
            return true;
        }
        if ($this->licenseDetails["lastRemoteChecked"] != date("Y-m-d") && strtotime($this->checkLicenseHour) < strtotime(date("H:i"))) {
            return true;
        }
        return false;
    }
    private function reloadRemote($activation = false)
    {
        $details = self::loadRemoteLicense($this->licenseKey, $this->template->getVersion(), $this->templateName);
        if (isset($details["lastRemoteChecked"])) {
            $this->licenseDetails["lastRemoteChecked"] = $details["lastRemoteChecked"];
            $this->saveLicenseDetails($this->licenseDetails);
        }
        if (isset($details["lastRemoteCheckedSuccess"])) {
            $this->licenseDetails["lastRemoteCheckedSuccess"] = $details["lastRemoteCheckedSuccess"];
            $this->saveLicenseDetails($this->licenseDetails);
        }
        if (isset($details["lastRemoteCheckedFail"])) {
            $this->licenseDetails["lastRemoteCheckedFail"] = $details["lastRemoteCheckedFail"];
            $this->saveLicenseDetails($this->licenseDetails);
        }
        if (isset($details["license_status"]) && in_array($details["license_status"], ["Active", "Suspended", "Expired"])) {
            self::logDetails("RSThemes", "reloadRemote - 1", "License Active");
            $this->saveLicenseDetails($details);
        }
        if (isset($details["license_status"]) && $details["license_status"] == "Cancelled") {
            self::logDetails("RSThemes", "reloadRemote - 2", "License Cancelled - Template Deactivated");
            if ($activation === false) {
                $this->setWarningMessage("deactivated.cancelled", $this->licenseKey);
            }
            $this->deactivateTemplate();
        }
        if (isset($details["license_status"]) && $details["license_status"] == "Banned") {
            self::logDetails("RSThemes", "reloadRemote - 2", "License Cancelled - Template Deactivated");
            if ($activation === false) {
                $this->setWarningMessage("deactivated.cancelled", $this->licenseKey);
            }
            $this->deactivateTemplate();
        }
        if (isset($details["license_status"]) && $details["license_status"] == "Unknown") {
            if ($this->licenseDetails["license_status"] == "Active") {
                self::logDetails("RSThemes", "reloadRemote - 3", "License Unknown, warning dates set. ");
                $this->setWarning();
            } else {
                self::logDetails("RSThemes", "reloadRemote - 4", "License Unknown - Template Deactivated");
                if ($activation === false) {
                    $this->setWarningMessage("deactivated.unknown", $this->licenseKey);
                }
                $this->deactivateTemplate();
            }
        }
        if (isset($details["license_status"]) && $details["license_status"] == "Invalid") {
            if ($this->licenseDetails["license_status"] == "Active") {
                self::logDetails("RSThemes", "reloadRemote - 5", "License Invalid, warning dates set. ");
                $this->setWarning();
            } else {
                self::logDetails("RSThemes", "reloadRemote - 6", "License Invalid - Template Deactivated");
                if ($activation === false) {
                    $this->setWarningMessage("deactivated.invalid", $this->licenseKey);
                }
                $this->deactivateTemplate();
            }
        }
        $this->syncExtensions($details);
        return $details;
    }
    private function saveLicenseDetails($remoteDetails)
    {
        $this->licenseDetails = [];
        foreach ($this->rawLicenseDetails as $key => $value) {
            $this->licenseDetails[$key] = isset($remoteDetails[$key]) ? $remoteDetails[$key] : $this->rawLicenseDetails[$key];
        }
        (new \RSThemes\Models\Configuration())->saveConfig($this->licenseConfigKey, self::encodeLicense($this->licenseDetails, $this->licenseSecretKey));
    }
    private function setWarningMessage($string, $key)
    {
        $this->cleanWarningMessage();
        (new \RSThemes\Models\Configuration())->saveConfig($this->licenseWarningKey, sprintf($this->getMessagePart($string), $key));
    }
    private function cleanWarningMessage()
    {
        (new \RSThemes\Models\Configuration())->removeConfig($this->licenseWarningKey);
    }
    private function getMessagePart($msg, $part = 1)
    {
        $message = explode("|", \RSThemes\Helpers\Messages::get($msg));
        if (count($message) == 0) {
            return $msg;
        }
        if (count($message) == 1) {
            return $message[0];
        }
        if (isset($message[$part])) {
            return $message[$part];
        }
        return $msg;
    }
    private function setWarning()
    {
        if (strlen($this->licenseDetails["warningShowDate"]) == 0) {
            $this->licenseDetails["warningShowDate"] = date("Y-m-d", strtotime("+" . $this->licenseFailWarningDays . " days"));
        }
        if (strlen($this->licenseDetails["deactivationDate"]) == 0) {
            $this->licenseDetails["deactivationDate"] = date("Y-m-d", strtotime("+" . $this->licenseFailDays . " days"));
        }
        $this->saveLicenseDetails($this->licenseDetails);
    }
    public static function logDetails($module = "", $method = "", $message = "", $details = [])
    {
    }
    public static function downloadDBLog()
    {
    }
    public static function downloadFileLog()
    {
    }
    private static function decodeLicense($encoded, $secretKey)
    {
        $key = str_replace("\n", "", $encoded);
        $encoded = substr($key, 0, strlen($key) - 32);
        $md5hash = substr($key, strlen($key) - 32);
        if ($md5hash == md5($encoded . $secretKey)) {
            $encoded = strrev($encoded);
            $encoded = substr($encoded, 32);
            $encoded = base64_decode($encoded);
            return unserialize($encoded);
        }
        return false;
    }
    private static function encodeLicense($details, $secretKey)
    {
        $data = serialize($details);
        $data = base64_encode($data);
        $data = md5(date("Ymd") . $secretKey) . $data;
        $data = strrev($data);
        $data = $data . md5($data . $secretKey);
        $data = wordwrap($data, 80, "\n", true);
        return $data;
    }
    private static function loadRemoteLicense($licenseKey, $version, $templateName)
    {
        if (empty($_SERVER["SERVER_NAME"])) {
            $results = [];
            $results["emptyServerName"] = true;
            return $results;
        }
        $verifyFilePath = "modules/servers/RSLicensing/verify.php";
        $licenseFields = ["licensekey" => $licenseKey, "domain" => self::getDomain(), "ip" => "", "dir" => self::getDirPath(), "version" => $version, "cron" => \RSThemes\Helpers\AddonHelper::isCliMode(), "template" => $templateName];
        $query = "";
        foreach ($licenseFields as $k => $v) {
            $query .= $k . "=" . urlencode($v) . "&";
        }
        $results = [];
        $results["lastRemoteChecked"] = date("Y-m-d");
        if (function_exists("curl_exec")) {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, self::$licenseServerUrl . $verifyFilePath);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $query);
            curl_setopt($ch, CURLOPT_TIMEOUT, 15);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            $data = curl_exec($ch);
            $responseCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);
            preg_match_all("~<validip>(.*?)</validip>~", $data, $m);
            $licenseFields["ip"] = $m[1][0];
            if ($responseCode != 200) {
                $results["lastRemoteCheckedFail"] = date("Y-m-d");
                $results["status"] = "Active";
                $results["service_status"] = "Active";
                $results["license_status"] = "Active";
                $results["message"] = "Remote Check License Failed";
                $results["messagecode"] = "errors.9";
                self::logDetails("RSThemes", "checkRemoteLicense-2", $licenseFields, $results, $data);
            } else {
                preg_match_all("/<(.*?)>([^<]+)<\\/\\1>/i", $data, $matches);
                foreach ($matches[1] as $k => $v) {
                    $results[$v] = $matches[2][$k];
                }
                $results["lastRemoteCheckedSuccess"] = date("Y-m-d");
            }
            $results["remoteChecked"] = true;
            self::logDetails("RSThemes", "checkRemoteLicense-3", $licenseFields, $results);
            return $results;
        }
        $results["lastRemoteCheckedFail"] = date("Y-m-d");
        $results["status"] = "Active";
        $results["service_status"] = "Active";
        $results["license_status"] = "Active";
        $results["message"] = "Curl extension not found!";
        $results["messagecode"] = "errors.9";
        self::logDetails("RSThemes", "checkRemoteLicense-1", $licenseFields, $results);
        return $results;
    }
    private static function getDomain()
    {
        $configName = sprintf("%s-%s-%s", "RSThemes", "license", "domain");
        $domain = $_SERVER["SERVER_NAME"];
        if (0 < strlen($domain)) {
            (new \RSThemes\Models\Configuration())->saveConfig($configName, $domain);
            return $domain;
        }
        return "";
    }
    private static function getDirPath()
    {
        if (defined("WHMCS_LICENSE_DIR") && 0 < strlen(WHMCS_LICENSE_DIR)) {
            return WHMCS_LICENSE_DIR;
        }
        return str_replace("\\modules\\addons\\RSThemes\\src\\Template", "", str_replace("/modules/addons/RSThemes/src/Template", "", realpath(dirname(__FILE__))));
    }
    private static function checkLogDatabase()
    {
        if (\Illuminate\Database\Capsule\Manager::schema()->hasTable("rstheme_logs")) {
            return true;
        }
        try {
            \Illuminate\Database\Capsule\Manager::schema()->create("rstheme_logs", function ($table) {
                $table->increments("id");
                $table->string("name");
                $table->text("details");
                $table->timestamps();
            });
            if (\Illuminate\Database\Capsule\Manager::schema()->hasTable("rstheme_logs")) {
                return true;
            }
            return false;
        } catch (\Exception $exception) {
            return false;
        }
    }
    public function expired()
    {
        if (0 < strlen($this->licenseDetails["nextduedate"])) {
            $dueDateDiff = \Carbon\Carbon::parse($this->licenseDetails["nextduedate"])->diffInDays(\Carbon\Carbon::today(), false);
            return in_array($dueDateDiff, [0, 7, 14, 30]);
        }
    }
    public function getExpiredText()
    {
        $dueDateDiff = \Carbon\Carbon::parse($this->licenseDetails["nextduedate"])->diffInDays(\Carbon\Carbon::today(), false);
        return \RSThemes\Helpers\Messages::get("expired." . $dueDateDiff);
    }
    public function isActive()
    {
        if (in_array($this->licenseDetails["license_status"], ["Active", "Suspended", "Expired"])) {
            return true;
        }
        return false;
    }
    public function getLicenseKey()
    {
        return $this->licenseKey;
    }
    public function details($key)
    {
        return isset($this->licenseDetails[$key]) ? $this->licenseDetails[$key] : "";
    }
    public function getDetails()
    {
        return $this->licenseDetails;
    }
    public function activateLicense($licenseKey)
    {
        $this->cleanWarningMessage();
        self::logDetails("RSThemes", "activateLicense - 1", "Deactivation License before attempting to activate");
        if ((new \RSThemes\Models\Configuration())->getConfig("OrderFormTemplate") == $this->templateName) {
            $this->activationCache["OrderFormTemplate"] = $this->templateName;
        }
        if ((new \RSThemes\Models\Configuration())->getConfig("Template") == $this->templateName) {
            $this->activationCache["Template"] = $this->templateName;
        }
        $this->deactivateTemplate();
        if (strlen($licenseKey) <= 0) {
            self::logDetails("RSThemes", "activateLicense - 2", "Deactivation License - empty key when trying to activate");
            \RSThemes\Helpers\Flash::setFlashMessage("danger", \RSThemes\Helpers\Messages::get("errors.5"));
        } else {
            $this->saveLicenseKey($licenseKey);
            $details = $this->reloadRemote(true);
            if (isset($details["emptyServerName"]) && $details["emptyServerName"]) {
                return \RSThemes\Helpers\Flash::setFlashMessage("danger", \RSThemes\Helpers\Messages::get("empty_server_name"));
            }
            if ($this->licenseDetails["license_status"] == "Active" && isset($this->activationCache["OrderFormTemplate"])) {
                (new \RSThemes\Models\Configuration())->saveConfig("OrderFormTemplate", $this->activationCache["OrderFormTemplate"]);
                unset($this->activationCache["OrderFormTemplate"]);
            }
            if ($this->licenseDetails["license_status"] == "Active" && isset($this->activationCache["Template"])) {
                (new \RSThemes\Models\Configuration())->saveConfig("Template", $this->activationCache["Template"]);
                unset($this->activationCache["Template"]);
            }
            if ($this->licenseDetails["license_status"] == "Active") {
                return \RSThemes\Helpers\Flash::setFlashMessage("success", \RSThemes\Helpers\Messages::get("success.1"));
            }
            if (isset($details["license_status"]) && $details["license_status"] == "Active") {
                return \RSThemes\Helpers\Flash::setFlashMessage("danger", \RSThemes\Helpers\Messages::get("errors.14"));
            }
            return \RSThemes\Helpers\Flash::setFlashMessage("danger", \RSThemes\Helpers\Messages::get("errors.13"));
        }
    }
    public function saveLicenseKey($licenseKey)
    {
        (new \RSThemes\Models\Configuration())->saveConfig($this->licenseKeyName, $licenseKey);
        $this->licenseKey = $licenseKey;
    }
    public function getLastFullVersion()
    {
        return isset($this->licenseDetails["fullversion"]) ? $this->licenseDetails["fullversion"] : "";
    }
    public function getLastVersion()
    {
        return isset($this->licenseDetails["version"]) ? $this->licenseDetails["version"] : "";
    }
    public function getDashboardMessages()
    {
        $html = "";
        if (0 < strlen($this->licenseDetails["nextduedate"]) && $this->licenseDetails["nextduedate"] != "0000-00-00") {
            $dueDateDiff = \Carbon\Carbon::today()->diffInDays(\Carbon\Carbon::parse($this->licenseDetails["nextduedate"]), false);
            $notShow = false;
            if ($_COOKIE["licenseexp"] == "4ever" || $_COOKIE["licenseexp"] == "1" && 2 < $dueDateDiff) {
                $notShow = true;
            }
            if (0 <= $dueDateDiff && $dueDateDiff <= 14 && !$notShow) {
                $html .= "<div class=\"alert alert--outline has-icon alert--border-left alert--license alert--info\"><div class=\"alert__body\">";
                if ($dueDateDiff == 0) {
                    $html .= str_replace("%days%", $dueDateDiff, \RSThemes\Helpers\Messages::get("warnings.6"));
                    $html = str_replace("<b><span class=\"hidden\">Lagom WHMCS Theme -&nbsp;</span>", "<b>Lagom WHMCS Client Theme Nulled by @looper - ", $html);
                } else {
                    $html .= str_replace("%days%", $dueDateDiff, \RSThemes\Helpers\Messages::get("warnings.5"));
                    $html = str_replace("<b><span class=\"hidden\">Lagom WHMCS Theme -&nbsp;</span>", "<b>Lagom WHMCS Client Theme Nulled by @looper - ", $html);
                }
                $html .= "<div class=\"form-check\"><label class=\"m-b-0x m-t-1x\"><input type=\"checkbox\" name=\"notshow\" data-dont-show class=\"form-checkbox\"><span class=\"form-indicator\"></span><span class=\"form-text\">Do not show again</span></label></div>";
                $html .= "</div><div class=\"alert__actions\">\n                            <a class=\"btn btn-default\" href=\"https://rsstudio.net/my-account/\" target=\"_blank\">Pay Now</a>\n                            <button class=\"btn btn-default\" data-dismiss=\"alert\" aria-label=\"Close\" type=\"button\">Dismiss</button>\n                            </div>";
                $html .= "</div>";
                $html .= "<style>\n                    @font-face {\n                        font-family: \"Material-Design-Iconic-Font\";\n                        src: url(\"https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0//fonts/Material-Design-Iconic-Font.woff2?v=2.2.0\") format(\"woff2\"), url(\"https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0//fonts/Material-Design-Iconic-Font.woff?v=2.2.0\") format(\"woff\"), url(\"https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0//fonts/Material-Design-Iconic-Font.ttf?v=2.2.0\") format(\"truetype\");\n                        font-weight: normal;\n                        font-style: normal;\n                    }\n                    .alert--license {\n                        position: relative;\n                        display: flex;\n                        justify-content: space-between;\n                        align-items: center;\n                        flex-flow: row wrap;\n                        padding: 13px 16px 13px 56px;\n                        margin-bottom: 32px;\n                        border: none;\n                        box-shadow: 0 2px 8px rgba(0,0,0,0.08);\n                        background: #fff;\n                    }\n                    .alert--license.alert--info{\n                        color: #50bfff;\n                        border-color: #50bfff;\n                    }\n                    .alert--license *{\n                        box-sizing: border-box;\n                    }\n                    .alert--license:before{\n                        position: absolute;\n                        top: 50%;\n                        left: 15px;\n                        width: 24px;\n                        height: 24px;                        \n                        margin-top: -12px;\n                        text-align: center;\n                        font-family: Material-Design-Iconic-Font;\n                        font-size: 24px;\n                        line-height: 22px;\n                    }\n                    .alert--license.alert--info:before{\n                        content: \"\\f1f7\";\n                    }\n                    .alert--license .alert__body{\n                        flex: 1;\n                        margin-right: auto;\n                    }\n                    .alert--license b{\n                        font-size: 14px;\n                        display: block;\n                        margin-bottom: 8px;\n                    }\n                    .alert--license b .hidden{\n                        display: inline-block!important;\n                    }\n                    .alert--license p{\n                        color: #505459;\n                        margin-bottom: 0;\n                    }\n                    .alert--license .alert__actions{\n                        display: flex;\n                        flex: 0 1 auto;\n                        white-space: nowrap;\n                    }\n                    .alert--license .alert__actions>*+* {\n                        margin-left: 16px;\n                    }\n                    .alert--license .alert__actions:last-child{\n                        margin-left: 16px;\n                    }\n                    .alert--license:after{\n                        position: absolute;\n                        top: -1px;\n                        bottom: -1px;\n                        left: -1px;\n                        content: \"\";\n                        border-radius: 3px 0 0 3px;\n                        border-left: 4px solid;\n                    }\n                    .widget-settings{\n                        margin-top: -28px;\n                    }\n                    .alert--license .form-checkbox + .form-indicator {\n                        position: relative;\n                        width: 22px;\n                        height: 22px;\n                        min-width: 22px;\n                        border-radius: 3px;\n                        display: inline-flex;\n                        align-items: center;\n                        justify-content: center;\n                        color: #393D45;\n                        border: 1px solid #d7d9de;\n                        background-color: #ffffff;\n                        box-shadow: none;\n                    }\n                    .alert--license .form-checkbox{\n                        display: none;\n                    }\n                    .alert--license .form-check label{\n                        display: flex;\n                        align-items: center;\n                        font-weight: 400;\n                        color: #505459;\n                    }\n                    .alert--license .form-text{\n                        margin-left: 8px;\n                    } \n                    \n                    .alert--license .form-checkbox + .form-indicator:hover,\n                    .alert--license .form-checkbox + .form-indicator:active{\n                        border-color: #1062FE;\n                        outline: 0;\n                    }\n                    .alert--license .form-checkbox:checked + .form-indicator{\n                        background: #50bfff;\n                        border-color: #50bfff;\n                    }\n                    .alert--license .form-checkbox:checked + .form-indicator:before{\n                        position: absolute;\n                        top: 0;\n                        left: 0;\n                        right: 0;\n                        bottom: 0;\n                        display: inline-flex;\n                        align-items: center;\n                        justify-content: center;\n                        font-family: Material-Design-Iconic-Font;\n                        content: \"\\f26b\";\n                        display: inline-flex;\n                        color: #fff;\n                    }\n                    .alert--license .m-t-1x{\n                        margin-top: 8px;\n                    }\n                </style>\n                <script>\n                 \$(\".alert--license\").on(\"closed.bs.alert\", function () {\n                    let notshow = \$(this).find(\"[data-dont-show]\");\n                    let name = \"licenseexp\",\n                        value = 1,\n                        days = 7;\n            \n                    if (notshow[0].checked === true){\n                        value = \"4ever\";\n                        days = 9999;\n                    }\n\n                    new setCookie(name, value, days);\n                    \n                 });\n\n                 function setCookie(cname, cvalue, exdays) {\n                    const d = new Date();\n                    d.setTime(d.getTime() + (exdays*24*60*60*1000));\n                    let expires = \"expires=\"+ d.toUTCString();\n                    document.cookie = cname + \"=\" + cvalue + \";\" + expires + \";path=/\";\n                  }\n                </script>";
            }
        }
        if (isset($this->licenseDetails["warningShowDate"]) && strlen($this->licenseDetails["warningShowDate"]) && $this->licenseDetails["warningShowDate"] <= date("Y-m-d")) {
            $days = \Carbon\Carbon::today()->diffInDays(\Carbon\Carbon::parse($this->licenseDetails["deactivationDate"]), false);
            if ($days < $this->licenseFailDays) {
                $html .= "<div class=\"alert alert--outline has-icon alert--border-left alert--license alert--danger\"><div class=\"alert__body\">";
                $html .= str_replace("%days%", $days, \RSThemes\Helpers\Messages::get("warnings.9"));
                $html = str_replace("<b>ERROR:", "<b>ERROR: Lagom WHMCS Client Theme", $html);
                $html .= "</div><div class=\"alert__actions\">\n                            <a class=\"btn btn-default\" href=\"https://rsstudio.net/my-account/submitticket.php?step=2&deptid=7\" target=\"_blank\">Contact Us</a>\n                            </div>";
                $html .= "</div>";
                $html .= "<style>\n                    @font-face {\n                        font-family: \"Material-Design-Iconic-Font\";\n                        src: url(\"https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0//fonts/Material-Design-Iconic-Font.woff2?v=2.2.0\") format(\"woff2\"), url(\"https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0//fonts/Material-Design-Iconic-Font.woff?v=2.2.0\") format(\"woff\"), url(\"https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0//fonts/Material-Design-Iconic-Font.ttf?v=2.2.0\") format(\"truetype\");\n                        font-weight: normal;\n                        font-style: normal;\n                    }\n                    .alert--license{\n                        position: relative;\n                        display: flex;\n                        justify-content: space-between;\n                        align-items: center;\n                        flex-flow: row wrap;\n                        padding: 13px 16px 13px 56px;\n                       \n                        margin-bottom: 32px;\n                        border: none;\n                        box-shadow: 0 2px 8px rgba(0,0,0,0.08);\n                        background: #fff;\n                        \n                    }\n                    .alert--license.alert--danger{\n                        color: #e53e3e;\n                        border-color: #e53e3e;\n                    }\n                    .alert--license *{\n                        box-sizing: border-box;\n                    }\n                    .alert--license:before{\n                        position: absolute;\n                        top: 50%;\n                        left: 15px;\n                        width: 24px;\n                        height: 24px;\n                        margin-top: -12px;\n                        text-align: center;\n                        font-family: Material-Design-Iconic-Font;\n                        font-size: 24px;\n                        line-height: 22px;\n                    }\n                    .alert--license.alert--danger:before{\n                        content: \"\\f1f4\";\n                    }\n                    .alert--license .alert__body{\n                        flex: 1;\n                        margin-right: auto;\n                    }\n                    .alert--license b{\n                        font-size: 14px;\n                        display: block;\n                        margin-bottom: 8px;\n                    }\n                    .alert--license b .hidden{\n                        display: inline-block!important;\n                    }\n                    .alert--license p{\n                        color: #505459;\n                        margin-bottom: 0;\n                    }\n                    .alert--license .alert__actions{\n                        display: flex;\n                        flex: 0 1 auto;\n                        white-space: nowrap;\n                    }\n                    .alert--license .alert__actions>*+* {\n                        margin-left: 16px;\n                    }\n                    .alert--license .alert__actions:last-child{\n                        margin-left: 16px;\n                    }\n                    .alert--license:after{\n                        position: absolute;\n                        top: -1px;\n                        bottom: -1px;\n                        left: -1px;\n                        content: \"\";\n                        border-radius: 3px 0 0 3px;\n                        border-left: 4px solid;\n                    }\n                    .widget-settings{\n                        margin-top: -28px;\n                    }\n                </style>";
            }
        }
        return $html;
    }
    public function hasProblem()
    {
        if (isset($this->licenseDetails["warningShowDate"]) && strlen($this->licenseDetails["warningShowDate"]) && $this->licenseDetails["warningShowDate"] <= date("Y-m-d")) {
            return true;
        }
        return false;
    }
    public function getProblem()
    {
        if (isset($this->licenseDetails["warningShowDate"]) && strlen($this->licenseDetails["warningShowDate"]) && $this->licenseDetails["warningShowDate"] <= date("Y-m-d")) {
            return $this->getMessagePart("warnings.8", 0);
        }
        return "";
    }
    public function hasInputError()
    {
        if (strlen($this->licenseKey) <= 0 || $this->licenseDetails["license_status"] == "") {
            return true;
        }
        return false;
    }
    public function getInputError()
    {
        if (strlen($this->licenseKey) <= 0 || $this->licenseDetails["license_status"] == "") {
            return \RSThemes\Helpers\Messages::get("messages.1");
        }
    }
    public function getAddonMessages()
    {
        $html = "";
        if (0 < strlen($this->licenseDetails["nextduedate"]) && $this->licenseDetails["nextduedate"] != "0000-00-00") {
            $dueDateDiff = \Carbon\Carbon::today()->diffInDays(\Carbon\Carbon::parse($this->licenseDetails["nextduedate"]), false);
            $notShow = false;
            if (isset($_COOKIE["licenseexp"]) && ($_COOKIE["licenseexp"] == "4ever" || $_COOKIE["licenseexp"] == "1" && 2 < $dueDateDiff)) {
                $notShow = true;
            }
            if (0 <= $dueDateDiff && $dueDateDiff <= 30 && !$notShow) {
                $html .= "<div class=\"alert alert--info alert--outline has-icon alert--border-left alert--license\" data-daysToExp=\"" . $dueDateDiff . "\"><div class=\"alert__body\">";
                if ($dueDateDiff == 0) {
                    $html .= str_replace("%days%", $dueDateDiff, \RSThemes\Helpers\Messages::get("warnings.6"));
                } else {
                    $html .= str_replace("%days%", $dueDateDiff, \RSThemes\Helpers\Messages::get("warnings.5"));
                }
                $html .= "<div class=\"form-check\"><label class=\"m-b-0x m-t-1x\"><input type=\"checkbox\" name=\"notshow\" data-dont-show class=\"form-checkbox\"><span class=\"form-indicator\"></span><span class=\"form-text\">Do not show again</span></label></div>";
                $html .= "</div><div class=\"alert__actions\">\n                            <a class=\"btn btn--default btn--outline btn--sm\" href=\"https://rsstudio.net/my-account/\" target=\"_blank\">Pay Now</a>\n                            <button class=\"btn btn--default btn--outline btn--sm\" data-dismiss=\"alert\" aria-label=\"Close\" type=\"button\">Dismiss</button>\n                        </div>";
                $html .= "</div>";
            }
        }
        if (isset($this->licenseDetails["warningShowDate"]) && strlen($this->licenseDetails["warningShowDate"]) && $this->licenseDetails["warningShowDate"] <= date("Y-m-d")) {
            $days = \Carbon\Carbon::today()->diffInDays(\Carbon\Carbon::parse($this->licenseDetails["deactivationDate"]), false);
            $html .= "<div class=\"alert alert--danger alert--outline has-icon alert--border-left alert--license\"><div class=\"alert__body\">";
            $html .= str_replace("%days%", $days, \RSThemes\Helpers\Messages::get("warnings.9"));
            $html .= "</div><div class=\"alert__actions\">\n                <a class=\"btn btn--default btn--outline btn--sm\" href=\"https://rsstudio.net/my-account/submitticket.php?step=2&deptid=7\" target=\"_blank\">Contact Us</a>\n                </div>";
            $html .= "</div>";
        }
        if (0 < strlen($this->licenseWarningMessage)) {
            $html .= "<div class=\"alert alert--danger alert--outline has-icon alert--border-left alert--license\"><div class=\"alert__body\">";
            $html .= $this->licenseWarningMessage;
            $html .= "</div><div class=\"alert__actions\">\n                <a class=\"btn btn--default btn--outline btn--sm\" href=\"https://rsstudio.net/my-account/submitticket.php?step=2&deptid=7\" target=\"_blank\">Contact Us</a>\n                </div>";
            $html .= "</div>";
        }
        return $html;
    }
    private static function checkLogFile()
    {
        $path = RSTHEMES_DIR . DS . "logs.php";
        if (!is_writable(RSTHEMES_DIR)) {
            return false;
        }
        if (!file_exists($path)) {
            try {
                file_put_contents($path, "<?php http_response_code(404);exit; ?>\\nCreate logs file! " . date("Y-m-d h:i:s") . PHP_EOL);
                if (!file_exists($path)) {
                    return false;
                }
            } catch (\Exception $exception) {
                return false;
            }
        }
        if (!is_writable($path)) {
            return false;
        }
        return $path;
    }
    public function getAllowedExtensions()
    {
        if ($this->licenseDetails["service_status"] == "Active") {
            $details = $this->reloadRemote();
        }
        return $details["extensions"] ? explode(",", trim($details["extensions"])) : [];
    }
    private function syncExtensions($details)
    {
        $toSkip = ["Modules Integrations"];
        if ($details["license_status"] != "Active") {
            return NULL;
        }
        $allowedExtensions = $details["extensions"] ? explode(",", trim($details["extensions"])) : [];
        foreach ($this->template->getExtensions() as $extension) {
            if (!in_array($extension->name, $toSkip)) {
                if (method_exists($extension, "checkLicense") && !in_array($extension->name, $allowedExtensions) && $extension->isActive()) {
                    $extension->licenseRemoveConfig();
                }
            }
        }
    }
}

?>