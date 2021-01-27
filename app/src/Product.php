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
	use SilverStripe\Forms\CheckboxField;
	use SilverStripe\Forms\FieldList;
	use SilverStripe\Forms\GridField\GridField;
	use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
	use UndefinedOffset\SortableGridField\Forms\GridFieldSortableRows;

	class Product extends Page {

		private static $db = [
			/*Frame 1*/
			'Name' => 'Text',
			'Desc' => 'HTMLText',
			'Price' => 'Text',
			'SLink' => 'Text',
			'Featured' => 'Boolean',
		
		];

		private static $has_one = [
		];

		private static $has_many = [
	        'ProductPhotos' => ProductPhoto::class,
	    ];

		private static $allowed_children = "none";

		private static $defaults = array(
			'PageName' => 'Product',
			'MenuTitle' => 'Product',
			'ShowInMenus' => true,
			'ShowInSearch' => true,
		);

		public function getCMSFields() {
			$fields = parent::getCMSFields();

			#Remove by tab
			$fields->removeFieldFromTab('Root.Main', 'Content');

			/*
			|-----------------------------------------------
			| @Product
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.ProductDetails.Main', array(
				new TextField('Name', 'Product Name'),
				new HTMLEditorField('Desc', 'Product Description'),
				new TextField('Price', 'Product Price'),
				new TextField('SLink', 'Shopee Link'),
			));


			$fields->addFieldToTab('Root.ProductDetails.Photo', new TabSet('ProductPhoto',
				new Tab('ProductPhotos', GridField::create(
		            'ProductPhotos',
		            'Product Photos',
		            $this->ProductPhotos(),
		            GridFieldConfig_RecordEditor::create(10)
		            ->addComponent(new GridFieldSortableRows('SortID'))
				))
			));

			/*
			|-----------------------------------------------
			| @Featured Button
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.FeaturedButton.Main', array(
				new CheckboxField('Featured', 'Featured on homepage?'),
			));
			
			return $fields;
		}
	}

	class ProductController extends PageController {

		public function init() {
	    	parent::init();
		}
	}
}
