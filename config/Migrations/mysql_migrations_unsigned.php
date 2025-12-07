<?php
// FULL MySQL → CakePHP Migrations (Phinx) conversion
// All INTEGER fields are UNSIGNED (signed => false)
// Collation: utf8mb4_hungarian_ci

use Migrations\AbstractMigration;

/** -----------------------------------------------------------------
 * CATEGORIES
 * ----------------------------------------------------------------*/
class CreateCategories extends AbstractMigration
{
    public function change(): void
    {
        $table = $this->table('categories', [
            'id' => false,
            'primary_key' => ['id'],
            'collation' => 'utf8mb4_hungarian_ci'
        ]);

        $table
            ->addColumn('id', 'integer', ['signed' => false, 'identity' => true])
            ->addColumn('icon_id', 'string', ['limit' => 64, 'null' => true])
            ->addColumn('name', 'string', ['limit' => 250])
            ->addColumn('name_slug', 'string', ['limit' => 250, 'null' => true])
            ->addColumn('description', 'text', ['null' => true])
            ->addColumn('description_slug', 'text')
            ->addColumn('keywords', 'string', ['limit' => 2000, 'null' => true])
            ->addColumn('keywords_slug', 'string', ['limit' => 2000, 'null' => true])
            ->addColumn('visible', 'boolean', ['default' => 1])
            ->addColumn('pos', 'integer', ['signed' => false, 'default' => 1000])
            ->addColumn('action', 'string', ['limit' => 20])
            ->addColumn('company_count', 'integer', ['signed' => false, 'default' => 0])
            ->addColumn('created', 'datetime')
            ->addColumn('modified', 'datetime')
            ->addIndex(['name'])
            ->addIndex(['visible'])
            ->addIndex(['pos'])
            ->addIndex(['action'])
            ->addIndex(['keywords'], ['type' => 'fulltext'])
            ->addIndex(['keywords_slug'], ['type' => 'fulltext'])
            ->create();
    }
}

/** -----------------------------------------------------------------
 * CATEGORY_STATS
 * ----------------------------------------------------------------*/
class CreateCategoryStats extends AbstractMigration
{
    public function change(): void
    {
        $table = $this->table('category_stats', [
            'id' => false,
            'primary_key' => ['category_id'],
            'collation' => 'utf8mb4_hungarian_ci'
        ]);

        $table
            ->addColumn('category_id', 'integer', ['signed' => false])
            ->addColumn('views_count', 'integer', ['signed' => false, 'default' => 0])
            ->addColumn('search_count', 'integer', ['signed' => false, 'default' => 0])
            ->addColumn('ad_count', 'integer', ['signed' => false, 'default' => 0])
            ->addColumn('popularity_score', 'float', ['default' => 0])
            ->addColumn('updated_at', 'datetime')
            ->create();
    }
}

/** -----------------------------------------------------------------
 * COMPANIES
 * ----------------------------------------------------------------*/
class CreateCompanies extends AbstractMigration
{
    public function change(): void
    {
        $table = $this->table('companies', [
            'id' => false,
            'primary_key' => ['id'],
            'collation' => 'utf8mb4_hungarian_ci'
        ]);

        $table
            ->addColumn('id', 'integer', ['signed' => false, 'identity' => true])
            ->addColumn('icon_id', 'string', ['limit' => 64, 'null' => true])
            ->addColumn('category_id', 'integer', ['signed' => false])
            ->addColumn('name', 'string', ['limit' => 250])
            ->addColumn('name_slug', 'string', ['limit' => 250])
            ->addColumn('description', 'text', ['null' => true])
            ->addColumn('description_slug', 'text')
            ->addColumn('keywords', 'string', ['limit' => 2000, 'null' => true])
            ->addColumn('keywords_slug', 'string', ['limit' => 2000, 'null' => true])
            ->addColumn('email', 'string', ['limit' => 250, 'null' => true])
            ->addColumn('phone', 'string', ['limit' => 50, 'null' => true])
            ->addColumn('website', 'string', ['limit' => 250, 'null' => true])
            ->addColumn('address', 'string', ['limit' => 500, 'null' => true])
            ->addColumn('visible', 'boolean', ['default' => 1])
            ->addColumn('pos', 'integer', ['signed' => false, 'default' => 1000])
            ->addColumn('premium_until', 'datetime', ['null' => true])
            ->addColumn('views_count', 'integer', ['signed' => false, 'default' => 0])
            ->addColumn('click_count', 'integer', ['signed' => false, 'default' => 0])
            ->addColumn('created', 'datetime')
            ->addColumn('modified', 'datetime')
            ->addIndex(['name'])
            ->addIndex(['category_id'])
            ->addIndex(['visible'])
            ->addIndex(['pos'])
            ->addIndex(['keywords'], ['type' => 'fulltext'])
            ->addIndex(['keywords_slug'], ['type' => 'fulltext'])
            ->create();
    }
}

/** -----------------------------------------------------------------
 * ADVERTISEMENTS / ADS
 * ----------------------------------------------------------------*/
class CreateAds extends AbstractMigration
{
    public function change(): void
    {
        $table = $this->table('ads', [
            'id' => false,
            'primary_key' => ['id'],
            'collation' => 'utf8mb4_hungarian_ci'
        ]);

        $table
            ->addColumn('id', 'integer', ['signed' => false, 'identity' => true])
            ->addColumn('category_id', 'integer', ['signed' => false])
            ->addColumn('company_id', 'integer', ['signed' => false])
            ->addColumn('title', 'string', ['limit' => 250])
            ->addColumn('title_slug', 'string', ['limit' => 250])
            ->addColumn('description', 'text', ['null' => true])
            ->addColumn('description_slug', 'text')
            ->addColumn('price', 'integer', ['signed' => false, 'null' => true])
            ->addColumn('views_count', 'integer', ['signed' => false, 'default' => 0])
            ->addColumn('click_count', 'integer', ['signed' => false, 'default' => 0])
            ->addColumn('priority', 'integer', ['signed' => false, 'default' => 0])
            ->addColumn('premium_until', 'datetime', ['null' => true])
            ->addColumn('visible', 'boolean', ['default' => 1])
            ->addColumn('created', 'datetime')
            ->addColumn('modified', 'datetime')
            ->addIndex(['category_id'])
            ->addIndex(['company_id'])
            ->addIndex(['visible'])
            ->addIndex(['priority'])
            ->addIndex(['title'], ['type' => 'fulltext'])
            ->addIndex(['description'], ['type' => 'fulltext'])
            ->create();
    }
}

