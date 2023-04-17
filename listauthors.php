<?php

import('lib.pkp.classes.plugins.GenericPlugin');

class listauthors extends GenericPlugin {
   
	public function register($category, $path, $mainContextId = NULL) {

        $success = parent::register($category, $path);
    
            if ($success && $this->getEnabled()) {
                HookRegistry::register('TemplateResource::getFilename', array($this, '_overridePluginTemplates'));
                HookRegistry::register('TemplateResource::getFilename', array($this, '_overridePluginTemplatesnovamente'));

    
        }
    
            return $success;
        }

        public function _overridePluginTemplates($hookName, $args) {
            $templatePath = $args[0];
            if ($templatePath === 'lib/pkp/templates/controllers/grid/users/author/form/authorForm.tpl') {
                $args[0] = 'plugins/generic/listauthors/templates/controllers/grid/users/author/form/authorForm.tpl';
            }
            return false;
        }


        public function _overridePluginTemplatesnovamente($hookName, $args) {
            $templatePath = $args[0];
            if ($templatePath === 'lib/pkp/templates/common/userDetails.tpl') {
                $args[0] = 'plugins/generic/listauthors/templates/commom/userDetails.tpl';
            }
            return false;
        }

  /**
   * Provide a name for this plugin
   *
   * The name will appear in the plugins list where editors can
   * enable and disable plugins.
   */
	public function getDisplayName() {
		return __('listauthors');
	}

	/**
   * Provide a description for this plugin
   *
   * The description will appear in the plugins list where editors can
   * enable and disable plugins.
   */
	public function getDescription() {
		return __('listar autores para submissão rápida');
	}
	
	/**
	 * Get the name of the settings file to be installed on new context
	 * creation.
	 * @return string
	 */
	function getContextSpecificPluginSettingsFile() {
		return $this->getPluginPath() . '/settings.xml';
	}

	
}
