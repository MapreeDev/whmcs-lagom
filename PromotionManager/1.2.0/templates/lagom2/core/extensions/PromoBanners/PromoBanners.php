<?php

use RSThemes\Extensions\TemplateExtension;
use Symfony\Component\Finder\Finder;

class LagomPromoBanners extends TemplateExtension {

    private function getFileContent($path) {
        if (file_exists($path)) {
            return file_get_contents($path);
        }
        return '';
    }

}
