<?php
use RSThemes\Extensions\TemplateExtension;
use Symfony\Component\Finder\Finder;

if(!class_exists('LagomModulesIntegration',false)) {
    class LagomModulesIntegration extends TemplateExtension
    {

        public function getExtensionConfig()
        {
            $finder = new Finder();
            $styles = [];
            foreach ($finder->in(__DIR__ . DS . 'styles')->directories()->depth('== 0')->sortByName() as $style) {
                $path = $style->getPath() . DS . $style->getFilename() . DS;
                $styles[$style->getFilename()] = [
                    'header' => $this->getFileContent($path . 'header.tpl'),
                    'footer' => $this->getFileContent($path . 'footer.tpl'),
                    'css' => $this->getFileContent($path . 'global.css'),
                    'thumb' => $this->getFileContent($path . 'thumb.png')
                ];
            }
            return $styles;
        }

        private function getFileContent($path)
        {
            if (file_exists($path)) {
                return file_get_contents($path);
            }
            return '';
        }
    }
}else{
    error_log('LagomModulesIntegration was already included ommiting.' . json_encode(debug_backtrace()));
}