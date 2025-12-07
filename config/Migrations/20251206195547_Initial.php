<?php
declare(strict_types=1);

use Migrations\BaseMigration;

class Initial extends BaseMigration
{
    /**
     * Change Method.
     *
     * More information on this method is available here:
     * https://book.cakephp.org/migrations/4/en/migrations.html#the-change-method
     *
     * @return void
     */
	public function change(): void
	{
		$table = $this->table('adcategories', ['id' => false, 'primary_key' => ['id']]);
		$table
			->addColumn('id', 'integer', [
				'signed' => false,     // <── UNSIGNED
				'identity' => true     // <── AUTO_INCREMENT
			])
			->addColumn('parent_id', 'integer', [
				'signed' => false,     // <── UNSIGNED
				'null' => true
			])
			->addColumn('name', 'string', ['limit' => 255])
			->addColumn('slug', 'string', ['limit' => 255])
			->addColumn('subtitle', 'string', ['limit' => 255])
			->addColumn('subtitle_slug', 'string', ['limit' => 255])			
			->addColumn('keywords', 'string', ['limit' => 1025])
			->addColumn('keywords_slug', 'string', ['limit' => 1025])			
			->addColumn('created_at', 'datetime')
			->addColumn('updated_at', 'datetime')
			->addIndex(['slug'], ['unique' => true, 'type' => 'fulltext'])
			->addIndex(['parent_id'])
			->create();
	}
}
