<?php
namespace {
	use SilverStripe\CMS\Model\SiteTree;
	use SilverStripe\Forms\TextField;
	use SilverStripe\Forms\TextareaField;
	use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
	use SilverStripe\Forms\HTMLEditor;
	use SilverStripe\Forms\FormField;
	use SilverStripe\AssetAdmin\Forms\UploadField;
	use SilverStripe\Assets\Image;
	use SilverStripe\Assets\File;
	use SilverStripe\Forms\TabSet;
	use SilverStripe\Forms\Tab;
	use SilverStripe\ORM\DataObject;
	use SilverStripe\Forms\FieldList;
	use SilverStripe\Forms\GridField\GridField;
	use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
	use UndefinedOffset\SortableGridField\Forms\GridFieldSortableRows;

	class ContactPage extends Page {

		private static $db = [
			/*Frame 1*/
			'F1Title' => 'Text',
			'F2Title' => 'Text',

			/*MAP*/

			'Lng' => 'Text',
	    	'Lat' => 'Text',

	    	/*Email*/
			'Email' => 'Text',
		
		];

		private static $has_one = [
			'MapPin' => Image::class,
		];

		private static $owns = [
			'MapPin',
		];



		private static $allowed_children = "none";

		private static $defaults = array(
			'PageName' => 'Contact Page',
			'MenuTitle' => 'Contact',
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
				new TextField('F1Title', 'Title'),
			));

			/*
			|-----------------------------------------------
			| @Frame2
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Frame2.Main', array(
				new TextField('F2Title', 'Header'),
			));

			/*
			|-----------------------------------------------
			| @Map
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Map.Main', array(
				$upload = UploadField::create('MapPin','Map Pin'),
				new TextField('Lat', 'Latitude'),
				new TextField('Lng', 'Longitude'),
			));

			# SET FIELD DESCRIPTION 
			$upload->setDescription('Max file size: 2MB');
			# Set destination path for the uploaded images.
			$upload->setFolderName('contactpage');

			/*
			|-----------------------------------------------
			| @E-mail
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Email.Main', array(
				new TextField('Email', 'E-mail Recipient'),
			));


			return $fields;
		}
	}

	class ContactPageController extends PageController {

		// public function FeaturedProducts() {
		// 	return Product::get()
		// 		->filter(array (
		// 		'Featured' => true
		// 	));
		// }

	}
}
