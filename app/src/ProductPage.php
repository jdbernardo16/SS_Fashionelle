<?php
namespace {
	use SilverStripe\CMS\Model\SiteTree;
	use SilverStripe\Forms\TextField;
	use SilverStripe\Forms\TextareaField;
	use SilverStripe\Forms\HTMLEditorField;
	use SilverStripe\Forms\HTMLEditor;
	use SilverStripe\AssetAdmin\Forms\UploadField;
	use SilverStripe\Assets\Image;
	use SilverStripe\Assets\File;
	use SilverStripe\Forms\TabSet;
	use SilverStripe\Forms\Tab;
	use SilverStripe\ORM\DataObject;
	use SilverStripe\Forms\FieldList;
	use SilverStripe\Forms\GridField\GridField;
	use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;

	class ProductPage extends Page {

		private static $db = [
			/*Frame 1*/
			'F1Title' => 'Text',
		
		];

		private static $has_one = [
			'F1BG' => Image::class,
		];

		private static $owns = [
			'F1BG',
		];

		private static $allowed_children = array(
			"ProductCategory"

		);

		private static $defaults = array(
			'PageName' => 'Product Page',
			'MenuTitle' => 'Product Page',
			'ShowInMenus' => true,
			'ShowInSearch' => true,
		);

		public function getCMSFields() {
			$fields = parent::getCMSFields();

			#Remove by tab
			$fields->removeFieldFromTab('Root.Main', 'Content');

			/*
			|-----------------------------------------------
			| @Frame1
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Frame1.Main', array(
				$upload1 = UploadField::create('F1BG','Image'),
				new TextField('F1Title', 'Title'),
			));
			# SET FIELD DESCRIPTION 
			$upload1->setDescription('Max file size: 2MB | Dimension: 1024px x 556px');
			# Set destination path for the uploaded images.
			$upload1->setFolderName('productpage');
			
			return $fields;
		}
	}

	class ProductPageController extends PageController {

		public function init() {
	    	parent::init();
	    	/*REDIRECT TO CHILDREN*/ 
	  //   	if (empty($this->Content)) {
	  // 			if($this->Children()->Count()){
	  // 				return $this->redirect($this->Children()->First()->AbsoluteLink()); 
	  //  			 } 
			// }
		}
	}
}
