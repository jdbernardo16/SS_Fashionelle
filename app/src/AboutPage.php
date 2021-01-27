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

	class AboutPage extends Page {

		private static $db = [
			/*Frame 1*/
			'F1Title' => 'Text',
			'F1Desc' => 'Text',

			/*Frame 3*/
			'F2Header' => 'Text',

			/*Frame 3*/
			'F3Title' => 'Text',
			'F3Desc' => 'Text',
			'F3Link' => 'Text',
		
		];

		private static $has_one = [
			'F1BG' => Image::class,
			'F3IMG' => Image::class,
		];

		private static $owns = [
			'F1BG',
			'F3IMG',
		];

		private static $has_many = [
	        'Itemtypes' => Itemtype::class,
	    ];



		private static $allowed_children = "none";

		private static $defaults = array(
			'PageName' => 'About Page',
			'MenuTitle' => 'About',
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
				new TextareaField('F1Desc', 'Description'),
			));
			# SET FIELD DESCRIPTION 
			$upload1->setDescription('Max file size: 2MB | Dimension: 1024px x 556px');
			# Set destination path for the uploaded images.
			$upload1->setFolderName('aboutpage');

			/*
			|-----------------------------------------------
			| @Frame2
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Frame2.Main', array(
				new TextField('F2Header', 'Header'),
			));

			$fields->addFieldToTab('Root.Frame2.Items', new TabSet('Itemtypes',
				new Tab('Itemtypes', GridField::create(
		            'Itemtypes',
		            'Itemtypes',
		            $this->Itemtypes(),
		            GridFieldConfig_RecordEditor::create(10)
		            ->addComponent(new GridFieldSortableRows('SortID'))
				))
			));

			/*
			|-----------------------------------------------
			| @Frame3
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Frame3.Main', array(
				$upload1 = UploadField::create('F3IMG','Image'),
				new TextField('F3Title', 'Title'),
				new TextareaField('F3Desc', 'Description'),
				new TextField('F3Link', 'Shopee Link'),
			));
			# SET FIELD DESCRIPTION 
			$upload1->setDescription('Max file size: 2MB | Dimension: 531px x 450px');
			# Set destination path for the uploaded images.
			$upload1->setFolderName('aboutpage');


			
			return $fields;
		}
	}

	class AboutPageController extends PageController {

		// public function FeaturedProducts() {
		// 	return Product::get()
		// 		->filter(array (
		// 		'Featured' => true
		// 	));
		// }

	}
}
