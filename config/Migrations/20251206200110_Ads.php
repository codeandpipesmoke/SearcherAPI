<?php
declare(strict_types=1);

use Migrations\BaseMigration;

class Ads extends BaseMigration
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
		$table = $this->table('ads');
		$table
			->addColumn('category_id', 'integer')
			->addColumn('title', 'string', ['limit' => 255])
			->addColumn('description', 'text', ['null' => true])
			->addColumn('price', 'integer', ['null' => true])
			->addColumn('user_id', 'integer', ['null' => true])
			->addColumn('status', 'enum', [
				'values' => ['active', 'archived', 'deleted'],
				'default' => 'active',
			])
			->addColumn('views_count', 'integer', ['default' => 0])
			->addColumn('unique_views_count', 'integer', ['default' => 0])
			->addColumn('favorite_count', 'integer', ['default' => 0])
			->addColumn('contact_clicks_count', 'integer', ['default' => 0])
			->addColumn('clicks_count', 'integer', ['default' => 0])
			->addColumn('match_score', 'float', ['default' => 0])
			->addColumn('activity_score', 'float', ['default' => 0])
			->addColumn('score_popularity', 'float', ['default' => 0])
			->addColumn('last_boost', 'datetime', ['null' => true])
			->addColumn('is_featured', 'boolean', ['default' => 0])
			->addColumn('featured_until', 'datetime', ['null' => true])
			->addColumn('priority_level', 'integer', ['default' => 0])
			->addColumn('admin_score_adjustment', 'integer', ['default' => 0])
			->addColumn('is_banned', 'boolean', ['default' => 0])
			->addColumn('reported_count', 'integer', ['default' => 0])
			->addColumn('created_at', 'datetime')
			->addColumn('updated_at', 'datetime')
			->addIndex(['category_id'])
			->addIndex(['is_featured', 'priority_level'])
			->addIndex(['created_at'])
			->create();
    }
}
