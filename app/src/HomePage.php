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

	class HomePage extends Page {

		private static $db = [

			/*Frame 1*/
			'F1Title' => 'Text',
			'F1Desc' => 'Text',
			'F1Link' => 'Text',

			/*Frame 2*/
			'F2Header' => 'Text',

			/*Frame 3*/
			'F3Title' => 'Text',
			'F3Desc' => 'Text',
			'F3Link' => 'Text',

			/*Frame 4*/
			'F4Header' => 'Text',

			/*Frame 5*/
			'F5Header' => 'HTMLText',
		
		
		];

		private static $has_one = [
			'F1IMG' => Image::class,
			'F3IMG' => Image::class,
			'F3BG' => Image::class,
		
		];

		private static $owns = [
			'F1IMG',
			'F3IMG',
			'F3BG',
		];

		private static $has_many = [
	        'Quotes' => Quote::class,
	        'IGPhotos' => IGPhoto::class,
	    ];


		private static $allowed_children = "none";

		private static $defaults = array(
			'PageName' => 'Home Page',
			'MenuTitle' => 'Home',
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
				$upload1 = UploadField::create('F1IMG','Image'),
				new TextField('F1Title', 'Title'),
				new TextareaField('F1Desc', 'Description'),
				new TextField('F1Link', 'About Link'),
			));
			# SET FIELD DESCRIPTION 
			$upload1->setDescription('Max file size: 2MB | Dimension: 657px x 450px');
			# Set destination path for the uploaded images.
			$upload1->setFolderName('homepage');


			/*
			|-----------------------------------------------
			| @Frame2
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Frame2.Main', array(
				new TextField('F2Header', 'Header'),
			));

			/*
			|-----------------------------------------------
			| @Frame3
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Frame3.Main', array(
				$upload2 = UploadField::create('F3BG','Background Image'),
				new TextField('F3Title', 'Title'),
				new TextareaField('F3Desc', 'Description'),
				new TextField('F3Link', 'Contact Link'),
				$upload2 = UploadField::create('F3IMG','Image'),
			));

			# SET FIELD DESCRIPTION 
			$upload2->setDescription('Max file size: 2MB | Dimension: 400px x 500px');
			# Set destination path for the uploaded images.
			$upload2->setFolderName('homepage');

			/*
			|-----------------------------------------------
			| @Frame4
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Frame4.Main', array(
				new TextField('F4Header', 'Header'),
			));


			$fields->addFieldToTab('Root.Frame4.Quotes', new TabSet('Quotes',
				new Tab('Quote', GridField::create(
		            'Quotes',
		            'Quotes',
		            $this->Quotes(),
		            GridFieldConfig_RecordEditor::create(10)
		            ->addComponent(new GridFieldSortableRows('SortID'))
				))
			));

			/*
			|-----------------------------------------------
			| @Frame5
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Frame5.Main', array(
				new HTMLEditorField('F5Header', 'Header'),
			));

			$fields->addFieldToTab('Root.Frame5.Instagram', new TabSet('IGPhotos',
				new Tab('IGPhotos', GridField::create(
		            'IGPhotos',
		            'Instagram Photos',
		            $this->IGPhotos(),
		            GridFieldConfig_RecordEditor::create(10)
		            ->addComponent(new GridFieldSortableRows('SortID'))
				))
			));




			return $fields;

		}
	}

	class HomePageController extends PageController {

		public function FeaturedProducts() {
			return Product::get()
				->filter(array (
				'Featured' => true
			));
		}

	}
}
